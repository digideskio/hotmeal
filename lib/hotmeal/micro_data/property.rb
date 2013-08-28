require 'hotmeal/micro_data'

module Hotmeal
  module MicroData
    class Property
      def initialize(name, options={})
        @name = name
        @as = options.delete(:as)
        if options[:class_name]
          @class_name = options.delete(:class_name)
        elsif options[:class_names]
          @class_names = options.delete(:class_names)
        end
        @from = options[:from]
        @options = options
      end

      attr_reader :name, :class_name
    end
  end
end
