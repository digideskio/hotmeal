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

      def value
        @value ||= collection
      end

      delegate :first, :last, :size, :each, to: :collection

      def value=(values)
        values.each_with_index do |item, index|
          value[index].value = item
        end
      end

      # @return [<Hotmeal::Mapper::Decorator>]
      def collection
        @collection ||= nodes.map { |item| self.class.decorator.new(item) }
      end

      # @return [<Nokogiri::XML::Node>]
      def nodes
        @decorated_nodes ||= @html ? @html.search(path) : []
      end
    end
  end
end
