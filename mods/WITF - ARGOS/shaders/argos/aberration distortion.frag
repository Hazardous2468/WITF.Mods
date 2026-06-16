#pragma header

//Code from witherstorm mod lol?
uniform float amount;

void main() {
	if(amount < 0.01){
        gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);
	}else{
		vec2 uv = openfl_TextureCoordv;
		
		float d = pow(distance(uv, vec2(0.5)), 3.0);
		
		float rValue = flixel_texture2D(bitmap, uv + vec2(amount * d, 0.0)).r;  
		vec4 gValue = flixel_texture2D(bitmap, uv);
		float bValue = flixel_texture2D(bitmap, uv - vec2(amount * d, 0.0)).b;
		
		gl_FragColor = vec4(rValue, gValue.g, bValue, gValue.a);
	}
}

