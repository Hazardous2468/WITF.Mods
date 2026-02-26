#pragma header

const vec3 resolution = vec3(1280.0, 720.0, 1.0);
#define pi 3.14159265358979323846264338327950288419716939937510

/**
 * The current time. Used to shift the effect over time.
 */
uniform float uTime;		

/**
 * How fast the waves move over time.
 */
uniform float uSpeed;		
/**
 * Number of waves over time.
 */
uniform float uFrequency;		


float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}


void main() {
	//from notitg files lol. Is glitch lines
	vec2 uv = openfl_TextureCoordv;
	vec2 uvn = openfl_TextureCoordv;

	uv.x += rand( vec2(uvn.y / 10.0, uTime / 10.0) ) * uFrequency;
	uv.x -= rand( vec2(uvn.y * 10.0, uTime * 10.0) ) * uFrequency;
	gl_FragColor = flixel_texture2D(bitmap, uv);
}

