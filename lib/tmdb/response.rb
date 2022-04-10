module Tmdb
  class Response

    attr_accessor :content, :request, :response

    delegate :code,          to: :response
    delegate :error_code,    to: :response
    delegate :error_message, to: :response

    def initialize(request, response)
      self.request  = request
      self.response = response
      self.content  = response.content
    end

    def success?
      response.code == 200
    end

  end
end
