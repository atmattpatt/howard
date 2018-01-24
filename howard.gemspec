# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'howard/version'

Gem::Specification.new do |spec|
  spec.name          = "howard"
  spec.version       = Howard::VERSION
  spec.authors       = ["Matthew Patterson"]
  spec.email         = ["matthew.s.patterson@gmail.com"]
  spec.summary       = %q{Unofficial client for the CTA Train Tracker API}
  spec.description   = %q{Unofficial client library for the Chicago Transit Authority's Train Tracker API}
  spec.homepage      = "https://github.com/matthewpatterson/howard"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.15.6"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
