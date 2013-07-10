# -*- encoding : utf-8 -*-
require "forklift/version"
require "forklift/error"
require "forklift/client"

module Forklift
  class << self
    # Alias for Forklift::Client.new, with this alias you can call Forklift.new
    #
    # @return [Forklift::Client]
    def new(options={})
      Forklift::Client.new(options)
    end

    # Delegate to Forklift::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
