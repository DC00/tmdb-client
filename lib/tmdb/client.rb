module Tmdb
  module Client

    class << self

      attr_accessor :api_key
      attr_accessor :api_token

      def configure
        yield self
      end

    end

  end
end
