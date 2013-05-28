require 'hotmeal/micro_data'

module Hotmeal
  module MicroData
    extend ActiveSupport::Autoload

    autoload :Boolean
    autoload :DataType
    autoload :Date
    autoload :DateTime
    autoload :Float
    autoload :Integer
    autoload :Number
    autoload :Text
    autoload :Time
    autoload :URL
  end
end
