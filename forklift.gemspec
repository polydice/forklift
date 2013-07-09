# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forklift/version'

Gem::Specification.new do |spec|
  spec.name          = "forklift"
  spec.version       = Forklift::VERSION
  spec.authors       = ["Yi-Ru Lin"]
  spec.email         = ["lawrence@polydice.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = "https://github.com/polydice/forklift"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'faraday', '~> 0.8'
  spec.add_dependency 'faraday_middleware', '~> 0.9'
  spec.add_dependency 'multi_xml', '~> 0.5.4'
end
