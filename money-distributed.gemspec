# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'money/distributed/version'

Gem::Specification.new do |spec|
  spec.name          = 'money-distributed'
  spec.version       = Money::Distributed::VERSION
  spec.authors       = ['DarthSim']
  spec.email         = ['darthsim@gmail.com']

  spec.summary       = 'Money gem extension for distributed systems'
  spec.homepage      = 'https://github.com/DarthSim/money-distributed'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 3.0'
  spec.files                 = Dir[
    'lib/**/*',
    'sorbet/rbi/dsl/**/*.rbi',
    'sorbet/rbi/shims/**/*.rbi',
    'LICENSE',
    'README.md',
  ]

  spec.add_dependency 'connection_pool'
  spec.add_dependency 'money', '>= 6.6.0'
  spec.add_dependency 'redis'
  spec.add_dependency 'sorbet'
  spec.add_dependency 'sorbet-runtime'

  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'spoom'
  spec.add_development_dependency 'tapioca'
  spec.add_development_dependency 'timecop'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
