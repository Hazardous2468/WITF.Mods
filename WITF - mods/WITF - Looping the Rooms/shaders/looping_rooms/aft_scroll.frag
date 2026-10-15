#pragma header
uniform float scrollingY;
uniform float scrollingX;
uniform float scale;

uniform float transition;

void main() {
	vec2 uv = openfl_TextureCoordv;
	
	
	uv.x -= 0.5;
	uv.y -= 0.5;
	
	uv.x *= scale;
	uv.y *= scale;
	
	uv.x += 0.5;
	uv.y += 0.5;
	
	uv.x -= scrollingX;
	
	vec2 uv_1 = uv;
	vec2 uv_2 = uv;
	
	uv_1.y += scrollingY;

	gl_FragColor = flixel_texture2D(bitmap, fract(uv_1));
	
	uv_2.y -= scrollingY;
	uv_2.x += 0.5;
	gl_FragColor += flixel_texture2D(bitmap, fract(uv_2)) * transition;

}

