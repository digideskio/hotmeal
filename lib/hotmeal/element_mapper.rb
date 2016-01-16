require 'hotmeal'
require 'hotmeal/node'
require 'hotmeal/methods_module'
require 'hotmeal/inspectable'
require 'active_support/concern'
require 'active_support/core_ext/array/wrap'

module Hotmeal
  module ElementMapper
    extend ActiveSupport::Concern
    include Hotmeal::Node
    include Hotmeal::MethodsModule
    include Hotmeal::Inspectable

    module ClassMethods
      def define_mapper(method, query, &block)
        define_reader(method) { read_node_content(query, &block) }
        define_writer(method) { write_node_content(query, value) }
      end

      def map(query, options = {}, &block)
        block = Hotmeal::Node::CONTENT_GETTER unless block_given?
        extending_query_by(query) do |query|
          if options.key?(:as)
            define_mapper(options[:as], query, &block)
          else
            block.call
          end
        end
      end

      def collect(query, options = {}, &block)
        block = Hotmeal::Node::CONTENT_GETTER unless block_given?
        fail 'No :as option' unless options[:as]
        define_reader(options[:as]) do
          extending_query_by(query) do |query|
            value = search(query)
            if options[:use]
              if options[:by]
                result = Hash.new { |hash, key| hash[key] = [] }
                value.each do |element|
                  result[element[options[:by]]] << element[options[:use]]
                end
                result
              else
                use = Array.wrap(options[:use])
                value.map do |node|
                  use.map { |property| node[property] }
                end
              end
            else
              value.map(&block)
            end
          end
        end
      end

      def use(query, options = {}, &block)
        block = Hotmeal::Node::CONTENT_GETTER unless block_given?
        extending_query_by(query) do |query|
          define_reader(options[:as]) { block.call(at(query)) } if options.key?(:as)
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
