require 'hotmeal/mapper'
require 'active_support/concern'

module Hotmeal
  module Mapper
    module Html
      extend ActiveSupport::Concern

      def initialize(html = nil, path = nil)
        self.html = html
        self.path = path
      end

      # @return [Nokogiri::XML::Node, nil]
      def html
        @html
      end

      # @return [Nokogiri::XML::Node, #to_s]
      def html=(value)
        value = if value.is_a?(Nokogiri::XML::Node) || value.is_a?(NilClass)
                  value
                elsif value.respond_to?(:read)
                  Nokogiri::HTML(value.read)
                elsif value.respond_to?(:to_s)
                  Nokogiri::HTML(value.to_s)
                else
                  raise ArgumentError, "Invalid value #{value.inspect} for Mapper#html"
                end
        @path = nil
        @html = value
      end

      delegate :at, :search, :at_css, :css, :at_xpath, :xpath, to: :html, allow_nil: true

      # @return [String]
      def path
        @path ||= @html.respond_to?(:path) ? @html.path : self.class.path
      end

      attr_writer :path

      def __getobj__
        value
      end

      def value
        html_content
      end

      def value=(value)
        self.html_content = value
      end

      # @return [String]
      def html_content
        if @html
          if @html.children.any? { |child| child.is_a?(Nokogiri::XML::Element) }
            @html.inner_html
          else
            @html.content
          end
        else
          nil
        end
      end

      def html_content=(content)
        @html ? @html.content = content : nil
      end

      def to_html
        @html ? @html.to_html : __getobj__.to_s
      end

      def to_s
        to_html
      end

      module ClassMethods
        attr_accessor :path
      end
    end
  end
end
