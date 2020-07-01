# frozen_string_literal: true

require 'test_helper'

module Bundler
  class WhyTest < ::Minitest::Test
    def test_that_it_has_a_version_number
      assert Why.gem_version.instance_of?(::Gem::Version)
    end
  end
end
