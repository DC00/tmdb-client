module Tmdb
  module Authentication
    module Token

      class Mock

        def self.pass
          OpenStruct.new(
            "code"            => 200,
            "parsed_response" => {
              "success"       => true,
              "expires_at"    => "2016-08-26 17:04:39 UTC",
              "request_token" => "ff5c7eeb5a8870efe3cd7fc5c282cffd26800ecd"
            }
          )
        end

        def self.fail
          OpenStruct.new(
            "code"            => 404,
            "parsed_response" => {
              "success"        => false,
              "status_message" => "The resource you requested could not be found.",
              "status_code"    => 34
            }
          )
        end

      end

    end
  end
end
