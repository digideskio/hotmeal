# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Contact Point
    #
    # A contact point—for example, a Customer Complaints department.
    # @see http://schema.org/ContactPoint
    #
    # Subtypes:
    # @see PostalAddress
    class ContactPoint < StructuredValue
      # A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.
      property :contact_type, class_name: 'Text', as: 'contactType', label: 'Contact Type'
      # Email address.
      property :email, class_name: 'Text', as: 'email', label: 'Email'
      # The fax number.
      property :fax_number, class_name: 'Text', as: 'faxNumber', label: 'Fax Number'
      # The telephone number.
      property :telephone, class_name: 'Text', as: 'telephone', label: 'Telephone'
    end
  end
end

