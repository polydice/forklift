# -*- encoding : utf-8 -*-
require 'faraday'
require 'forklift/version'

module Forklift
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :faraday_config_block,
      :api_version,
      :api_endpoint,
      :proxy,
      :api_key,
      :shared_secret,
      :auto_traversal,
      :user_agent].freeze

    DEFAULT_ADAPTER             = Faraday.default_adapter
    DEFAULT_API_VERSION         = 'v1/'
    DEFAULT_API_ENDPOINT        = 'http://tw.partner.buy.yahoo.com/api/'
    DEFAULT_USER_AGENT          = "Forklift Ruby Gem #{Forklift::VERSION}".freeze
    DEFAULT_AUTO_TRAVERSAL      = false

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    # This will append a slash on the end of 'value'.
    def api_endpoint=(value)
      @api_endpoint = File.join(value, "")
    end

    # This will append a slash on the end of 'value'.
    def api_version=(value)
      @api_version = File.join(value, "")
    end

    def faraday_config(&block)
      @faraday_config_block = block
    end

    def reset
      self.adapter             = DEFAULT_ADAPTER
      self.api_version         = DEFAULT_API_VERSION
      self.api_endpoint        = DEFAULT_API_ENDPOINT
      self.proxy               = nil
      self.api_version         = nil
      self.api_key             = nil
      self.shared_secret       = nil
      self.user_agent          = DEFAULT_USER_AGENT
      self.auto_traversal      = DEFAULT_AUTO_TRAVERSAL
    end
  end
end

