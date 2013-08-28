# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/article'

module Hotmeal
  module Schema
    # News Article
    #
    # @see http://schema.org/NewsArticle
    class NewsArticle < Article
      # The location where the NewsArticle was produced.
      property :dateline, class_name: 'Text', as: 'dateline', label: 'Dateline'
      # The number of the column in which the NewsArticle appears in the print edition.
      property :print_column, class_name: 'Text', as: 'printColumn', label: 'Print Column'
      # The edition of the print product in which the NewsArticle appears.
      property :print_edition, class_name: 'Text', as: 'printEdition', label: 'Print Edition'
      # If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).
      property :print_page, class_name: 'Text', as: 'printPage', label: 'Print Page'
      # If this NewsArticle appears in print, this field indicates the print section in which the article appeared.
      property :print_section, class_name: 'Text', as: 'printSection', label: 'Print Section'
    end
  end
end

