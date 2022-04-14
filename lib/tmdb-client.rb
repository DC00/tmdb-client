require "httparty"
require "active_support/core_ext/hash"
require "tmdb/version"

require "tmdb/adapter"
require "tmdb/client"
require "tmdb/constants"
require "tmdb/exception"
require "tmdb/payload"
require "tmdb/request"
require "tmdb/response"

require "tmdb/authentication/guest_session/mock"
require "tmdb/authentication/guest_session/request"
require "tmdb/authentication/guest_session/response"

require "tmdb/authentication/session/mock"
require "tmdb/authentication/session/request"
require "tmdb/authentication/session/response"

require "tmdb/authentication/token/mock"
require "tmdb/authentication/token/request"
require "tmdb/authentication/token/response"

module Tmdb

  class << self

    attr_accessor :api_key, :api_token, :domain

    def configure
      yield self
    end

  end

end
