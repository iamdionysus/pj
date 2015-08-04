# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pj/version"

Gem::Specification.new do |spec|
  spec.name          = "pj"
  spec.version       = Pj::VERSION
  spec.authors       = %w(iamdionysus)
  spec.email         = %w(iamdionysus@gmail.com)

  spec.summary       = spec.description
  spec.description   = "helper to manage git project"
  spec.homepage      = "https://github.com/iamdionysus/pj"

  spec.files         = %w(pj.gemspec) + Dir["*.md", "bin/*", "lib/**/*.rb"]
  spec.bindir        = "bin"
  spec.executables   = %w(pj)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"

  spec.add_runtime_dependency "clipboard", "~> 1.0"
  spec.add_runtime_dependency "thor", "~> 0.19"
end
