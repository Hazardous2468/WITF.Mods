
function modsTimeline()	
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	--addHaxeLibrary("ShaderFilter", "openfl.filters")
	--addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "funkin")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")

	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
	


	
		var introBG = createZSpr("introBG", 'sing-sing-red-indigo/intro_bg');
		introBG.setGraphicSize(FlxG.width+2);
		introBG.screenCenter();	
		introBG.y = -FlxG.height*1.5;

		var stars = createZSpr("stars", 'sing-sing-red-indigo/bgStars');
		stars.setGraphicSize(FlxG.width+200, FlxG.height+200);
		stars.screenCenter();	
		stars.y -= 222;

		var introBG_black:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		introBG_black.scrollFactor.set();
		PlayState.instance.add(introBG_black);
		game.customLuaSprites.set("introBG_black", introBG_black);


		var introBG_water = createZSpr("introBG_water", 'sing-sing-red-indigo/intro_bg_water');
		introBG_water.setGraphicSize(FlxG.width+2, FlxG.height+2);
		introBG_water.screenCenter();	
		introBG_water.y += 2;

		
		game.defaultHUDCameraZoom = 1.025;

		addUpdate(function(elapsed){
			introBG_black.y = introBG_water.y + introBG_water.y2 + introBG_water.height*0.7;
		});	

		addResetEvent(function(){
			introBG.y2 = 0;	
			introBG_water.y2 = 0;	
			stars.y2 = 0;	
		});

		eh.funcTweenModEvent(target1, -4, 5, ModConstants.getEaseFromString("inOutSine"), -66, 0, function(v) {
			introBG.y2 = v;
			introBG_water.y2 = v;
			stars.y2 = v*0.35;
		}, "introBG_move");

		eh.funcTweenModEvent(target1, 35, 4, ModConstants.getEaseFromString("inSine"), 0, -FlxG.height, function(v) {
			introBG.y2 = v;
			introBG_water.y2 = v;
			stars.y2 = v*0.35;
		}, "introBG_move");

		eh.funcTweenModEvent(target1, 152, 192-152, ModConstants.getEaseFromString("inOutSine"), -FlxG.height, FlxG.height, function(v) {
			introBG.y2 = v;
			introBG_water.y2 = v;
			stars.y2 = v*0.35;
		}, "introBG_move");

		eh.funcTweenModEvent(target1, 228.9, 0.1, ModConstants.getEaseFromString("instant"), FlxG.height, -FlxG.height, function(v) {
			introBG.y2 = v;
			introBG_water.y2 = v;
			stars.y2 = v*0.35;
		}, "introBG_move");

		eh.funcTweenModEvent(target1, 231.9, 0.1, ModConstants.getEaseFromString("instant"), -FlxG.height, 0, function(v) {
			introBG.y2 = v;
			introBG_water.y2 = v;
			stars.y2 = v*0.35;
		}, "introBG_move");



		var waveyShader = new FlxRuntimeShader(Assets.getText(Paths.frag("WaveyX")), null);
		addUpdate(function(elapsed){
			waveyShader.setFloat('iTime', Conductor.instance.songPosition/1000);
		});	
		addResetEvent(function(){
			waveyShader.setFloat('speed', 0.9);
			waveyShader.setFloat('frequency', 13.0);
			waveyShader.setFloat('power', 0.017);
		});
		introBG_water.shader = waveyShader;




		var shaderBG1_shader = new FlxRuntimeShader(Assets.getText(Paths.frag("sing-sing-red-indigo-bgShader1")), null);
		addUpdate(function(elapsed){
			shaderBG1_shader.setFloat('iTime', Conductor.instance.songPosition/1000);
		});	
		addResetEvent(function(){
			shaderBG1_shader.setFloat('_alpha', 0.0);
		});	
		eh.funcTweenModEvent(target1, 36, 2.5, ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			shaderBG1_shader.setFloat('_alpha', v);
		}, "shaderBG1_shaderAlpha");

		eh.funcTweenModEvent(target1, 83, 4, ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			shaderBG1_shader.setFloat('_alpha', v);
		}, "shaderBG1_shaderAlpha");

		var shaderBG1_spr:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(FlxG.width, FlxG.height, 0xFFFFFFFF);
		shaderBG1_spr.scrollFactor.set();
		PlayState.instance.customLuaSprites.set("shaderBG1_spr", shaderBG1_spr);
		PlayState.instance.add(shaderBG1_spr);
		shaderBG1_spr.screenCenter();	
		shaderBG1_spr.shader = shaderBG1_shader;
		



		var vignette = createSpr("vignette", 'sing-sing-red-indigo/vignette');
		vignette.setGraphicSize(FlxG.width+2, FlxG.height+2);
		vignette.screenCenter();	
		vignette.camera=game.camHUD;

		
	]])


	
end


