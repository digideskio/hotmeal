# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/medical_study'

module Hotmeal
  module Schema
    # Medical Trial
    #
    # @see http://schema.org/MedicalTrial
    class MedicalTrial < MedicalStudy
      # The phase of the trial.
      property :phase, class_name: 'Text', as: 'phase', label: 'Phase'
      # Specifics about the trial design (enumerated).
      property :trial_design, class_name: 'MedicalTrialDesign', as: 'trialDesign', label: 'Trial Design'
    end
  end
end

