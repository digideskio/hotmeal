require 'hotmeal/mapper'
require 'hotmeal/mapper/inspectable'
require 'delegate'
require 'active_support/core_ext/module/delegation'

module Hotmeal
  module Mapper
    class AbstractDecorator < SimpleDelegator
      include Hotmeal::Mapper::Inspectable

      alias_method :decorated, :__getobj__
    end
  end
end
