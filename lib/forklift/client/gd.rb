# -*- encoding : utf-8 -*-
module Forklift
  class Client
    class Gd
      ATTRS = [:gd_id, :zone_name, :substation_name, :cat_name, :catitem_name, :gd_image, :gd_name, :gd_sdesc, :gd_spechead, :gd_price, :gd_brand, :gd_model, :gd_url, :subcat_no, :cat_no, :sub_no, :zone_no]
      attr_accessor(*ATTRS)

      def initialize(client, gd)
        @client   = client
        ATTRS.each do |attr|
          value = gd[attr] || gd[attr.to_s]
          value ||= ""
          send("#{attr}=", value)
        end
      end
    end
  end
end
