# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # TV Episode
    #
    # An episode of a TV series or season.
    # @see http://schema.org/TVEpisode
    class TVEpisode < CreativeWork
      # A cast member of the movie, TV series, season, or episode, or video.
      property :actor, class_name: 'Person', as: 'actor', label: 'Actor'
      # A cast member of the movie, TV series, season, or episode, or video. (legacy spelling; see singular form, actor)
      property :actors, class_name: 'Person', as: 'actors', label: 'Actors'
      # The director of the movie, TV episode, or series.
      property :director, class_name: 'Person', as: 'director', label: 'Director'
      # The episode number.
      property :episode_number, class_name: 'Number', as: 'episodeNumber', label: 'Episode Number'
      # The composer of the movie or TV soundtrack.
      property :music_by, class_names: %w[Person MusicGroup], as: 'musicBy', label: 'Music by'
      # The season to which this episode belongs.
      property :part_of_season, class_name: 'TVSeason', as: 'partOfSeason', label: 'Part of Season'
      # The TV series to which this episode or season belongs.
      property :part_of_tv_series, class_name: 'TVSeries', as: 'partOfTVSeries', label: 'Part of TV Series'
      # The producer of the movie, TV series, season, or episode, or video.
      property :producer, class_name: 'Person', as: 'producer', label: 'Producer'
      # The production company or studio that made the movie, TV series, season, or episode, or video.
      property :production_company, class_name: 'Organization', as: 'productionCompany', label: 'Production Company'
      # The trailer of the movie or TV series, season, or episode.
      property :trailer, class_name: 'VideoObject', as: 'trailer', label: 'Trailer'
    end
  end
end
