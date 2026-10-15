#pragma header

// Simple wavey shader that shifts the x pixels based on their y position using sine
uniform float power;
uniform float frequency;
uniform float iTime;
uniform float speed;
void main()
{
	vec2 uv = openfl_TextureCoordv;
	uv.x += sin((iTime*speed) + (uv.y*frequency)) * power;
	gl_FragColor = flixel_texture2D(bitmap,uv);	
}