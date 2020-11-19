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

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.0'
  spec.add_development_dependency 'timecop'

  spec.add_dependency 'connection_pool'
  spec.add_dependency 'money', '>= 6.6.0'
  spec.add_dependency 'redis'
end
