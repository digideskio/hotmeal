require 'hotmeal/mapper'
require 'delegate'
require 'active_support/core_ext/module/delegation'

module Hotmeal
  module Mapper
    class Decorator < SimpleDelegator
      extend ActiveSupport::Autoload

      autoload :Attributes

      class << self
        attr_accessor :path
      end

      def initialize(html = nil, path = nil)
        path = html.path if html.respond_to?(:path)
        path ||= self.class.path
        self.html = html
        self.path = path
      end

      # @return [Nokogiri::XML::Node, nil]
      def html
        @html
      end

      def path
        @path ||=
          begin
            if @html.respond_to?(:path)
              @html.path
            else
              self.class.path
            end
          end
      end
      attr_writer :path

      def __getobj__
        if @html
          @html.content
        end
      end

      delegate :at, :search,
               :at_css, :css,
               :at_xpath, :xpath,
               to: :html

      # @return [Nokogiri::XML::Node, #to_s]
      def html=(value)
        unless value.is_a?(Nokogiri::XML::Node)
          value = Nokogiri::HTML(value.to_s) if value && value.respond_to?(:to_s)
        end
        @path = value.respond_to?(:path) ? value.path : nil
        @html = value
      end

      def value
        content
      end

      def value=(value)
        self.content = value if self.respond_to?()
      end

      def to_html
        if @html.respond_to?(:to_html)
          @html.to_html
        else
          __getobj__.to_s
        end
      end
    end
  end
end
