# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Episode
    #
    # @see http://schema.org/Episode
    #
    # Subtypes:
    # @see RadioEpisode
    # @see TVEpisode
    class Episode < CreativeWork
      # A cast member of the movie, tv/radio series, season, episode, or video.
      property :actor, class_name: 'Person', as: 'actor', label: 'Actor'
      # A cast member of the movie, tv/radio series, season, episode, or video. (legacy spelling; see singular form, actor)
      property :actors, class_name: 'Person', as: 'actors', label: 'Actors'
      # The director of the movie, tv/radio episode or series.
      property :director, class_name: 'Person', as: 'director', label: 'Director'
      # The director of the movie, tv/radio episode or series. (legacy spelling; see singular form, director)
      property :directors, class_name: 'Person', as: 'directors', label: 'Directors'
      # Position of the episode within an ordered group of episodes.
      property :episode_number, class_name: 'Integer', as: 'episodeNumber', label: 'Episode Number'
      # The composer of the movie or TV/radio soundtrack.
      property :music_by, class_names: %w[Person MusicGroup], as: 'musicBy', label: 'Music by'
      # The season to which this episode belongs.
      property :part_of_season, class_name: 'Season', as: 'partOfSeason', label: 'Part of Season'
      # The series to which this episode or season belongs.
      property :part_of_series, class_name: 'Series', as: 'partOfSeries', label: 'Part of Series'
      # Free text to define other than pure numerical ranking of an episode or a season in an ordered list of items (further formatting restrictions may apply within particular user groups).
      property :position, class_name: 'Text', as: 'position', label: 'Position'
      # The producer of the movie, tv/radio series, season, or episode, or video.
      property :producer, class_name: 'Person', as: 'producer', label: 'Producer'
      # The production company or studio that made the movie, tv/radio series, season, or episode, or media object.
      property :production_company, class_name: 'Organization', as: 'productionCompany', label: 'Production Company'
      # A publication event associated with the episode, clip or media object.
      property :publication, class_name: 'PublicationEvent', as: 'publication', label: 'Publication'
      # The trailer of a movie or tv/radio series, season, or episode.
      property :trailer, class_name: 'VideoObject', as: 'trailer', label: 'Trailer'
    end
  end
end

