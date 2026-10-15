#pragma header

const vec3 iResolution = vec3(1280.0, 720.0, 1.0);
uniform float zoom;
uniform float angle;

#define pi 3.14159265358979323846264338327950288419716939937510
mat2 Rot(float a){
    float s = sin(a), c=cos(a);
    return mat2(c,-s,s,c);
}
float degreeToRad( in float degree)
{
    return degree * (pi / 180.0);
}

void main() {
	vec2 uv = openfl_TextureCoordv;
	
	float a = iResolution.x/iResolution.y;
	
	uv -= 0.5;
    uv.x *= a; // fix aspect ratio
	
	uv /= zoom;	
	
	uv *= Rot(degreeToRad(angle));
    uv.x /= a; // fix aspect ratio
    uv += 0.5;
    vec4 col = flixel_texture2D( bitmap, fract(uv) );

	gl_FragColor = col;	
}

