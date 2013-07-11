# -*- encoding : utf-8 -*-
module Forklift
  class Client
    module Sections
      def sections(parent_hash={no: 0})
        going_down(no: parent_hash[:no] || parent_hash["no"], level_no: 0)
      end
    end
  end
end
