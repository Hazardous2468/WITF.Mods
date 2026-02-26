#pragma header

//from halved halved halved
const vec3 resolution = vec3(1280.0, 720.0, 1.0);


uniform float uTime;

uniform float uEyeSize;
uniform float uEyeBlur;
uniform float uEyeWidth;

uniform float EYE_WIDTH;
uniform	float EYE_SIZE;
uniform	float EYE_BLUR;


float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main() {

	//float eyewidth = 2.0;
	//float eyesize = 0.5;
	//float eyeblur = 0.1;
	
	float eyewidth = uEyeWidth;
	float eyesize = uEyeSize;
	float eyeblur = uEyeBlur;


	vec2 uv = openfl_TextureCoordv;
	
	uv -= 0.5;
	uv = abs(uv);
	
	vec4 col = vec4(0.0,0.0,0.0,1.0);  
	
	float lid = sin(uv.x * eyewidth + 1.5) * eyesize;
	float fill = -lid + uv.y;
	float random_ = rand(vec2(uv.x+10.0+uTime/19.5, uv.y-10.0+uTime/12.4));
	fill = smoothstep(0.01, 0.01 + eyeblur, fill + random_*0.2);
	
	fill += clamp(random_, 0.05, 0.23); //edit by hazard to add noise or somethin lol
	
	col.a = fill;
	
	//gl_FragColor = texture2D(bitmap, uv);
	gl_FragColor = col;
	
}

