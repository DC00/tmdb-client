module Tmdb
  class Client

    attr_accessor :adapter

    def initialize
      # (Adapter)
      self.adapter = Tmdb::Adapter.build
    end

    def guest_session
      request = Tmdb::Authentication::GuestSession::Request.new({})
      request.execute(adapter)
    end

    def session(token)
      request = Tmdb::Authentication::Session::Request.new({ request_token: token })
      request.execute(adapter)
    end

    def token
      # (Adaptee) contains info for Adapter class
      request = Tmdb::Authentication::Token::Request.new({})

      # (Target) request.execute returns Response which is the Target interface
      request.execute(adapter)
    end

  end
end
