#extension GL_EXT_texture_array : enable
vec4 texture1DArray(sampler1DArray sampler, vec2 coord);
vec4 texture1DArrayLod(sampler1DArray sampler, vec2 coord, float lod);

vec4 texture2DArray(sampler2DArray sampler, vec3 coord);
vec4 texture2DArrayLod(sampler2DArray sampler, vec3 coord, float lod);

vec4 shadow1DArray(sampler1DArrayShadow sampler, vec3 coord);
vec4 shadow1DArrayLod(sampler1DArrayShadow sampler, vec3 coord, float lod);

vec4 shadow2DArray(sampler2DArrayShadow sampler, vec4 coord);
