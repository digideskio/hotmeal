# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/intangible'

module Hotmeal
  module Schema
    # Service Channel
    #
    # @see http://schema.org/ServiceChannel
    class ServiceChannel < Intangible
      # A language someone may use with the item.
      property :available_language, class_name: 'Language', as: 'availableLanguage', label: 'Available Language'
      # Estimated processing time for the service using this channel.
      property :processing_time, class_name: 'Duration', as: 'processingTime', label: 'Processing Time'
      # The service provided by this channel.
      property :provides_service, class_name: 'Service', as: 'providesService', label: 'Provides Service'
      # The location (e.g. civic structure, local business, etc.) where a person can go to access the service.
      property :service_location, class_name: 'Place', as: 'serviceLocation', label: 'Service Location'
      # The phone number to use to access the service.
      property :service_phone, class_name: 'ContactPoint', as: 'servicePhone', label: 'Service Phone'
      # The address for accessing the service by mail.
      property :service_postal_address, class_name: 'PostalAddress', as: 'servicePostalAddress', label: 'Service Postal Address'
      # The number to access the service by text message.
      property :service_sms_number, class_name: 'ContactPoint', as: 'serviceSmsNumber', label: 'Service Sms Number'
      # The website to access the service.
      property :service_url, class_name: 'URL', as: 'serviceUrl', label: 'Service Url'
    end
  end
end
