require 'chunky_png'
require 'benchmark'

require_relative 'rt/vector'
require_relative 'rt/point'
require_relative 'rt/color'
require_relative 'rt/ray'
require_relative 'rt/shapes'
require_relative 'rt/scene'
require_relative 'rt/canvas'
require_relative 'rt/screen'
require_relative 'scenes'

MAX_DEPTH = 2
img = nil

x = (ARGV[0] || 200).to_i
y = (ARGV[1] || 200).to_i

# screen = Screen.new(position: Vector.new([-2, -0.5, -3]),
#                     size: [x, y], rotation: [Math::PI / 3, 0, Math::PI / 2])
screen = Screen.new(position: Vector.new([0, 0, 0]),
                    size: [x, y])
@scenes.each do |scene|
  next unless scene[:enabled]
  puts 'Scene: ' + scene[:name]
  # puts Benchmark.measure {
  img = screen.render(Scene.new(scene))
  # }
  # ChunkyPNG::Image.new(x, y, img.normalize).save(scene[:name] + '.png')
  img = Canvas.interpolate_from_image(img, 2)
  ChunkyPNG::Image.new(x * 2 - 1, y * 2 - 1, img.normalize)
                  .save(scene[:name] + 'x2.png')

end
