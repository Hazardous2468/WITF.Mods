#pragma header

const vec3 resolution = vec3(1280.0, 720.0, 1.0);
#define pi 3.14159265358979323846264338327950288419716939937510
#define iTime uTime

uniform float uTime;		
uniform float cameraSway;		

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




//For the dumb fucking clock funny
mat2 Rot(float a){
    float s = sin(a), c=cos(a);
    return mat2(c,-s,s,c);
}

void main() {

	float ASCII_Details = 8.0; 
	float PixelSize = 5.0;
	float blurSize = 0.05;
	
	
	vec2 uv = openfl_TextureCoordv;
	
	//rotate
	uv.xy -= 0.5;
	uv *= Rot(cameraSway);
	uv.xy += 0.5;
	
	//uv.y = 1.0 - uv.y; // flip tex
	vec2 crtCoords = crt(uv, 4.5);

	vec2 uv_2 = crtCoords.xy * resolution.xy;
	vec2 funnyUV = floor(uv_2 / ASCII_Details) * ASCII_Details / resolution.xy;
	vec4 col_4 = flixel_texture2D(bitmap, funnyUV);
	vec3 col = col_4.rgb;

		  
	vec2 p = mod(uv_2 / PixelSize, 2.0) - vec2(1.0);
	
	gl_FragColor = vec4(col, col_4.a) * col_4.a;
	
	gl_FragColor.rgb = col_4.rgb;
	
	gl_FragColor.rgb = scanline(uv_2, gl_FragColor.rgb);
	
	//fml
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,crtCoords.x));
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,1.0-crtCoords.x));
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,crtCoords.y));
	gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.0), smoothstep(1.0-blurSize, 1.0,1.0-crtCoords.y));


}

