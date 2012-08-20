# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hotmeal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Alexander Semyonov']
  gem.email         = ['al@semyonov.us']
  gem.description   = %q{Hotmeal helps to discover metainformation from your html pages: Atom and RSS feeds, Microformats, Microdata, RDFa, etc}
  gem.summary       = %q{HTML metainformation discoverer}
  gem.homepage      = 'http://github.com/alsemyonov/hotmeal'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'hotmeal'
  gem.require_paths = ['lib']
  gem.version       = Hotmeal::VERSION

  gem.add_dependency 'nokogiri', '~> 1.5.0'
  gem.add_development_dependency 'yard', '~> 0.8.2'
  gem.add_development_dependency 'rspec', '~> 2.11.0'
end
