require_relative '../lib/controller'
require_relative 'minitest/assertions'

require 'minitest/autorun'

class ControllerTest < Minitest::Test
  def test_examples
    assert_controller_batch 'a', 0, 1, :north
    assert_controller_batch 'b', 0, 0, :west
    assert_controller_batch 'c', 3, 3, :north
  end
end
