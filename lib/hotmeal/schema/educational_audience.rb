# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/audience'

module Hotmeal
  module Schema
    # Educational Audience
    #
    # An EducationalAudience
    # @see http://schema.org/EducationalAudience
    class EducationalAudience < Audience
      # An educationalRole of an EducationalAudience
      property :educational_role, class_name: 'Text', as: 'educationalRole', label: 'Educational Role'
    end
  end
end

