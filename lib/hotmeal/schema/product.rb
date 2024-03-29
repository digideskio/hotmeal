# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/thing'

module Hotmeal
  module Schema
    # Product
    #
    # @see http://schema.org/Product
    #
    # Subtypes:
    # @see IndividualProduct
    # @see ProductModel
    # @see SomeProducts
    class Product < Thing
      # The overall rating, based on a collection of reviews or ratings, of the item.
      property :aggregate_rating, class_name: 'AggregateRating', as: 'aggregateRating', label: 'Aggregate Rating'
      # The intended audience of the item, i.e. the group for whom the item was created.
      property :audience, class_name: 'Audience', as: 'audience', label: 'Audience'
      # The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
      property :brand, class_names: %w(Organization Brand), as: 'brand', label: 'Brand'
      # The color of the product.
      property :color, class_name: 'Text', as: 'color', label: 'Color'
      # The depth of the product.
      property :depth, class_names: %w(Distance QuantitativeValue), as: 'depth', label: 'Depth'
      # The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero.
      property :gtin13, class_name: 'Text', as: 'gtin13', label: 'Gtin13'
      # The GTIN-14 code of the product, or the product to which the offer refers.
      property :gtin14, class_name: 'Text', as: 'gtin14', label: 'Gtin14'
      # The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN.
      property :gtin8, class_name: 'Text', as: 'gtin8', label: 'Gtin8'
      # The height of the item.
      property :height, class_names: %w(Distance QuantitativeValue), as: 'height', label: 'Height'
      # A pointer to another product (or multiple products) for which this product is an accessory or spare part.
      property :is_accessory_or_spare_part_for, class_name: 'Product', as: 'isAccessoryOrSparePartFor', label: 'Is Accessory or Spare Part for'
      # A pointer to another product (or multiple products) for which this product is a consumable.
      property :is_consumable_for, class_name: 'Product', as: 'isConsumableFor', label: 'Is Consumable for'
      # A pointer to another, somehow related product (or multiple products).
      property :is_related_to, class_name: 'Product', as: 'isRelatedTo', label: 'Is Related to'
      # A pointer to another, functionally similar product (or multiple products).
      property :is_similar_to, class_name: 'Product', as: 'isSimilarTo', label: 'Is Similar to'
      # A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
      property :item_condition, class_name: 'OfferItemCondition', as: 'itemCondition', label: 'Item Condition'
      # A logo associated with an organization.
      property :logo, class_names: %w(URL ImageObject), as: 'logo', label: 'Logo'
      # The manufacturer of the product.
      property :manufacturer, class_name: 'Organization', as: 'manufacturer', label: 'Manufacturer'
      # The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong product identifiers via the gtin8/gtin13/gtin14 and mpn properties.
      property :model, class_names: %w(ProductModel Text), as: 'model', label: 'Model'
      # The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
      property :mpn, class_name: 'Text', as: 'mpn', label: 'Mpn'
      # An offer to transfer some rights to an item or to provide a service—for example, an offer to sell tickets to an event, to rent the DVD of a movie, to stream a TV show over the internet, to repair a motorcycle, or to loan a book.
      property :offers, class_name: 'Offer', as: 'offers', label: 'Offers'
      # The product identifier, such as ISBN. For example: <meta itemprop='productID' content='isbn:123-456-789'/>.
      property :product_id, class_name: 'Text', as: 'productID', label: 'Product ID'
      # The release date of a product or product model. This can be used to distinguish the exact variant of a product.
      property :release_date, class_name: 'Date', as: 'releaseDate', label: 'Release Date'
      # A review of the item.
      property :review, class_name: 'Review', as: 'review', label: 'Review'
      # Review of the item (legacy spelling; see singular form, review).
      property :reviews, class_name: 'Review', as: 'reviews', label: 'Reviews'
      # The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
      property :sku, class_name: 'Text', as: 'sku', label: 'Sku'
      # The weight of the product.
      property :weight, class_name: 'QuantitativeValue', as: 'weight', label: 'Weight'
      # The width of the item.
      property :width, class_names: %w(Distance QuantitativeValue), as: 'width', label: 'Width'
    end
  end
end
