require "minitest/autorun"
require "./network"
 
class MainTest < Minitest::Test
  # proper testing should use mocks and not actually do the request. should also check errors
  def test_fetch
    n = Network.new
    body = n.fetch("http://www.google.com")
    assert_equal(false, body.empty?)
  end
end