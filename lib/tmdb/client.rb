module Tmdb
  module Client

    class << self

      attr_accessor :api_key, :api_token

      def configure
        yield self
      end

    end

  end
end
