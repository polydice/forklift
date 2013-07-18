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

        if result[:count].to_i == 1
          result[:catalogs] = [Forklift::Client::Catalog.new(client, collection["category"])]
        elsif result[:count].to_i > 1
          result[:catalogs] = collection["category"].map do |hash|
            Forklift::Client::Catalog.new(client, hash)
          end
        else
          result[:catalogs] = []
        end

      when :gd

        if result[:count].to_i == 1
          result[:gds] = [Forklift::Client::Gd.new(client, collection["gd"])]
        elsif result[:count].to_i > 1
          result[:gds] = collection["gd"].nil? ? [] : collection["gd"].map do |hash|
            Forklift::Client::Gd.new(client, hash)
          end
        else
          result[:gds] = []
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
