# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/vessel'

module Hotmeal
  module Schema
    # Lymphatic Vessel
    #
    # @see http://schema.org/LymphaticVessel
    class LymphaticVessel < Vessel
      # The vasculature the lymphatic structure originates, or afferents, from.
      property :originates_from, class_name: 'Vessel', as: 'originatesFrom', label: 'Originates From'
      # The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.
      property :region_drained, class_names: %w[AnatomicalSystem AnatomicalStructure], as: 'regionDrained', label: 'Region Drained'
      # The vasculature the lymphatic structure runs, or efferents, to.
      property :runs_to, class_name: 'Vessel', as: 'runsTo', label: 'Runs to'
    end
  end
end

