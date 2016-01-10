require 'hotmeal'

require 'thor'
require 'json'
require 'erb'
require 'active_support/core_ext/string'

module Hotmeal
  class SchemaGenerator < Thor
    desc 'generate_schema', 'Generates schema.org classes from json'

    def generate_schema
      schema = JSON.parse(File.read('data/schema.org.json'))

      schema['types'].each do |type_name, type|
        generate_file('class', File.join('lib/hotmeal/schema', "#{type['id'].underscore}.rb"), binding)
      end

      file_name = 'lib/hotmeal/schema/autoload.rb'
      generate_file('autoload', file_name, binding)
    end

    desc 'fetch', 'Fetch updated schema.org.json'

    def fetch
      require 'open-uri'
      File.write(File.expand_path('../../../data/schema.org.json', __FILE__), open('http://schema.rdfs.org/all.json').read)
      File.write(File.expand_path('../../../data/schema.org.jsonld', __FILE__), open('http://schema.org/docs/tree.jsonld').read)
    end

    protected

    def generate_file(template_name, file_name, binding)
      File.write(file_name, load_template(template_name).result(binding))
    end

    def templates
      @templates ||= {}
    end

    def load_template(template_name)
      templates[template_name] ||= ERB.new(File.read(File.expand_path("../schema_generator/#{template_name}.erb", __FILE__)), nil, '-')
    end
  end
end
