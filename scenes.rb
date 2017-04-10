@scenes = [
  { name: 'five_balls', enabled: false, objects:
    [
      Sphere.new(center: Vector.new([1, 2, -20]), r: 1, color: GREEN),
      Sphere.new(center: Vector.new([-2, 2, -15]), r: 1, color: BLUE),
      Sphere.new(center: Vector.new([-1, -8, -30]), r: 8, color: RED + GREEN),
      Sphere.new(center: Vector.new([0, 20, 10]), r: 1, color: GREEN, light: 1),
      Sphere.new(center: Vector.new([-5, -4, -6]), r: 1,
                 color: GREEN + RED + BLUE, light: 0.4),
      Sphere.new(center: Vector.new([3, 1, -18]), r: 2, color: RED * 0.6)
    ] },
  { name: 'three_balls', enabled: false, objects:
    [
      Sphere.new(center: Vector.new([3, 3, -8]), r: 2, color: GREEN),
      Sphere.new(center: Vector.new([-3, 3, -8]), r: 2, color: BLUE),
      Sphere.new(center: Vector.new([0, -3, -8]), r: 2, color: RED + GREEN),
      Sphere.new(center: Vector.new([0, 10, 10]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'balls_triangle_and_plane', enabled: false, objects:
    [
      Plane.new(n: Vector.new([-0.3, -0.1, -1]).normalize, d: 8, color: BLUE),
      Triangle.new(vertices: [Vector.new([3, -3, -4]),
                              Vector.new([-3, 3, -4]), Vector.new([3, 3, -4])],
                   color: GREEN, reflectivity: 0.7),
      Sphere.new(center: Vector.new([1, 1, -2]), r: 0.5, color: RED,
                 reflectivity: 0.1),
      Sphere.new(center: Vector.new([1, -1, -2]), r: 0.5, color: RED,
                 reflectivity: 0.9),
      Sphere.new(center: Vector.new([0, 10, 10]), r: 1, color: WHITE, light: 1)
    ] },
  { name: 'two_balls_two_triangles', enabled: false, objects:
    [
      Triangle.new(vertices:
        [Vector.new([2, -2, -5]), Vector.new([-2, 2, -5]),
         Vector.new([2, 2, -5])],
                   color: LGREEN, reflectivity: 1),
      Triangle.new(vertices:
        [
          Vector.new([2, -2, -5]), Vector.new([-2, 2, -5]),
          Vector.new([-2, -2, -4])
        ],
                   color: WHITE, reflectivity: 1),
      Sphere.new(center: Vector.new([1, 1, -2]), r: 0.5, color: LRED,
                 reflectivity: 0.1, light: 0.5),
      Sphere.new(center: Vector.new([1, -1, -2]), r: 0.5, color: LRED,
                 reflectivity: 0.9),
      Sphere.new(center: Vector.new([0, 10, 10]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'shadows', enabled: false, objects:
    [
      Triangle.new(vertices:
        [Vector.new([-20, 2, 0]), Vector.new([-20, 2, -20]),
         Vector.new([40, 2, -2])], color: LBLUE, reflectivity: 0),
      Triangle.new(vertices:
        [Vector.new([-2, 0.5, -3]), Vector.new([0, 0.5, -5]),
         Vector.new([2, 0.5, -3])], color: RED, reflectivity: 0),
      Sphere.new(center: Vector.new([0, 0, -3]), r: 0.5, color: LRED,
                 reflectivity: 0.1),
      Sphere.new(center: Vector.new([0, -2, -2]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'ball_and_plane', enabled: true, objects:
    [
      Triangle.new(vertices:
        [Vector.new([-20, 2, 0]), Vector.new([-20, 2, -20]),
         Vector.new([40, 2, -2])], color: LBLUE, reflectivity: 0),
      Sphere.new(center: Vector.new([0, 0, -5]), r: 1, color: LRED,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([0, -2, -4]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'nonreflecting_spheres', enabled: true, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([-2, 0, -6]), r: 1, color: RED,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([2, 0, -6]), r: 1, color: PURPLE,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([-1.2, 2, -6]), r: 1, color: BLUE,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([1.2, 2, -6]), r: 1, color: GREEN,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([0, 0, -7]), r: 1, color: WHITE,
                 reflectivity: 0),
      Triangle.new(vertices:
        [Vector.new([-500, 4, -50]), Vector.new([50, 4, -50]),
         Vector.new([0, 4, 50])], color: BLUE * 0.6, reflectivity: 1),
      Sphere.new(center: Vector.new([0, -4, 2]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'reflecting_spheres_02', enabled: true, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 0.2),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 0.2),
      Sphere.new(center: Vector.new([-2, 0, -6]), r: 1, color: RED,
                 reflectivity: 0.2),
      Sphere.new(center: Vector.new([2, 0, -6]), r: 1, color: PURPLE,
                 reflectivity: 0.2),
      Sphere.new(center: Vector.new([-1.2, 2, -6]), r: 1, color: BLUE,
                 reflectivity: 0.2),
      Sphere.new(center: Vector.new([1.2, 2, -6]), r: 1, color: GREEN,
                 reflectivity: 0.2),
      Sphere.new(center: Vector.new([0, 0, -7]), r: 1, color: WHITE,
                 reflectivity: 0.2),
      Triangle.new(vertices:
        [Vector.new([-500, 4, -50]), Vector.new([50, 4, -50]),
         Vector.new([0, 4, 50])], color: BLUE * 0.6, reflectivity: 1),
      Sphere.new(center: Vector.new([0, -4, 2]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'reflecting_spheres_05', enabled: false, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 0.5),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 0.5),
      Sphere.new(center: Vector.new([-2, 0, -6]), r: 1, color: RED,
                 reflectivity: 0.5),
      Sphere.new(center: Vector.new([2, 0, -6]), r: 1, color: PURPLE,
                 reflectivity: 0.5),
      Sphere.new(center: Vector.new([-1.2, 2, -6]), r: 1, color: BLUE,
                 reflectivity: 0.5),
      Sphere.new(center: Vector.new([1.2, 2, -6]), r: 1, color: GREEN,
                 reflectivity: 0.5),
      Sphere.new(center: Vector.new([0, 0, -7]), r: 1, color: WHITE,
                 reflectivity: 0.5),
      Triangle.new(vertices:
        [Vector.new([-500, 4, -50]), Vector.new([50, 4, -50]),
         Vector.new([0, 4, 50])], color: BLUE * 0.6, reflectivity: 1),
      Sphere.new(center: Vector.new([0, -4, 2]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'reflecting_spheres_08', enabled: true, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 0.8),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 0.8),
      Sphere.new(center: Vector.new([-2, 0, -6]), r: 1, color: RED,
                 reflectivity: 0.8),
      Sphere.new(center: Vector.new([2, 0, -6]), r: 1, color: PURPLE,
                 reflectivity: 0.8),
      Sphere.new(center: Vector.new([-1.2, 2, -6]), r: 1, color: BLUE,
                 reflectivity: 0.8),
      Sphere.new(center: Vector.new([1.2, 2, -6]), r: 1, color: GREEN,
                 reflectivity: 0.8),
      Sphere.new(center: Vector.new([0, 0, -7]), r: 1, color: WHITE,
                 reflectivity: 0.8),
      Triangle.new(vertices:
        [Vector.new([-500, 4, -50]), Vector.new([50, 4, -50]),
         Vector.new([0, 4, 50])], color: BLUE * 0.6, reflectivity: 1),
      Sphere.new(center: Vector.new([0, -4, 2]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'reflecting_spheres', enabled: false, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([-2, 0, -6]), r: 1, color: RED,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([2, 0, -6]), r: 1, color: PURPLE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([-1.2, 2, -6]), r: 1, color: BLUE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([1.2, 2, -6]), r: 1, color: GREEN,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([0, 0, -7]), r: 1, color: WHITE,
                 reflectivity: 1),
      Triangle.new(vertices:
        [Vector.new([-500, 4, -50]), Vector.new([50, 4, -50]),
         Vector.new([0, 4, 50])], color: BLUE * 0.6, reflectivity: 1),
      Sphere.new(center: Vector.new([0, -4, 2]), r: 1, color: WHITE,
                 light: 1)
    ] },

  { name: 'reflecting_spheres_in_box', enabled: true, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([-2, 0, -6]), r: 1, color: GREEN,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([2, 0, -6]), r: 1, color: RED,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([-1.2, 2, -6]), r: 1, color: BLUE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([1.2, 2, -6]), r: 1, color: PURPLE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([0, 0, -7]), r: 1, color: WHITE,
                 reflectivity: 1),
      Plane.new(n: Vector.new([0, 0, 1]), d: 10, color: LBLUE,
                reflectivity: 0),
      Plane.new(n: Vector.new([0, 0, -1]), d: 10, color: RED,
                reflectivity: 0),
      Plane.new(n: Vector.new([1, 0, 0]), d: 4, color: WHITE,
                reflectivity: 0),
      Plane.new(n: Vector.new([-1, 0, 0]), d: 4, color: WHITE,
                reflectivity: 0.2),
      Plane.new(n: Vector.new([0, 1, 0]), d: 4, color: BLUE * 0.6,
                reflectivity: 1),
      Sphere.new(center: Vector.new([0, -4, 2]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'spheres_in_box', enabled: true, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 0.2),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 0.4),
      Sphere.new(center: Vector.new([-2, 0, -6]), r: 1, color: GREEN,
                 reflectivity: 0.6),
      Sphere.new(center: Vector.new([2, 0, -6]), r: 1, color: RED,
                 reflectivity: 0.8),
      Sphere.new(center: Vector.new([-1.2, 2, -6]), r: 1, color: BLUE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([1.2, 2, -6]), r: 1, color: PURPLE,
                 reflectivity: 1),
      Sphere.new(center: Vector.new([0, 0, -7]), r: 1, color: WHITE,
                 reflectivity: 1),
      Plane.new(n: Vector.new([0, 0, 1]), d: 10, color: LBLUE,
                reflectivity: 0),
      Plane.new(n: Vector.new([0, 0, -1]), d: 10, color: RED,
                reflectivity: 0.2),
      Plane.new(n: Vector.new([1, 0, 0]), d: 4, color: WHITE,
                reflectivity: 0),
      Plane.new(n: Vector.new([-1, 0, 0]), d: 4, color: WHITE,
                reflectivity: 0.2),
      Plane.new(n: Vector.new([0, 1, 0]), d: 4, color: BLUE * 0.6,
                reflectivity: 1),
      Triangle.new(vertices:
        [Vector.new([4, 4, -8]), Vector.new([4, 0, -2]),
         Vector.new([0, 4, -2])], color: ORANGE, reflectivity: 1),
      Sphere.new(center: Vector.new([0, -4, 2]), r: 1, color: WHITE,
                 light: 1)
    ] },
  { name: 'light', enabled: false, background: ORANGE, max_depth: 2, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 0.5),
      Sphere.new(center: Vector.new([0, 2, -6]), r: 1, color: WHITE,
                 light: 1),
      Plane.new(n: Vector.new([0, -1, 0]), d: 4, color: BLUE,
                reflectivity: 1),
      Plane.new(n: Vector.new([1, 0, 0]), d: 4, color: GREEN,
                reflectivity: 0)
    ] },
  { name: 'balls', enabled: true, background: ORANGE, max_depth: 2, objects:
    [
      Sphere.new(center: Vector.new([-1.2, -2, -6]), r: 1, color: YELLOW,
                 reflectivity: 0, texture: true),
      Sphere.new(center: Vector.new([1.2, -2, -6]), r: 1, color: ORANGE,
                 reflectivity: 0),
      Sphere.new(center: Vector.new([0, 2, -6]), r: 1, color: WHITE,
                 light: 1),
      Sphere.new(center: Vector.new([-2, 0, -4]), r: 1, color: WHITE,
                 light: 1),
      Plane.new(n: Vector.new([0, -1, 0]), d: 4, color: BLUE,
                reflectivity: 0.3)
    ] },
  { name: 'frontwall', enabled: false, background: RED, max_depth: 2, objects:
    [
      Sphere.new(center: Vector.new([0, 2, 10]), r: 1, color: WHITE,
                 light: 1),
      Plane.new(n: Vector.new([0, 0, -1]), d: 4, color: BLUE,
                reflectivity: 0.2, texture: true)
    ] },
  { name: 'sidewall', enabled: false, background: RED, max_depth: 2, objects:
    [
      Sphere.new(center: Vector.new([8, -8, -12]), r: 1, color: WHITE,
                 light: 1),
      Sphere.new(center: Vector.new([-4, 1, -8]), r: 1, color: YELLOW,
                 light: 1),
      Plane.new(n: Vector.new([0, 1, 0]), d: 3, color: BLUE,
                reflectivity: 0.4, texture: true)
    ] },
  { name: 'tiltedwall', enabled: true, background: RED, max_depth: 2, objects:
    [
      Sphere.new(center: Vector.new([0, -2, -2]), r: 1, color: WHITE,
                 light: 1),
      Plane.new(n: Vector.new([0, 1, -1]).normalize, d: 4, color: BLUE,
                reflectivity: 0.4, texture: true)
    ] },
  { name: 'ball_and_wall', enabled: false, background: LGREEN, max_depth: 2, objects:
    [
      Sphere.new(center: Vector.new([-1, -0.5, -4]), r: 0.5, color: WHITE,
                 light: 1),
      Sphere.new(center: Vector.new([1, -1, -4]), r: 1, color: YELLOW,
                 reflectivity: 0.4, texture: true),
      Plane.new(n: Vector.new([0, 4, -3]).normalize, d: 4, color: BLUE,
                reflectivity: 0.4, texture: true)
    ] },
  { name: 'ball_and_walls', enabled: true, background: LGREEN, max_depth: 2, objects:
    [
      Sphere.new(center: Vector.new([-1, -0.5, -4]), r: 0.5, color: WHITE,
                 light: 1),
      Sphere.new(center: Vector.new([1, -1, -4]), r: 1, color: YELLOW,
                 reflectivity: 0.4, texture: true),
      Plane.new(n: Vector.new([0, 4, -3]).normalize, d: 4, color: BLUE,
                reflectivity: 0.4, texture: true),
      Plane.new(n: Vector.new([1, 0, 0]).normalize, d: 8, color: YELLOW,
                reflectivity: 0.4, texture: true)
    ] },
    { name: 'transparent_ball_and_walls', enabled: true, background: LGREEN, max_depth: 2, objects:
      [
        Sphere.new(center: Vector.new([0, 0, 2]), r: 0.5, color: WHITE,
                   light: 1),
        Sphere.new(center: Vector.new([3, 0, 0]), r: 0.5, color: WHITE,
                   light: 1),
        Sphere.new(center: Vector.new([1, -1, -3]), r: 1, color: YELLOW,
                   reflectivity: 0, refraction: 1.5, transparency: 0.8),
        Plane.new(n: Vector.new([0, 0, -1]).normalize, d: 8, color: BLUE,
                  reflectivity: 0, texture: true),
        Plane.new(n: Vector.new([-1, 0, 0]).normalize, d: 0.5, color: RED,
                  reflectivity: 0, texture: true),
        Plane.new(n: Vector.new([0, 0, 1]).normalize, d: 8, color: YELLOW,
                  reflectivity: 0, texture: true)
      ] },

      { name: 'transparent_plane_and_walls', enabled: false, background: LGREEN, max_depth: 2, objects:
        [
          Sphere.new(center: Vector.new([0, 0, 2]), r: 0.5, color: WHITE,
                     light: 0.5),
          Sphere.new(center: Vector.new([3, 0, 0]), r: 0.5, color: WHITE,
                     light: 0.5),
          Plane.new(n: Vector.new([0.3, 0, -1]).normalize, d: 3, color: YELLOW,
                    reflectivity: 0, refraction: 1.5, transparency: 0.8),
          Plane.new(n: Vector.new([0, 0, -1]).normalize, d: 8, color: BLUE,
                    reflectivity: 0, texture: true),
          Plane.new(n: Vector.new([-1, 0, 0]).normalize, d: 0.5, color: RED,
                    reflectivity: 0, texture: true),
          Plane.new(n: Vector.new([0, 0, 1]).normalize, d: 8, color: YELLOW,
                    reflectivity: 0, texture: true)
        ] },

      { name: 'transparent_balls', enabled: true, background: LGREEN, max_depth: 2, objects:
        [
          Sphere.new(center: Vector.new([-2, -2, 2]), r: 0.5, color: WHITE,
                     light: 1),
          Sphere.new(center: Vector.new([2, -2, 2]), r: 0.5, color: WHITE,
                     light: 1),
          Sphere.new(center: Vector.new([1.2, 1, -4]), r: 1, color: WHITE,
                     reflectivity: 0, refraction: 1.5, transparency: 1),
          Sphere.new(center: Vector.new([-1.2, 1, -4]), r: 1, color: WHITE,
                     reflectivity: 0, refraction: 1.5, transparency: 1),
          Sphere.new(center: Vector.new([1.2, -1.2, -4]), r: 1, color: YELLOW,
                     reflectivity: 0, refraction: 1.5, transparency: 1),
          Sphere.new(center: Vector.new([-1.2, -1.2, -4]), r: 1, color: RED,
                     reflectivity: 0, refraction: 1.5, transparency: 1),
          Sphere.new(center: Vector.new([0, 1, -6]), r: 1, color: WHITE,
                     reflectivity: 1, refraction: 1.5, transparency: 0),
          Plane.new(n: Vector.new([0, 0, -1]).normalize, d: 8, color: WHITE,
                    reflectivity: 0, texture: true),
          Plane.new(n: Vector.new([0, 1, 0]).normalize, d: 2, color: GREEN,
                    reflectivity: 1)
        ] }
]
