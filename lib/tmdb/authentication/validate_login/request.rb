module Tmdb
  module Authentication
    module ValidateLogin

      class Request < Tmdb::Request

        def execute(adapter)
          response = case mode
            when MOCK_VENDOR_FAIL
              raise Tmdb::Exception.new("HTTP 001: Mocked failure", request: attributes, code: "999")
            when MOCK_FAIL
              Tmdb::Payload.new(Mock.fail)
            when MOCK
              Tmdb::Payload.new(Mock.pass)
            else
              adapter.execute(:post, VALIDATE_LOGIN_URL, attributes)
          end

          Tmdb::Authentication::ValidateLogin::Response.new(attributes, response)
        end

        def attributes
          options.slice(:username, :password, :request_token)
        end

      end

    end
  end
end
