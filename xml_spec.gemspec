# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xml_spec/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Federico Gonzalez"]
  gem.email         = ["fedegl@gmail.com"]
  gem.description   = %q{Test XML with RSpec and Cucumber}
  gem.summary       = %q{Test XML with RSpec and Cucumber}
  gem.homepage      = "https://github.com/boost/xml_spec"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "xml_spec"
  gem.require_paths = ["lib"]
  gem.version       = XmlSpec::VERSION
  
  gem.add_dependency "nokogiri",  ">= 1.3.2"  
  gem.add_dependency "rspec",     "~> 3.1.0"

  gem.add_development_dependency "rake", "~> 0.9"
  gem.add_development_dependency "cucumber", "~> 1.1", ">= 1.1.1"
end
