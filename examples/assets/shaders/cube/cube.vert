#version 450

#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

layout (location = 0) in vec3 inPosition;
layout (location = 1) in vec3 inTangent;
layout (location = 2) in vec3 inBitangent;
layout (location = 3) in vec3 inNormal;
layout (location = 4) in vec2 inTexCoord;

layout (binding = 0) uniform UBO {
	mat4 viewModelProjectionMatrix;
	mat3 normalViewMatrix;
} ubo;

layout (location = 0) out vec3 outNormal;
layout (location = 1) out vec2 outTexCoord;

out gl_PerVertex {
    vec4 gl_Position;   
};

void main() {
  outNormal = ubo.normalViewMatrix * inNormal;
	outTexCoord = inTexCoord;
	gl_Position = ubo.viewModelProjectionMatrix * vec4(inPosition, 1.0);
}
