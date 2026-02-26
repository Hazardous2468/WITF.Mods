#pragma header
//Botched together by Hazard24 for Blissful Chaos. Ported from Level-Headed (Inhuman OS).
//This shader is a combination of both https://www.shadertoy.com/view/Wlt3zS and https://www.shadertoy.com/view/lsf3WH 

uniform float noiseMix;
uniform float fxMix;
uniform float sepiaMix;
uniform float beat;

vec4 BlackLight(vec4 color, float fxWeight)
{
  float lum = color.r + color.g + color.b / 3.0;
  lum = (222.0 * color.r + 707.0 * color.g + 71.0 * color.b) / 1000.0;
  // R = Abs(R - L) * fxWeight
  color.r = abs(color.r - lum) * fxWeight;
  color.r = clamp(color.r, 0.0, 1.0);
  color.g = abs(color.g - lum) * fxWeight;
  color.g = clamp(color.g, 0.0, 1.0);
  color.b = abs(color.b - lum) * fxWeight;
  color.b = clamp(color.b, 0.0, 1.0);

  return color;
}

// # 13 Sepia
vec4 Sepia(vec4 color)
{
    vec4 outputColor = color;
    outputColor.r = (color.r * 0.393) + (color.g * 0.769) + (color.b * 0.189);
    outputColor.g = (color.r * 0.349) + (color.g * 0.686) + (color.b * 0.168);    
    outputColor.b = (color.r * 0.272) + (color.g * 0.534) + (color.b * 0.131);
    
    return outputColor;
}

float hash(vec2 p)  // replace this by something better
{
    p  = 50.0*fract( p*0.3183099 + vec2(0.71,0.113));
    return -1.0+2.0*fract( p.x*p.y*(p.x+p.y) );
}

float noise( in vec2 p )
{
    vec2 i = floor( p );
    vec2 f = fract( p );
	
	vec2 u = f*f*(3.0-2.0*f);

    return mix( mix( hash( i + vec2(0.0,0.0) ), 
                     hash( i + vec2(1.0,0.0) ), u.x),
                mix( hash( i + vec2(0.0,1.0) ), 
                     hash( i + vec2(1.0,1.0) ), u.x), u.y);
}




void main()
{
	vec2 uv = openfl_TextureCoordv;	
	
	vec2 noiseUV = uv*2.5 + beat*20.6;
	float f = 0.0;
	f = noise( 32.0*noiseUV );
	f = 0.5 + 0.5*f;
	
	
	vec4 col = flixel_texture2D( bitmap, uv);
	
	col = mix(col,BlackLight(col,6.),fxMix);
	col = mix(col,Sepia(col),sepiaMix);
	
	col += clamp(f, 0.0, 1.0)*noiseMix;
	//col = vec4(f,f,f,1.0);
	
	gl_FragColor = col;
}
