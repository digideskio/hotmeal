# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/audience'

module Hotmeal
  module Schema
    # People Audience
    #
    # @see http://schema.org/PeopleAudience
    #
    # Subtypes:
    # @see MedicalAudience
    # @see ParentAudience
    class PeopleAudience < Audience
      # Expectations for health conditions of target audience
      property :health_condition, class_name: 'MedicalCondition', as: 'healthCondition', label: 'Health Condition'
      # Audiences defined by a person's gender.
      property :required_gender, class_name: 'Text', as: 'requiredGender', label: 'Required Gender'
      # Audiences defined by a person's maximum age.
      property :required_max_age, class_name: 'Integer', as: 'requiredMaxAge', label: 'Required Max Age'
      # Audiences defined by a person's minimum age.
      property :required_min_age, class_name: 'Integer', as: 'requiredMinAge', label: 'Required Min Age'
      # The gender of the person or audience.
      property :suggested_gender, class_name: 'Text', as: 'suggestedGender', label: 'Suggested Gender'
      # Maximal age recommended for viewing content
      property :suggested_max_age, class_name: 'Number', as: 'suggestedMaxAge', label: 'Suggested Max Age'
      # Minimal age recommended for viewing content
      property :suggested_min_age, class_name: 'Number', as: 'suggestedMinAge', label: 'Suggested Min Age'
    end
  end
end

