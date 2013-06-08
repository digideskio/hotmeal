# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/place'

module Hotmeal
  module Schema
    # Civic Structure
    #
    # A public structure, such as a town hall or concert hall.
    # @see http://schema.org/CivicStructure
    #
    # Subtypes:
    # @see Airport
    # @see Aquarium
    # @see Beach
    # @see BusStation
    # @see BusStop
    # @see Campground
    # @see Cemetery
    # @see Crematorium
    # @see EventVenue
    # @see FireStation
    # @see GovernmentBuilding
    # @see Hospital
    # @see MovieTheater
    # @see Museum
    # @see MusicVenue
    # @see Park
    # @see ParkingFacility
    # @see PerformingArtsTheater
    # @see PlaceOfWorship
    # @see Playground
    # @see PoliceStation
    # @see RVPark
    # @see StadiumOrArena
    # @see SubwayStation
    # @see TaxiStand
    # @see TrainStation
    # @see Zoo
    class CivicStructure < Place
      # The opening hours for a business. Opening hours can be specified as a weekly time range, starting with days, then times per day. Multiple days can be listed with commas ',' separating each day. Day or time ranges are specified using a hyphen '-'.- Days are specified using the following two-letter combinations: Mo, Tu, We, Th, Fr, Sa, Su.- Times are specified using 24:00 time. For example, 3pm is specified as 15:00. - Here is an example: <time itemprop="openingHours" datetime="Tu,Th 16:00-20:00">Tuesdays and Thursdays 4-8pm</time>. - If a business is open 7 days a week, then it can be specified as <time itemprop="openingHours" datetime="Mo-Su">Monday through Sunday, all day</time>.
      property :opening_hours, class_name: 'Duration', as: 'openingHours', label: 'Opening Hours'
    end
  end
end

