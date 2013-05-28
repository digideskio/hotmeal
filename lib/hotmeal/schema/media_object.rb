# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Media Object
    #
    # An image, video, or audio object embedded in a web page. Note that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
    # @see http://schema.org/MediaObject
    #
    # Subtypes:
    # @see AudioObject
    # @see DataDownload
    # @see ImageObject
    # @see MusicVideoObject
    # @see VideoObject
    class MediaObject < CreativeWork
      # A NewsArticle associated with the Media Object.
      property :associated_article, class_name: 'NewsArticle', as: 'associatedArticle', label: 'Associated Article'
      # The bitrate of the media object.
      property :bitrate, class_name: 'Text', as: 'bitrate', label: 'Bitrate'
      # File size in (mega/kilo) bytes.
      property :content_size, class_name: 'Text', as: 'contentSize', label: 'Content Size'
      # Actual bytes of the media object, for example the image file or video file. (previous spelling: contentURL)
      property :content_url, class_name: 'URL', as: 'contentUrl', label: 'Content Url'
      # The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      property :duration, class_name: 'Duration', as: 'duration', label: 'Duration'
      # A URL pointing to a player for a specific video. In general, this is the information in the src element of an embed tag and should not be the same as the content of the loc tag. (previous spelling: embedURL)
      property :embed_url, class_name: 'URL', as: 'embedUrl', label: 'Embed Url'
      # The creative work encoded by this media object
      property :encodes_creative_work, class_name: 'CreativeWork', as: 'encodesCreativeWork', label: 'Encodes Creative Work'
      # mp3, mpeg4, etc.
      property :encoding_format, class_name: 'Text', as: 'encodingFormat', label: 'Encoding Format'
      # Date the content expires and is no longer useful or available. Useful for videos.
      property :expires, class_name: 'Date', as: 'expires', label: 'Expires'
      # The height of the item.
      property :height, class_names: %w[Distance QuantitativeValue], as: 'height', label: 'Height'
      # Player type required—for example, Flash or Silverlight.
      property :player_type, class_name: 'Text', as: 'playerType', label: 'Player Type'
      # The regions where the media is allowed. If not specified, then it's assumed to be allowed everywhere. Specify the countries in ISO 3166 format.
      property :regions_allowed, class_name: 'Place', as: 'regionsAllowed', label: 'Regions Allowed'
      # Indicates if use of the media require a subscription  (either paid or free). Allowed values are true or false (note that an earlier version had 'yes', 'no').
      property :requires_subscription, class_name: 'Boolean', as: 'requiresSubscription', label: 'Requires Subscription'
      # Date when this media object was uploaded to this site.
      property :upload_date, class_name: 'Date', as: 'uploadDate', label: 'Upload Date'
      # The width of the item.
      property :width, class_names: %w[Distance QuantitativeValue], as: 'width', label: 'Width'
    end
  end
end

