require 'hotmeal'
require 'hotmeal/element_mapper'
require 'hotmeal/methods_module'
require 'hotmeal/node'

module Hotmeal
  class CollectionMapper
    include Hotmeal::MethodsModule::ClassMethods
    include Hotmeal::Node
    include Hotmeal::ElementMapper

    def initialize(html, query, &block)
      self.html = html
      self.query = query
      @value = instance_eval(&block) if block_given?
      process
    end

    def process
      # no-op
    end

    def collect(query, options = {}, &block)
      extending_query_by(query) do |query|
        if options.key?(:as)
          method = options.delete(:as)
          attr_reader(method)
          block = CONTENT_GETTER unless block_given?
          value = search(query)
          value = if options[:by] && options[:use]
                    result = Hash.new { |hash, key| hash[key] = [] }
                    value.each do |element|
                      result[element[options[:by]]] << element[options[:use]]
                    end
                    result
                  else
                    value.map(&block)
                  end
          instance_variable_set("@#{method}", value)
        end
      end
    end

    def use(query, options = {}, &block)
      extending_query_by(query) do |query|
        if options.key?(:as)
          method = options.delete(:as)
          attr_reader(method)
          block = CONTENT_GETTER unless block_given?
          value = block.call(at(query))
          instance_variable_set("@#{method}", value)
        end
      end
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
