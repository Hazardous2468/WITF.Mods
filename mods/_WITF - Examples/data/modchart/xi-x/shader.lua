function modsTimeline()
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		
		var bloomShader = new FlxRuntimeShader(Assets.getText(Paths.frag("xi-x/bloom")), null);
		addResetEvent(function(){
			bloomShader.setFloat('BLOOM_INTENSITY', 0.0);
			bloomShader.setFloat('BLOOM_THRESHOLD', 0.50);
			bloomShader.setInt('BLUR_ITERATIONS', 3);
			bloomShader.setFloat('BLUR_SIZE', 0.015);
			bloomShader.setInt('BLUR_SUBDIVISIONS', 10);
			bloomShader.setBool('BLOOM_ONLY', false);
			bloomShader.setBool('DO_ALPHA', true);
			bloomShader.setBool('ENABLED', false);
		});	
		
		
		
		
		
		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(bloomShader));
		
		game.camGame.filters = newCamEffects;
		game.camHUD.filters = newCamEffects;
		game.camNotes.filters = newCamEffects;
		game.camAFT.filters = newCamEffects;
				
		
		eh.funcModEvent(target1, 295, function() {
			bloomShader.setBool('ENABLED', true);
			bloomShader.setFloat('BLOOM_THRESHOLD', 0.4);
			bloomShader.setFloat('BLUR_SIZE', 0.02);
		});
		
		eh.funcModEvent(target1, 359, function() {
			bloomShader.setBool('ENABLED', false);
			bloomShader.setFloat('BLOOM_THRESHOLD', 0.5);
			bloomShader.setFloat('BLUR_SIZE', 0.015);
		});
		
		eh.funcTweenModEvent(target1, 295.5, 1,  ModConstants.getEaseFromString("inOutSine"), 0, 1.5, function(v) {
			bloomShader.setFloat('BLOOM_INTENSITY', v);
		}, "bloomShaderIntensity");
		
		eh.funcTweenModEvent(target1, 328, 1,  ModConstants.getEaseFromString("outExpo"), 1.5, 0, function(v) {
			bloomShader.setFloat('BLOOM_INTENSITY', v);
		}, "bloomShaderIntensity");
		
		eh.funcTweenModEvent(target1, 329, 1.7,  ModConstants.getEaseFromString("linear"), 0, 2, function(v) {
			bloomShader.setFloat('BLOOM_INTENSITY', v);
		}, "bloomShaderIntensity");
		
		eh.funcTweenModEvent(target1, 358, 0.5,  ModConstants.getEaseFromString("outExpo"), 2, 0, function(v) {
			bloomShader.setFloat('BLOOM_INTENSITY', v);
		}, "bloomShaderIntensity");
		
		
		
		eh.funcModEvent(target1, 451.25, function() {
			bloomShader.setBool('ENABLED', true);
		});
		
		eh.funcModEvent(target1, 584, function() {
			bloomShader.setBool('ENABLED', false);
		});
		
		eh.funcTweenModEvent(target1, 452.5, 4,  ModConstants.getEaseFromString("inOutSine"), 0, 1.8, function(v) {
			bloomShader.setFloat('BLOOM_INTENSITY', v);
		}, "bloomShaderIntensity");
		
		eh.funcTweenModEvent(target1, 518, 2,  ModConstants.getEaseFromString("linear"), 1.8, 1.66, function(v) {
			bloomShader.setFloat('BLOOM_INTENSITY', v);
		}, "bloomShaderIntensity");
		
		eh.funcTweenModEvent(target1, 580, 2,  ModConstants.getEaseFromString("inOutSine"), 1.66, 0, function(v) {
			bloomShader.setFloat('BLOOM_INTENSITY', v);
		}, "bloomShaderIntensity");
		
	]])
	
end







