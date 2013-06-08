# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Movie
    #
    # A movie.
    # @see http://schema.org/Movie
    class Movie < CreativeWork
      # A cast member of the movie, TV series, season, or episode, or video.
      property :actor, class_name: 'Person', as: 'actor', label: 'Actor'
      # A cast member of the movie, TV series, season, or episode, or video. (legacy spelling; see singular form, actor)
      property :actors, class_name: 'Person', as: 'actors', label: 'Actors'
      # The director of the movie, TV episode, or series.
      property :director, class_name: 'Person', as: 'director', label: 'Director'
      # The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      property :duration, class_name: 'Duration', as: 'duration', label: 'Duration'
      # The composer of the movie or TV soundtrack.
      property :music_by, class_names: %w[Person MusicGroup], as: 'musicBy', label: 'Music by'
      # The producer of the movie, TV series, season, or episode, or video.
      property :producer, class_name: 'Person', as: 'producer', label: 'Producer'
      # The production company or studio that made the movie, TV series, season, or episode, or video.
      property :production_company, class_name: 'Organization', as: 'productionCompany', label: 'Production Company'
      # The trailer of the movie or TV series, season, or episode.
      property :trailer, class_name: 'VideoObject', as: 'trailer', label: 'Trailer'
    end
  end
end

