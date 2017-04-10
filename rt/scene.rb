# Class representing scene
class Scene
  attr_accessor :name, :enabled, :background, :max_depth, :objects, :lights
  def initialize(name: '', enabled: true, background: BACKGROUND,
                 max_depth: MAX_DEPTH, objects: [])
    @name = name
    @enabled = enabled
    @background = background
    @objects = objects
    @max_depth = max_depth
    @lights = objects.select { |object| object.light > 0 }
  end
end
