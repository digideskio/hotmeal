# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Drug Class
    #
    # A class of medical drugs, e.g., statins. Classes can represent general pharmacological class, common mechanisms of action, common physiological effects, etc.
    # @see http://schema.org/DrugClass
    class DrugClass < MedicalTherapy
      # A drug in this drug class.
      property :drug, class_name: 'Drug', as: 'drug', label: 'Drug'
    end
  end
end
