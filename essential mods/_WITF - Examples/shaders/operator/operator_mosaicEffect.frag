#pragma header
uniform float xStrength;
uniform float yStrength;
void main() {
	vec2 uBlocksize = vec2(xStrength, yStrength);
	vec2 blocks = openfl_TextureSize / uBlocksize;
	gl_FragColor = flixel_texture2D(bitmap, floor(openfl_TextureCoordv * blocks) / blocks);
}

