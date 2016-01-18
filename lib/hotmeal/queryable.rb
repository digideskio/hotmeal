require 'hotmeal'
require 'active_support/concern'
require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/module/delegation'
require 'nokogiri'

module Hotmeal
  module Queryable
    extend ActiveSupport::Concern

    include Hotmeal::Mapper::Html

    CONTENT_GETTER = ->(node) { node.content }
    CONTENT_SETTER = ->(node, value) { node.content = value }

    included do
      class_attribute :query
      self.query = ''
    end

    # @param [String] query
    def read_node_content(query, &block)
      block ||= CONTENT_GETTER
      node = at(query)
      node ? block.call(node) : nil
    end

    # @param [String] query XPath query for exact element
    # @param [Object] value value to be inserted in the content of query's result (if any)
    def write_node_content(query, value, &block)
      block ||= CONTENT_SETTER
      node = at(query)
      node ? block.call(node, value) : nil
    end

    module ClassMethods
      def extending_query_by(query, &block)
        parent_query = self.query
        self.query = self.query + query.to_s

        result = block.arity == 1 ? block.call(self.query) : block.call

        self.query = parent_query
        result
      end
    end

    include ClassMethods
  end
end
