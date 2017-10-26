require "minitest/autorun"
require "./network"
 
class MainTest < Minitest::Test
  include Network

  # proper testing should use mocks and not actually do the request. should also check errors
  def test_fetch
    body = Network.fetch("http://www.google.com")
    assert_equal(false, body.empty?)
  end
end