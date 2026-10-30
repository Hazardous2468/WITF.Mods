#pragma header

uniform float uTimeX;		
uniform float uTimeY;		
vec2 scale = vec2(3.0, 3.0);
uniform bool flipAlpha;
uniform float alphaMult;
uniform bool flashing;

//2D signed hash function:
vec2 Hash2(vec2 P)
{
	return 1.-2.*fract(cos(P.x*vec2(91.52,-74.27)+P.y*vec2(-39.07,09.78))*939.24);
}
//2D Worley noise.
float Worley(vec2 P)
{
	float D = 1.;
	vec2 F = floor(P+.5);
		
	//Find the the nearest point the neigboring cells.
	D = min(length(.5*Hash2(F+vec2( 1, 1))+F-P+vec2( 1, 1)),D);
	D = min(length(.5*Hash2(F+vec2( 0, 1))+F-P+vec2( 0, 1)),D);
	D = min(length(.5*Hash2(F+vec2(-1, 1))+F-P+vec2(-1, 1)),D);
	D = min(length(.5*Hash2(F+vec2( 1, 0))+F-P+vec2( 1, 0)),D);
	D = min(length(.5*Hash2(F+vec2( 0, 0))+F-P+vec2( 0, 0)),D);
	D = min(length(.5*Hash2(F+vec2(-1, 0))+F-P+vec2(-1, 0)),D);
	D = min(length(.5*Hash2(F+vec2( 1,-1))+F-P+vec2( 1,-1)),D);
	D = min(length(.5*Hash2(F+vec2( 0,-1))+F-P+vec2( 0,-1)),D);
	D = min(length(.5*Hash2(F+vec2(-1,-1))+F-P+vec2(-1,-1)),D);
	return D;
}

void main() {

	vec2 p = openfl_TextureCoordv;
	p -= 0.5;
	vec2 wtf = vec2(0.0);
	
	
	
	vec2 coordFuny = openfl_TextureCoordv;
	
	//Resize
	coordFuny.x *= scale.x;
	coordFuny.y *= scale.y;

	coordFuny.x += uTimeX;
	coordFuny.y += uTimeY;
	
	
	vec4 color = flixel_texture2D(bitmap, fract((coordFuny) * 3.0));
	if(flipAlpha){
		color = vec4(1.) - color; //Flip all
	}

	
	float sampleAlpha = color.a;
	vec2 nCoord=openfl_TextureCoordv;
	
	nCoord *= 1440.0;
	nCoord.x += uTimeX*2.;
	nCoord.y += uTimeY*2.;
	float sinShit1 = (cos(uTimeY*64.)*0.05)+2.;
	float v = Worley(nCoord/sinShit1)+.3*Worley(nCoord/32.)+.2*Worley(nCoord/16.)+.1*Worley(nCoord/8.);
	if(flashing){v *= (sin(uTimeX*32.)+2.)*0.5;}
	v *= sampleAlpha;
	color = vec4(v,0.0,0.0,sampleAlpha);
	gl_FragColor = clamp(color, 0.0, 1.0);
	gl_FragColor *= alphaMult;
	
}

