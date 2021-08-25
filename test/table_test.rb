require_relative '../lib/table'

require 'minitest/autorun'

class TableTest < Minitest::Test
  def setup
    x_size = 5
    y_size = 5

    @table = Table.new x_size, y_size
    @x_max = x_size - 1
    @y_max = y_size - 1
  end

  def test_table_dimensions
    assert_equal @table.x_size, @x_max
    assert_equal @table.y_size, @y_max

    assert_equal @table.has?(0, 0), true
    assert_equal @table.has?(0, @y_max), true
    assert_equal @table.has?(@x_max, @y_max), true
    assert_equal @table.has?(@x_max, 0), true

    assert_equal @table.has?(0, -1), false
    assert_equal @table.has?(-1, 0), false
    assert_equal @table.has?(@x_max, @y_max + 1), false
    assert_equal @table.has?(@x_max + 1, @y_max), false
  end
end
