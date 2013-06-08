# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/performing_group'

module Hotmeal
  module Schema
    # Music Group
    #
    # A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
    # @see http://schema.org/MusicGroup
    class MusicGroup < PerformingGroup
      # A music album.
      property :album, class_name: 'MusicAlbum', as: 'album', label: 'Album'
      # A collection of music albums (legacy spelling; see singular form, album).
      property :albums, class_name: 'MusicAlbum', as: 'albums', label: 'Albums'
      # A member of the music group—for example, John, Paul, George, or Ringo.
      property :music_group_member, class_name: 'Person', as: 'musicGroupMember', label: 'Music Group Member'
      # A music recording (track)—usually a single song.
      property :track, class_name: 'MusicRecording', as: 'track', label: 'Track'
      # A music recording (track)—usually a single song (legacy spelling; see singular form, track).
      property :tracks, class_name: 'MusicRecording', as: 'tracks', label: 'Tracks'
    end
  end
end

