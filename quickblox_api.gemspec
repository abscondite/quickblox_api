# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quickblox_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'quickblox_api'
  spec.version       = QuickbloxApi::VERSION
  spec.authors       = ['Michael Ostrovskyi']
  spec.email         = ['abscondite.mo@gmail.com']
  spec.homepage      = %q{https://github.com/abscondite/quickblox_api}
  spec.summary       = %q{A library for easy interfacing with the Quickblox API}
  spec.description   = %q{}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'ruby-hmac'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
