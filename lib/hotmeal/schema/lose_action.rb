# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/achieve_action'

module Hotmeal
  module Schema
    # Lose Action
    #
    # @see http://schema.org/LoseAction
    class LoseAction < AchieveAction
      # A sub property of participant. The winner of the action.
      property :winner, class_name: 'Person', as: 'winner', label: 'Winner'
    end
  end
end
