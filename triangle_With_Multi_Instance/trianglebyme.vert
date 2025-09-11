#version 450

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inColor;

layout (binding = 0) uniform UBO 
{
	mat4 projectionMatrix;
	mat4 modelViewMatrix;
} ubo;

layout (location = 0) out vec3 outColor;

out gl_PerVertex 
{
    vec4 gl_Position;   
};


void main() 
{
	vec3 v_pos = inPos;
	switch (gl_InstanceIndex){
		case 0:
		{
			v_pos.xyz += vec3(-3.0, 0.0, 0.0);
			break;
		}
		case 2:
		{
			v_pos.xyz += vec3(3.0, 0.0, 0.0);
			break;
		}
		default:
		{
			break;
		}
	}
	outColor = inColor;
	gl_Position = ubo.projectionMatrix * ubo.modelViewMatrix * vec4(v_pos.xyz, 1.0);
}
