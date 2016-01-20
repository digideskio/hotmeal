require 'hotmeal'
require 'delegate'

module Hotmeal
  class Namespace < SimpleDelegator
    URIS = {
      'http://ogp.me/ns#' => :og,
      'http://ogp.me/ns/fb#' => :fb,
      'http://ogp.me/ns/music#' => :music,
      'http://ogp.me/ns/video#' => :video,
      'http://ogp.me/ns/profile#' => :profile,
      'http://ogp.me/ns/article#' => :article,
      'http://ogp.me/ns/book#' => :book,
      'http://ogp.me/ns/website#' => :website
    }.freeze

    def self.by_uri
      @by_uri ||= {}
    end

    def self.for(uri)
      uri = uri.to_s
      by_uri[uri] ||= new(uri: uri, ns: URIS[uri])
    end

    def initialize(attributes = {})
      attributes[:ns] ||= :og
      assign_attributes(attributes)
      self.class.by_uri[uri] ||= self
    end

    def assign_attributes(attributes)
      attributes.each do |name, value|
        public_send("#{name}=", value)
      end
    end

    def ns=(ns)
      @ns = ns.to_sym
    end

    def __getobj__
      to_prefix
    end

    def to_prefix
      "#{prefix} #{uri}"
    end

    def __setobj__(obj)
      obj = obj.__getobj__ while obj.respond_to?(:__getobj__)
      self.ns, self.uri = obj.to_s.split(/:\s+/, 2)
    end

    def to_hash
      { ns: ns, uri: uri }
    end

    def prefix
      "#{ns}:"
    end

    attr_accessor :uri
    attr_reader :ns
  end
end
