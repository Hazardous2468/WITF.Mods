#pragma header

uniform float amount;
	
void main() {
	vec2 uv = openfl_TextureCoordv;
    vec4 color = flixel_texture2D(bitmap, uv);

    vec2 center = vec2(0.5, 0.5);
    vec2 delta = uv - center;

    float angle = atan(delta.x, delta.y); // -PI to PI, 0 = top
    float normalized = (angle + 3.14159265) / (6.2831853);

    float edgeWidth = 0.004;
    float mask = smoothstep(amount - edgeWidth, amount + edgeWidth, normalized);

    color.rgb = mix(color.rgb, vec3(0.0), mask);

    gl_FragColor = color;
	
}

