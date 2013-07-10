# -*- encoding : utf-8 -*-
module Forklift
  class Client
    module Gds
      def gds(parent_hash={no: 0, level_no: 0})
        no       = parent_hash[:no] || parent_hash["no"]
        level_no = parent_hash[:level_no] || parent_hash["level_no"]
        get_gd_info(no: no, level_no: level_no)["gds"]
      end
    end
  end
end
