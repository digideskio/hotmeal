require 'hotmeal/micro_data'

module Hotmeal
  module MicroData
    module DataTypes
      extend ActiveSupport::Autoload

      autoload :DataType

      autoload :Boolean
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
end
