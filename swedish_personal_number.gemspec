# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swedish_personal_number/version'

Gem::Specification.new do |spec|
  spec.name          = "swedish_personal_number"
  spec.version       = SwedishPersonalNumber::VERSION
  spec.authors       = ["Juan Lulkin", "Talya Stern"]
  spec.email         = ["juan.lulkin@klarna.com", "talya.stern@klarna.com"]
  spec.summary       = %q{Provides helpers to deal with Swedish personal numbers}
  spec.description   = %q{Provides helpers to deal with Swedish personal numbers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_dependency "activesupport"
end
