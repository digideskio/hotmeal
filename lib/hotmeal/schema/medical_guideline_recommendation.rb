# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Medical Guideline Recommendation
    #
    # A guideline recommendation that is regarded as efficacious and where quality of the data supporting the recommendation is sound.
    # @see http://schema.org/MedicalGuidelineRecommendation
    class MedicalGuidelineRecommendation < MedicalGuideline
      # Strength of the guideline's recommendation (e.g. 'class I').
      property :recommendation_strength, class_name: 'Text', as: 'recommendationStrength', label: 'Recommendation Strength'
    end
  end
end

