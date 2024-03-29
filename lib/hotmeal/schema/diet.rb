# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Diet
    #
    # @see http://schema.org/Diet
    class Diet < CreativeWork
      # Nutritional information specific to the dietary plan. May include dietary recommendations on what foods to avoid, what foods to consume, and specific alterations/deviations from the USDA or other regulatory body's approved dietary guidelines.
      property :diet_features, class_name: 'Text', as: 'dietFeatures', label: 'Diet Features'
      # People or organizations that endorse the plan.
      property :endorsers, class_names: %w(Organization Person), as: 'endorsers', label: 'Endorsers'
      # Medical expert advice related to the plan.
      property :expert_considerations, class_name: 'Text', as: 'expertConsiderations', label: 'Expert Considerations'
      # Descriptive information establishing the overarching theory/philosophy of the plan. May include the rationale for the name, the population where the plan first came to prominence, etc.
      property :overview, class_name: 'Text', as: 'overview', label: 'Overview'
      # Specific physiologic benefits associated to the plan.
      property :physiological_benefits, class_name: 'Text', as: 'physiologicalBenefits', label: 'Physiological Benefits'
      # Proprietary name given to the diet plan, typically by its originator or creator.
      property :proprietary_name, class_name: 'Text', as: 'proprietaryName', label: 'Proprietary Name'
      # Specific physiologic risks associated to the plan.
      property :risks, class_name: 'Text', as: 'risks', label: 'Risks'
    end
  end
end
