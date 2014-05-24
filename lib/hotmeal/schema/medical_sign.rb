# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_sign_or_symptom'

module Hotmeal
  module Schema
    # Medical Sign
    #
    # @see http://schema.org/MedicalSign
    class MedicalSign < MedicalSignOrSymptom
      # A physical examination that can identify this sign.
      property :identifying_exam, class_name: 'PhysicalExam', as: 'identifyingExam', label: 'Identifying Exam'
      # A diagnostic test that can identify this sign.
      property :identifying_test, class_name: 'MedicalTest', as: 'identifyingTest', label: 'Identifying Test'
    end
  end
end

