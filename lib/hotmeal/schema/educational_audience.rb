# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/audience'

module Hotmeal
  module Schema
    # Educational Audience
    #
    # @see http://schema.org/EducationalAudience
    class EducationalAudience < Audience
      # An educationalRole of an EducationalAudience
      property :educational_role, class_name: 'Text', as: 'educationalRole', label: 'Educational Role'
    end
  end
end

