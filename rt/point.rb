# Class representing a physical point at a surface
class Point < Vector
  attr_reader :object, :normal, :ray, :distance
  def initialize(vector: Vector.new, object: nil, normal: nil, ray: nil, distance: 0)
    @coordinates = vector.coordinates
    @object = object
    @normal = normal
    @ray = ray
    @distance = distance
  end

  def +(other)
    Vector.new(@coordinates) + other
  end

  def -(other)
    Vector.new(@coordinates) - other
  end

  def ==(other)
    super &&
      @object == other.object && @normal == other.normal &&
      @ray == other.ray && @distance == other.distance
  end

  def reflected_ray
    (@ray.vector - @normal * 2 * @ray.vector.dot(@normal)).normalize!
  end

  def refracted_ray
    cos_theta_i = -@ray.vector.dot(@normal)
    ratio = @ray.refraction_idx / refraction_idx
    sin_theta_t_square = ratio**2 * (1 - cos_theta_i**2)
    if sin_theta_t_square > 1
      return @normal.cross(@ray.vector.cross(@normal)).normalize!
    end
    (@ray.vector * ratio +
      @normal * (ratio * cos_theta_i -
        Math.sqrt(1 - sin_theta_t_square))).normalize!
  end

  def refraction_idx
    @ray.refraction_idx > 1 ? 1 : @object.refraction
  end

  def refraction_coefficient
    r0 = ((@object.refraction - 1) / (@object.refraction + 1))**2
    if refraction_idx > 1
      1 - (r0 + (1 - r0) * (1 + @ray.vector.dot(@normal))**5)
    else
      cos_theta_t = -refracted_ray.dot(@normal)
      r = [r0 + (1 - r0) * (1 - cos_theta_t)**5, 1].min
      1 - r
    end
  end

  def point_color(scene)
    scene.lights.reduce(Color.new([0, 0, 0])) do |acc, lamp|
      vector = lamp.center - self
      limit = vector.length
      lightray = Ray.new(
        from: self, scene: scene,
        vector: vector.normalize!,
        limit: limit
      )
      if lightray.light_source_visible?(lamp)
        acc +  point_color_from_single_lamp(lamp, lightray)
      else
        acc
      end
    end
  end

  private

  def point_color_from_single_lamp(lamp, lightray)
    lamp.color * @normal.dot(lightray.vector).abs * lamp.light
  end
end
