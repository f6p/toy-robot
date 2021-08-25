require 'minitest/assertions'

module Minitest::Assertions
  def assert_controller_batch file, x, y, facing
    assert_output(position x, y, facing) { execute file }
  end

  def assert_report robot, x, y, facing
    assert_output(position x, y, facing) { robot.report }
  end

  private

  def execute file
    path = File.join File.dirname(__FILE__), '..', 'examples', file

    ctrl = Controller.new
    cmds = File.readlines path

    cmds.each { |cmd| ctrl.execute cmd }
  end

  def position x, y, facing
    "#{x},#{y},#{facing.to_s.upcase}\n"
  end
end
