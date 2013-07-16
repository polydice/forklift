# -*- encoding : utf-8 -*-
module Forklift
  module Utils
    # collection = {"count" => 123, "gd" => [...]}
    # target = gd or catalog
    def create_from_collection(collection, target, client)
      result = {}
      result[:count] = collection["count"]
      case target.to_sym
      when :catalog
        result[:catalogs] = collection["category"].nil? ? [] : collection["category"].map do |hash|
          Forklift::Client::Catalog.new(client, hash)
        end
      when :gd
        result[:gds] = collection["gd"].nil? ? [] : collection["gd"].map do |hash|
          Forklift::Client::Gd.new(client, hash)
        end
      end

      return result
    end

    def sym_or_str_key(hash, key)
      result = hash[key.to_sym] || hash[key.to_s]
      return result
    end
  end
end
