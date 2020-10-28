# frozen_string_literal: true

require 'bundler/why/command'
require 'bundler/why/version'

module Bundler
  module Why
    # All of `Why`'s errors should be `BundlerError`s, so that they will
    # be rescued by bundler (in `bundler/friendly_errors.rb`), and printed in a
    # concise form. If a plain `Exception` happens in a bundler plugin, bundler
    # will print a big error report template, and ask the user to report it
    # as a bug in bundler itself.
    class Error < BundlerError; end
  end
end
