#pragma header
uniform float _active;
void main() {
	vec2 uv = openfl_TextureCoordv;
	vec4 texFull = flixel_texture2D(bitmap,uv);
	vec3 tex = vec3(texFull.r, texFull.g, texFull.b);
	vec3 tex_inverted = vec3(1.-tex.r,1.-tex.g,1.-tex.b);
	tex_inverted = clamp(tex_inverted, 0.0, 0.5);
	//vec3 tex_inverted = vec3(1.-tex.r,tex.g,tex.b);
	vec3 texMix = mix(tex, tex_inverted, _active);
	gl_FragColor = vec4(texMix.r, texMix.g, texMix.b, texFull.a);
}

