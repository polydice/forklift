module Forklift
  class Client
    module Sections
      def sections(parent_hash={no: 0})
        get_catalog(no: parent_hash[:no] || parent_hash["no"], level_no: 0)["categories"]
      end
    end
  end
end
