# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'olx_api/version'

Gem::Specification.new do |spec|
  spec.name          = "olx_api"
  spec.version       = OlxApi::VERSION
  spec.authors       = ["Ardee Aram (Codebox)"]
  spec.email         = ["ardee.aram@galoretv.com"]
  spec.summary       = %q{OLX API exposes http://olx.com.ph as a Ruby API to make the site programmable.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_dependency 'rest-client', '= 1.7.2'
  spec.add_dependency 'nokogiri', '= 1.6.6.2'
  spec.add_dependency 'mechanize', '= 2.7.3'
  spec.add_dependency 'watir', '= 5.0.0'
  spec.add_dependency 'phantomjs', '= 1.9.8.0'
end
