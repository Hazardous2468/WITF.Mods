#pragma header

//source: https://www.shadertoy.com/view/Xdf3Rf

// Basic sobel filter implementation
// Jeroen Baert - jeroen.baert@cs.kuleuven.be
// 
// www.forceflow.be

float stepAmount = 0.25;

float intensity(in vec4 color){
	return sqrt((color.x*color.x)+(color.y*color.y)+(color.z*color.z));
}


vec3 sobel(float stepx, float stepy, vec2 center){
	// get samples around pixel
    float tleft = intensity(flixel_texture2D(bitmap,center + vec2(-stepx,stepy)));
    float left = intensity(flixel_texture2D(bitmap,center + vec2(-stepx,0)));
    float bleft = intensity(flixel_texture2D(bitmap,center + vec2(-stepx,-stepy)));
    float top = intensity(flixel_texture2D(bitmap,center + vec2(0,stepy)));
    float bottom = intensity(flixel_texture2D(bitmap,center + vec2(0,-stepy)));
    float tright = intensity(flixel_texture2D(bitmap,center + vec2(stepx,stepy)));
    float right = intensity(flixel_texture2D(bitmap,center + vec2(stepx,0)));
    float bright = intensity(flixel_texture2D(bitmap,center + vec2(stepx,-stepy)));
 
	// Sobel masks (see http://en.wikipedia.org/wiki/Sobel_operator)
	//        1 0 -1     -1 -2 -1
	//    X = 2 0 -2  Y = 0  0  0
	//        1 0 -1      1  2  1
	
	// You could also use Scharr operator:
	//        3 0 -3        3 10   3
	//    X = 10 0 -10  Y = 0  0   0
	//        3 0 -3        -3 -10 -3
 
    float x = tleft + 2.0*left + bleft - tright - 2.0*right - bright;
    float y = -tleft - 2.0*top - tright + bleft + 2.0 * bottom + bright;
    float color = sqrt((x*x) + (y*y));
    return vec3(color,color,color);
 }
 

const vec3 iResolution = vec3(1280.0, 720.0, 1.0);

void main() {
	vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);
	gl_FragColor = color;
	
	vec3 sobelResult = sobel(stepAmount/iResolution[0], stepAmount/iResolution[1], openfl_TextureCoordv);
	gl_FragColor.xyz = sobelResult.xyz;
	gl_FragColor.a = sobelResult.z;
}

