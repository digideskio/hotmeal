# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Food Establishment
    #
    # A food-related business.
    # @see http://schema.org/FoodEstablishment
    #
    # Subtypes:
    # @see Bakery
    # @see BarOrPub
    # @see Brewery
    # @see CafeOrCoffeeShop
    # @see FastFoodRestaurant
    # @see IceCreamShop
    # @see Restaurant
    # @see Winery
    class FoodEstablishment < LocalBusiness
      # Either Yes/No, or a URL at which reservations can be made.
      property :accepts_reservations, class_names: %w[Text URL], as: 'acceptsReservations', label: 'Accepts Reservations'
      # Either the actual menu or a URL of the menu.
      property :menu, class_names: %w[Text URL], as: 'menu', label: 'Menu'
      # The cuisine of the restaurant.
      property :serves_cuisine, class_name: 'Text', as: 'servesCuisine', label: 'Serves Cuisine'
    end
  end
end
