# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'hotmeal/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Alexander Semyonov']
  gem.email         = %w(al@semyonov.us)
  gem.description   = %q{Hotmeal helps to discover meta-information from your html pages: Atom and RSS feeds, Microformats, Microdata, RDFa, etc}
  gem.summary       = %q{HTML meta-information discoverer}
  gem.homepage      = 'http://github.com/alsemyonov/hotmeal'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'hotmeal'
  gem.require_paths = %w(lib)
  gem.version       = Hotmeal::VERSION

  gem.add_dependency 'nokogiri', '~> 1.6.0'
  gem.add_dependency 'activesupport', '~> 3.0'
  gem.add_dependency 'thor'
  gem.add_development_dependency 'yard', '~> 0.8.2'
  gem.add_development_dependency 'redcarpet'
  gem.add_development_dependency 'rspec', '~> 2.11'
  gem.add_development_dependency 'rake'
end
