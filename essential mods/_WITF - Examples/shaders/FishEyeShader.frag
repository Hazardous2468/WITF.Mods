#pragma header

const vec3 resolution = vec3(1280.0, 720.0, 1.0);
#define pi 3.14159265358979323846264338327950288419716939937510
	
/**
 * Number of waves over time.
 */
uniform float uFrequency;		

void main() {

	float amount = uFrequency;

	vec2 uv = openfl_TextureCoordv;
			
	uv -= 0.5;
	uv *= 1.0 - amount / 2.0;
	
	float r = sqrt(dot(uv,uv));
	uv *= 1.0 + r * amount;
	uv += 0.5;
	
	//lmao, this should be fine to comment out, right? -Haz
	//vec2 res = resolution.xy;
	//uv = clamp( uv, 1.0 / res, (res - 1.0) / res );

	gl_FragColor = flixel_texture2D(bitmap, uv);
	
}

