module Tmdb
  module Certification
    module Movie

      class Response < Tmdb::Response

        def success
          content.dig("success")
        end

        def certifications
          content.dig("certifications")
        end

      end

    end
  end
end
