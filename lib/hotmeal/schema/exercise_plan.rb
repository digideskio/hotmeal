# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Exercise Plan
    #
    # @see http://schema.org/ExercisePlan
    class ExercisePlan < CreativeWork
      # Length of time to engage in the activity.
      property :activity_duration, class_name: 'Duration', as: 'activityDuration', label: 'Activity Duration'
      # How often one should engage in the activity.
      property :activity_frequency, class_name: 'Text', as: 'activityFrequency', label: 'Activity Frequency'
      # Any additional component of the exercise prescription that may need to be articulated to the patient. This may include the order of exercises, the number of repetitions of movement, quantitative distance, progressions over time, etc.
      property :additional_variable, class_name: 'Text', as: 'additionalVariable', label: 'Additional Variable'
      # Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.
      property :exercise_type, class_name: 'Text', as: 'exerciseType', label: 'Exercise Type'
      # Quantitative measure gauging the degree of force involved in the exercise, for example, heartbeats per minute. May include the velocity of the movement.
      property :intensity, class_name: 'Text', as: 'intensity', label: 'Intensity'
      # Number of times one should repeat the activity.
      property :repetitions, class_name: 'Number', as: 'repetitions', label: 'Repetitions'
      # How often one should break from the activity.
      property :rest_periods, class_name: 'Text', as: 'restPeriods', label: 'Rest Periods'
      # Quantitative measure of the physiologic output of the exercise; also referred to as energy expenditure.
      property :workload, class_name: 'Energy', as: 'workload', label: 'Workload'
    end
  end
end
