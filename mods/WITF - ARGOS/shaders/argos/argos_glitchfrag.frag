#pragma header

uniform float uTime;
uniform float amount;

float truncLOL(float x, float num_levels)
{
	return floor(x * num_levels) / num_levels;
}

void main() {
	if(amount < 0.01){
		gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);
	}else{
		vec2 pt = openfl_TextureCoordv;
		
		float truncTime = truncLOL(uTime, 8.0);
		float yShit = 0.5 - pt.y * tan(pt.y - 0.5 * 3.0);
		yShit = truncLOL(yShit, 32.0);
		
		pt.x += yShit * 1.8 ;
		pt.x += sin(uTime*120.0) * mod(pt.y, 0.015);

		gl_FragColor = flixel_texture2D(bitmap,fract(pt));	
	}
}

