# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Medical Condition Stage
    #
    # A stage of a medical condition, such as 'Stage IIIa'.
    # @see http://schema.org/MedicalConditionStage
    class MedicalConditionStage < MedicalIntangible
      # The stage represented as a number, e.g. 3.
      property :stage_as_number, class_name: 'Number', as: 'stageAsNumber', label: 'Stage As Number'
      # The substage, e.g. 'a' for Stage IIIa.
      property :sub_stage_suffix, class_name: 'Text', as: 'subStageSuffix', label: 'Sub Stage Suffix'
    end
  end
end

