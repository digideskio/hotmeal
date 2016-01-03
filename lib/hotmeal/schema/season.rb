# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Season
    #
    # @see http://schema.org/Season
    #
    # Subtypes:
    # @see RadioSeason
    # @see TVSeason
    class Season < CreativeWork
      # The end date and time of the event or item (in ISO 8601 date format).
      property :end_date, class_name: 'Date', as: 'endDate', label: 'End Date'
      # An episode of a TV/radio series or season
      property :episode, class_name: 'Episode', as: 'episode', label: 'Episode'
      # An episode of a TV/radio series or season (legacy spelling; see singular form, episode)
      property :episodes, class_name: 'Episode', as: 'episodes', label: 'Episodes'
      # The number of episodes in this season or series.
      property :number_of_episodes, class_name: 'Number', as: 'numberOfEpisodes', label: 'Number of Episodes'
      # The series to which this episode or season belongs.
      property :part_of_series, class_name: 'Series', as: 'partOfSeries', label: 'Part of Series'
      # Free text to define other than pure numerical ranking of an episode or a season in an ordered list of items (further formatting restrictions may apply within particular user groups).
      property :position, class_name: 'Text', as: 'position', label: 'Position'
      # The producer of the movie, tv/radio series, season, or episode, or video.
      property :producer, class_name: 'Person', as: 'producer', label: 'Producer'
      # The production company or studio that made the movie, tv/radio series, season, or episode, or media object.
      property :production_company, class_name: 'Organization', as: 'productionCompany', label: 'Production Company'
      # Position of the season within an ordered group of seasons.
      property :season_number, class_name: 'Integer', as: 'seasonNumber', label: 'Season Number'
      # The start date and time of the event or item (in ISO 8601 date format).
      property :start_date, class_name: 'Date', as: 'startDate', label: 'Start Date'
      # The trailer of a movie or tv/radio series, season, or episode.
      property :trailer, class_name: 'VideoObject', as: 'trailer', label: 'Trailer'
    end
  end
end
