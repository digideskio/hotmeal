# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/anatomical_structure'

module Hotmeal
  module Schema
    # Muscle
    #
    # @see http://schema.org/Muscle
    class Muscle < AnatomicalStructure
      # The movement the muscle generates.
      property :action, class_name: 'Text', as: 'action', label: 'Action'
      # The muscle whose action counteracts the specified muscle.
      property :antagonist, class_name: 'Muscle', as: 'antagonist', label: 'Antagonist'
      # The blood vessel that carries blood from the heart to the muscle.
      property :blood_supply, class_name: 'Vessel', as: 'bloodSupply', label: 'Blood Supply'
      # The place of attachment of a muscle, or what the muscle moves.
      property :insertion, class_name: 'AnatomicalStructure', as: 'insertion', label: 'Insertion'
      # The underlying innervation associated with the muscle.
      property :nerve, class_name: 'Nerve', as: 'nerve', label: 'Nerve'
      # The place or point where a muscle arises.
      property :origin, class_name: 'AnatomicalStructure', as: 'origin', label: 'Origin'
    end
  end
end
