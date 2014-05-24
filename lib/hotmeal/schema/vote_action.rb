# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/choose_action'

module Hotmeal
  module Schema
    # Vote Action
    #
    # @see http://schema.org/VoteAction
    class VoteAction < ChooseAction
      # A sub property of object. The candidate subject of this action.
      property :candidate, class_name: 'Person', as: 'candidate', label: 'Candidate'
    end
  end
end

