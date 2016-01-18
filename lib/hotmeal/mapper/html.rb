require 'hotmeal/mapper'
require 'active_support/concern'

module Hotmeal
  module Mapper
    module Html
      extend ActiveSupport::Concern

      def initialize(html = nil, path = nil)
        self.html = html
        self.path = path
        process
      end

      def process
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
        __setobj__(value.content) if value && value.respond_to?(:content) && respond_to?(:__setobj__)
      end

      delegate :at, :search, :at_css, :css, :at_xpath, :xpath, :inner_html, :inner_text,
               to: :html, allow_nil: true
      alias_method :__search__, :search # TODO: remove. Now for backward compatibility

      def inner_text
        return unless @html
        @html.inner_text.to_s.strip
      end

      def inner_html
        return unless @html
        @html.inner_html.to_s.strip
      end

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
        return unless @html
        @html.content
      end

      def html_content=(content)
        return unless @html
        @html.content = content
      end

      # @return [String]
      def to_html
        @html ? @html.to_html : ''
      end

      # @return [String]
      def to_s
        element? ? to_html : html_content.to_s
      end

      # @return [Boolean]
      def element?
        @html.is_a?(Nokogiri::XML::Element)
      end

      # @return [Boolean]
      def attribute?
        @html.is_a?(Nokogiri::XML::Attr)
      end

      module ClassMethods
        # @return [String]
        attr_accessor :path
      end
    end
  end
end
