class Table
  attr_reader :x_size, :y_size

  def initialize x_size, y_size
    @x_size = x_size - 1
    @y_size = y_size - 1
  end

  def has? x, y
    x.between?(0, @x_size) && y.between?(0, @y_size)
  end
end
