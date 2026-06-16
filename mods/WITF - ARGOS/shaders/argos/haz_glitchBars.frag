#pragma header

//Simple-ish (and scuffed) glitch shader which generates random bars and shuffles the x position on that bar while distorting the colour.

const float barWidth = 0.0675;

uniform int loops;

uniform float uTime;
uniform bool _active;

float random(vec2 c)
{
	float toReturn = fract(sin(dot(c.xy, vec2(12.9898, 78.233))) * 43758.5453);
	return toReturn;
}
vec3 genstuff(vec2 coord,float truncTime, float seed){
	vec3 col = vec3(1);
	if(coord.y > seed-barWidth && coord.y < seed){
		float randomColourR = random(vec2(seed,0.5));
		float randomColourG = random(vec2(seed,1.0));
		float randomColourB = random(vec2(seed,1.5));
		col = vec3(randomColourR,randomColourG,randomColourB);
	}
	return col;
}
vec2 genstuffcoord(vec2 coord,float truncTime,float seed){
	vec2 coordMod = vec2(0.0,0.0);
	if(coord.y > seed-barWidth && coord.y < seed){
		coordMod.x += random(vec2(seed,0.0)) / 4.0;
	}
	return coordMod;
}
float truncLOL(float x, float num_levels)
{
	return floor(x * num_levels) / num_levels;
}


void main() {
	if(_active){
		vec2 coord = openfl_TextureCoordv;
		vec3 col = vec3(1.0);
			
		float truncTime = truncLOL(uTime, 14.0);
		
		//coord shift for glitch
		for (int i = 0; i < loops; i++) {
			float seed = mod(random(vec2(truncTime,i)), 1.0);
			coord += genstuffcoord(coord,truncTime,seed);
		}
		//coord shift global
		float shifty = floor(mod(uTime*24., 2.0));
		shifty -= 0.5;
		float ypos = mod(coord.y, 0.2) * 0.01;
		ypos -= 0.001;
		shifty *= ypos*2.0;
		coord += shifty;
		
		//generating texture using coords
		vec4 textureStuff = flixel_texture2D(bitmap,fract(coord));
		
		//colour glitch
		for (int i = 0; i < loops; i++) {
			float seed = mod(random(vec2(truncTime,i)), 1.0);
			coord += genstuffcoord(coord,truncTime,seed);
			//col = mix( col, vec3(0.5), genstuff(coord,truncTime,seed));
			col = genstuff(coord,truncTime,seed);
			textureStuff *= vec4(col,1.0);
		}       
		gl_FragColor = textureStuff;
	}else{
		gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);
	}
}

