#pragma header

uniform float[4] testInput = float[4](3.0, 5.0, 1.0, 1.0);

uniform float[] aaaa;


void main()
{
	//float[4] testInput_ = float[4](3.0, 5.0, 1.0, 1.0);
	
	//testInput_ = testInput;

	gl_FragColor = flixel_texture2D(bitmap,openfl_TextureCoordv);	
	
	gl_FragColor.r *= testInput[0];
	gl_FragColor.g *= testInput[1];
	gl_FragColor.b *= testInput[2];
	gl_FragColor.a *= testInput[3];
	
	
	
	//gl_FragColor.r *= aaaa[0];
	
}