# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Medical Test Panel
    #
    # Any collection of tests commonly ordered together.
    # @see http://schema.org/MedicalTestPanel
    class MedicalTestPanel < MedicalTest
      # A component test of the panel.
      property :sub_test, class_name: 'MedicalTest', as: 'subTest', label: 'Sub Test'
    end
  end
end
