require 'hotmeal/open_graph'

module Hotmeal
  class OpenGraph
    class Property < Hotmeal::Mapper::Decorator
      def name
        html_element[:property]
      end

      private

      def html_element
        @html.parent
      end
    end
  end
end
