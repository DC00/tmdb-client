module Tmdb
  class Request

    # (Adaptee) Existing interface incompatible with client which we want to adapt to Client interface

    include Tmdb::Constants

    attr_accessor :mode, :options

    def initialize(options)
      self.mode    = options.delete(:mode)
      self.options = options
    end

    def attributes
      raise NotImplementedError.new("Must implement #attributes in subclass")
    end

  end
end
