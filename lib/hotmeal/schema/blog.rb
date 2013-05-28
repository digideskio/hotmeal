# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Blog
    #
    # A blog
    # @see http://schema.org/Blog
    class Blog < CreativeWork
      # A posting that is part of this blog.
      property :blog_post, class_name: 'BlogPosting', as: 'blogPost', label: 'Blog Post'
      # The postings that are part of this blog (legacy spelling; see singular form, blogPost).
      property :blog_posts, class_name: 'BlogPosting', as: 'blogPosts', label: 'Blog Posts'
    end
  end
end

