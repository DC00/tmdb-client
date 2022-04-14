module Tmdb
  class Client

    attr_accessor :adapter

    def initialize
      # (Adapter)
      self.adapter = Tmdb::Adapter.build
    end

    def guest_session(options)
      request = Tmdb::Authentication::GuestSession::Request.new(options)
      request.execute(adapter)
    end

    def session(options)
      request = Tmdb::Authentication::Session::Request.new(options)
      request.execute(adapter)
    end

    def token(options)
      # (Adaptee) contains info for Adapter class
      request = Tmdb::Authentication::Token::Request.new(options)

      # (Target) request.execute returns Response which is the Target interface
      request.execute(adapter)
    end

    def movie_certifications(options)
      request = Tmdb::Certification::Movie::Request.new(options)
      request.execute(adapter)
    end

  end
end
