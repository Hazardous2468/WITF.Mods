#pragma header

//ORIGINAL - https://www.shadertoy.com/view/4lB3Dc

uniform float uTime;

float rand(vec2 co){
	return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}
		
void main() {

	vec4 texColor = vec4(0);
	// get position to sample
	vec2 samplePosition = openfl_TextureCoordv.xy;
	float whiteNoise = 9999.0;
	
	
	//Fix for upside-down texture
	samplePosition.y = 1.0-samplePosition.y; 
	
	// Jitter each line left and right
	samplePosition.x = samplePosition.x+(rand(vec2(uTime,openfl_TextureCoordv.y))-0.5)/64.0;
	// Jitter the whole picture up and down
	samplePosition.y = samplePosition.y+(rand(vec2(uTime))-0.5)/32.0;
	// Slightly add color noise to each line
	texColor = texColor + (vec4(-0.5)+vec4(rand(vec2(openfl_TextureCoordv.y,uTime)),rand(vec2(openfl_TextureCoordv.y,uTime+1.0)),rand(vec2(openfl_TextureCoordv.y,uTime+2.0)),0))*0.1;

	
	// Either sample the texture, or just make the pixel white (to get the staticy-bit at the bottom)
	whiteNoise = rand(vec2(floor(samplePosition.y*80.0),floor(samplePosition.x*50.0))+vec2(uTime,0));
	if (whiteNoise > 11.5-30.0*samplePosition.y || whiteNoise < 1.5-5.0*samplePosition.y) {
		// Sample the texture.
		samplePosition.y = 1.0-samplePosition.y; //Fix for upside-down texture
		texColor = texColor + flixel_texture2D(bitmap,samplePosition);
	} else {
		// Use white. (Im adding here so the color noise still applies)
		texColor = vec4(1);
	}
	gl_FragColor = texColor;
	
}

