#pragma header
uniform float iTimeX;
uniform float iTimeY;

void main()
{
	vec2 uv = openfl_TextureCoordv;
	
	uv.x += iTimeX;
	uv.y += iTimeY;
    
    // Output to screen
    gl_FragColor = flixel_texture2D(bitmap, fract(uv));
}