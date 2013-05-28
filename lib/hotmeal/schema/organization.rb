# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Organization
    #
    # An organization such as a school, NGO, corporation, club, etc.
    # @see http://schema.org/Organization
    #
    # Subtypes:
    # @see Corporation
    # @see EducationalOrganization
    # @see GovernmentOrganization
    # @see LocalBusiness
    # @see NGO
    # @see PerformingGroup
    # @see SportsTeam
    class Organization < Thing
      # Physical address of the item.
      property :address, class_name: 'PostalAddress', as: 'address', label: 'Address'
      # The overall rating, based on a collection of reviews or ratings, of the item.
      property :aggregate_rating, class_name: 'AggregateRating', as: 'aggregateRating', label: 'Aggregate Rating'
      # The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
      property :brand, class_names: %w[Organization Brand], as: 'brand', label: 'Brand'
      # A contact point for a person or organization.
      property :contact_point, class_name: 'ContactPoint', as: 'contactPoint', label: 'Contact Point'
      # A contact point for a person or organization (legacy spelling; see singular form, contactPoint).
      property :contact_points, class_name: 'ContactPoint', as: 'contactPoints', label: 'Contact Points'
      # The Dun & Bradstreet DUNS number for identifying an organization or business person.
      property :duns, class_name: 'Text', as: 'duns', label: 'Duns'
      # Email address.
      property :email, class_name: 'Text', as: 'email', label: 'Email'
      # Someone working for this organization.
      property :employee, class_name: 'Person', as: 'employee', label: 'Employee'
      # People working for this organization. (legacy spelling; see singular form, employee)
      property :employees, class_name: 'Person', as: 'employees', label: 'Employees'
      # Upcoming or past event associated with this place or organization.
      property :event, class_name: 'Event', as: 'event', label: 'Event'
      # Upcoming or past events associated with this place or organization (legacy spelling; see singular form, event).
      property :events, class_name: 'Event', as: 'events', label: 'Events'
      # The fax number.
      property :fax_number, class_name: 'Text', as: 'faxNumber', label: 'Fax Number'
      # A person who founded this organization.
      property :founder, class_name: 'Person', as: 'founder', label: 'Founder'
      # A person who founded this organization (legacy spelling; see singular form, founder).
      property :founders, class_name: 'Person', as: 'founders', label: 'Founders'
      # The date that this organization was founded.
      property :founding_date, class_name: 'Date', as: 'foundingDate', label: 'Founding Date'
      # The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
      property :global_location_number, class_name: 'Text', as: 'globalLocationNumber', label: 'Global Location Number'
      # Points-of-Sales operated by the organization or person.
      property :has_pos, class_name: 'Place', as: 'hasPOS', label: 'Has POS'
      # A count of a specific user interactions with this item—for example, 20 UserLikes, 5 UserComments, or 300 UserDownloads. The user interaction type should be one of the sub types of UserInteraction.
      property :interaction_count, class_name: 'Text', as: 'interactionCount', label: 'Interaction Count'
      # The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
      property :isic_v4, class_name: 'Text', as: 'isicV4', label: 'Isic V4'
      # The official name of the organization, e.g. the registered company name.
      property :legal_name, class_name: 'Text', as: 'legalName', label: 'Legal Name'
      # The location of the event or organization.
      property :location, class_names: %w[PostalAddress Place], as: 'location', label: 'Location'
      # URL of an image for the logo of the item.
      property :logo, class_names: %w[URL ImageObject], as: 'logo', label: 'Logo'
      # A pointer to products or services offered by the organization or person.
      property :makes_offer, class_name: 'Offer', as: 'makesOffer', label: 'Makes Offer'
      # A member of this organization.
      property :member, class_names: %w[Organization Person], as: 'member', label: 'Member'
      # A member of this organization (legacy spelling; see singular form, member).
      property :members, class_names: %w[Organization Person], as: 'members', label: 'Members'
      # The North American Industry Classification System (NAICS) code for a particular organization or business person.
      property :naics, class_name: 'Text', as: 'naics', label: 'Naics'
      # Products owned by the organization or person.
      property :owns, class_names: %w[OwnershipInfo Product], as: 'owns', label: 'Owns'
      # A review of the item.
      property :review, class_name: 'Review', as: 'review', label: 'Review'
      # Review of the item (legacy spelling; see singular form, review).
      property :reviews, class_name: 'Review', as: 'reviews', label: 'Reviews'
      # A pointer to products or services sought by the organization or person (demand).
      property :seeks, class_name: 'Demand', as: 'seeks', label: 'Seeks'
      # The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
      property :tax_id, class_name: 'Text', as: 'taxID', label: 'Tax ID'
      # The telephone number.
      property :telephone, class_name: 'Text', as: 'telephone', label: 'Telephone'
      # The Value-added Tax ID of the organisation or person.
      property :vat_id, class_name: 'Text', as: 'vatID', label: 'Vat ID'
    end
  end
end

