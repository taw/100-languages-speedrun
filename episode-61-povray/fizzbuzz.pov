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

#declare Fizz = cone {
  <0, 0.1, 0>, 0.2,
  <0, 1.3, 0>, 0.0
  texture{T_Copper_4C}
}

#declare Buzz = torus {
  0.3, 0.1
  translate <0, 0.2, 0>
  texture{T_Wood6}
}

#declare RandomSeed = seed(1);
#for (X,0,9)
  #for (Z,0,9)
    #declare N = 91+X-10*Z;
    #declare OE = mod(X+Z, 2);
    #declare M3 = mod(N, 3);
    #declare M5 = mod(N, 5);
    #declare M15 = mod(N, 15);

    box {
      <X-5, 0.0, Z-5>,
      <X-4, 0.1, Z-4>
      #if (OE = 0)
        texture{T_Stone18}
      #else
        texture{T_Wood32}
      #end
    }

    #if (M15 = 0)
      object { Fizz translate <X-4.5, 0, Z-4.5> }
      object { Buzz translate <X-4.5, 0, Z-4.5> }
    #elseif (M5 = 0)
      object { Buzz translate <X-4.5, 0, Z-4.5> }
    #elseif (M3 = 0)
      object { Fizz translate <X-4.5, 0, Z-4.5> }
    #else
      #for (XX,0,9)
        #for (ZZ,0,9)
          #declare NN = 91+XX-10*ZZ;
          #if (NN <= N)
            sphere {
              <X-5+0.05+0.1*XX, 0.2 Z-5+0.05+0.1*ZZ>, 0.05
              texture{T_Brass_1B}
            }
          #end
        #end
      #end
    #end
  #end
#end
