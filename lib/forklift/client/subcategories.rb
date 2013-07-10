module Forklift
  class Client
    module Subcategories
      def subcategories(parent_no=0)
        get_catalog(no: parent_no, level_no: 3)
      end
    end
  end
end
