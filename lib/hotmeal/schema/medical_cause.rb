# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/medical_entity'

module Hotmeal
  module Schema
    # Medical Cause
    #
    # @see http://schema.org/MedicalCause
    class MedicalCause < MedicalEntity
      # The condition, complication, symptom, sign, etc. caused.
      property :cause_of, class_name: 'MedicalEntity', as: 'causeOf', label: 'Cause of'
    end
  end
end

