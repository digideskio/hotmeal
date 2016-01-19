require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Profile < Struct
      property :first_name
      property :last_name
      property :username
      property :gender
    end
  end
end
