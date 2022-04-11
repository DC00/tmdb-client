module Tmdb
  module Authentication
    module Token

      class Mock

        def self.pass
          OpenStruct.new(
            "code"            => 200,
            "parsed_response" => {
              "success"       => "true",
              "expires_at"    => "2022-04-10 23:09:37 UTC",
              "request_token" => "ea816866a6369d9f61f9bdf606b32376e1f31ad2"
            }
          )
        end

        def self.fail
          OpenStruct.new(
            "code"            => 401,
            "parsed_response" => {
              "success"        => false,
              "status_code"    => 7,
              "status_message" => "Invalid API key: You must be granted a valid key."
            }
          )
        end

      end

    end
  end
end
