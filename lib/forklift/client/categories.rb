module Forklift
  class Client
    module Categories
      def categories(parent_no=0)
        get_catalog(no: parent_no, level_no: 2)
      end
    end
  end
end
