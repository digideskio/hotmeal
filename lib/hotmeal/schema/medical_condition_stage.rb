# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_intangible'

module Hotmeal
  module Schema
    # Medical Condition Stage
    #
    # @see http://schema.org/MedicalConditionStage
    class MedicalConditionStage < MedicalIntangible
      # The stage represented as a number, e.g. 3.
      property :stage_as_number, class_name: 'Number', as: 'stageAsNumber', label: 'Stage As Number'
      # The substage, e.g. 'a' for Stage IIIa.
      property :sub_stage_suffix, class_name: 'Text', as: 'subStageSuffix', label: 'Sub Stage Suffix'
    end
  end
end
