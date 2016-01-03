# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/media_object'

module Hotmeal
  module Schema
    # Video Object
    #
    # @see http://schema.org/VideoObject
    class VideoObject < MediaObject
      # The caption for this object.
      property :caption, class_name: 'Text', as: 'caption', label: 'Caption'
      # Thumbnail image for an image or video.
      property :thumbnail, class_name: 'ImageObject', as: 'thumbnail', label: 'Thumbnail'
      # If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
      property :transcript, class_name: 'Text', as: 'transcript', label: 'Transcript'
      # The frame size of the video.
      property :video_frame_size, class_name: 'Text', as: 'videoFrameSize', label: 'Video Frame Size'
      # The quality of the video.
      property :video_quality, class_name: 'Text', as: 'videoQuality', label: 'Video Quality'
    end
  end
end
