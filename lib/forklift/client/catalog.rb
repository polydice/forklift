# -*- encoding : utf-8 -*-
module Forklift
  class Client
    class Catalog
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

      def unboxing
        @client.unboxing(no: @no, level_no: @level_no)
      end
    end
  end
end
