require 'hotmeal/open_graph/property'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  class OpenGraph
    class Struct < Property
      extend ActiveSupport::Concern

      autoload :Audio
      autoload :Image
      autoload :Url

      class_attribute :aliased_attribute

      def self.ns(ns, uri, &block)

      end

      def self.prefix
        @prefix ||= "#{semantic_name.first.underscore}:"
      end

      def self.property_class
        @property_class ||= semantic_name.map(&:underscore).join('.')
      end

      def self.semantic_name
        name.gsub(/Hotmeal::OpenGraph::/, '').split('::')
      end

      # @example
      #   property :title, required: true, ns: :og
      #
      #   is equivalent to
      #
      #   attribute "[@property='og:title']/@content", as: property, class: Property
      def self.property(name, options = {}, &block)
        property = [options[:ns], name].join(':')
        options.delete(:array)
        attribute "[@property='#{property}']/@content", { as: name, class: Property }.merge(options)
      end

      def self.alias_property(name)
        self.aliased_attribute = name
      end

      def initialize(html = nil, path = nil)
        super(html, path)
        write_attribute(aliased_attribute, self) if aliased_attribute
      end

      def read_attribute(name)
        @attributes[name]
      end

      def write_attribute(name, value)
        @attributes[name] = value
      end

      def attributes
        @attributes ||= {}
      end

      def process
        super
        @attributes = {}
        return unless @html.respond_to?(:parent)
        element = @html.parent
        while property?(element = element.next_element)
          attribute = element[:property].to_s.gsub(property_regexp, '')
          public_send("#{attribute}=", element[:content])
        end
      end

      def property?(element)
        return unless html_content
        element[:property].to_s =~ property_regexp
      end

      def property_regexp
        @property_regexp ||= /#{name}:/
      end

      def __getobj__
        html_content
      end
    end
  end
end
