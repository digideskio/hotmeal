# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_organization'

module Hotmeal
  module Schema
    # Diagnostic Lab
    #
    # @see http://schema.org/DiagnosticLab
    class DiagnosticLab < MedicalOrganization
      # A diagnostic test or procedure offered by this lab.
      property :available_test, class_name: 'MedicalTest', as: 'availableTest', label: 'Available Test'
    end
  end
end

