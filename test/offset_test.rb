require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require 'date'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_date
    expected = Time.now.strftime("%m/%d/%Y").delete("/").to_i
    assert_equal expected, @offset.date
  end

  def test_squared
    assert_equal 5, @offset.date_squared
  end
end
