module Tmdb
  module Authentication
    module GuestSession

      class Response < Tmdb::Response

        def success
          content.dig("success")
        end

        def expires_at
          content.dig("expires_at")
        end

        def guest_session_id
          content.dig("guest_session_id")
        end

      end

    end
  end
end
