module Forklift
  class Client
    module Categories
      def categories(parent_hash={no: 0})
        get_catalog(no: parent_hash[:no] || parent_hash["no"], level_no: 2)["categories"]
      end
    end
  end
end
