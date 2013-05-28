# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Place
    #
    # Entities that have a somewhat fixed, physical extension.
    # @see http://schema.org/Place
    #
    # Subtypes:
    # @see AdministrativeArea
    # @see CivicStructure
    # @see Landform
    # @see LandmarksOrHistoricalBuildings
    # @see LocalBusiness
    # @see Residence
    # @see TouristAttraction
    class Place < Thing
      # Physical address of the item.
      property :address, class_name: 'PostalAddress', as: 'address', label: 'Address'
      # The overall rating, based on a collection of reviews or ratings, of the item.
      property :aggregate_rating, class_name: 'AggregateRating', as: 'aggregateRating', label: 'Aggregate Rating'
      # The basic containment relation between places.
      property :contained_in, class_name: 'Place', as: 'containedIn', label: 'Contained in'
      # Upcoming or past event associated with this place or organization.
      property :event, class_name: 'Event', as: 'event', label: 'Event'
      # Upcoming or past events associated with this place or organization (legacy spelling; see singular form, event).
      property :events, class_name: 'Event', as: 'events', label: 'Events'
      # The fax number.
      property :fax_number, class_name: 'Text', as: 'faxNumber', label: 'Fax Number'
      # The geo coordinates of the place.
      property :geo, class_names: %w[GeoCoordinates GeoShape], as: 'geo', label: 'Geo'
      # The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
      property :global_location_number, class_name: 'Text', as: 'globalLocationNumber', label: 'Global Location Number'
      # A count of a specific user interactions with this item—for example, 20 UserLikes, 5 UserComments, or 300 UserDownloads. The user interaction type should be one of the sub types of UserInteraction.
      property :interaction_count, class_name: 'Text', as: 'interactionCount', label: 'Interaction Count'
      # The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
      property :isic_v4, class_name: 'Text', as: 'isicV4', label: 'Isic V4'
      # URL of an image for the logo of the item.
      property :logo, class_names: %w[URL ImageObject], as: 'logo', label: 'Logo'
      # A URL to a map of the place.
      property :map, class_name: 'URL', as: 'map', label: 'Map'
      # A URL to a map of the place (legacy spelling; see singular form, map).
      property :maps, class_name: 'URL', as: 'maps', label: 'Maps'
      # The opening hours of a certain place.
      property :opening_hours_specification, class_name: 'OpeningHoursSpecification', as: 'openingHoursSpecification', label: 'Opening Hours Specification'
      # A photograph of this place.
      property :photo, class_names: %w[ImageObject Photograph], as: 'photo', label: 'Photo'
      # Photographs of this place (legacy spelling; see singular form, photo).
      property :photos, class_names: %w[ImageObject Photograph], as: 'photos', label: 'Photos'
      # A review of the item.
      property :review, class_name: 'Review', as: 'review', label: 'Review'
      # Review of the item (legacy spelling; see singular form, review).
      property :reviews, class_name: 'Review', as: 'reviews', label: 'Reviews'
      # The telephone number.
      property :telephone, class_name: 'Text', as: 'telephone', label: 'Telephone'
    end
  end
end
