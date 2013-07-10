# -*- encoding : utf-8 -*-
module Forklift
  class Client
    module Subcategories
      def subcategories(parent_hash={no: 0})
        get_catalog(no: parent_hash[:no] || parent_hash["no"], level_no: 3)["categories"]
      end
    end
  end
end
