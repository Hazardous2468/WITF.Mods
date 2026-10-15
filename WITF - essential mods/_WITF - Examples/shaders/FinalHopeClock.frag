#pragma header

const vec3 resolution = vec3(1280.0, 720.0, 1.0);
#define pi 3.14159265358979323846264338327950288419716939937510
#define iTime uTime

/**
 * The current time. Used to shift the effect over time.
 */
uniform float uTime;		
/**
 * Which out of several effects should be used.
 */
uniform int effectType;
/**
 * How fast the waves move over time.
 */
uniform float uSpeed;		
/**
 * Number of waves over time.
 */
uniform float uFrequency;		
/**
 * How much the pixels are going to stretch over the waves.
 */
uniform float uWaveAmplitude;



//For the dumb fucking clock funny
mat2 Rot(float a){
    float s = sin(a), c=cos(a);
    return mat2(c,-s,s,c);
}
float sdCircle(vec2 uv, float r, vec2 offset) {
    float x = uv.x - offset.x;
    float y = uv.y - offset.y;
    
    return length(vec2(x, y)) - r;
}
float udSegment( in vec2 p, in vec2 a, in vec2 b )
{
    vec2 ba = b-a;
    vec2 pa = p-a;
    float h =clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length(pa-h*ba);
}
float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}
float degreeToRad( in float degree){return degree * (pi / 180.0);}




vec4 drawScene(vec2 uv) {
    vec4 col = vec4(1.000,0.584,0.000,1.0);
    vec4 result = vec4(0.0);
    float stepMult = 1.1;

     float circle1_center = sdCircle(uv, 0.05, vec2(0.0, 0.0));
    circle1_center = smoothstep(0.,0.005*stepMult, circle1_center); 

    result = mix(col, result, circle1_center);


     float circle1_in = sdCircle(uv, 0.15, vec2(0.0, 0.0));
    float circle2_in = sdCircle(uv, 0.2, vec2(0.0, 0.0));
    float circres_in = max(-circle1_in, circle2_in); // subtraction - subtract d1 from d2

    float howmany = 8.0;
    for(float i = 0.0; i < howmany; i++){
        vec2 circlespikesuv = uv;
         circlespikesuv *= Rot(degreeToRad(360.0/howmany*i));
         circlespikesuv *= Rot(iTime/2.0*-1.0);
         circlespikesuv.y += 0.2;
         float circlesp = sdBox(circlespikesuv,  vec2(0.05, 0.05));
        circres_in = min(circres_in, circlesp); // union
    }
    
    circres_in = smoothstep(0.,0.005*stepMult, circres_in); 

    result = mix(col, result, circres_in);


     float circle1 = sdCircle(uv, 0.6, vec2(0.0, 0.0));
    float circle2 = sdCircle(uv, 0.65, vec2(0.0, 0.0));
    float circres = max(-circle1, circle2); // subtraction - subtract d1 from d2
    
    howmany = 16.0;
    for(float i = 0.0; i < howmany; i++){
        vec2 circlespikesuv = uv;
         circlespikesuv *= Rot(degreeToRad(360.0/howmany*i));
         circlespikesuv *= Rot(iTime/2.0);
         circlespikesuv.y += 0.66;
         float circlesp = sdBox(circlespikesuv,  vec2(0.05, 0.05));
        circres = min(circres, circlesp); // union
        
        circlespikesuv = uv;
         circlespikesuv *= Rot(degreeToRad(360.0/howmany*i));
         circlespikesuv *= Rot(iTime/3.0*-1.0);
         circlespikesuv.y += 0.59;
         circlesp = sdBox(circlespikesuv,  vec2(0.05, 0.05));
        circres = min(circres, circlesp); // union
        
        circlespikesuv = uv;
         circlespikesuv *= Rot(degreeToRad(360.0/howmany*i));
         circlespikesuv *= Rot(iTime/4.0);
         circlespikesuv.y += 0.4;
         circlesp = sdBox(circlespikesuv,  vec2(0.05, 0.01));
        circres = min(circres, circlesp); // union
    }
    
    circres = smoothstep(0.,0.005*stepMult, circres); 

    result = mix(col, result, circres);

    vec2 uvhandoffset = uv;
    uvhandoffset *= Rot(iTime);
    uvhandoffset.y -= 0.25;
    float hand1 = sdBox(uvhandoffset,  vec2(0.025, 0.1));
    result = mix(col, result, smoothstep(0.,0.005*stepMult, hand1));
    
    uvhandoffset.y += 0.25;
    uvhandoffset *= Rot(iTime*15.0/4.0);
    uvhandoffset.y -= 0.25;
    float hand2 = sdBox(uvhandoffset,  vec2(0.012, 0.25));
    result = mix(col, result, smoothstep(0.,0.005*stepMult, hand2));
    
    return result;
}




void main() {
	//vec2 res = vec2(500.0,500.0);

	vec2 uv = openfl_TextureCoordv;
	float alphaSample = flixel_texture2D(bitmap,openfl_TextureCoordv).a;
	//uv.x *= 1.25;
	uv -= 0.5;
	uv *= 1.5;

	//uv.x *= res.x/res.y; // fix aspect ratio
	
	//float sizeMod = (abs(sin(iTime))+3.5)*0.25;
	//uv *= sizeMod;
	
	
	
	vec4 col = drawScene(uv);
	gl_FragColor = col*alphaSample;
}

