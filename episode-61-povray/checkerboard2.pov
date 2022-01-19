#include "colors.inc"
#include "metals.inc"
#include "stones.inc"
#include "textures.inc"
#include "woods.inc"

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
    #declare N = 91+X-10*Z;
    #declare OE = mod(X+Z, 2);
    box {
      <X-5, 0.0, Z-5>,
      <X-4, 0.1, Z-4>
      #if (OE = 0)
        texture{T_Stone18}
      #else
        texture{T_Wood32}
      #end
    }

    box {
      <X-4.6, 0.1, Z-4.6>,
      <X-4.4, 0.1+0.01*N, Z-4.4>
      texture{T_Brass_1B}
    }
  #end
#end
