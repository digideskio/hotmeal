# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/intangible'

module Hotmeal
  module Schema
    # Rating
    #
    # The rating of the video.
    # @see http://schema.org/Rating
    #
    # Subtypes:
    # @see AggregateRating
    class Rating < Intangible
      # The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.
      property :best_rating, class_names: %w[Number Text], as: 'bestRating', label: 'Best Rating'
      # The rating for the content.
      property :rating_value, class_name: 'Text', as: 'ratingValue', label: 'Rating Value'
      # The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.
      property :worst_rating, class_names: %w[Number Text], as: 'worstRating', label: 'Worst Rating'
    end
  end
end

