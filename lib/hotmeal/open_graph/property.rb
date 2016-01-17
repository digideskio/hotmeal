require 'hotmeal/open_graph'
require 'delegate'

module Hotmeal
  class OpenGraph
    class Property < SimpleDelegator
      class << self
        # @return [String]
        attr_accessor :property_name

        # @return [String]
        attr_accessor :property

        # @return [Hotmeal::OpenGraph::PropertyDefinition]
        attr_accessor :parent
      end

      def initialize(definition, node = nil)
        @definition = definition
        super(node)
      end

      attr_reader :definition

      def content
        __getobj__.respond_to?(:content) ? __getobj__.content : __getobj__
      end

      def content=(value)
        __getobj__.respond_to?(:content=) ? __getobj__.content = value : __setobj__(value)
      end

      def inspectable?
        !!__getobj__
      end

      def inspect
        '#(%s=%s)' % [definition.property, __getobj__.inspect]
      end

      def to_s
        '%s=%s' % [definition.property, __getobj__] if __getobj__
      end
    end
  end
end
