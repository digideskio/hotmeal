require 'hotmeal'
require 'hotmeal/element_mapper'
require 'hotmeal/methods_module'
require 'hotmeal/queryable'

module Hotmeal
  class CollectionMapper
    include Hotmeal::MethodsModule::ClassMethods
    include Hotmeal::Queryable
    include Hotmeal::ElementMapper
    include Hotmeal::ElementMapper::ClassMethods

    def initialize(html, query, &block)
      self.html = html
      self.query = query
      @value = instance_eval(&block) if block_given?
      process
    end

    def process
      # no-op
    end

    def methods_module
      @methods_module ||=
        begin
          singleton_class.send(:include, mod = Module.new)
          mod
        end
    end
  end
end
