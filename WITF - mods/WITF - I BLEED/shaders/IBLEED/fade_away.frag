#pragma header

const vec2 resolution = vec2(1280.0, 720.0);

uniform float _FADE;

void main() {
	vec2 uv = openfl_TextureCoordv;
	
	vec4 color = flixel_texture2D(bitmap, uv);
	
	vec2 center = vec2(0.5,0.5);
	float dist = length(uv - center);
	
	//float alphaMult = 1.0 - (dist * 2.0);
	float alphaMult = pow(1.0 - dist * 2.0, 3.0);
	
	alphaMult = clamp(alphaMult, 0.0, 1.0);
	
	alphaMult = mix(alphaMult, 1.0, _FADE);
	
	color *= alphaMult;
	gl_FragColor = color;
}

