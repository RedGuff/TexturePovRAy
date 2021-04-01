// PoVRay 3.7 Scene File " ... .pov"
// author:  redGuff
// date:    04/W01/2021                    
// +w128 +h128
// +w256 +h256
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------  

// orthographic projection using parallel camera rays
// Could be used to render a planar image map, for example 
  
camera {
  orthographic
  location <0,0,-10>    // position & direction of view
  look_at  <0,0,0>
  right 1*x            // horizontal size of view
  up 1*y               // vertical size of view
}

box {                  // this box fits exactly in view with:
// right 1*x            // horizontal size of view
 // up 1*y               // vertical size of view

  <-0.5, -0.5, 0>, <0.5, 0.5, 0>
  texture { pigment { rgb <1, 0, 1> } }
}




// sun ---------------------------------------------------------------------
light_source{< -3000, 3000, -3000> color White}

//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
// Change that:
#declare motif =        union{
   
      sphere { <0,0,0>, 0.25 

        texture { pigment{ color rgb<1.00, 0.55, 0.00>}
                  finish { phong 1.0 reflection 0.00}
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0,0.5,0>  
       }  // end of sphere ----------------------------------- 

     object{ Dodecahedron  
        scale <0.1,0.1,0.1>
        texture { pigment{ color rgb<1,0.67,0.15> }
                  normal { crackle 1.75 scale 0.25 turbulence 0.2 }
                  finish { phong 0.3 reflection{ 0.35 metallic 0.5 } }
                }
        scale <1,1,1>*1  rotate<0,0,0> translate<0,0,0>
       } // end of object

          object{ Icosahedron  
        scale <0.1,0.1,0.1>
        material{   //-----------------------------------------------------------
         texture { pigment{ color rgbf<0.6,0.95,0.7,0.45> }
                   //  normal { bumps 1 scale 0.85 }
                   finish { phong 1 reflection 0.25 specular 0.9 roughness 0.001 phong 1 phong_size 400 }
                 }
         interior{ I_Glass  caustics 0.2 }
        } // end of material ----------------------------------------------------
             scale <1,1,1>*1  rotate< 0,0,0> translate<0.5,0.5,-0.15>
       } // end of object  ------------------------------------------------------
 
   }           
// Don't change that:
object{motif translate<-1/2,0,0>}
object{motif translate<1/2,0,0>}
object{motif translate<-1/2,-1,0>}
object{motif translate<1/2,-1,0>}
 