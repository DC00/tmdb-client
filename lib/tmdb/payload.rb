module Tmdb
  class Payload

    attr_accessor :code, :content, :headers

    def initialize(response)
      self.code    = response.code
      self.content = response.parsed_response
      self.headers = response.headers
    end

    def error_code
      content["error"]
    end

    def error_message
      content["error_description"]
    end

  end
end
