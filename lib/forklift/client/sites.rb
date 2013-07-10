module Forklift
  class Client
    module Sites
      def sites(parent_hash={no: 0})
        get_catalog(no: parent_hash[:no] || parent_hash["no"], level_no: 1)["categories"]
      end
    end
  end
end
