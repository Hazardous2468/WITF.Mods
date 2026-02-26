#pragma header


const int EFFECT_TYPE_NoiseField = 33;



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





void main() {
	if(uFrequency < 0.002){
		gl_FragColor = vec4(0.0); 
	}else{
		vec2 coord = openfl_TextureCoordv;
		float N1 = 0.0;
		float N2 = 0.0;
		float Nfinal = 0.0;
		
		float timmm = uTime * 2.0;

		vec2 P1 = (coord + 0.7*timmm) * 4000.0; 
		vec2 P2 = (coord + 0.3*timmm) * 2000.0; 
		P1.x += sin(( P1.y*0.05+(timmm*20.0)))*20.5;
		P2.x -= sin(( P2.y*0.02+timmm))*43.1;
		P2.y += timmm*150.0;

		N1 = .4*Worley(P1/64.)+.3*Worley(P1/32.)+.2*Worley(P1/16.)+.1*Worley(P1/8.);
		N2 = .2*Worley(P2/64.)+.3*Worley(P2/24.)+.2*Worley(P2/16.)+.1*Worley(P2/8.);
		
		N1 = (clamp(N1,0.5,1.0)*4.0)-2.3;
		N1*=2.0;
		N2 = (clamp(N2,0.5,1.0)*8.0)-4.0;
		Nfinal = mix(N1,N2,0.8);
		Nfinal*=uFrequency;

		gl_FragColor = vec4(Nfinal,Nfinal,Nfinal,Nfinal); 
	}
}

