module Tmdb
  class Payload

    attr_accessor :code, :content, :headers

    def initialize(response)
      self.code    = response.code
      self.content = response.parsed_response
      self.headers = response.headers
    end

    def error_code
      content["status_code"]
    end

    def error_message
      content["status_message"]
    end

  end
end
