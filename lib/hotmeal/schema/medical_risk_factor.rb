# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_entity'

module Hotmeal
  module Schema
    # Medical Risk Factor
    #
    # @see http://schema.org/MedicalRiskFactor
    class MedicalRiskFactor < MedicalEntity
      # The condition, complication, etc. influenced by this factor.
      property :increases_risk_of, class_name: 'MedicalEntity', as: 'increasesRiskOf', label: 'Increases Risk of'
    end
  end
end
