require_relative 'robot'

class Controller
  attr_reader :robot

  def initialize
    @robot = Robot.new
  end

  def execute command
    params = command.downcase.strip.split /\s+|\s*,\s*/

    raise unless allow? params.first

    @robot.send *params
  rescue
    STDERR.puts "Invalid command: #{command}"
  end

  private

  def allow? command
    %w(left move place report right).include? command
  end
end
