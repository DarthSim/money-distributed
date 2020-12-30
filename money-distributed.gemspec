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

  spec.required_ruby_version = '>= 2.5' # rubocop:disable Gemspec/RequiredRubyVersion

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '>= 12.3.3' # CVE-2020-8130
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'timecop'

  spec.add_dependency 'connection_pool'
  spec.add_dependency 'money', '>= 6.6.0'
  spec.add_dependency 'redis'
end
