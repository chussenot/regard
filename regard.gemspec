# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'regard/version'

Gem::Specification.new do |spec|
  spec.name          = 'regard'
  spec.version       = Regard::VERSION
  spec.authors       = ['Clement Hussenot']
  spec.email         = ['chussenot@gmail.com']

  spec.summary       = 'Audit docker on your hosts'
  spec.description   = 'Audit docker on your hosts'
  spec.homepage      = 'https://github.com/chussenot/regard'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'docker-api', '>= 0'
  spec.add_development_dependency 'bundler', '>= 1.12'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
