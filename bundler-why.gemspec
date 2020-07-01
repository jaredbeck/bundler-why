# frozen_string_literal: true

require_relative 'lib/bundler/why/version'

Gem::Specification.new do |spec|
  spec.name = 'bundler-why'
  spec.licenses = ['Nonstandard']
  spec.version = ::Bundler::Why.gem_version.to_s
  spec.authors = ['Jared Beck']
  spec.email = ['jared@jaredbeck.com']
  spec.summary = 'Explains the presence of a dependency.'
  spec.homepage = 'https://github.com/jaredbeck/bundler-why'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.
      split("\x0").
      reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
end
