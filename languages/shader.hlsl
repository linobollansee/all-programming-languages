// HLSL (DirectX Shading Language)
float4 main(float4 pos : POSITION) : SV_POSITION
{
    return pos;
}

float4 PSMain(float4 pos : SV_POSITION) : SV_TARGET
{
    return float4(1.0, 1.0, 1.0, 1.0);
}
