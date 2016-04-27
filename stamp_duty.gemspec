# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stamp_duty/version'

Gem::Specification.new do |spec|
  spec.name          = "stamp_duty"
  spec.version       = StampDuty::VERSION
  spec.authors       = ["James Doyley"]
  spec.email         = ["jdoyley@gmail.com"]

  spec.summary       = %q{ A UK proerty stamp duty calculator }
  spec.homepage      = "https://github.com/j-dexx/stamp_duty"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "simplecov", "~> 0.11.2"
  spec.add_development_dependency "mocha", "~> 1.1.0"
  spec.add_development_dependency "pry"
end
