require 'hotmeal/mapper'

module Hotmeal
  module Mapper
    module Inspectable
      def inspect
        '#<%s:0x%x %s>' % [self.class, object_id, inspect_attributes]
      end

      private

      def inspect_attributes
        attributes.map do |(name, value)|
          "@#{name}=#{value.inspect}"
        end.join(' ')
      end
    end
  end
end
