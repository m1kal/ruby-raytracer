# Canvas represents the image and can be used to initialize ChunkyPNG canvas
class Canvas
  attr_reader :x_size, :y_size
  attr_accessor :pixels
  def initialize(x_size: 0, y_size: 0)
    @pixels = Array.new(x_size * y_size)
    @x_size = x_size
    @y_size = y_size
  end

  def []=(x, y, color)
    @pixels[y * @x_size + x] = color
  end

  def [](x, y)
    @pixels[y * @x_size + x]
  end

  def normalize
    @pixels.map(&:to_i)
  end

  def self.interpolate_from_image(from, ratio)
    canvas = Canvas.new(x_size: from.x_size * ratio - ratio + 1,
                        y_size: from.y_size * ratio - ratio + 1)
    from.y_size.times do |y|
      from.x_size.times do |x|
        canvas[x * ratio, y * ratio] = from[x, y]
      end
    end
    canvas.interpolate_linear(ratio, ratio)
    canvas
  end

  def interpolate_linear(x_ratio, y_ratio)
    x = 0
    y = 0

    while y < @y_size - 1
      while x < @x_size - 1
        corners = [self[x, y], self[x + x_ratio, y],
                   self[x, y + y_ratio], self[x + x_ratio, y + y_ratio]]
        (y_ratio + 1).times do |y_int|
          y_mix = y_int.to_f / y_ratio
          (x_ratio + 1).times do |x_int|
            x_mix = x_int.to_f / x_ratio
            color = corners[0] * ((1 - x_mix) * (1 - y_mix)) +
                    corners[1] * (x_mix * (1 - y_mix)) +
                    corners[2] * ((1 - x_mix) * y_mix) +
                    corners[3] * (x_mix * y_mix)
            self[x + x_int, y + y_int] = color
          end
        end
        x += x_ratio
      end
      x = 0
      y += y_ratio
    end
  end
end
