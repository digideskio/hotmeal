require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Article < Object
      property :published_time, type: DateTime
      property :modified_time, type: DateTime
      property :expiration_time, type: DateTime
      property :author, array: true, class: Collection.of(Profile)
      property :section
      property :tag, array: true
    end
  end
end
