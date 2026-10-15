#pragma header

uniform float circleInner;
uniform float circleOuter;
float blurDif = 0.003;
uniform float outlineDif;
const vec3 resolution = vec3(1280.0, 720.0, 1.0);

void main() {
	vec2 uv = openfl_TextureCoordv;
	
	vec2 center = uv;
    center.x -= 0.5;
    center.y -= 0.5;
    center.x *= resolution.x/resolution.y;
    

	vec4 col_tex = flixel_texture2D(bitmap,uv);
    vec4 col_empty = vec4(0.0);
	
	
	if (outlineDif > 0.0){
        vec4 col_line = vec4(1.0,1.0,1.0, 1.0);

        float blend = smoothstep(circleInner+outlineDif, circleInner+blurDif+outlineDif, length(center));
        blend -= smoothstep(circleOuter-outlineDif, circleOuter+blurDif-outlineDif, length(center));
        
        col_tex = mix(col_line, col_tex, blend);
    }
	
	
	float blend = smoothstep(circleInner, circleInner+blurDif, length(center));
    //blend = clamp(blend,0.0,1.0); //Don't know if this is necessary
    blend -= smoothstep(circleOuter, circleOuter+blurDif, length(center));
  
    
    vec4 col_out = mix(col_empty, col_tex, blend);
    gl_FragColor = col_out;

	
}

