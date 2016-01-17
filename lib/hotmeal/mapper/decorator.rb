require 'hotmeal/mapper'
require 'hotmeal/mapper/abstract_decorator'

module Hotmeal
  module Mapper
    class Decorator < AbstractDecorator
      extend ActiveSupport::Autoload

      include Hotmeal::Mapper::Html

      autoload :Attributes

      class << self
        attr_accessor :path
      end

      def initialize(html = nil, path = nil)
        self.html = html
        self.path = path
      end

      def __getobj__
        @html ? @html.content : nil
      end

      delegate :at, :search,
               :at_css, :css,
               :at_xpath, :xpath,
               to: :html, allow_nil: true

      def value
        content
      end

      def value=(value)
        self.content = value if self.respond_to?()
      end

      def to_s
        to_html
      end
    end
  end
end
