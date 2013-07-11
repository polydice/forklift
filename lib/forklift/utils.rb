# -*- encoding : utf-8 -*-
module Forklift
  module Utils
    # data = {"count" => 123, "gd" => [...]}
    # target = gd or catalog
    def create_from_collection(data, target)
      result = {}
      result[:count] = data["count"]
      case target.to_sym
      when :catalog
        result[:catalogs] = data["category"].map do |hash|
            send("create_catalog", hash)
        end
      when :gd
        result[:gds] = data["gd"].map do |hash|
            send("create_gd", hash)
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
