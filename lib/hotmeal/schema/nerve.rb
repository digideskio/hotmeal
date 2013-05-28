# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Nerve
    #
    # A common pathway for the electrochemical nerve impulses that are transmitted along each of the axons.
    # @see http://schema.org/Nerve
    class Nerve < AnatomicalStructure
      # The branches that delineate from the nerve bundle.
      property :branch, class_names: %w[AnatomicalStructure Nerve], as: 'branch', label: 'Branch'
      # The neurological pathway extension that involves muscle control.
      property :nerve_motor, class_name: 'Muscle', as: 'nerveMotor', label: 'Nerve Motor'
      # The neurological pathway extension that inputs and sends information to the brain or spinal cord.
      property :sensory_unit, class_names: %w[AnatomicalStructure SuperficialAnatomy], as: 'sensoryUnit', label: 'Sensory Unit'
      # The neurological pathway that originates the neurons.
      property :sourced_from, class_name: 'BrainStructure', as: 'sourcedFrom', label: 'Sourced From'
    end
  end
end
