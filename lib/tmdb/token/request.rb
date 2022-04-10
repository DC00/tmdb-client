module Tmdb
  module Token
    class Request < Tmdb::Request

      def execute(adapter)
        response = case mode
          when MOCK_VENDOR_FAIL
            raise Tmdb::Exception.new("HTTP 001: Mocked failure", request: attributes, code: "999")
          when MOCK_FAIL
            Tmdb::Payload(Mock.fail)
          when MOCK
            Tmdb::Payload(Mock.pass)
          else
            adapter.execute(:get, "/3/authentication/token/new", attributes)
        end

        Tmdb::Token::Response.new(attributes, response)
      end

      def attributes
        options
      end

    end
  end
end