# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_intangible'

module Hotmeal
  module Schema
    # Dose Schedule
    #
    # @see http://schema.org/DoseSchedule
    #
    # Subtypes:
    # @see MaximumDoseSchedule
    # @see RecommendedDoseSchedule
    # @see ReportedDoseSchedule
    class DoseSchedule < MedicalIntangible
      # The unit of the dose, e.g. 'mg'.
      property :dose_unit, class_name: 'Text', as: 'doseUnit', label: 'Dose Unit'
      # The value of the dose, e.g. 500.
      property :dose_value, class_name: 'Number', as: 'doseValue', label: 'Dose Value'
      # How often the dose is taken, e.g. 'daily'.
      property :frequency, class_name: 'Text', as: 'frequency', label: 'Frequency'
      # Characteristics of the population for which this is intended, or which typically uses it, e.g. 'adults'.
      property :target_population, class_name: 'Text', as: 'targetPopulation', label: 'Target Population'
    end
  end
end
