require 'hotmeal/mapper'
require 'delegate'
require 'active_support/core_ext/module/delegation'

module Hotmeal
  module Mapper
    class AbstractDecorator < SimpleDelegator
    end
  end
end
