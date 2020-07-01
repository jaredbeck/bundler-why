# frozen_string_literal: true

module Bundler
  # :nodoc:
  module Why
    def self.gem_version
      ::Gem::Version.new('0.1.0')
    end
  end
end
