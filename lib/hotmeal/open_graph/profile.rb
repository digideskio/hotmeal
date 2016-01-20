require 'hotmeal/open_graph/object'

module Hotmeal
  class OpenGraph
    class Profile < Object
      self.namespace = Namespace.for('http://ogp.me/ns/profile#')

      property :first_name
      property :last_name
      property :username
      property :gender
    end
  end
end
