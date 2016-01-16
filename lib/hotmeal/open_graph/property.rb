require 'hotmeal/open_graph'
require 'hotmeal/inspectable'

module Hotmeal
  class OpenGraph
    class Property
      include Hotmeal::Inspectable

      # @param [String] name
      # @param [Hash] options
      def initialize(name, options = {})
        @name = name
        @options = options
      end

      def ns!(name, uri = nil, &block)
        extend Hotmeal::OpenGraph::PropertiesMethods
        ns(name, uri, &block)
      end
    end
  end
end
