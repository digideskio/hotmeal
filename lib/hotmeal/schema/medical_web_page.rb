# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/web_page'

module Hotmeal
  module Schema
    # Medical Web Page
    #
    # @see http://schema.org/MedicalWebPage
    class MedicalWebPage < WebPage
      # An aspect of medical practice that is considered on the page, such as 'diagnosis', 'treatment', 'causes', 'prognosis', 'etiology', 'epidemiology', etc.
      property :aspect, class_name: 'Text', as: 'aspect', label: 'Aspect'
    end
  end
end
