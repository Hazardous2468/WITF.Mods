#pragma header

uniform float iTimeX;
uniform float iTimeY;
uniform float time;
uniform float anglewave;
uniform float uTimeX;
uniform float uTimeY;
uniform float scaleX;
uniform float scaleY;

#define iTime vec2(iTimeX, iTimeY)
#define scale vec2(scaleX, scaleY)

uniform bool edgeDistort;
uniform float edgeDistortIntensity;
uniform bool newFisheye;
uniform bool haz_active;
uniform float redactionSystemTransitionThing;


const float PI = 3.14159265358979323846;
//https://www.shadertoy.com/view/3lVGWt
mat2 rotationMatrix(float angle)
{
	angle *= PI / 180.0;
	float s=sin(angle), c=cos(angle);
	return mat2( c, -s, s, c );
}

void main() {
	if(!haz_active){
		gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);
	}else{
		vec2 p = openfl_TextureCoordv;
		p-=0.5;
		vec2 wtf = vec2(0.0);
		if(edgeDistort){
			if(newFisheye){
				//New fish eye code:
				p *= 1.0 - edgeDistortIntensity / 2.0; 
				float r = sqrt(dot(p,p));
				p *= 1.0 + r * edgeDistortIntensity;
				wtf = p;
			}else{
				wtf = 0.5 + p * sqrt(1.0-edgeDistortIntensity * dot(p,p)); //Old fisheye: https://www.shadertoy.com/view/MtcXDH
			}
		}

		vec2 uv = openfl_TextureCoordv;
		uv.xy-=redactionSystemTransitionThing;
		uv *= scale;
		uv *= rotationMatrix(sin(time*2.)*anglewave);
		uv.x += uTimeX;
		uv.y += uTimeY;

		uv = (uv + wtf) * 2.25;
		if(mod(uv.x,2.0)>1.0)
			uv.y -= iTime.y;
		if(mod(uv.y,2.0)>1.0)
			uv.x -= iTime.x;

		//Thanks for saving my life: https://www.shadertoy.com/view/3ddyWf
		vec4 color = flixel_texture2D(bitmap, fract(uv));

		gl_FragColor = color;
	}
}

