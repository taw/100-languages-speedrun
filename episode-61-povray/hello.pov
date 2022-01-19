#include "colors.inc"
#include "textures.inc"

background { color rgb <0.8, 0.8, 1.0> }

camera {
  location <0, 2, -3>
  look_at  <0, 1,  2>
}

sphere { <0, 0, 2>, 1 texture{Blood_Marble} }
plane { <0, 1, 0>, -1 texture{Brass_Valley} }
light_source { <2, 4, -3> color White }
