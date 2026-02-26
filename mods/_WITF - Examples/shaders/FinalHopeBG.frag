#pragma header

const int EFFECT_TYPE_Clouds = 31;
const int EFFECT_TYPE_CloudsALT = 32;


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







mat2 Rot(float a){
    float s = sin(a), c=cos(a);
    return mat2(c,-s,s,c);
}






//2D signed hash function:
vec2 Hash2(vec2 P){return 1.-2.*fract(cos(P.x*vec2(91.52,-74.27)+P.y*vec2(-39.07,09.78))*939.24);}
//2D Worley noise.
float Worley(vec2 P)
{
	float D = 1.;
	vec2 F = floor(P+.5);  
	//Find the the nearest point the neigboring cells.
	D = min(length(.5*Hash2(F+vec2( 1, 1))+F-P+vec2( 1, 1)),D);
	D = min(length(.5*Hash2(F+vec2( 0, 1))+F-P+vec2( 0, 1)),D);
	D = min(length(.5*Hash2(F+vec2(-1, 1))+F-P+vec2(-1, 1)),D);
	D = min(length(.5*Hash2(F+vec2( 1, 0))+F-P+vec2( 1, 0)),D);
	D = min(length(.5*Hash2(F+vec2( 0, 0))+F-P+vec2( 0, 0)),D);
	D = min(length(.5*Hash2(F+vec2(-1, 0))+F-P+vec2(-1, 0)),D);
	D = min(length(.5*Hash2(F+vec2( 1,-1))+F-P+vec2( 1,-1)),D);
	D = min(length(.5*Hash2(F+vec2( 0,-1))+F-P+vec2( 0,-1)),D);
	D = min(length(.5*Hash2(F+vec2(-1,-1))+F-P+vec2(-1,-1)),D);
	return D;
}

float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}




const mat2 m = mat2( 1.6,  1.2, -1.2,  1.6 );
vec2 hash( vec2 p ) {
	p = vec2(dot(p,vec2(127.1,311.7)), dot(p,vec2(269.5,183.3)));
	return -1.0 + 2.0*fract(sin(p)*43758.5453123);
}

float noise( in vec2 p ) {
    const float K1 = 0.366025404; // (sqrt(3)-1)/2;
    const float K2 = 0.211324865; // (3-sqrt(3))/6;
	vec2 i = floor(p + (p.x+p.y)*K1);	
    vec2 a = p - i + (i.x+i.y)*K2;
    vec2 o = (a.x>a.y) ? vec2(1.0,0.0) : vec2(0.0,1.0); //vec2 of = 0.5 + 0.5*vec2(sign(a.x-a.y), sign(a.y-a.x));
    vec2 b = a - o + K2;
	vec2 c = a - 1.0 + 2.0*K2;
    vec3 h = max(0.5-vec3(dot(a,a), dot(b,b), dot(c,c) ), 0.0 );
	vec3 n = h*h*h*h*vec3( dot(a,hash(i+0.0)), dot(b,hash(i+o)), dot(c,hash(i+1.0)));
    return dot(n, vec3(70.0));	
}

float fbm(vec2 n) {
	float total = 0.0, amplitude = 0.1;
	for (int i = 0; i < 7; i++) {
		total += noise(n) * amplitude;
		n = m * n;
		amplitude *= 0.4;
	}
	return total;
}



void main() {
	if(effectType == EFFECT_TYPE_Clouds){
		//https://www.shadertoy.com/view/4tdSWr
		
		float cloudscale = 1.1;
		float speed = 0.03;
		float clouddark = 0.5;
		float cloudlight = 0.3;
		float cloudcover = 0.2;
		float cloudalpha = 8.0;
		float skytint = 0.5;
		vec3 skycolour1_sunset = vec3(0.231,0.212,0.471);
		vec3 skycolour2_sunset = vec3(0.710,0.686,0.412);
		
		vec3 skycolour1_blue = vec3(0.2, 0.4, 0.6);
		vec3 skycolour2_blue = vec3(0.4, 0.7, 1.0);
		
		vec3 skycolour1 = mix(skycolour1_blue, skycolour1_sunset, uWaveAmplitude);
		vec3 skycolour2 = mix(skycolour2_blue, skycolour2_sunset, uWaveAmplitude);
	
		
		vec2 p = openfl_TextureCoordv;
		vec2 uv = p*vec2(resolution.x/resolution.y,1.0);    
		float time = uTime * 1.0;
		float q = fbm(uv * cloudscale * 0.5);
		
		//ridged noise shape
		float r = 0.0;
		uv *= cloudscale;
		uv -= q - time;
		float weight = 0.8;
		for (int i=0; i<8; i++){
			r += abs(weight*noise( uv ));
			uv = m*uv + time;
			weight *= 0.7;
		}
		
		//noise shape
		float f = 0.0;
		uv = p*vec2(resolution.x/resolution.y,1.0);
		uv *= cloudscale;
		uv -= q - time;
		weight = 0.7;
		for (int i=0; i<8; i++){
			f += weight*noise( uv );
			uv = m*uv + time;
			weight *= 0.6;
		}
		
		f *= r + f;
    
		//noise colour
		float c = 0.0;
		time = uTime * speed * 2.0;
		uv = p*vec2(resolution.x/resolution.y,1.0);
		uv *= cloudscale*2.0;
		uv -= q - time;
		weight = 0.4;
		for (int i=0; i<7; i++){
			c += weight*noise( uv );
			uv = m*uv + time;
			weight *= 0.6;
		}
		
		//noise ridge colour
		float c1 = 0.0;
		time = uTime * speed * 3.0;
		uv = p*vec2(resolution.x/resolution.y,1.0);
		uv *= cloudscale*3.0;
		uv -= q - time;
		weight = 0.4;
		for (int i=0; i<7; i++){
			c1 += abs(weight*noise( uv ));
			uv = m*uv + time;
			weight *= 0.6;
		}
		
		c += c1;
		
		vec3 skycolour = mix(skycolour2, skycolour1, p.y);
		vec3 cloudcolour = vec3(1.1, 1.1, 0.9) * clamp((clouddark + cloudlight*c), 0.0, 1.0);
	   
		f = cloudcover + cloudalpha*f*r;
		
		vec3 result = mix(skycolour, clamp(skytint * skycolour + cloudcolour, 0.0, 1.0), clamp(f + c, 0.0, 1.0));
		
		float alphaSample = flixel_texture2D(bitmap,openfl_TextureCoordv).a;
		gl_FragColor = vec4( result*alphaSample, alphaSample );
	}else if(effectType == EFFECT_TYPE_CloudsALT){
		//https://www.shadertoy.com/view/4tdSWr
		
		float cloudscale = 1.1;
		float speed = 0.03;
		float clouddark = 0.5;
		float cloudlight = 0.3;
		float cloudcover = 0.2;
		float cloudalpha = 8.0;
		float skytint = 0.46;
		vec3 skycolour1 = vec3(0.231,0.212,0.471);
		vec3 skycolour2 = vec3(0.710,0.686,0.412);
		

	
	
		
		vec2 p = openfl_TextureCoordv;
		vec2 uv = p*vec2(resolution.x/resolution.y,1.0);    
		float time = uTime * 1.0;
		float q = fbm(uv * cloudscale * 0.5);
		
		//ridged noise shape
		float r = 0.0;
		uv *= cloudscale;
		uv -= q - time;
		float weight = 0.8;
		for (int i=0; i<8; i++){
			r += abs(weight*noise( uv ));
			uv = m*uv + time;
			weight *= 0.7;
		}
		
		//noise shape
		float f = 0.0;
		uv = p*vec2(resolution.x/resolution.y,1.0);
		uv *= cloudscale;
		uv -= q - time;
		weight = 0.7;
		for (int i=0; i<8; i++){
			f += weight*noise( uv );
			uv = m*uv + time;
			weight *= 0.6;
		}
		
		f *= r + f;
    
		//noise colour
		float c = 0.0;
		time = uTime * speed * 2.0;
		uv = p*vec2(resolution.x/resolution.y,1.0);
		uv *= cloudscale*2.0;
		uv -= q - time;
		weight = 0.4;
		for (int i=0; i<7; i++){
			c += weight*noise( uv );
			uv = m*uv + time;
			weight *= 0.6;
		}
		
		//noise ridge colour
		float c1 = 0.0;
		time = uTime * speed * 3.0;
		uv = p*vec2(resolution.x/resolution.y,1.0);
		uv *= cloudscale*3.0;
		uv -= q - time;
		weight = 0.4;
		for (int i=0; i<7; i++){
			c1 += abs(weight*noise( uv ));
			uv = m*uv + time;
			weight *= 0.6;
		}
		
		c += c1;
		
		vec3 skycolour = mix(skycolour2, skycolour1, p.y);
		vec3 cloudcolour = vec3(1.1, 1.1, 0.9) * clamp((clouddark + cloudlight*c), 0.0, 1.0);
	   
		f = cloudcover + cloudalpha*f*r;
		
		vec3 result = mix(skycolour, clamp(skytint * skycolour + cloudcolour, 0.0, 1.0), clamp(f + c, 0.0, 1.0));
		
		float alphaSample = flixel_texture2D(bitmap,openfl_TextureCoordv).a;
		gl_FragColor = vec4( result*alphaSample, alphaSample );
	}
}

