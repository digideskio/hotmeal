require 'hotmeal/open_graph'

module Hotmeal
  class OpenGraph
    class Collection < Hotmeal::Mapper::CollectionDecorator
      def self.of(mapper)
        full_class_name = "#{mapper}Collection"
        class_name = full_class_name.demodulize
        container_name = full_class_name.deconstantize
        container = container_name.constantize
        unless container.const_defined?(class_name)
          collection_class = Class.new(self)
          collection_class.item class: mapper
          container.const_set(class_name, collection_class)
        end
        container.const_get(class_name)
      end
    end
  end
end
