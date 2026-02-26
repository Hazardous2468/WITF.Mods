#pragma header

uniform float xAmount;		
uniform float yAmount;	
void main() {
	vec2 blocks = openfl_TextureSize / vec2(xAmount, yAmount);
	gl_FragColor = flixel_texture2D(bitmap, floor(openfl_TextureCoordv * blocks) / blocks);
}

