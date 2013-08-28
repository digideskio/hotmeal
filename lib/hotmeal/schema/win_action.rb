# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/achieve_action'

module Hotmeal
  module Schema
    # Win Action
    #
    # @see http://schema.org/WinAction
    class WinAction < AchieveAction
      # A sub property of participant. The loser of the action.
      property :loser, class_name: 'Person', as: 'loser', label: 'Loser'
    end
  end
end

