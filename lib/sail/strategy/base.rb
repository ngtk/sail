module Sail
  module Strategy
    class Base
      def prepare
        raise NotImplementedError
      end

      def update
        raise NotImplementedError
      end
    end
  end
end
