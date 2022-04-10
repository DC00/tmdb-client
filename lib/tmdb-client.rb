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

require "tmdb/token/mock"
require "tmdb/token/request"
require "tmdb/token/response"

module Tmdb

  class << self

    attr_accessor :api_key, :api_token, :domain

    def configure
      yield self
    end

  end

end
