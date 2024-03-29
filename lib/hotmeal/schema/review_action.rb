# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/assess_action'

module Hotmeal
  module Schema
    # Review Action
    #
    # @see http://schema.org/ReviewAction
    class ReviewAction < AssessAction
      # A sub property of result. The review that resulted in the performing of the action.
      property :result_review, class_name: 'Review', as: 'resultReview', label: 'Result Review'
    end
  end
end
