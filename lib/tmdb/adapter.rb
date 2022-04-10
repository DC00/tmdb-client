module Tmdb
  class Adapter

    include HTTParty

    attr_accessor :api_key, :api_token, :domain

    format :json
    default_timeout 10

    def initialize
      self.api_key   = Tmdb.api_key
      self.api_token = Tmdb.api_token
      self.domain    = Tmdb.domain
    end

    def credentials
      {
        api_key:   api_key,
        api_token: api_token
      }
    end

    def headers
      {
        "Content-Type" => "application/json"
      }
    end

    def execute(method, resource, params = {})
      begin
        endpoint = [domain, resource].join
        response = case method
          when :get
            self.class.get(endpoint, headers: headers, query: params.merge(credentials))
          when :post
            self.class.post(endpoint, headers: headers, body: params.merge(credentials).to_json)
          else
            raise Tmdb::Exception.new("Invalid HTTP method provided", request: params, code: 100)
        end

        case response.code
          when 401
            raise Tmdb::Exception.new(
              "HTTP #{response.code}: Unauthorized",
              request:  params,
              response: response.body,
              code:     response.code
            )
          when 403
            raise Tmdb::Exception.new(
              "HTTP #{response.code}: Access denied",
              request:  params,
              response: response.body,
              code:     response.code
            )
          when 404
            raise Tmdb::Exception.new(
              "HTTP #{response.code}: Error finding resource",
              request:  params,
              response: response.body,
              code:     response.code
            )
          when 429
            raise Tmdb::Exception.new(
              "HTTP #{response.code}: Rate limit exceeded",
              request:  params,
              response: response.body,
              code:     response.code
            )
          when 500..599
            raise Tmdb::Exception.new(
              "HTTP #{response.code}: Error when processing request",
              request:  params,
              response: response.body,
              code:     response.code
            )
        end

        Tmdb::Payload.new(response)

      rescue Timeout::Error => exception

        # tracking timeouts as error http code 408 with no response
        raise Tmdb::Exception.new(exception.message, request: params, code: 408)

      end
    end

  end
end
