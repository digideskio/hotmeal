require 'hotmeal/micro_data/data_types'
require 'delegate'

module Hotmeal
  module MicroData
    module DataTypes
      # Data Type
      #
      # The basic data types such as Integers, Strings, etc.
      # @see http://schema.org/DataType
      #
      # Subtypes:
      # @see Boolean
      # @see Date
      # @see DateTime
      # @see Number
      # @see Text
      # @see Time
      class DataType < SimpleDelegator
        def self.from_microdata(value)
          new(value.to_s)
        end

        def to_microdata
          __getobj__.to_s
        end
      end
    end
  end
end
