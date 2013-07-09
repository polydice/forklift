module Forklift
  class Client
    module Roots
      def roots
        get("/URL", options)
      end
  end
end