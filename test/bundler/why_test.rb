# frozen_string_literal: true

require 'test_helper'

class Bundler::WhyTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert ::Bundler::Why.gem_version.instance_of?(::Gem::Version)
  end
end
