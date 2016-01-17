require 'hotmeal/mapper'

require 'delegate'

module Hotmeal
  module Mapper
    class CollectionDecorator < Decorator
      include Enumerable

      def self.item(options = {})
        @options = options
      end

      def self.decorator
        @options[:class] || Hotmeal::Mapper::Decorator
      end

      def each(&block)
        __getobj__.each(&block)
      end

      def __getobj__
        decorated_nodes.map { |item| self.class.decorator.new(item) }
      end

      def decorated_nodes
        search(path)
      end

      delegate :size, to: :__getobj__
    end
  end
end
