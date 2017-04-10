# Class representing a color in RGB-space
class Color
  include VectorOps
  include OptimizedVectorOps

  def *(other)
    return super unless other.is_a?(Color)
    self.class.new([@coordinates[0] * other.coordinates[0],
                    @coordinates[1] * other.coordinates[1],
                    @coordinates[2] * other.coordinates[2]])
  end

  def to_i(scale: WHITE)
    @coordinates.each_with_index.reduce(255) do |acc, (x, idx)|
      xx = length > 1 ? x / length : x
      color = (xx.abs * 255 / scale[idx]).to_i
      acc + ([color, 255].min << (24 - 8 * idx))
    end
  end

  def mix(other, reflection, darken =  0)
    self * (1 - reflection) + other * reflection * (1 - darken)
  end
end

RED = Color.new([1, 0, 0])
GREEN = Color.new([0, 1, 0])
BLUE = Color.new([0, 0, 1])
WHITE = RED + GREEN + BLUE
BLACK = Color.new([0, 0, 0])
PURPLE = (RED + BLUE) * 0.5
YELLOW = RED + GREEN
ORANGE = RED + (GREEN * 0.5)
GREY = WHITE * 0.5

LRED = Color.new([1, 0.5, 0.5])
LGREEN = Color.new([0.5, 1, 0.5])
LBLUE = Color.new([0.5, 0.5, 1])

BACKGROUND = BLUE + GREEN
