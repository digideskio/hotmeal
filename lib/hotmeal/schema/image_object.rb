# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/media_object'

module Hotmeal
  module Schema
    # Image Object
    #
    # @see http://schema.org/ImageObject
    class ImageObject < MediaObject
      # The caption for this object.
      property :caption, class_name: 'Text', as: 'caption', label: 'Caption'
      # exif data for this object.
      property :exif_data, class_name: 'Text', as: 'exifData', label: 'Exif Data'
      # Indicates whether this image is representative of the content of the page.
      property :representative_of_page, class_name: 'Boolean', as: 'representativeOfPage', label: 'Representative of Page'
      # Thumbnail image for an image or video.
      property :thumbnail, class_name: 'ImageObject', as: 'thumbnail', label: 'Thumbnail'
    end
  end
end

