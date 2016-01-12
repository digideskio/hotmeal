require 'hotmeal'
require 'hotmeal/node'
require 'hotmeal/methods_module'
require 'active_support/concern'

module Hotmeal
  module ElementMapper
    extend ActiveSupport::Concern
    include Hotmeal::Node
    include Hotmeal::MethodsModule

    module ClassMethods
      def define_mapper(method, query, &block)
        define_reader(method) { read_node_content(query, &block) }
        define_writer(method) { write_node_content(query, value) }
      end

      def map(query, options = {}, &block)
        extending_query_by(query) do |query|
          if options.key?(:as)
            block = Hotmeal::Node::CONTENT_GETTER unless block_given?
            define_mapper(options.delete(:as), query, &block)
          else
            block.call
          end
        end
      end

      def collect(query, options = {}, &block)
        extending_query_by(query) do |query|
          if options.key?(:as)
            attr_reader(options[:as])
            block = Hotmeal::Node::CONTENT_GETTER unless block_given?
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
            instance_variable_set("@#{options[:as]}", value)
          end
        end
      end

      def use(query, options = {}, &block)
        extending_query_by(query) do |query|
          if options.key?(:as)
            method = options.delete(:as)
            attr_reader(method)
            block = Hotmeal::Node::CONTENT_GETTER unless block_given?
            value = block.call(at(query))
            instance_variable_set("@#{method}", value)
          end
        end
      end

      def map_each(query, options = {}, &block)
        extending_query_by(query) do |query|
          if options.key?(:as)
            method = options.delete(:as)
            mapper_class = options.delete(:class) { CollectionMapper }
            instance_variable = "@#{method}"
            define_method(method) do
              instance_variable_get(instance_variable) ||
                instance_variable_set(instance_variable, mapper_class.new(html, query, &block))
            end
          end
        end
      end
    end
  end
end
