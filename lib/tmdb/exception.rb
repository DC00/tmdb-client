module Tmdb
  class Exception < StandardError

    attr_accessor :context

    def initialize(message, context = {})
      self.context = context

      # build the exception
      super(message)

      # set backtrace
      set_backtrace(caller)
    end

    def code
      context[:code]
    end

    def request
      context[:request]
    end

    def response
      begin
        JSON.parse(context[:response].to_s)
      rescue JSON::ParserError
        {}
      end
    end

    def error_code
      response["error_code"]
    end

  end
end
