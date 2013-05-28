# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Medical Guideline
    #
    # Any recommendation made by a standard society (e.g. ACC/AHA) or consensus statement that denotes how to diagnose and treat a particular condition. Note: this type should be used to tag the actual guideline recommendation; if the guideline recommendation occurs in a larger scholarly article, use MedicalScholarlyArticle to tag the overall article, not this type. Note also: the organization making the recommendation should be captured in the recognizingAuthority base property of MedicalEntity.
    # @see http://schema.org/MedicalGuideline
    #
    # Subtypes:
    # @see MedicalGuidelineContraindication
    # @see MedicalGuidelineRecommendation
    class MedicalGuideline < MedicalEntity
      # Strength of evidence of the data used to formulate the guideline (enumerated).
      property :evidence_level, class_name: 'MedicalEvidenceLevel', as: 'evidenceLevel', label: 'Evidence Level'
      # Source of the data used to formulate the guidance, e.g. RCT, consensus opinion, etc.
      property :evidence_origin, class_name: 'Text', as: 'evidenceOrigin', label: 'Evidence Origin'
      # Date on which this guideline's recommendation was made.
      property :guideline_date, class_name: 'Date', as: 'guidelineDate', label: 'Guideline Date'
      # The medical conditions, treatments, etc. that are the subject of the guideline.
      property :guideline_subject, class_name: 'MedicalEntity', as: 'guidelineSubject', label: 'Guideline Subject'
    end
  end
end
