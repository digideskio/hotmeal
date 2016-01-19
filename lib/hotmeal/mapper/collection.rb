require 'hotmeal/mapper'

require 'delegate'

module Hotmeal
  module Mapper
    class Collection < Decorator
      include Enumerable

      def self.of(mapper, options = {})
        full_class_name = options[:as] ||= "#{mapper}Collection"
        class_name = full_class_name.demodulize
        container_name = full_class_name.deconstantize
        container = options[:container] ||= container_name.constantize
        unless container.const_defined?(class_name)
          collection_class = Class.new(self)
          collection_class.decorate_items_with(mapper)
          container.const_set(class_name, collection_class)
        end
        container.const_get(class_name)
      end

      def self.item(options = {})
        @options = options
      end

      def self.options
        @options ||= {}
      end

      def self.decorate_items_with(klass)
        options[:class] = klass
      end

      def self.decorator
        @decorator ||=
          begin
            options[:class] = options[:class].constantize if options[:class].is_a?(String)
            options[:class] || Hotmeal::Mapper::Decorator
          end
      end

      def self.decorator=(decorator)
        decorator = decorator.constantize if decorator.is_a?(String)
        @options[:class] = decorator || Hotmeal::Mapper::Decorator
      end

      def initialize(html = nil, path = nil)
        super(html, path)
        __setobj__(collection)
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
        @nodes ||= @html ? @html.search(path) : []
      end
    end
  end
end
