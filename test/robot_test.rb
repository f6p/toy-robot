require_relative '../lib/robot'
require_relative 'minitest/assertions'

require 'minitest/autorun'

class RobotTest < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_movement_north
    @robot.place 0, 0, 'NORTH'
    @robot.move
    assert_report @robot, 0, 1, :north

    @robot.place 0, @robot.table.y_size, 'NORTH'
    @robot.move
    assert_report @robot, 0, @robot.table.y_size, :north
  end

  def test_movement_east
    @robot.place 0, 0, 'EAST'
    @robot.move
    assert_report @robot, 1, 0, :east

    @robot.place @robot.table.x_size, 0, 'EAST'
    @robot.move
    assert_report @robot, @robot.table.x_size, 0, :east
  end

  def test_movement_south
    @robot.place @robot.table.x_size, @robot.table.y_size, 'SOUTH'
    @robot.move
    assert_report @robot, @robot.table.x_size, @robot.table.y_size - 1, :south

    @robot.place 0, 0, 'SOUTH'
    @robot.move
    assert_report @robot, 0, 0, :south
  end

  def test_movement_west
    @robot.place @robot.table.x_size, @robot.table.y_size, 'WEST'
    @robot.move
    assert_report @robot, @robot.table.x_size - 1, @robot.table.y_size, :west

    @robot.place 0, 0, 'WEST'
    @robot.move
    assert_report @robot, 0, 0, :west
  end

  def test_placement
    @robot.place 0, 0, '0'
    assert_silent { @robot.report }

    @robot.place -1, -1, 'NORTH'
    assert_silent { @robot.report }

    @robot.place 0, 0, 'NORTH'
    assert_report @robot, 0, 0, :north

    @robot.place 1, 1, 'NORTH'
    assert_report @robot, 1, 1, :north
  end

  def test_turn_left
    @robot.place 0, 0, 'NORTH'

    @robot.left
    assert_report @robot, 0, 0, :west

    @robot.left
    assert_report @robot, 0, 0, :south

    @robot.left
    assert_report @robot, 0, 0, :east

    @robot.left
    assert_report @robot, 0, 0, :north
  end

  def test_turn_right
    @robot.place 0, 0, 'NORTH'

    @robot.right
    assert_report @robot, 0, 0, :east

    @robot.right
    assert_report @robot, 0, 0, :south

    @robot.right
    assert_report @robot, 0, 0, :west

    @robot.right
    assert_report @robot, 0, 0, :north
  end
end
