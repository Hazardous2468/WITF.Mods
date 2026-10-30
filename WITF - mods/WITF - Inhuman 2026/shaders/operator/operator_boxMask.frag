#pragma header

const vec2 resolution = vec2(1280.0, 720.0);

uniform float xpos;
uniform float ypos;
uniform float rot;
uniform float size;

vec4 border_colour = vec4(1.0,1.0,1.0,1.0);

float border_thickness = 0.12;
float box_falloff = 0.01;


//FORKED FROM 
//https://www.shadertoy.com/view/7slyR7

// basic box mask
// https://www.shadertoy.com/view/7dlyR7

// math from Unreal engine node BoxMask-3D
float boxMask(vec2 uv, vec2 pivot, vec2 bounds, float falloff)
{
	vec2 p = abs(uv - pivot);
	p = max(p - (bounds * 0.5), 0.);
	
	return 1.0 - min(length(p) / max(falloff, 0.00001), 1.0);
}

// rotate UVs
// from https://shadertoyunofficial.wordpress.com/2019/01/02/programming-tricks-in-shadertoy-glsl/
#define rot(a)      mat2( cos(a), -sin(a), sin(a), cos(a) )

void main() {
	vec2 box_position = vec2(xpos,ypos);
	vec2 box_bounds = vec2(size, size);

	// UVs
    vec2 uvUnfix = openfl_TextureCoordv * resolution;
	vec2 uv = uvUnfix.xy/resolution.yy;
    float aspect = resolution.x / resolution.y;
	
	vec2 box_position_corrected = vec2(box_position.x * aspect, box_position.y); // center of screen
	
	box_position_corrected *= rot(rot);
    uv *= rot(rot);
	
	float box = boxMask(uv, box_position_corrected, box_bounds, box_falloff);
	float boxBorder = boxMask(uv, box_position_corrected, vec2(box_bounds.x+border_thickness,box_bounds.y+border_thickness), 0.01);
	
	
	vec2 textureCoord = openfl_TextureCoordv;
	textureCoord.x += 0.5 - box_position.x;
	textureCoord.y += 0.5 - box_position.y;
	vec4 textureCol = flixel_texture2D(bitmap, fract(textureCoord) );
	
	vec4 col = vec4(0.,0.,0.,0.);
	col = mix(col,border_colour, boxBorder*border_colour.a);
	col = mix(col, textureCol, box);

	// Output to screen
	gl_FragColor = col;
}

