module Forklift
  class Client
    module Sites
      def sites(parent_no=0)
        get_catalog(no: parent_no, level_no: 1)
      end
    end
  end
end
