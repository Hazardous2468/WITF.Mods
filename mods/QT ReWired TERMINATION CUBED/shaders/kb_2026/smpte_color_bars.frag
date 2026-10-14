#pragma header

uniform bool enabled;
uniform float fadeAmount;
uniform float fadeBoost;

const float c = 0.75294117647058823529411764705882;
const float b = 0.07450980392156862745098039215686;
const float d = 1./7.;
const float funnyNumber = 1./3.;
const float dd = 1./5.5;

void main() {
	if(enabled){
		vec2 uv = openfl_TextureCoordv;

		vec4 ogColor = flixel_texture2D(bitmap, openfl_TextureCoordv);

		float sampleAlpha = ogColor.a;
		sampleAlpha = (sampleAlpha*(1.0-fadeBoost))+fadeBoost;
		//sampleAlpha = 1.0;


		vec3 finalOut = vec3(0.0);
	    uv.y = 1.-uv.y;
	    vec3 col = vec3(c,c,0.);
	    finalOut = col * step(uv.x,d*2.0) * step(d,uv.x);
	    col = vec3(c);
	    finalOut += col * step(uv.x,d);
	    col = vec3(0.,c,c);
	    finalOut += col * step(uv.x,d*3.0) * step(d*2.0,uv.x);
	    col = vec3(0.,c,0.);
	    finalOut += col * step(uv.x,d*4.0) * step(d*3.0,uv.x);
	    col = vec3(c,0.,c);
	    finalOut += col * step(uv.x,d*5.0) * step(d*4.0,uv.x);
	    col = vec3(c,0.,0.);
	    finalOut += col * step(uv.x,d*6.0) * step(d*5.0,uv.x);
	    col = vec3(0.,0.,c);
	    finalOut += col * step(uv.x,d*7.0) * step(d*6.0,uv.x);
	    finalOut *= vec3(1.0) * step(d*2.5,uv.y);
	    finalOut += col * step(uv.x,d*1.0)  * step(uv.y,d*2.5) * step(d*1.75,uv.y);
	    col = vec3(c);
	    finalOut += col * step(uv.x,d*7.0) * step(d*6.0,uv.x) * step(uv.y,d*2.5) * step(d*1.75,uv.y);
	    col = vec3(b);
	    finalOut += col * step(uv.x,d*2.0) * step(d*1.0,uv.x) * step(uv.y,d*2.5) * step(d*1.75,uv.y);
	    finalOut += col * step(uv.x,d*4.0) * step(d*3.0,uv.x) * step(uv.y,d*2.5) * step(d*1.75,uv.y);
	    finalOut += col * step(uv.x,d*6.0) * step(d*5.0,uv.x) * step(uv.y,d*2.5) * step(d*1.75,uv.y);
	    col = vec3(c,0.,c);
	    finalOut += col * step(uv.x,d*3.0) * step(d*2.0,uv.x) * step(uv.y,d*2.5) * step(d*1.75,uv.y);
	    finalOut += vec3(0.,c,c) * step(uv.x,d*5.0) * step(d*4.0,uv.x) * step(uv.y,d*2.5) * step(d*1.75,uv.y);
	    finalOut += vec3(0.,0.129,0.298) * step(uv.x,dd)  * step(uv.y,d*1.75);
	    finalOut += vec3(1.) * step(uv.x,dd*2.0) * step(dd,uv.x) * step(uv.y,d*1.75);
	    finalOut += vec3(0.196,0.,0.416) * step(uv.x,dd*3.) * step(dd*2.,uv.x)  * step(uv.y,d*1.75);
	    finalOut += vec3(b)  * step(dd*3.,uv.x)  * step(uv.y,d*1.75);
	    finalOut -= vec3(0.04) * step(d*5.0,uv.x) * step(uv.x,d*(5.0+funnyNumber))  * step(uv.y,d*1.75);
	    finalOut += vec3(0.04) * step(d*(5.0+funnyNumber+funnyNumber),uv.x) * step(uv.x,d*(5.0+funnyNumber+funnyNumber+funnyNumber))  * step(uv.y,d*1.75);

	    gl_FragColor = vec4(finalOut*sampleAlpha,sampleAlpha);

	    gl_FragColor = mix(ogColor, gl_FragColor, fadeAmount);

	}else{
		gl_FragColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
	}

}
