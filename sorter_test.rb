require "minitest/autorun"
require "./sorter"
 
class MainTest < Minitest::Test
  def test_sort
    # checks diff cases, special characters removal
    words = "The &shop; and/ so was^ a. the, the. AND #ThE and! wAs&".split(" ")

    sorter = Sorter.new
    sorted = sorter.sort(words)

    assert_equal("the", sorted[0][:word])
    assert_equal(4, sorted[0][:count])
    assert_equal("and", sorted[1][:word])
    assert_equal(3, sorted[1][:count])
    assert_equal("was", sorted[2][:word])
    assert_equal(2, sorted[2][:count])
    assert_equal("shop", sorted[3][:word])
    assert_equal(1, sorted[3][:count])
  end
end