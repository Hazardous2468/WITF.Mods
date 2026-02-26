#pragma header

const vec3 iResolution = vec3(1280.0, 720.0, 1.0);




//Bloom Settings
//BLOOM_THRESHOLD - how bright a pixel needs to be to become blurred
//BLOOM_INTENSITY - how bright the bloom effect is
//BLOOM_ONLY - only shows the blur created by bloom
uniform float BLOOM_THRESHOLD;
uniform float BLOOM_INTENSITY;

uniform bool BLOOM_ONLY;
//#define BLOOM_ONLY



//Blur Settings
//BLUR_ITERATIONS - how many times a blur is created
//BLUR_SIZE - the radius of the bloom
//BLUR_SUBDIVISIONS - how many times the texture is sampled per iteration
uniform int BLUR_ITERATIONS;
uniform float BLUR_SIZE;
uniform int BLUR_SUBDIVISIONS;



vec3 getHDR(vec3 tex) {return max((tex - BLOOM_THRESHOLD) * BLOOM_INTENSITY, 0.);}
vec3 blend(vec3 a, vec3 b) {return 1. - (1. - a)*(1. - b); }
vec3 gaussian(sampler2D sampler, vec2 uv) {
            vec3 sum = vec3(0.);
            for(int i = 1; i <= BLUR_ITERATIONS; i++) {
             
                float angle = 360. / float(BLUR_SUBDIVISIONS);
                
                for(int j = 0; j < BLUR_SUBDIVISIONS; j++) {
                 
                    float dist = BLUR_SIZE * (float(i+1) / float(BLUR_ITERATIONS));
                    float s    = sin(angle * float(j));
                    float c	   = cos(angle * float(j)); 
                    sum += getHDR(flixel_texture2D(sampler, uv + vec2(c,s)*dist).xyz); 
                }
            }
            sum /= float(BLUR_ITERATIONS * BLUR_SUBDIVISIONS);
            return sum * BLOOM_INTENSITY;
        }


	


void main() {
	vec2 uv = openfl_TextureCoordv;
	vec4 tx = flixel_texture2D(bitmap, uv);
	
	gl_FragColor.xyz = gaussian(bitmap, uv);
	gl_FragColor.a   = tx.a;
	
	if(!BLOOM_ONLY)
		gl_FragColor.xyz = blend(tx.xyz, gl_FragColor.xyz);
	
	//#ifndef BLOOM_ONLY    
	//gl_FragColor.xyz = blend(tx.xyz, gl_FragColor.xyz);
	//#endif
	  
}

