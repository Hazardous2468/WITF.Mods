#pragma header

const int EFFECT_TYPE_CreditsPostProcess = 35;

const vec3 resolution = vec3(1280.0, 720.0, 1.0);
#define pi 3.14159265358979323846264338327950288419716939937510
#define iTime uTime

/**
 * The current time. Used to shift the effect over time.
 */
uniform float uTime;		
/**
 * Which out of several effects should be used.
 */
uniform int effectType;
/**
 * How fast the waves move over time.
 */
uniform float uSpeed;		
/**
 * Number of waves over time.
 */
uniform float uFrequency;		
/**
 * How much the pixels are going to stretch over the waves.
 */
uniform float uWaveAmplitude;

float greyScale(in vec3 col) 
{
    return dot(col, vec3(0.2126, 0.7152, 0.0722)); //sRGB
}

float character(float n, vec2 p)
{
	p = floor(p*vec2(4.0, -4.0) + 2.5);
	if (clamp(p.x, 0.0, 4.0) == p.x && clamp(p.y, 0.0, 4.0) == p.y
	 && int(mod(n/exp2(p.x + 5.0*p.y), 2.0)) == 1) return 1.0;
	return 0.0;
}
vec3 scanline(vec2 coord, vec3 screen)
{
	screen.rgb -= sin((coord.y + (iTime * 29.0))) * 0.02;
	return screen;
}

vec2 crt(vec2 coord, float bend)
{
	// put in symmetrical coords
	coord = (coord - 0.5) * 2.0;

	coord *= 1.0;	

	// deform coords
	coord.x *= 1.0 + pow((abs(coord.y) / bend), 2.0);
	coord.y *= 1.0 + pow((abs(coord.x) / bend), 2.0);

	// transform back to 0.0 - 1.0 space
	coord  = (coord / 2.0) + 0.5;

	return coord;
}






void main() {

	float ASCII_Details = 4.0; 
	float PixelSize = 4.0;
	float blurSize = 0.05;
	
	
	vec2 uv = openfl_TextureCoordv;
	//uv.y = 1.0 - uv.y; // flip tex
	vec2 crtCoords = crt(uv, 3.5);

	vec2 uv_2 = crtCoords.xy * resolution.xy;
	vec2 funnyUV = floor(uv_2 / ASCII_Details) * ASCII_Details / resolution.xy;
	vec4 col_4 = flixel_texture2D(bitmap, funnyUV);
	vec3 col = col_4.rgb;
	float gray = greyScale(col);
	float n = 65536.0 + 
		  step(0.2, gray) * 64.0 + 
		  step(0.3, gray) * 267172.0 +
		  step(0.4, gray) * 14922314.0 + 
		  step(0.5, gray) * 8130078.0 - 
		  step(0.6, gray) * 8133150.0 - 
		  step(0.7, gray) * 2052562.0 -
		  step(0.8, gray) * 1686642.0;
		  
	vec2 p = mod(uv_2 / PixelSize, 2.0) - vec2(1.0);
	col = col*character(n, p);
	gl_FragColor = vec4(col, col_4.a) * col_4.a;
	gl_FragColor.rgb = scanline(uv_2, gl_FragColor.rgb);
	
	//fml
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,crtCoords.x));
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,1.0-crtCoords.x));
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,crtCoords.y));
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,1.0-crtCoords.y));

	
}

