#pragma header

uniform float scrollX;
uniform float scrollY;

void main() {
	vec2 uv = openfl_TextureCoordv;
	uv.x += scrollX;
	uv.y += scrollY;
	gl_FragColor = flixel_texture2D(bitmap,fract(uv));	
}

