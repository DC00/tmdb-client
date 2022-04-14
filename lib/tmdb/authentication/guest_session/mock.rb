module Tmdb
  module Authentication
    module GuestSession

      class Mock

        def self.pass
          OpenStruct.new(
            "code"            => 200,
            "parsed_response" => {
              "success"          => true,
              "guest_session_id" => "1ce82ec1223641636ad4a60b07de3581",
              "expires_at"       => "2016-08-27 16:26:40 UTC"
            }
          )
        end

        def self.fail
          OpenStruct.new(
            "code"            => 200,
            "parsed_response" => {
              "success"        => false,
              "status_code"    => 6,
              "status_message" => "Invalid id: The pre-requisite id is invalid or not found."
            }
          )
        end

      end

    end
  end
end
