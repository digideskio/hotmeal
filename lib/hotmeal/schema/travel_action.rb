# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/move_action'

module Hotmeal
  module Schema
    # Travel Action
    #
    # @see http://schema.org/TravelAction
    class TravelAction < MoveAction
      # A sub property of asset. The distance travelled.
      property :distance, class_name: 'Distance', as: 'distance', label: 'Distance'
    end
  end
end

