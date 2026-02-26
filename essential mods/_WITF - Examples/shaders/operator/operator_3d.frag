#pragma header

uniform float uTime;
const vec2 resolution = vec2(1280.0, 720.0);

uniform float xpos;
uniform float ypos;
uniform float dept;
uniform float xrot;
uniform float yrot;
uniform float zrot;



float plane( in vec3 norm, in vec3 po, in vec3 ro, in vec3 rd ) {
	float de = dot(norm, rd);
	de = sign(de)*max( abs(de), 0.001);
	return dot(norm, po-ro)/de;
}
vec2 raytraceTexturedQuad(in vec3 rayOrigin, in vec3 rayDirection, in vec3 quadCenter, in vec3 quadRotation, in vec2 quadDimensions) {
	//Rotations ------------------
	float a = sin(quadRotation.x); float b = cos(quadRotation.x); 
	float c = sin(quadRotation.y); float d = cos(quadRotation.y); 
	float e = sin(quadRotation.z); float f = cos(quadRotation.z); 
	float ac = a*c;   float bc = b*c;
	
	mat3 RotationMatrix  = 
			mat3(	  d*f,      d*e,  -c,
				ac*f-b*e, ac*e+b*f, a*d,
				bc*f+a*e, bc*e-a*f, b*d );
	//--------------------------------------
	
	vec3 right = RotationMatrix * vec3(quadDimensions.x, 0.0, 0.0);
	vec3 up = RotationMatrix * vec3(0, quadDimensions.y, 0);
	vec3 normal = cross(right, up);
	normal /= length(normal);
	
	//Find the plane hit point in space
	vec3 pos = (rayDirection * plane(normal, quadCenter, rayOrigin, rayDirection)) - quadCenter;
	
	//Find the texture UV by projecting the hit point along the plane dirs
	return vec2(dot(pos, right) / dot(right, right),
				dot(pos, up)    / dot(up,    up)) + 0.5;
}



//psych engine 3d perspective shader
void main() {	
	vec2 screenUV = openfl_TextureCoordv;
	vec2 p = (2.0 * screenUV) - 1.0;
	float screenAspect = resolution.x/resolution.y;
	p.x *= screenAspect;
	
	//Normalized Ray Dir
	vec3 dir = vec3(p.x, p.y, 1.0);
	dir /= length(dir);

	gl_FragColor = vec4(0.0);
	
	//Define the plane
	vec3 planePosition = vec3(xpos, ypos, dept);
	vec3 planeRotation = vec3(xrot, yrot, zrot);
	vec2 planeDimension = vec2(-screenAspect, 1.0);
	
	//vec2 uv = openfl_TextureCoordv;
	vec2 uv = raytraceTexturedQuad(vec3(0.0,0.0,0.0), dir, planePosition, planeRotation, planeDimension);
	
	//If we hit the rectangle, sample the texture
	if (abs(uv.x - 0.5) < 0.5 && abs(uv.y - 0.5) < 0.5) {
		gl_FragColor = flixel_texture2D(bitmap, uv);
	}
}

