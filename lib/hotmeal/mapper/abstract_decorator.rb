require 'hotmeal/mapper'
require 'hotmeal/mapper/inspectable'
require 'delegate'
require 'active_support/core_ext/module/delegation'

module Hotmeal
  module Mapper
    class AbstractDecorator < SimpleDelegator
      include Hotmeal::Mapper::Inspectable

      alias_method :decorated, :__getobj__

      def self.delegate_attribute(*attributes)
        options = attributes.extract_options!
        attributes = attributes.inject([]) do |result, attribute|
          result + %I(#{attribute} #{attribute}= #{attribute}?)
        end
        attributes << options
        delegate(*attributes)
      end
    end
  end
end
