# -*- encoding : utf-8 -*-
require 'forklift/connection'
require 'forklift/request'
require 'forklift/utils'

require 'forklift/client/gd'
require 'forklift/client/catalog'


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

      if init_options[:api_key].nil? or init_options[:shared_secret].nil?
        raise ArgumentError, "You need give me api_key and shared_secret"
      end

      VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", init_options[key]) unless init_options[key].nil?
      end
    end

    # Alias for getting the sub-categories of certain category.
    # e.g. sites of certain section, categories of certain site
    def going_down(parent_hash={no: 0, level_no: 0})
      no       = sym_or_str_key(parent_hash, :no)
      level_no = sym_or_str_key(parent_hash, :level_no)

      if no.nil? or level_no.nil?
        return {}
      else
        return create_from_collection(get_catalog(no: no, level_no: level_no)["categories"], :catalog, self)
      end
    end

    # Alias for Forklift.new(api_key: ..., shared_secret: ...).gds(parent_hash)
    def unboxing(parent={no: 0, level_no: 0})
      case parent
      when Hash
        no       = sym_or_str_key(parent, :no)
        level_no = sym_or_str_key(parent, :level_no)

        create_from_collection(get_gd_info(no: no, level_no: level_no)["gds"], :gd, self)
      when Forklift::Client::Catalog
        create_from_collection(get_gd_info(no: parent.no, level_no: parent.level_no)["gds"], :gd, self)
      else
        {}
      end
    end

    VALID_CATALOGS.each_with_index do |name, level_no|
      define_method(name) do |parent={no: 0}|
        case parent
        when Hash
          no = sym_or_str_key(parent, :no)
          going_down(no: no, level_no: level_no)
        when Forklift::Client::Catalog
          going_down(no: parent.no, level_no: parent.level_no)
        else
          {}
        end
      end
    end

    include Forklift::Connection
    include Forklift::Request
    include Forklift::Utils
  end
end
