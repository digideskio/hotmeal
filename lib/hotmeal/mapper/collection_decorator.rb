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

      def self.decorator=(decorator)
        @options[:class] = decorator || Hotmeal::Mapper::Decorator
      end

      def each(&block)
        value.each(&block)
      end

      # @return [<Hotmeal::Mapper::Decorator>]
      def value
        decorated_nodes.map { |item| self.class.decorator.new(item) }
      end

      def value=(values)
        values.each_with_index do |item, index|
          value[index].value = item
        end
      end

      def decorated_nodes
        @decorated_nodes ||= @html ? @html.search(path) : []
      end
    end
  end
end
