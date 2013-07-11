# -*- encoding : utf-8 -*-
require 'forklift/connection'
require 'forklift/request'

require 'forklift/client/sections'
require 'forklift/client/sites'
require 'forklift/client/categories'
require 'forklift/client/subcategories'
require 'forklift/client/gds'


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

    VALID_CATALOGS = [:sections, :sites, :categories, :subcategories]

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

    # Alias for getting the sub-categories of certain category.
    # e.g. sites of certain section, categories of certain site
    def going_down(parent_hash={no: 0, level_no: 0})
      no       = parent_hash[:no]       || parent_hash["no"]
      level_no = parent_hash[:level_no] || parent_hash["level_no"]

      if no.nil? or level_no.nil?
        return {}
      else
        return get_catalog(no: no, level_no: level_no)["categories"]
      end
    end

    # Alias for Forklift.new(api_key: ..., shared_secret: ...).gds(parent_hash)
    def unboxing(parent_hash)
      gds(parent_hash)
    end

    VALID_CATALOGS.each_with_index do |name, level_no|
      define_method(name) do |parent_hash={no: 0}|
        going_down(no: parent_hash[:no] || parent_hash["no"], level_no: level_no)
      end
    end

    include Forklift::Connection
    include Forklift::Request
    include Forklift::Client::Gds
    #include Forklift::Client::Root
    #include Forklift::Client::Sections
    #include Forklift::Client::Sites
    #include Forklift::Client::Categories
    #include Forklift::Client::Subcategories
  end
end
