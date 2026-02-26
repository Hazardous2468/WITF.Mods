#pragma header

//https://www.shadertoy.com/view/MlBSzR

uniform bool _active;
uniform float glitchStrength;

void main() {
	if(_active){
		vec2 uv = openfl_TextureCoordv;
    
		float x = uv.s;
		float y = uv.t;
		
		//float glitchStrength = (iMouse.y + 55.55)/iResolution.y * 5.0;
		//float glitchStrength = 2.0;
		
		
		 // get snapped position
		float psize = 0.04 * glitchStrength;
		float psq = 1.0 / psize;
		
		
		float px = floor( x * psq + 0.5) * psize;
		float py = floor( y * psq + 0.5) * psize;
		
		vec4 colSnap = flixel_texture2D( bitmap, vec2( px,py) );
		
		float lum = pow( 1.0 - (colSnap.r + colSnap.g + colSnap.b) / 3.0, glitchStrength ); // remove the minus one if you want to invert luma
		
		
		
		// do move with lum as multiplying factor
		float qsize = psize * lum;
		
		float qsq = 1.0 / qsize;

		float qx = floor( x * qsq + 0.5) * qsize;
		float qy = floor( y * qsq + 0.5) * qsize;

		float rx = (px - qx) * lum + x;
		float ry = (py - qy) * lum + y;
		
		vec4 colMove = flixel_texture2D( bitmap, vec2( rx,ry) );
		
		
		// final color
		gl_FragColor = colMove;
	
	}else{
		gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);
	}
}

