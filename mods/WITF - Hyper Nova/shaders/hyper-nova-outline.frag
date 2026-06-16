#pragma header


uniform bool haz_active;
bool fastOutline = false;
bool highDetail = false;

vec4 outlineCol	= vec4(0.0, 0.0, 0.0, 1.0);
float outlineSize  = 0.022;


void main() {
	if(!haz_active){
		gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);
	}else{
	
		vec4 original_col = flixel_texture2D(bitmap, openfl_TextureCoordv);
		
		float outlineScale = 1.0-outlineSize;
		float a = 0.0;
		vec4 tex = vec4(1.0);
	
		
		vec4 tex_building = vec4(0.0);
		vec2 uvScaled = openfl_TextureCoordv;
		
		a = flixel_texture2D(bitmap, uvScaled + vec2(outlineSize/2.0, outlineSize/2.0)).a;
		tex_building += vec4(1.0) * a;
		a = flixel_texture2D(bitmap, uvScaled + vec2(outlineSize/2.0, outlineSize/2.0*-1.0)).a;
		tex_building += vec4(1.0) * a;
		a = flixel_texture2D(bitmap, uvScaled + vec2(outlineSize/2.0*-1.0, outlineSize/2.0*-1.0)).a;
		tex_building += vec4(1.0) * a;
		a = flixel_texture2D(bitmap, uvScaled + vec2(outlineSize/2.0*-1.0, outlineSize/2.0*1.0)).a;
		tex_building += vec4(1.0) * a;
		
		if (highDetail){
			a = flixel_texture2D(bitmap, uvScaled + vec2(outlineSize/2.0, 0.0)).a;
			tex_building += vec4(1.0) * a;
			a = flixel_texture2D(bitmap, uvScaled + vec2(0.0, outlineSize/2.0)).a;
			tex_building += vec4(1.0) * a;
			a = flixel_texture2D(bitmap, uvScaled + vec2(outlineSize/2.0*-1.0, 0.0)).a;
			tex_building += vec4(1.0) * a;
			a = flixel_texture2D(bitmap, uvScaled + vec2(0.0, outlineSize/2.0*1.0)).a;
			tex_building += vec4(1.0) * a;
		}
		
		tex = tex_building;
				
		
		tex = clamp(tex, 0.0, 1.0);
		tex *= outlineCol;
		gl_FragColor = tex;

		tex = original_col;
		if (tex.a > 0.01){
			gl_FragColor = original_col;
		}
	}
}

