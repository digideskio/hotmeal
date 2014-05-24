# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/civic_structure'

module Hotmeal
  module Schema
    # Hospital
    #
    # @see http://schema.org/Hospital
    class Hospital < CivicStructure
      # A medical service available from this provider.
      property :available_service, class_names: %w[MedicalTest MedicalProcedure MedicalTherapy], as: 'availableService', label: 'Available Service'
      # A medical specialty of the provider.
      property :medical_specialty, class_name: 'MedicalSpecialty', as: 'medicalSpecialty', label: 'Medical Specialty'
    end
  end
end

