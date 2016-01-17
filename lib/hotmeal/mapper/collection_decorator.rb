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
        value.each(&block)
      end

      def value
        decorated_nodes.map { |item| self.class.decorator.new(item) }
      end

      def value=(values)
        raise NotImplementedError, "#{self.class}#values= is not implemented. Setting of values for multiple elements mapping is not supported yet"
        decorated_nodes.map { |item| self.class.decorator.new(item) }
      end

      def decorated_nodes
        search(path)
      end

      delegate :size, to: :__getobj__
    end
  end
end
