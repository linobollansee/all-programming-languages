// Metal Shading Language
#include <metal_stdlib>
using namespace metal;

vertex float4 vertex_main(uint vertexID [[vertex_id]]) {
    return float4(0.0, 0.0, 0.0, 1.0);
}

fragment float4 fragment_main() {
    return float4(1.0, 1.0, 1.0, 1.0);
}
