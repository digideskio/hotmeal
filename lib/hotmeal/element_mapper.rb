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
        define_reader(method) { instance_eval(&block) }
        define_writer(method) { write_node_content(query, value) }
      end

      def map(query, options = {}, &block)
        extending_query_by(query) do |query|
          if options.key?(:as)
            block = ->(value) { value } unless block_given?
            method_name = options.delete(:as)
            define_mapper(method_name, query) do
              result = at(query)
              if result
                block.call(result.content)
              else
                result
              end
            end
          else
            puts 'What are you doing here?'
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
