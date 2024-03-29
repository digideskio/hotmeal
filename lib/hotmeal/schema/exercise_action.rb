# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/play_action'

module Hotmeal
  module Schema
    # Exercise Action
    #
    # @see http://schema.org/ExerciseAction
    class ExerciseAction < PlayAction
      # A sub property of location. The course where this action was taken.
      property :course, class_name: 'Place', as: 'course', label: 'Course'
      # A sub property of instrument. The died used in this action.
      property :diet, class_name: 'Diet', as: 'diet', label: 'Diet'
      # A sub property of asset. The distance travelled.
      property :distance, class_name: 'Distance', as: 'distance', label: 'Distance'
      # A sub property of instrument. The exercise plan used on this action.
      property :exercise_plan, class_name: 'ExercisePlan', as: 'exercisePlan', label: 'Exercise Plan'
      # Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.
      property :exercise_type, class_name: 'Text', as: 'exerciseType', label: 'Exercise Type'
      # A sub property of location. The original location of the object or the agent before the action.
      property :from_location, class_names: %w(Place Number), as: 'fromLocation', label: 'From Location'
      # A sub property of participant. The oponent on this action.
      property :oponent, class_name: 'Person', as: 'oponent', label: 'Oponent'
      # A sub property of location. The sports activity location where this action occurred.
      property :sports_activity_location, class_name: 'SportsActivityLocation', as: 'sportsActivityLocation', label: 'Sports Activity Location'
      # A sub property of location. The sports event where this action occurred.
      property :sports_event, class_name: 'SportsEvent', as: 'sportsEvent', label: 'Sports Event'
      # A sub property of participant. The sports team that participated on this action.
      property :sports_team, class_name: 'SportsTeam', as: 'sportsTeam', label: 'Sports Team'
      # A sub property of location. The final location of the object or the agent after the action.
      property :to_location, class_names: %w(Place Number), as: 'toLocation', label: 'To Location'
    end
  end
end
