# Class represents light ray
class Ray
  attr_reader :from, :vector, :limit, :refraction_idx
  def initialize(from: Vector.new([0, 0, 0]), vector: Vector.new([0, 0, 0]),
                 scene: nil, limit: Float::INFINITY, refraction_idx: 1)
    @from = from
    @vector = vector.normalize!
    @limit = limit
    @scene = scene
    @refraction_idx = refraction_idx
  end

  def trace(depth = 0)
    objects = @scene.objects
    intersection = find_intersection(objects)
    return @scene.background unless intersection.object

    color = intersection.point_color(@scene) * intersection.object.color
    color = add_refraction(color, intersection, depth)
    color = add_reflection(color, intersection, depth)
    if intersection.object.texture
      color *= intersection.object.texture_color(intersection)
    end
    final_color(intersection, color)
  end

  def light_source_visible?(lamp)
    @scene.objects
          .reject { |object| object == lamp }
          .reject(&:refraction)
          .none? { |object| object.intersect(self, @limit) }
  end

  private

  def final_color(intersection, color)
    return color if intersection.object.light.zero?
    intersection.object.color * intersection.object.light *
      intersection.normal.dot(vector).abs +
      color
  end

  def add_reflection(color, intersection, depth,
                     coefficient = intersection.object.reflectivity)
    return color if coefficient.zero? || depth >= @scene.max_depth
    next_ray = Ray.new(from: intersection,
                       vector: intersection.reflected_ray,
                       scene: @scene)
    reflection_color = next_ray.trace(depth + 1)
    color.mix(reflection_color * intersection.object.color_change,
              coefficient, 0.1)
  end

  def add_refraction(color, intersection, depth)
    return color if intersection.object.transparency.zero?
    return color if depth >= @scene.max_depth
    next_ray = Ray.new(from: intersection - intersection.normal * 0.00002,
                       vector: intersection.refracted_ray, scene: @scene,
                       refraction_idx: intersection.refraction_idx)
    refraction_color = next_ray.trace(depth)
    output_color = add_reflection(refraction_color, intersection, depth,
                                  1 - intersection.refraction_coefficient)
    color.mix(output_color * intersection.object.color_change,
              intersection.object.transparency)
  end

  def find_intersection(objects)
    objects.reduce(Point.new(distance: @limit)) do |result, object|
      t = object.intersect(self, result.distance)
      t || result
    end
  end
end
