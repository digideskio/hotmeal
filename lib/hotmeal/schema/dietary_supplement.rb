# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/medical_therapy'

module Hotmeal
  module Schema
    # Dietary Supplement
    #
    # A product taken by mouth that contains a dietary ingredient intended to supplement the diet. Dietary ingredients may include vitamins, minerals, herbs or other botanicals, amino acids, and substances such as enzymes, organ tissues, glandulars and metabolites.
    # @see http://schema.org/DietarySupplement
    class DietarySupplement < MedicalTherapy
      # An active ingredient, typically chemical compounds and/or biologic substances.
      property :active_ingredient, class_name: 'Text', as: 'activeIngredient', label: 'Active Ingredient'
      # Descriptive information establishing a historical perspective on the supplement. May include the rationale for the name, the population where the supplement first came to prominence, etc.
      property :background, class_name: 'Text', as: 'background', label: 'Background'
      # A dosage form in which this drug/supplement is available, e.g. 'tablet', 'suspension', 'injection'.
      property :dosage_form, class_name: 'Text', as: 'dosageForm', label: 'Dosage Form'
      # True if this item's name is a proprietary/brand name (vs. generic name).
      property :is_proprietary, class_name: 'Boolean', as: 'isProprietary', label: 'Is Proprietary'
      # The drug or supplement's legal status, including any controlled substance schedules that apply.
      property :legal_status, class_name: 'DrugLegalStatus', as: 'legalStatus', label: 'Legal Status'
      # The manufacturer of the product.
      property :manufacturer, class_name: 'Organization', as: 'manufacturer', label: 'Manufacturer'
      # Recommended intake of this supplement for a given population as defined by a specific recommending authority.
      property :maximum_intake, class_name: 'MaximumDoseSchedule', as: 'maximumIntake', label: 'Maximum Intake'
      # The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.
      property :mechanism_of_action, class_name: 'Text', as: 'mechanismOfAction', label: 'Mechanism of Action'
      # The generic name of this drug or supplement.
      property :non_proprietary_name, class_name: 'Text', as: 'nonProprietaryName', label: 'Non Proprietary Name'
      # Recommended intake of this supplement for a given population as defined by a specific recommending authority.
      property :recommended_intake, class_name: 'RecommendedDoseSchedule', as: 'recommendedIntake', label: 'Recommended Intake'
      # Any potential safety concern associated with the supplement. May include interactions with other drugs and foods, pregnancy, breastfeeding, known adverse reactions, and documented efficacy of the supplement.
      property :safety_consideration, class_name: 'Text', as: 'safetyConsideration', label: 'Safety Consideration'
      # Characteristics of the population for which this is intended, or which typically uses it, e.g. 'adults'.
      property :target_population, class_name: 'Text', as: 'targetPopulation', label: 'Target Population'
    end
  end
end

