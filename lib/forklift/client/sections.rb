module Forklift
  class Client
    module Sections
      def sections(parent_no=0)
        return get_catalog(no: parent_no, level_no: 0)["categories"]
      end
    end
  end
end
