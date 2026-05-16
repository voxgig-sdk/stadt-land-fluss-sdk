# StadtLandFluss SDK exists test

require "minitest/autorun"
require_relative "../StadtLandFluss_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = StadtLandFlussSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
