# Class responsible for rendering images
class Screen
  def initialize(position: Vector.new, size: [100, 100],
                 pov: 30, rotation: [0, 0, 0])
    @x = size[0]
    @y = size[1]
    @pov_factor = Math.tan(Math::PI * pov / 180)
    @position = position
    @rotation = rotation
    set_directions
  end

  def render(scene)
    img = Canvas.new(x_size: @x, y_size: @y)
    (0..@x - 1).to_a.each do |x|
      (0..@y - 1).to_a.each do |y|
        img[x, y] = render_pixel(scene, x, y)
      end
    end
    img
  end

  private

  def set_directions
    @direction = rotate(Vector.new([0, 0, -1]))
    @camera = @position - @direction
    @down = rotate(Vector.new([0, 1, 0]))
    @right = rotate(Vector.new([1, 0, 0]))
  end

  def render_pixel(scene, x, y)
    ray = Ray.new(from: @camera, vector: pixel_position(x, y), scene: scene)
    ray.trace
  end

  def pixel_position(x, y)
    xx = pixel_coordinate(x, @x, @x / @y)
    yy = pixel_coordinate(y, @y, 1)
    @direction + @right * xx + @down * yy
  end

  def rotate(vector)
    vector_xz = vector.rotate_y(@rotation[0])
    vector_y = RotationMatrix.rotate_around_vector(
      (@direction || vector_xz).cross(Vector.new([0, 1, 0])),
      vector_xz, @rotation[1]
    )
    if @direction
      RotationMatrix.rotate_around_vector(@direction, vector_y, @rotation[2])
    else
      vector_y
    end
  end

  def pixel_coordinate(position, size, ratio)
    (2 * ((position + 0.5) / size) - 1) * @pov_factor * ratio
  end
end
