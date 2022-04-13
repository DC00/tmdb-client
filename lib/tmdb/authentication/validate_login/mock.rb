module Tmdb
  module Authentication
    module ValidateLogin

      class Mock

        def self.pass
          OpenStruct.new(
            "code"            => 200,
            "parsed_response" => {
              "success"       => true,
              "expires_at"    => "2022-04-10 23:09:37 UTC",
              "request_token" => "ea816866a6369d9f61f9bdf606b32376e1f31ad2"
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
