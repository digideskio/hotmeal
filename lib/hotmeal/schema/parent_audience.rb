# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/people_audience'

module Hotmeal
  module Schema
    # Parent Audience
    #
    # @see http://schema.org/ParentAudience
    class ParentAudience < PeopleAudience
      # Maximal age of the child
      property :child_max_age, class_name: 'Number', as: 'childMaxAge', label: 'Child Max Age'
      # Minimal age of the child
      property :child_min_age, class_name: 'Number', as: 'childMinAge', label: 'Child Min Age'
    end
  end
end
