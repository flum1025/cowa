# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cowa/version'

Gem::Specification.new do |spec|
  spec.name          = "cowa"
  spec.version       = Cowa::VERSION
  spec.authors       = ["flum1025"]
  spec.email         = ["flum.1025@gmail.com"]

  spec.summary       = %q{composite library for weather api}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/flum1025/cowa"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_dependency 'json'
  spec.add_dependency 'open-uri'
  spec.add_dependency 'active_support'
  spec.add_dependency 'active_support/core_ext'
end
