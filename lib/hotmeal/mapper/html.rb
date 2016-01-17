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

      def __getobj__
        @html ? @html.content : nil
      end

      # @return [String]
      def path
        @path ||= @html.respond_to?(:path) ? @html.path : self.class.path
      end

      attr_writer :path


      def to_html
        if @html.respond_to?(:to_html)
          @html.to_html
        else
          __getobj__.to_s
        end
      end

      module ClassMethods
        attr_accessor :path
      end
    end
  end
end
