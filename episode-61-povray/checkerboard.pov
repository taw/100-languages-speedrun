#include "colors.inc"
#include "textures.inc"
#include "stones.inc"

background { color rgb <0.8, 0.8, 1.0> }

camera {
  location <0, 10, -8>
  look_at  <0, 0, -2>
}

light_source { <2, 4, -3> color White }
plane { <0, 1, 0>, 0 texture{T_Stone10} }

#declare RandomSeed = seed(1);
#for (X,0,9)
  #for (Z,0,9)
    box {
      <X-5, 0.0, Z-5>,
      <X-4, 0.1, Z-4>
      pigment { color rgb <rand(RandomSeed), rand(RandomSeed), rand(RandomSeed)> }
    }
  #end
#end

