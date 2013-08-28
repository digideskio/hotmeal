require 'hotmeal/micro_data/data_types'

module Hotmeal
  module MicroData
    module DataTypes
      # Boolean
      #
      # Boolean: True or False.
      # @see http://schema.org/Boolean
      class Boolean < DataType
        def self.from_microdata(value)
          case value
          when true, false
            super(value)
          when 'true', 't', 'yes', 'y', '1', 1
            super(true)
          when 'false', 'f', 'no', 'n', '0', 0
            super(false)
          else
            nil
          end
        end
      end
    end
  end
end

