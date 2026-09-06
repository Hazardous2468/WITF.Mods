#pragma header

//edited to work like Psych HSV. (For easier hue shifting)
//V0.7a - Now has stealth glow!
//V0.7.6a - Now has sudden and hidden stealth support for holds!



uniform bool _active;
uniform float _animationProgress;

uniform float _hue;
uniform float _sat;
uniform float _val;

uniform float _hue2;
uniform float _sat2;
uniform float _val2;

uniform float _stealthGlow;
uniform float _stealthR;
uniform float _stealthG;
uniform float _stealthB;

uniform bool _isHold;

vec3 normalizeColor(vec3 color)
{
    return vec3(
        color[0] / 255.0,
        color[1] / 255.0,
        color[2] / 255.0
    );
}

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}



void main() {
	vec4 color = vec4(0.0);
	if(_active){
		vec4 tex = flixel_texture2D(bitmap, openfl_TextureCoordv);

	
	    // R = extra
	    // G = gradient coordinate (0 -> 1)
	    // B = fill mask
	    float borderMask = tex.r;
	    float gradCoord  = tex.g;
	    float fillMask   = tex.b;


	    float animated = fract(gradCoord - _animationProgress);

	    float bright = 1.0;
	    float dark   = 175.0 / 255.0;
	    float gradientValue = mix(dark, bright, animated);


	    float finalRed = mix(tex.r, gradientValue, fillMask) * tex.a;

	    color = vec4(finalRed, 0.0, 0.0, tex.a);


	    // Tame the original red back to it's more desaturated version
		vec4 newRed = vec4(239.0/255.0, 191.0/255.0, 191.0/225.0, tex.a);

		color = mix(color, newRed, borderMask);


	    // Make the white still stick out if it's present.
	    // TODO -> Make this smoother!
	    float isWhite = step(0.9, tex.r) * step(0.9, tex.g) * step(0.9, tex.b); // 1 = white, 0 = not white
	    color = mix(color, tex, isWhite);


	}else{
		color = flixel_texture2D(bitmap, openfl_TextureCoordv);
	}





	vec4 swagColor = vec4(rgb2hsv(vec3(color[0], color[1], color[2])), color[3]);
	swagColor.x += _hue + _hue2;
	swagColor.y *= _sat * _sat2;
	swagColor.z *= _val * _val2;
	color = vec4(hsv2rgb(vec3(swagColor[0], swagColor[1], swagColor[2])), swagColor[3]);

	vec4 glow = vec4(_stealthR,_stealthG,_stealthB, 1.0);	
	float _stealthGlow_clamped = clamp(_stealthGlow, 0.0, 1.0);
	glow *=  color[3]; //Apply Alpha from texture
	glow = clamp(glow, 0.0, 1.0);
	color = mix(color, glow, _stealthGlow_clamped);
	
	gl_FragColor = color;

}

