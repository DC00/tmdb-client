module Tmdb
  module Authentication
    module GuestSession

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
              adapter.execute(:get, GUEST_SESSION_URL, attributes)
          end

          Tmdb::Authentication::GuestSession::Response.new(attributes, response)
        end

        def attributes
          options
        end

      end

    end
  end
end
