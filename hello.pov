// POV-Ray
#include "colors.inc"

camera {
  location <0, 0, -5>
  look_at <0, 0, 0>
}

light_source { <10, 10, -10> color White }

text {
  ttf "timrom.ttf" "Hello, World!" 0.2, 0
  pigment { color Red }
}
