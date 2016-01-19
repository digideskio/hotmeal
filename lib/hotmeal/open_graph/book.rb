require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Book < Struct
      property :author, array: true, class: Collection.of(Profile)
      property :isbn
      property :release_date, type: DateTime
      property :tag, array: true
    end
  end
end
