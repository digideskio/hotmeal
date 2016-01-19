require 'hotmeal/mapper'

module Hotmeal
  module Mapper
    module Inspectable
      def inspect
        if has_attributes?
          contents = inspect_attributes
          '#<%s:0x%x %s>' % [self.class, object_id, contents]
        elsif respond_to?(:collection)
          collection.inspect
        elsif respond_to?(:html_content)
          html_content.inspect
        else
          super
        end
      end

      private

      def inspect_attributes
        attributes.map do |(name, value)|
          value = value.__getobj__ while value.respond_to?(:__getobj__)
          "@#{name}=#{value.inspect}"
        end.join(' ')
      end
    end
  end
end
