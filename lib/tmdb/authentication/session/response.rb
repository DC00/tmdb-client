module Tmdb
  module Authentication
    module Session

      class Response < Tmdb::Response

        def success
          content.dig("success")
        end

        def session_id
          content.dig("session_id")
        end

      end

    end
  end
end
