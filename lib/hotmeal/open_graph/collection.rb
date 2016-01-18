require 'hotmeal/open_graph'

module Hotmeal
  class OpenGraph
    class Collection < Hotmeal::Mapper::CollectionDecorator
      def self.of(mapper)
        full_class_name = "#{mapper.name}Collection"
        class_name = full_class_name.demodulize
        container = full_class_name.deconstantize.constantize
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
