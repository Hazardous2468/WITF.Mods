#pragma header
uniform float uTime;
uniform bool _active;
//Simply a port of the basic ShaderToy new project code, but is applied ontop of the texture.
void main() {
	vec2 coord = openfl_TextureCoordv;
	vec4 textureStuff = flixel_texture2D(bitmap,coord);
	if(_active){
		vec3 col = 0.5 + 0.5*cos(uTime + coord.xyx + vec3(0,2,4));
		textureStuff *= vec4(col,1.0);
	}
	gl_FragColor = textureStuff;
}

