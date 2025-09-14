#version 450

layout (location = 0) in vec2 outUV;
layout (binding =1) uniform sampler2D texSampler;
layout (location = 0) out vec4 outFragColor;



void main() 
{
  vec4 outColor = texture(texSampler, outUV);
  outFragColor = outColor ; //vec4(outColor, 1.0);
}