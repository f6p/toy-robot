require_relative 'table'

class Robot
  DIRECTIONS = %w(north east south west)

  attr_reader :table, :x, :y, :f

  def initialize
    @table = Table.new 5, 5
  end

  def place x, y, f
    begin
      x = Integer x
      y = Integer y
      f.downcase!
    rescue
      return
    end

    if @table.has?(x, y) && DIRECTIONS.include?(f)
      @x, @y, @f = x, y, f
    end
  end

  def move
    return unless placed?

    case @f
      when 'north'
        @y += 1 if @table.has? @x, @y + 1
      when 'east'
        @x += 1 if @table.has? @x + 1, @y
      when 'south'
        @y -= 1 if @table.has? @x, @y - 1
      when 'west'
        @x -= 1 if @table.has? @x - 1, @y
    end
  end

  def left
    return unless placed?

    turn -1
  end

  def right
    return unless placed?

    turn 1
  end

  def report
    return unless placed?

    puts "#@x,#@y,#{@f.upcase}"
  end

  def placed?
    @x && @y && @f
  end

  private

  def turn steps
    old_f = DIRECTIONS.index @f
    new_f = old_f + steps

    @f = DIRECTIONS[new_f % DIRECTIONS.size]
  end
end
