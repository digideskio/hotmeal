# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/structured_value'

module Hotmeal
  module Schema
    # Opening Hours Specification
    #
    # @see http://schema.org/OpeningHoursSpecification
    class OpeningHoursSpecification < StructuredValue
      # The closing hour of the place or service on the given day(s) of the week.
      property :closes, class_name: 'Time', as: 'closes', label: 'Closes'
      # The day of the week for which these opening hours are valid.
      property :day_of_week, class_name: 'DayOfWeek', as: 'dayOfWeek', label: 'Day of Week'
      # The opening hour of the place or service on the given day(s) of the week.
      property :opens, class_name: 'Time', as: 'opens', label: 'Opens'
      # The beginning of the validity of offer, price specification, or opening hours data.
      property :valid_from, class_name: 'DateTime', as: 'validFrom', label: 'Valid From'
      # The end of the validity of offer, price specification, or opening hours data.
      property :valid_through, class_name: 'DateTime', as: 'validThrough', label: 'Valid Through'
    end
  end
end

