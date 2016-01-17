require 'hotmeal/mapper'
require 'hotmeal/mapper/inspectable'
require 'delegate'
require 'active_support/core_ext/module/delegation'

module Hotmeal
  module Mapper
    class AbstractDecorator < SimpleDelegator
      include Inspectable
    end
  end
end
