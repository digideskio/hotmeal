# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/rating'

module Hotmeal
  module Schema
    # Aggregate Rating
    #
    # @see http://schema.org/AggregateRating
    class AggregateRating < Rating
      # The item that is being reviewed/rated.
      property :item_reviewed, class_name: 'Thing', as: 'itemReviewed', label: 'Item Reviewed'
      # The count of total number of ratings.
      property :rating_count, class_name: 'Number', as: 'ratingCount', label: 'Rating Count'
      # The count of total number of reviews.
      property :review_count, class_name: 'Number', as: 'reviewCount', label: 'Review Count'
    end
  end
end
