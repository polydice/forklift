# -*- encoding : utf-8 -*-
module Forklift
  class Client
    class Catalog
      include Forklift::Utils
      attr_accessor :no, :level_no, :name, :type
      def initialize(client, catalog = {no: 0, level_no: 0, name: "", type: ""})
        @client   = client
        @no       = catalog[:no]       || catalog["no"]
        @level_no = catalog[:level_no] || catalog["level_no"]
        @name     = catalog[:name]     || catalog["name"]
        @type     = catalog[:type]     || catalog["type"]
      end

      def going_down
        @client.going_down(no: @no, level_no: @level_no)
      end

      def unboxing(options = {page: 1, ps: 50})
        page = sym_or_str_key(options, :page, 1)
        ps   = sym_or_str_key(options, :ps, 50)
        @client.unboxing(no: @no, level_no: @level_no, page: page, ps: ps)
      end
    end
  end
end
