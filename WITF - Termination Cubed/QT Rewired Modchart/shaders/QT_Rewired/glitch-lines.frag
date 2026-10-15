#pragma header

const vec3 resolution = vec3(1280.0, 720.0, 1.0);

uniform float uTime;
uniform float amount;

float rand( vec2 co )
{
	return fract(sin(dot(co.xy,vec2(12.9898,78.233))) * 43758.5453);
}

void main() {
	if(amount <= 0.00){
		gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);
	}else{
		vec2 uv = openfl_TextureCoordv;
		vec2 uvn = openfl_TextureCoordv;

		uv.x += rand( vec2(uvn.y / 10.0, uTime / 10.0) ) * amount;
		uv.x -= rand( vec2(uvn.y * 10.0, uTime * 10.0) ) * amount;
		gl_FragColor = flixel_texture2D(bitmap, uv);
	}
	
}

