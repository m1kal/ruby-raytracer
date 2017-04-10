# Module containing basic vector and matrix operations
module VectorOps
  PRECISION = 0.001
  attr_accessor :coordinates

  def initialize(coordinates = [0, 0, 0])
    @coordinates = coordinates
  end

  def -@
    self.class.new(@coordinates.map(&:-@))
  end

  def +(other)
    self.class.new(@coordinates.map.with_index { |x, idx| x + other[idx] })
  end

  def -(other)
    self + -other
  end

  def *(other)
    self.class.new(@coordinates.map { |x| x * other })
  end

  def dot(other)
    @coordinates.each_with_index
                .reduce(0) { |acc, (x, idx)| acc + x * other[idx] }
  end

  def normalize
    self.class.new(@coordinates.map { |x| x / length })
  end

  def normalize!
    @coordinates = @coordinates.map { |x| x / length }
    @length = 1
    self
  end

  def length
    @length = @length || Math.sqrt(dot(self))
  end

  def []=(idx, value)
    @coordinates[idx] = value
  end

  def [](idx)
    @coordinates[idx]
  end

  def ==(other)
    @coordinates.each_with_index.all? do |x, idx|
      (x - other[idx]).abs < PRECISION
    end
  end

  def to_s
    @coordinates.to_s
  end

  private

  def epsilon(first, second, index)
    index1 = (index + 1) % 3
    index2 = (index + 2) % 3
    first[index1] * second[index2] - first[index2] * second[index1]
  end
end

# Less general and more explicit but faster
module OptimizedVectorOps
  PRECISION = 0.001

  def -@
    self.class.new(@coordinates.map(&:-@))
  end

  def +(other)
    self.class.new([@coordinates[0] + other.coordinates[0],
                    @coordinates[1] + other.coordinates[1],
                    @coordinates[2] + other.coordinates[2]])
  end

  def -(other)
    self.class.new([@coordinates[0] - other.coordinates[0],
                    @coordinates[1] - other.coordinates[1],
                    @coordinates[2] - other.coordinates[2]])
  end

  def *(other)
    self.class.new([@coordinates[0] * other,
                    @coordinates[1] * other,
                    @coordinates[2] * other])
  end

  def dot(other)
    @coordinates[0] * other.coordinates[0] +
      @coordinates[1] * other.coordinates[1] +
      @coordinates[2] * other.coordinates[2]
  end

  def normalize
    return self.class.new(@coordinates) if length == 1
    self.class.new([@coordinates[0] / length,
                    @coordinates[1] / length,
                    @coordinates[2] / length])
  end

  def normalize!
    return self if length == 1
    @coordinates[0] /= length
    @coordinates[1] /= length
    @coordinates[2] /= length
    @length = 1
    self
  end
end

# Class representing a vector with basic operations
class Vector
  include VectorOps
  include OptimizedVectorOps

  def cross(other)
    coordinates = [epsilon(@coordinates, other.coordinates, 0),
                   epsilon(@coordinates, other.coordinates, 1),
                   epsilon(@coordinates, other.coordinates, 2)]
    self.class.new(coordinates)
  end

  def rotate_x(angle)
    self.class.new(
      [@coordinates[0],
       @coordinates[1] * Math.cos(angle) - @coordinates[2] * Math.sin(angle),
       @coordinates[2] * Math.cos(angle) + @coordinates[1] * Math.sin(angle)]
    )
  end

  def rotate_y(angle)
    self.class.new(
      [@coordinates[0] * Math.cos(angle) - @coordinates[2] * Math.sin(angle),
       @coordinates[1],
       @coordinates[2] * Math.cos(angle) + @coordinates[0] * Math.sin(angle)]
    )
  end

  def rotate_z(angle)
    self.class.new(
      [@coordinates[0] * Math.cos(angle) - @coordinates[1] * Math.sin(angle),
       @coordinates[1] * Math.cos(angle) + @coordinates[0] * Math.sin(angle),
       @coordinates[2]]
    )
  end
end

# Class methods of this class can be used to perform rotations
class RotationMatrix
  def self.find_vector_angles(vector)
    dir = vector.normalize
    theta_z = Math.asin(dir[2])
    length_on_xy_plane = Math.sqrt(1 - dir[2]**2)
    cos_theta_x = dir[0] < length_on_xy_plane ? dir[0] / length_on_xy_plane : 1
    theta_x = Math.acos(cos_theta_x)
    theta_x = 0 if length_on_xy_plane < 0.001
    [theta_x, theta_z]
  end

  def self.rotate_around_vector(base, vector, angle)
    angles = find_vector_angles(base)

    aligned_vector = vector.rotate_z(-angles[0]).rotate_y(-angles[1])
    aligned_and_rotated_vector = aligned_vector.rotate_x(angle)
    aligned_and_rotated_vector.rotate_y(angles[1]).rotate_z(angles[0])
  end
end
