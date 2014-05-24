# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_entity'

module Hotmeal
  module Schema
    # Medical Test
    #
    # @see http://schema.org/MedicalTest
    #
    # Subtypes:
    # @see BloodTest
    # @see DiagnosticProcedure
    # @see ImagingTest
    # @see MedicalTestPanel
    # @see PathologyTest
    class MedicalTest < MedicalEntity
      # Drugs that affect the test's results.
      property :affected_by, class_name: 'Drug', as: 'affectedBy', label: 'Affected by'
      # Range of acceptable values for a typical patient, when applicable.
      property :normal_range, class_name: 'Text', as: 'normalRange', label: 'Normal Range'
      # A sign detected by the test.
      property :sign_detected, class_name: 'MedicalSign', as: 'signDetected', label: 'Sign Detected'
      # A condition the test is used to diagnose.
      property :used_to_diagnose, class_name: 'MedicalCondition', as: 'usedToDiagnose', label: 'Used to Diagnose'
      # Device used to perform the test.
      property :uses_device, class_name: 'MedicalDevice', as: 'usesDevice', label: 'Uses Device'
    end
  end
end

