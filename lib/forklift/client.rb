require 'forklift/connection'
require 'forklift/request'

require 'forklift/client/sections'
require 'forklift/client/sites'
require 'forklift/client/categories'
require 'forklift/client/subcategories'


module Forklift

  class Client
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

    attr_accessor(*VALID_OPTIONS_KEYS)

    DEFAULT_ADAPTER             = Faraday.default_adapter
    DEFAULT_API_VERSION         = 'v1/'
    DEFAULT_API_ENDPOINT        = 'http://tw.partner.buy.yahoo.com/api/'
    DEFAULT_USER_AGENT          = "Forklift Ruby Gem #{Forklift::VERSION}".freeze
    DEFAULT_AUTO_TRAVERSAL      = false

    def initialize(init_options={})

      self.adapter             = DEFAULT_ADAPTER
      self.api_version         = DEFAULT_API_VERSION
      self.api_endpoint        = DEFAULT_API_ENDPOINT
      self.user_agent          = DEFAULT_USER_AGENT
      self.auto_traversal      = DEFAULT_AUTO_TRAVERSAL

      VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", init_options[key]) unless init_options[key].nil?
      end
    end

    include Forklift::Connection
    include Forklift::Request
    #include Forklift::Client::Root
    include Forklift::Client::Sections
    include Forklift::Client::Sites
    include Forklift::Client::Categories
    include Forklift::Client::Subcategories
  end
end
