# Generic shape, initializes basic properties
class Shape
  attr_reader :color, :light, :reflectivity, :texture, :color_change,
              :refraction, :transparency
  def initialize(color: nil, light: 0, reflectivity: 1, texture: false,
                 refraction: false, transparency: 0, **_)
    @color = color
    @light = light
    @reflectivity = reflectivity
    @texture = texture
    @color_change = ((@color || Color.new) + WHITE) * 0.5
    @refraction = refraction
    @transparency = transparency
  end
end

# Sphere
class Sphere < Shape
  attr_reader :center, :r, :color, :light
  def initialize(center: nil, r: 0, **_)
    super
    @center = center
    @r = r
  end

  def intersect(ray, threshold)
    l = @center - ray.from
    tc = l.dot(ray.vector)
    return false if tc < 0
    d2 = l.dot(l) - tc * tc
    th_square = @r * @r - d2
    return false if th_square < 0
    th = Math.sqrt(th_square)
    intersection_params(ray, th, tc, threshold)
  end

  def texture_color(point)
    u = Math.acos(point.normal[2]) / Math::PI
    v = (Math.atan2(point.normal[0], point.normal[1]) / Math::PI + 1) / 2
    ((4 * u) % 1 < 0.5) ^ ((4 * v) % 1 < 0.5) ? WHITE : BLACK
  end

  private

  def intersection_params(ray, th, tc, threshold)
    t = tc >= th ? tc - th : tc + th
    return false if t > threshold
    point_of_hit = ray.from + ray.vector * t
    normal = (point_of_hit - @center).normalize!
    normal = -normal if normal.dot(ray.vector) > 0
    point = point_of_hit + normal * 0.00001
    Point.new(object: self, vector: point, normal: normal, ray: ray,
              distance: t)
  end
end

# Plane
class Plane < Shape
  attr_reader :n, :d, :light, :color
  def initialize(n: nil, d: 0, **_)
    super
    @n = n
    @d = d
    add_orientation if @texture
  end

  def intersect(ray, threshold)
    n_dot_ray = @n.dot(ray.vector)
    return false if n_dot_ray.abs < 0.0001
    t = (-@n.dot(ray.from) + @d) / n_dot_ray
    return false if t < 0
    return false if t > threshold
    normal = n_dot_ray > 0 ? -@n : @n
    intersection_params(t, ray, normal)
  end

  def texture_color(point)
    shift = point - (@n * d)
    u = shift.dot(@up)
    v = shift.dot(@right)
    ((u / 2) % 1 < 0.5) ^ ((v / 2) % 1 < 0.5) ? WHITE : BLACK
  end

  private

  def add_orientation
    up_z = Vector.new([0, 0, 1])
    up_y = Vector.new([0, 1, 0])
    @up =  @n.cross(@n.dot(up_z).abs < 0.99 ? up_z : up_y)
    @right = @n.cross(@up)
  end

  def intersection_params(t, ray, n)
    point = ray.from + ray.vector * (t - 0.00001)
    Point.new(object: self, vector: point, normal: n, ray: ray, distance: t)
  end
end

# Triangle
class Triangle < Plane
  attr_reader :n, :d, :light, :color
  def initialize(vertices: nil, **_)
    super
    @vertices = vertices
    @n = edges[0].cross(edges[1])
    @n = (@n * @n.dot(@vertices[0])).normalize!
    @d = @n.dot(@vertices[0])
  end

  def intersect(ray, threshold)
    point = super
    return false unless point
    sides = [
      left_or_right(point, 0), left_or_right(point, 1), left_or_right(point, 2)
    ]
    return false unless sides[0] == sides[1] && sides[1] == sides[2]
    point
  end

  private

  def distance(point, vertex_num)
    point - @vertices[vertex_num]
  end

  def left_or_right(point, edge_idx)
    @n.dot(edges[edge_idx].cross(distance(point, edge_idx))) < 0
  end

  def edges
    @edges ||= [@vertices[1] - @vertices[0], @vertices[2] - @vertices[1],
                @vertices[0] - @vertices[2]]
  end
end
