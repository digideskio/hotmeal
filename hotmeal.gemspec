# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'hotmeal/version'

Gem::Specification.new do |gem|
  gem.name = 'hotmeal'
  gem.version = Hotmeal::VERSION
  gem.authors = ['Alexander Semyonov']
  gem.email = %w(al@semyonov.us)
  gem.description = 'Hotmeal helps to discover meta-information from your html pages: Atom and RSS feeds, Microformats, Microdata, RDFa, etc'
  gem.summary = 'HTML meta-information discoverer'
  gem.homepage = 'http://github.com/alsemyonov/hotmeal'

  gem.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  gem.bindir = 'exe'
  gem.executables = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = %w(lib)
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.add_dependency 'nokogiri', '~> 1.6.8'
  gem.add_dependency 'activesupport', '~> 4.2.5'
  gem.add_dependency 'thor'
  gem.add_development_dependency 'yard', '~> 0.8.2'
  gem.add_development_dependency 'redcarpet'
  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency 'rake'
end
