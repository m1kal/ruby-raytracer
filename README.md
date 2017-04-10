Ray tracer written in Ruby

Based on https://www.scratchapixel.com/ tutorials

Features:
- supported point lights in form of glowing spheres
- available shapes: sphere, triangle, plane
- reflections, refraction
- procedural texturing
- arbitrary camera position and angle
- uses ChunkyPNG to generate image file, no external dependencies

=TODO

- Spatial transformations of objects
- Proper algorithm for modelling materials that are semi-transparent
- Performance is really weak. Main optimization area is probably handling vector operations, creating new objects, but geometrical operations can also be optimized.
- I think my approach to RGB color space is not right. It seems easy however
- Textures: mapping of coordinates on a surface is arbitrary now, it should be possible to set orientation and starting point
- Texture from image
- Support for animations: the simplest case seems to be rotating camera
- Partially transparent objects do not cast shadows
