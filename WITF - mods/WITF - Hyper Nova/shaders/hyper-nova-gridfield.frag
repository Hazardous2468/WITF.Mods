#pragma header

const vec2 iResolution = vec2(1280.0, 720.0);

uniform float aaaaaa;
uniform float aaatwo;
uniform float redTime;
uniform float iTime;
uniform float NUM_LAYERS;
uniform float ZOOM;
uniform float fisheye;

//Some GPU's don't have fWidth? :(
float myFwidth(float p) {
    return 1.5 / min(iResolution.x, iResolution.y);
}

#define pi 3.14159265358979323846264338327950288419716939937510
mat2 Rot(float a){
	float s = sin(a), c=cos(a);
	return mat2(c,-s,s,c);
}

void main() {
	if(aaaaaa > 0.01 || redTime>0.001){
		vec2 co = openfl_TextureCoordv * iResolution;
		vec2 uv = (co-.5*iResolution.xy)/iResolution.y;
		uv *= 1.0 - fisheye / 2.0;
		float r = sqrt(dot(uv,uv));
		uv *= 1.0 + r * fisheye;
		vec4 col = vec4(0.);    
		for(float i=0.;i<1.;i+=1./NUM_LAYERS){
			vec2 p = uv;
			float t = iTime*0.333;

			p*=Rot(pi*((t*0.2)-i));
			p.y += (t*0.5)+i;
			p.x -= (t*0.5)+i;
			p = fract(p*ZOOM)-0.5;
			p = abs(p);

			float a = (0.5)*pi;
			vec2 n = vec2(sin(a), cos(a));
			float d = abs(dot(p-.5,n)); 
			col.g += smoothstep(myFwidth(d),0.0,d-0.01)*aaaaaa*aaatwo;
			col.b += smoothstep(myFwidth(d),0.0,d-0.01)*aaaaaa*aaatwo;
			col.r += smoothstep(myFwidth(d),0.0,d-0.025)*redTime;
		}
		gl_FragColor = vec4(col);
	}else{
		gl_FragColor = vec4(0.0);
	}
}

