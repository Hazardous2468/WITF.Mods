#pragma header

const vec3 resolution = vec3(1280.0, 720.0, 1.0);
uniform float beat;
void main()
{
	float t = beat*0.01*0.5;
	vec2 uv = openfl_TextureCoordv;
	uv.x += t*0.9;
	uv.y -= t*0.75;
	gl_FragColor = flixel_texture2D(bitmap,fract(uv));	
	
}