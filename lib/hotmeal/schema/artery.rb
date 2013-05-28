# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Artery
    #
    # A type of blood vessel that specifically carries blood away from the heart.
    # @see http://schema.org/Artery
    class Artery < Vessel
      # The branches that comprise the arterial structure.
      property :arterial_branch, class_name: 'AnatomicalStructure', as: 'arterialBranch', label: 'Arterial Branch'
      # The anatomical or organ system that the artery originates from.
      property :source, class_name: 'AnatomicalStructure', as: 'source', label: 'Source'
      # The area to which the artery supplies blood to.
      property :supply_to, class_name: 'AnatomicalStructure', as: 'supplyTo', label: 'Supply to'
    end
  end
end
