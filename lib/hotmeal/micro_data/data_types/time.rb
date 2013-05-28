require 'hotmeal/micro_data/data_types'

module Hotmeal
  module MicroData
    module DataTypes
      # Time
      #
      # A point in time recurring on multiple days in the form hh:mm:ss[Z|(+|-)hh:mm] (see XML schema for details).
      # @see http://schema.org/Time
      class Time < DataType
      end
    end
  end
end
