#pragma header

const vec3 resolution = vec3(1280.0, 720.0, 1.0);
#define pi 3.14159265358979323846264338327950288419716939937510
uniform float _alpha;
uniform float iTime;


//2D signed hash function:
vec2 Hash2(vec2 P){return 1.-2.*fract(cos(P.x*vec2(91.52,-74.27)+P.y*vec2(-39.07,09.78))*939.24);}
//2D Worley noise.
float Worley(vec2 P)
{
	P += iTime;
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

vec3 palette(float t)
{
    t *= 0.3;
    vec3 a = vec3(0.35, 0.555, 0.777);
    vec3 b = vec3(0.994, 0.778, 0.514);
    vec3 c = vec3(1.417, 1.028, 0.112);
    vec3 d = vec3(4.956, 2.653, 4.864);
    return a + b*cos( 6.28318*(c*t+d) );
}


void main() {
	if(_alpha < 0.002){
		gl_FragColor = vec4(0.0); 
	}else{
		vec2 coord = openfl_TextureCoordv;
		float N1 = 0.0;
		float N2 = 0.0;
		float Nfinal = 0.0;


	    vec2 P = (coord + 0.05) * 1000.0;   
	    vec2 P1 = P;
	    vec2 P2 = P;
	    P1.x += sin(( P1.y*0.005+iTime))*50.5;
	    P2.x -= sin(( P2.y*0.02+iTime))*43.1;
	    P2.y += iTime*50.0;

	    N1 = .4*Worley(P1/96.)+.3*Worley(P1/36.)+.2*Worley(P1/16.)+.1*Worley(P1/8.);
	    N2 = .2*Worley(P2/64.)+.3*Worley(P2/128.)+.2*Worley(P2/16.)+.1*Worley(P2/8.);
	    Nfinal = N1+N2;
	    //Nfinal = 1.-clamp(Nfinal,0.4,0.85);
		//gl_FragColor = vec4(Nfinal*0.9, Nfinal*0.25, Nfinal*0.94, 1);
		
		Nfinal = 1.-clamp(Nfinal,0.6,0.9);
    	Nfinal *= 2.0;

		vec3 col = vec3(Nfinal);
		vec3 palette = palette(length(Nfinal - coord.y) + (iTime*0.25));
    	col *= palette * 0.5;

		gl_FragColor = vec4(col.r, col.g, col.b, 1.0);

		gl_FragColor *= _alpha;
	}
}

