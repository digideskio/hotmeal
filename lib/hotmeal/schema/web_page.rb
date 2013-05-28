# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Web Page
    #
    # A web page. Every web page is implicitly assumed to be declared to be of type WebPage, so the various properties about that webpage, such as breadcrumb may be used. We recommend explicit declaration if these properties are specified, but if they are found outside of an itemscope, they will be assumed to be about the page
    # @see http://schema.org/WebPage
    #
    # Subtypes:
    # @see AboutPage
    # @see CheckoutPage
    # @see CollectionPage
    # @see ContactPage
    # @see ItemPage
    # @see MedicalWebPage
    # @see ProfilePage
    # @see SearchResultsPage
    class WebPage < CreativeWork
      # A set of links that can help a user understand and navigate a website hierarchy.
      property :breadcrumb, class_name: 'Text', as: 'breadcrumb', label: 'Breadcrumb'
      # Indicates the collection or gallery to which the item belongs.
      property :is_part_of, class_name: 'CollectionPage', as: 'isPartOf', label: 'Is Part of'
      # Date on which the content on this web page was last reviewed for accuracy and/or completeness.
      property :last_reviewed, class_name: 'Date', as: 'lastReviewed', label: 'Last Reviewed'
      # Indicates if this web page element is the main subject of the page.
      property :main_content_of_page, class_name: 'WebPageElement', as: 'mainContentOfPage', label: 'Main Content of Page'
      # Indicates the main image on the page
      property :primary_image_of_page, class_name: 'ImageObject', as: 'primaryImageOfPage', label: 'Primary Image of Page'
      # A link related to this web page, for example to other related web pages.
      property :related_link, class_name: 'URL', as: 'relatedLink', label: 'Related Link'
      # People or organizations that have reviewed the content on this web page for accuracy and/or completeness.
      property :reviewed_by, class_names: %w[Organization Person], as: 'reviewedBy', label: 'Reviewed by'
      # One of the more significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most.
      property :significant_link, class_name: 'URL', as: 'significantLink', label: 'Significant Link'
      # The most significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most (legacy spelling; see singular form, significantLink).
      property :significant_links, class_name: 'URL', as: 'significantLinks', label: 'Significant Links'
      # One of the domain specialities to which this web page's content applies.
      property :specialty, class_name: 'Specialty', as: 'specialty', label: 'Specialty'
    end
  end
end
