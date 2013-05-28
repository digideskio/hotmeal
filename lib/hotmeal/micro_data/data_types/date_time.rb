require 'hotmeal/micro_data/data_types'

module Hotmeal
  module MicroData
    module DataTypes
      # Date Time
      #
      # A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (see Chapter 5.4 of ISO 8601).
      # @see http://schema.org/DateTime
      class DateTime < DataType
      end
    end
  end
end
