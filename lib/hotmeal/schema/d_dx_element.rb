# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/medical_intangible'

module Hotmeal
  module Schema
    # D Dx Element
    #
    # @see http://schema.org/DDxElement
    class DDxElement < MedicalIntangible
      # One or more alternative conditions considered in the differential diagnosis process.
      property :diagnosis, class_name: 'MedicalCondition', as: 'diagnosis', label: 'Diagnosis'
      # One of a set of signs and symptoms that can be used to distinguish this diagnosis from others in the differential diagnosis.
      property :distinguishing_sign, class_name: 'MedicalSignOrSymptom', as: 'distinguishingSign', label: 'Distinguishing Sign'
    end
  end
end

