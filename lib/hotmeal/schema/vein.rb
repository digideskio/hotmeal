# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/vessel'

module Hotmeal
  module Schema
    # Vein
    #
    # @see http://schema.org/Vein
    class Vein < Vessel
      # The vasculature that the vein drains into.
      property :drains_to, class_name: 'Vessel', as: 'drainsTo', label: 'Drains to'
      # The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.
      property :region_drained, class_names: %w[AnatomicalSystem AnatomicalStructure], as: 'regionDrained', label: 'Region Drained'
      # The anatomical or organ system that the vein flows into; a larger structure that the vein connects to.
      property :tributary, class_name: 'AnatomicalStructure', as: 'tributary', label: 'Tributary'
    end
  end
end

