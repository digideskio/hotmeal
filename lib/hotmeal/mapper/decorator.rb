require 'hotmeal/mapper'
require 'hotmeal/mapper/abstract_decorator'

module Hotmeal
  module Mapper
    class Decorator < AbstractDecorator
      extend ActiveSupport::Autoload

      include Hotmeal::Mapper::Html

      autoload :Attributes

      def __getobj__
        value
      end

      def value
        @html.try(:content)
      end

      def value=(value)
        @html.try(:content=, value) if @html.respond_to?(:content=)
      end

      def to_s
        to_html
      end
    end
  end
end
