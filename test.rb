require './function'
require 'minitest/autorun'

class Test < MiniTest::Test
  def test_1
    paid_till = Date.new(2020, 7)
    max_version = Date.new(2020, 2)
    min_version = Date.new(2019, 1)
    flvget = Date.new(2020, 10)
    assert_equal ['20.02'], version(paid_till, max_version, min_version, flvget)
  end

  def test_2
    paid_till = Date.new(2021, 7)
    max_version = nil
    min_version = nil
    flvget = Date.new(2021, 10)
    assert_equal ['21.06', '21.07'], version(paid_till, max_version, min_version, flvget)
  end
end
