#pragma header
uniform float alphaMultiplier;
uniform float distance;

bool additiveForBack = false;
bool additiveForFront = true;
bool additiveForOriginal = false;
float cutoutAlpha = 0.04;

int push = 0;

int backDepth = 0;
int frontDepth = 5;


float offsetX = 0.0;
float offsetY = 0.0;


//Heavily modified from: https://www.shadertoy.com/view/MdcyWS

	vec2 scaleFromCenter(vec2 coord, float scale) {
		vec2 scaleCenter = vec2(0.5);
		scaleCenter.x += offsetX;
		scaleCenter.y += offsetY;
		return (coord - scaleCenter) * scale + scaleCenter;
	}

void main() {
	int backDepth_ = backDepth + push;
	int frontDepth_ = frontDepth + push;

	vec2 st = openfl_TextureCoordv;

	//base
	vec4 result = vec4(0.0);

	//Behind
	for (int i = 1+push; i <= backDepth_; i++) {
		float alphaShit = float(i) / float(backDepth_);
		float scaleShit = 1.0 + (float(i)*distance);
		vec2 newCoord = scaleFromCenter(st, scaleShit);
		vec4 newCoordColor = flixel_texture2D(bitmap, newCoord) * (1.0 - alphaShit);
		newCoordColor *=  alphaMultiplier;

		if(additiveForBack){
			result += newCoordColor;
		}else{
			if(result.a < cutoutAlpha)
				result = newCoordColor;
		}
	}

	vec2 newCoord = scaleFromCenter(st, 1.0 + (float(push)*distance));
	vec4 resultColor = flixel_texture2D(bitmap, newCoord);
	if(additiveForOriginal){
		result += resultColor;
	}else{
		if(resultColor.a > cutoutAlpha)
			result = resultColor;
	}

	//Front
	for (int i = 1; i <= frontDepth_; i++) {
		float alphaShit = float(i) / float(frontDepth_);
		float scaleShit = (1.0 - (float(i)*distance)) + (float(push)*distance);
		if(scaleShit < 0.0){ //Failsafe to prevent flipping if too small lol
			scaleShit = 0.0;
		}
		vec2 newCoord = scaleFromCenter(st, scaleShit);
		vec4 newCoordColor = flixel_texture2D(bitmap, newCoord) * (1.0 - alphaShit);
		newCoordColor *=  alphaMultiplier;

		if(additiveForFront){
			result += newCoordColor;
		}else{
			if(newCoordColor.a > cutoutAlpha)
				result = newCoordColor;
		}
	}
	gl_FragColor = result;
}

