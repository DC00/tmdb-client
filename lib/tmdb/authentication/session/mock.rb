module Tmdb
  module Authentication
    module Session

      class Mock

        def self.pass
          OpenStruct.new(
            "code"            => 200,
            "parsed_response" => {
              "success"    => true,
              "session_id" => "55790b05e5de6b5f453b0c5286a047a8",
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
