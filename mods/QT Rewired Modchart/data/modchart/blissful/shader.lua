function modsTimeline()

	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "funkin")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxColorUtil", "funkin.util")
	
	runHaxeCode(
	[[
		//Change this to true if you wanna reduce bloom quality lol
		var lowerQualityShaders = true;
	
	
		var target1 = PlayState.instance.playerStrumline.mods;
		if(PlayState.instance.currentVariation == "pico"){
		
		}else{		
			
			var doShaders = true;
			//Shader setup!
			var reduceBloomIt:Int = 0;
			var reduceBloomSubdivs:Int = 0;
			if(lowerQualityShaders){
				reduceBloomIt = 1;
				reduceBloomSubdivs = 4;
			}
			
			
			var bloomShader = new FlxRuntimeShader(Assets.getText(Paths.frag("QT_Rewired/bloom")), null);
			bloomShader.setFloat('BLOOM_INTENSITY', 0);
			bloomShader.setFloat('BLOOM_THRESHOLD', 0.56);
			bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
			bloomShader.setFloat('BLUR_SIZE', 0.029);
			bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
			
			bloomShader.setBool('BLOOM_ONLY', false);
			
			
			
			addResetEvent(function(){
				bloomShader.setFloat('BLOOM_INTENSITY', 0);
				bloomShader.setFloat('BLOOM_THRESHOLD', 0.56);
				bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
				bloomShader.setFloat('BLUR_SIZE', 0.025);
				bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
				bloomShader.setBool('BLOOM_ONLY', false);
			});	
			
			
			eh.funcTweenModEvent(target1, 192, 1.5,  ModConstants.getEaseFromString("expoInOut"), 0, 1.25, function(v) {
				bloomShader.setFloat('BLOOM_INTENSITY', v);
			}, "bloom_intensity");
			
			eh.funcTweenModEvent(target1, 223, 1,  ModConstants.getEaseFromString("linear"), 1.25, 0, function(v) {
				bloomShader.setFloat('BLOOM_INTENSITY', v);
			}, "bloom_intensity");
		
			eh.funcTweenModEvent(target1, 255.9, 1,  ModConstants.getEaseFromString("linear"), 0, 1.25, function(v) {
				bloomShader.setFloat('BLOOM_INTENSITY', v);
			}, "bloom_intensity");
			
			eh.funcTweenModEvent(target1, 287, 1,  ModConstants.getEaseFromString("linear"), 1.25, 0, function(v) {
				bloomShader.setFloat('BLOOM_INTENSITY', v);
			}, "bloom_intensity");
			
			
			
			
			eh.funcTweenModEvent(target1, 360, 0.75,  ModConstants.getEaseFromString("pop"), 0, 1, function(v) {
				bloomShader.setFloat('BLOOM_INTENSITY', v);
			}, "bloom_intensity");
			
			eh.funcTweenModEvent(target1, 360+0.75, 0.75,  ModConstants.getEaseFromString("pop"), 0, 1, function(v) {
				bloomShader.setFloat('BLOOM_INTENSITY', v);
			}, "bloom_intensity");
			
			eh.funcTweenModEvent(target1, 360+1.5, 0.75,  ModConstants.getEaseFromString("pop"), 0, 1, function(v) {
				bloomShader.setFloat('BLOOM_INTENSITY', v);
			}, "bloom_intensity");
			
			
			
			var newCamEffects:Array<BitmapFilter>=[];
			if(doShaders){
				newCamEffects.push(new ShaderFilter(bloomShader));
			}
			
			game.camGame.filters = newCamEffects;
			game.camHUD.filters = newCamEffects;
			game.camNotes.filters = newCamEffects;
			

			
			setVar("rainbowBlend", 0.0);
			addResetEvent(function(){
				setVar("rainbowBlend", 0.0);
				game.scoreText.color = 0xFFFFFFFF;
			});	
			
			eh.funcTweenModEvent(target1, 288, 4,  ModConstants.getEaseFromString("linear"), 0, 0.5, function(v) {
				setVar("rainbowBlend", v);
			}, "hueShift_blend");
			
			eh.funcTweenModEvent(target1, 348, 6,  ModConstants.getEaseFromString("inOutQuad"), 0.5, 0, function(v) {
				setVar("rainbowBlend", v);
			}, "hueShift_blend");
			
			//Rainbow score text for the funny dance
			eh.funcTweenModEvent(target1, 288, 352-288,  ModConstants.getEaseFromString("linear"), 0, 352-288, function(v) {
				//bloomShader.setFloat('BLOOM_INTENSITY', v);
				
				var blend:Float = getVar("rainbowBlend");
				
				var timmy:Float = v*32*1.5 * 4;
				var p:Float = Math.PI;
				var rad:Float = p/180;
				
				var red:Float = FlxMath.fastSin(timmy*rad);
				var green:Float =  (FlxMath.fastSin(timmy*rad+(0.66*p)));
				var blue:Float = (FlxMath.fastSin(timmy*rad+(0.66*p*2)));
				
				red *= blend;
				green *= blend;
				blue *= blend;
				
				

				var col = 0xFFFFFFFF;

				col = FlxColorUtil.interpolate(col, 0xFFFF0000, red);
				col = FlxColorUtil.interpolate(col, 0xFF00FF00, green);
				col = FlxColorUtil.interpolate(col, 0xFF0000FF, blue);

				game.scoreText.color = col;
				
			}, "hueShift");
		}
	]])
	
	
	
	

end 
