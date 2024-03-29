# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Book
    #
    # @see http://schema.org/Book
    class Book < CreativeWork
      # The edition of the book.
      property :book_edition, class_name: 'Text', as: 'bookEdition', label: 'Book Edition'
      # The format of the book.
      property :book_format, class_name: 'BookFormatType', as: 'bookFormat', label: 'Book Format'
      # The illustrator of the book.
      property :illustrator, class_name: 'Person', as: 'illustrator', label: 'Illustrator'
      # The ISBN of the book.
      property :isbn, class_name: 'Text', as: 'isbn', label: 'ISBN'
      # The number of pages in the book.
      property :number_of_pages, class_name: 'Integer', as: 'numberOfPages', label: 'Number of Pages'
    end
  end
end
