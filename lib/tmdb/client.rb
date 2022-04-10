module Tmdb
  class Client

    attr_accessor :adapter

    def initialize
      self.adapter = Tmdb::Adapter.new
    end

    def token
      request = Tmdb::Token::Request.new({})
      request.execute(adapter)
    end

  end
end
