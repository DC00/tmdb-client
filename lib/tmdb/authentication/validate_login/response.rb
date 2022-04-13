module Tmdb
  module Authentication
    module ValidateLogin

      class Response < Tmdb::Response

        def success
          content.dig("success")
        end

        def expires_at
          content.dig("expires_at")
        end

        def request_token
          content.dig("request_token")
        end

      end

    end
  end
end
