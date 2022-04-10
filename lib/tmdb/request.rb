module Tmdb
  class Request

    include Tmdb::Constants

    attr_accessor :mode
    attr_accessor :options

    def initialize(options)
      self.mode    = options.delete(:mode)
      self.options = options
    end

    def attributes
      raise NotImplementedError.new("Must implement #attributes in subclass")
    end

  end
end
