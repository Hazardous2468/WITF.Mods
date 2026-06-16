#pragma header

// https://www.shadertoy.com/view/WtBBD1

const vec3 iResolution = vec3(1280.0, 720.0, 1.0);
uniform float iTime;

#define hash(p)    fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453)
#define hash2(p)   cos( 6.28*hash(p) + vec2(0,11) + V(p)*iTime ) // variant of random gradient + rotating (= lownoise)
#define l(i,j)     dot( hash2(I+vec2(i,j)) , F-vec2(i,j) )       // random wavelet at grid vertex I+vec2(i,j) 
#define L(j,x)     mix( l(0,j), l(1,j), x )

//#define V(p) 2. 
#define V(p) ( 8. - length(p) )

 float Perlin(vec2 p) {                        // Perlin noise
            vec2 I = floor(p), 
                 F = fract(p), 
             //  U = F;
             //  U = F*F*(3.-2.*F);                   // based Perlin noise
                 U = F*F*F*( F* ( F*6.-15.) + 10. );  // improved Perlin noise ( better derivatives )
            return mix( L(0,U.x) , L(1,U.x) , U.y );  // smooth interpolation of corners random wavelets
        }

		

		
void main() {
	vec2 u = openfl_TextureCoordv.xy * iResolution.xy;
	u *= 2.0;
	vec2 R = iResolution.xy / 0.5,
		S = 8. / R.yy,
		U = ( 2.*u - R ) * S,
		D;
		
	float v = Perlin( U );  
	
	D = vec2( v - Perlin( U+vec2(0,S.y) ), Perlin( U+vec2(S.x,0) ) - v ) *2./ S;
    //D = vec2( -dFdy(v), dFdx(v) ) / S;                  // using hardware derivatives
    gl_FragColor = vec4( v / max(2.,1.5*length(U)) );    // renormalize by distance
	
	gl_FragColor = 0.7 - gl_FragColor;
	
	vec3 texture = flixel_texture2D(bitmap,openfl_TextureCoordv).rgb;
	texture*=vec3(1.0);
	gl_FragColor *= vec4(texture,1.); // coloring	  
}

