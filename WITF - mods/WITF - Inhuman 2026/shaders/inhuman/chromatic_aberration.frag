#pragma header
uniform float intensity;		
void main() {
	vec2 uv = openfl_TextureCoordv;

	float d = pow(distance(uv, vec2(0.5)), 3.0);

    vec4 rValue = flixel_texture2D(bitmap, uv + vec2(intensity * d, 0.0));  
    vec4 gValue = flixel_texture2D(bitmap, uv);
    vec4 bValue = flixel_texture2D(bitmap, uv - vec2(intensity * d, 0.0));


    float a = gValue.a + rValue.a + bValue.a;
    a /= 3.0;
    gl_FragColor = vec4(rValue.r, gValue.g, bValue.b, a);

}

