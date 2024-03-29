# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Music Recording
    #
    # @see http://schema.org/MusicRecording
    class MusicRecording < CreativeWork
      # The artist that performed this album or recording.
      property :by_artist, class_name: 'MusicGroup', as: 'byArtist', label: 'By Artist'
      # The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      property :duration, class_name: 'Duration', as: 'duration', label: 'Duration'
      # The album to which this recording belongs.
      property :in_album, class_name: 'MusicAlbum', as: 'inAlbum', label: 'In Album'
      # The playlist to which this recording belongs.
      property :in_playlist, class_name: 'MusicPlaylist', as: 'inPlaylist', label: 'In Playlist'
    end
  end
end
