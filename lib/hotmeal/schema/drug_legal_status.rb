# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_intangible'

module Hotmeal
  module Schema
    # Drug Legal Status
    #
    # @see http://schema.org/DrugLegalStatus
    class DrugLegalStatus < MedicalIntangible
      # The location in which the status applies.
      property :applicable_location, class_name: 'AdministrativeArea', as: 'applicableLocation', label: 'Applicable Location'
    end
  end
end
