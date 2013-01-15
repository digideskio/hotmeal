#!/usr/bin/env rake

require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'

  desc 'Run specs'
  RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = %w(--color)
    t.verbose = false
  end
rescue LoadError
  task :spec do
    abort 'install rspec to run specs ($ bundle install)'
  end
end

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

task default: :spec
