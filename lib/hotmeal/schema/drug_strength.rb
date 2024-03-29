# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_intangible'

module Hotmeal
  module Schema
    # Drug Strength
    #
    # @see http://schema.org/DrugStrength
    class DrugStrength < MedicalIntangible
      # An active ingredient, typically chemical compounds and/or biologic substances.
      property :active_ingredient, class_name: 'Text', as: 'activeIngredient', label: 'Active Ingredient'
      # The location in which the strength is available.
      property :available_in, class_name: 'AdministrativeArea', as: 'availableIn', label: 'Available in'
      # The units of an active ingredient's strength, e.g. mg.
      property :strength_unit, class_name: 'Text', as: 'strengthUnit', label: 'Strength Unit'
      # The value of an active ingredient's strength, e.g. 325.
      property :strength_value, class_name: 'Number', as: 'strengthValue', label: 'Strength Value'
    end
  end
end
