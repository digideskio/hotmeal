# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/action'

module Hotmeal
  module Schema
    # Move Action
    #
    # @see http://schema.org/MoveAction
    #
    # Subtypes:
    # @see ArriveAction
    # @see DepartAction
    # @see TravelAction
    class MoveAction < Action
      # A sub property of location. The original location of the object or the agent before the action.
      property :from_location, class_names: %w[Place Number], as: 'fromLocation', label: 'From Location'
      # A sub property of location. The final location of the object or the agent after the action.
      property :to_location, class_names: %w[Place Number], as: 'toLocation', label: 'To Location'
    end
  end
end

