#!/usr/bin/env rake

require 'bundler/gem_tasks'

begin
  require 'yard'
  YARD::Rake::YardocTask.new(:doc) do |t|
    #t.files   = ['lib/**/*.rb', OTHER_PATHS]   # optional
    #t.options = ['--any', '--extra', '--opts'] # optional
  end
rescue LoadError
  task :doc do
    raise 'YARD is not installed. Please, run: gem install yard'
  end
end
