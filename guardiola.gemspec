# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guardiola/version'

Gem::Specification.new do |spec|
  spec.name          = "guardiola"
  spec.version       = Guardiola::VERSION
  spec.authors       = ["Xavier Canal i Masjuan"]
  spec.email         = ["xavi@itnig.net"]
  spec.summary       = %q{Football schedule service}
  spec.description   = %q{API to get whole information about football in major league in the world}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "capybara"
end
