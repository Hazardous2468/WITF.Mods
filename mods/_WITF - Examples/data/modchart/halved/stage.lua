function stageSetup()	
	
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FlxTypeText", "flixel.addons.text")
	addHaxeLibrary("FlxTrail", "flixel.addons.effects")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	--Stage setup
	runHaxeCode(
	[[
	
	var lowerQualityShaders = false;
	var doShaders = true;
	

	
	
	var target1 = PlayState.instance.playerStrumline.mods;
	//Shader setup!
	
	
	var lowerSubDivs:Int = 0;
	var lowerIts:Int = 0;
	if (lowerQualityShaders){
		lowerIts = 1;
		lowerSubDivs = 4;
	}
	
	var bloomShader = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/bloom")), null);
	bloomShader.setFloat('BLOOM_INTENSITY', 1.0);
	bloomShader.setFloat('BLOOM_THRESHOLD', 0.56);
	bloomShader.setInt('BLUR_ITERATIONS', 3-lowerIts);
	bloomShader.setFloat('BLUR_SIZE', 0.029);
	bloomShader.setInt('BLUR_SUBDIVISIONS', 24 - lowerSubDivs);
	bloomShader.setBool('BLOOM_ONLY', true);
	
	addResetEvent(function(){
		bloomShader.setFloat('BLOOM_INTENSITY', 1.5);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.38);
		bloomShader.setInt('BLUR_ITERATIONS', 3-lowerIts);
		bloomShader.setFloat('BLUR_SIZE', 0.02);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 24 - lowerSubDivs);
		bloomShader.setBool('BLOOM_ONLY', true);
	});	
	
	
	eh.funcTweenModEvent(target1, 156, 4,  ModConstants.getEaseFromString("inOutCubic"), 0.02, 0.00675, function(v) {
		bloomShader.setFloat('BLUR_SIZE', v);	
	}, "bloom_blur");
	
	eh.funcTweenModEvent(target1, 220, 4,  ModConstants.getEaseFromString("inOutCubic"), 0.00675, 0.0, function(v) {
		bloomShader.setFloat('BLUR_SIZE', v);	
	}, "bloom_blur");
	
	eh.funcTweenModEvent(target1, 302, 2,  ModConstants.getEaseFromString("inOutCubic"), 0, 0.00675, function(v) {
		bloomShader.setFloat('BLUR_SIZE', v);	
	}, "bloom_blur");
	eh.funcTweenModEvent(target1, 408, 1,  ModConstants.getEaseFromString("inOutCubic"), 0.00675, 0.001, function(v) {
		bloomShader.setFloat('BLUR_SIZE', v);	
	}, "bloom_blur");
	eh.funcTweenModEvent(target1, 483, 1,  ModConstants.getEaseFromString("linear"), 0.001, 0.01, function(v) {
		bloomShader.setFloat('BLUR_SIZE', v);	
	}, "bloom_blur");
	
	
	eh.funcModEvent(target1, 472, function() {
		bloomShader.setBool('BLOOM_ONLY', false);
	}, "bloomonly");
	
	
	

	var invertShader = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/haz_invertCol_halved")), null);
	invertShader.setFloat('_active', 0.0);
	addResetEvent(function(){
		invertShader.setFloat('_active', 0.0);
	});	
	
	eh.funcModEvent(target1, 173.97, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcTweenModEvent(target1, 174, 2,  ModConstants.getEaseFromString("inExpo"), 1, 0, function(v) {
		invertShader.setFloat('_active', v);	
	}, "invertCols");
	
	eh.funcTweenModEvent(target1, 206.5, 0.5,  ModConstants.getEaseFromString("inExpo"), 0, 0.5, function(v) {
		invertShader.setFloat('_active', v);	
	}, "invertCols");
	eh.funcTweenModEvent(target1, 207, 1,  ModConstants.getEaseFromString("linear"), 0.5, 0, function(v) {
		invertShader.setFloat('_active', v);	
	}, "invertCols");
	
		
		
	var glitch2 = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/glitch2")), null);
	
	if(lowerQualityShaders){
		glitch2.setInt('NUM_SAMPLES', 18);
	}else{
		glitch2.setInt('NUM_SAMPLES', 14);
	}
	
	glitch2.setFloat('amount', 0.0);
	addUpdate(function(elapsed){
		glitch2.setFloat('uTime', Conductor.instance.songPosition/1000*2);
	});	
	
	var glitch2Mod:CustomModifier = createCustomMod("glitch2", 0.01);
	glitch2Mod.modPriority = -9990;
	glitch2Mod.unknown = false;
	glitch2Mod.strumsMod = false;
    glitch2Mod.notesMod = false;
    glitch2Mod.holdsMod = false;
    glitch2Mod.pathMod = false;
    glitch2Mod.specialMod = true;
    glitch2Mod.speedMod = false;
	eh.addCustomMod("bf", glitch2Mod);
	glitch2Mod.specialMathFunc = function() {
		glitch2.setFloat('amount', glitch2Mod.currentValue);
	};
	
	
	var glitchLinesShader = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/glitch-lines")), null);
	glitchLinesShader.setFloat('amount', 0.0);
	addUpdate(function(elapsed){
		glitchLinesShader.setFloat('uTime', Conductor.instance.songPosition/1000);
	});	
	
	var glitchLinesMod:CustomModifier = createCustomMod("glitchLines", 0.00);
	glitchLinesMod.modPriority = -9990;
	glitchLinesMod.unknown = false;
	glitchLinesMod.strumsMod = false;
    glitchLinesMod.notesMod = false;
    glitchLinesMod.holdsMod = false;
    glitchLinesMod.pathMod = false;
    glitchLinesMod.specialMod = true;
    glitchLinesMod.speedMod = false;
	eh.addCustomMod("bf", glitchLinesMod);
	glitchLinesMod.specialMathFunc = function() {
		glitchLinesShader.setFloat('amount', glitchLinesMod.currentValue);
	};
	
	
	
	
	
	var fisheye = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/fisheye")), null);
	fisheye.setFloat('amount', 0.5);
	var fishEyeMod:CustomModifier = createCustomMod("fisheye", 0.01);
	fishEyeMod.modPriority = -9990;
	fishEyeMod.unknown = false;
	fishEyeMod.strumsMod = false;
    fishEyeMod.notesMod = false;
    fishEyeMod.holdsMod = false;
    fishEyeMod.pathMod = false;
    fishEyeMod.specialMod = true;
    fishEyeMod.speedMod = false;
	eh.addCustomMod("bf", fishEyeMod);
	fishEyeMod.specialMathFunc = function() {
		fisheye.setFloat('amount', fishEyeMod.currentValue);
	};
	
	
	
	var glitchfuck = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/argos_glitchfrag")), null);
	glitchfuck.setFloat('amount', 0.0);
	addUpdate(function(elapsed){
		glitchfuck.setFloat('uTime', Conductor.instance.songPosition / 1000);
	});	
	
	eh.funcModEvent(target1, 190.5, function() {
		glitchfuck.setFloat('amount', 1.0);
	}, "glitchfuck");
	eh.funcModEvent(target1, 191.95, function() {
		glitchfuck.setFloat('amount', 0.0);
	}, "glitchfuck");
	
	
	var binaryGlitch = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/binaryglitch")), null);
	binaryGlitch.setBool('_active', false);
	binaryGlitch.setFloat('glitchStrength', 2.0);
	
	addResetEvent(function(){
		binaryGlitch.setBool('_active', false);
		binaryGlitch.setFloat('glitchStrength', 2.0);
	});	
	

	
	eh.funcModEvent(target1, 410, function() {
		binaryGlitch.setBool('_active', true);
	}, "binaryGlitchActive");
	
	eh.funcTweenModEvent(target1, 410, 2.5,  ModConstants.getEaseFromString("inExpo"), 0.0, 2.0, function(v) {
		binaryGlitch.setFloat('glitchStrength', v);	
	}, "binaryGlitchAmount");
	
	eh.funcTweenModEvent(target1, 472, 1,  ModConstants.getEaseFromString("outExpo"), 2.0, 0.2, function(v) {
		binaryGlitch.setFloat('glitchStrength', v);	
	}, "binaryGlitchAmount");
	
	eh.funcTweenModEvent(target1, 482, 1,  ModConstants.getEaseFromString("outExpo"), 0.2, 0.22, function(v) {
		binaryGlitch.setFloat('glitchStrength', v);	
	}, "binaryGlitchAmount");
	
	eh.funcTweenModEvent(target1, 610, 4,  ModConstants.getEaseFromString("inOutCubic"), 0.2, 0.5*0.7, function(v) {
		binaryGlitch.setFloat('glitchStrength', v);	
	}, "binaryGlitchAmount");
	
	
	
	var emptyEffects:Array<BitmapFilter>=[];
	
	if(doShaders){
		var baseCamEffect:Array<BitmapFilter>=[];
		baseCamEffect.push(new ShaderFilter(bloomShader));
		baseCamEffect.push(new ShaderFilter(fisheye));
		baseCamEffect.push(new ShaderFilter(glitchfuck));
		baseCamEffect.push(new ShaderFilter(glitch2));
		baseCamEffect.push(new ShaderFilter(glitchLinesShader));
		baseCamEffect.push(new ShaderFilter(binaryGlitch));
		baseCamEffect.push(new ShaderFilter(invertShader));
		

		
		
		var aaaaaa:Array<BitmapFilter>=[];
		aaaaaa.push(new ShaderFilter(bloomShader));
		aaaaaa.push(new ShaderFilter(fisheye));
		aaaaaa.push(new ShaderFilter(glitchfuck));
		aaaaaa.push(new ShaderFilter(glitch2));
		aaaaaa.push(new ShaderFilter(glitchLinesShader));
		aaaaaa.push(new ShaderFilter(invertShader));
		
		var baseCamEffectNoInv:Array<BitmapFilter>=[];
		baseCamEffectNoInv.push(new ShaderFilter(bloomShader));
		baseCamEffectNoInv.push(new ShaderFilter(fisheye));
		baseCamEffectNoInv.push(new ShaderFilter(glitch2));
		baseCamEffectNoInv.push(new ShaderFilter(glitchLinesShader));
		baseCamEffectNoInv.push(new ShaderFilter(binaryGlitch));
		
		var maxReducedNoFisheyeCamEffect:Array<BitmapFilter>=[];
		maxReducedNoFisheyeCamEffect.push(new ShaderFilter(bloomShader));
		maxReducedNoFisheyeCamEffect.push(new ShaderFilter(fisheye));
		maxReducedNoFisheyeCamEffect.push(new ShaderFilter(glitch2));
		maxReducedNoFisheyeCamEffect.push(new ShaderFilter(glitchLinesShader));
		
		var maxReducedCamEffect:Array<BitmapFilter>=[];
		maxReducedCamEffect.push(new ShaderFilter(bloomShader));
		maxReducedCamEffect.push(new ShaderFilter(fisheye));
		maxReducedCamEffect.push(new ShaderFilter(glitch2));
		maxReducedCamEffect.push(new ShaderFilter(glitchLinesShader));
		
		var reducedCamEffect:Array<BitmapFilter>=[];
		reducedCamEffect.push(new ShaderFilter(bloomShader));
		reducedCamEffect.push(new ShaderFilter(fisheye));
		reducedCamEffect.push(new ShaderFilter(glitchfuck));
		reducedCamEffect.push(new ShaderFilter(glitch2));
		reducedCamEffect.push(new ShaderFilter(glitchLinesShader));
	
		game.camHUD.filters=(maxReducedCamEffect);
		game.camNotes.filters=(maxReducedCamEffect);
		game.camGame.filters=(maxReducedCamEffect);
		game.camAFT.filters=(maxReducedCamEffect);
		
		addResetEvent(function(){
			game.camHUD.filters=(maxReducedCamEffect);
			game.camNotes.filters=(maxReducedCamEffect);
			game.camGame.filters=(maxReducedCamEffect);
			game.camAFT.filters=(maxReducedCamEffect);
		});
		
		eh.funcModEvent(target1, 158, function() {
			game.camHUD.filters=(reducedCamEffect);
			game.camNotes.filters=(reducedCamEffect);
			game.camGame.filters=(reducedCamEffect);
			game.camAFT.filters=(reducedCamEffect);
		}, "camShaders");
		
		eh.funcModEvent(target1, 172, function() {
			game.camHUD.filters=(aaaaaa);
			game.camNotes.filters=(aaaaaa);
			game.camGame.filters=(aaaaaa);
			game.camAFT.filters=(aaaaaa);
		}, "camShaders");
		
		eh.funcModEvent(target1, 210, function() {
			game.camHUD.filters=(reducedCamEffect);
			game.camNotes.filters=(reducedCamEffect);
			game.camGame.filters=(reducedCamEffect);
			game.camAFT.filters=(reducedCamEffect);
		}, "camShaders");
		
		eh.funcModEvent(target1, 222, function() {
			game.camHUD.filters=(maxReducedNoFisheyeCamEffect);
			game.camNotes.filters=(maxReducedNoFisheyeCamEffect);
			game.camGame.filters=(maxReducedNoFisheyeCamEffect);
			game.camAFT.filters=(maxReducedNoFisheyeCamEffect);
			
		}, "camShaders");
		
		eh.funcModEvent(target1, 302, function() {
			game.camHUD.filters=(maxReducedCamEffect);
			game.camNotes.filters=(maxReducedCamEffect);
			game.camGame.filters=(maxReducedCamEffect);
			game.camAFT.filters=(maxReducedCamEffect);			
		}, "camShaders");
		
		eh.funcModEvent(target1, 408, function() {
			game.camHUD.filters=(baseCamEffectNoInv);
			game.camNotes.filters=(baseCamEffectNoInv);
			game.camGame.filters=(baseCamEffectNoInv);
			game.camAFT.filters=(baseCamEffectNoInv);			
		}, "camShaders");
		
	}else{
		game.camHUD.filters=(emptyEffects);
		game.camNotes.filters=(emptyEffects);
		game.camGame.filters=(emptyEffects);
		game.camAFT.filters=(emptyEffects);
	}

	
	
	
	
	
		
	var eyeShader = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/halved_eye")), null);
	eyeShader.setFloat('uEyeSize', -0.3);
	eyeShader.setFloat('uEyeWidth', 2.2);
	eyeShader.setFloat('uEyeBlur', 0.1);
	addResetEvent(function(){
		eyeShader.setFloat('uEyeSize', -0.3);
		eyeShader.setFloat('uEyeWidth', 2.2);
		eyeShader.setFloat('uEyeBlur', 0.1);
		
		glitchfuck.setFloat('amount', 0.0);
	});	
	
	addUpdate(function(elapsed){
		eyeShader.setFloat('uTime', Conductor.instance.songPosition/1000);
	});	
	
	
	var eyeOpenMod:CustomModifier = createCustomMod("eye_open", 0.55);
	eyeOpenMod.modPriority = -9990;
	eyeOpenMod.unknown = false;
	eyeOpenMod.strumsMod = false;
    eyeOpenMod.notesMod = false;
    eyeOpenMod.holdsMod = false;
    eyeOpenMod.pathMod = false;
    eyeOpenMod.specialMod = true;
    eyeOpenMod.speedMod = false;
	eh.addCustomMod("bf", eyeOpenMod);
	eyeOpenMod.specialMathFunc = function() {
		eyeShader.setFloat('uEyeSize', eyeOpenMod.currentValue);
	};
	
	
	
	
	var eyeSpr = new FunkinSprite(0,0).makeSolidColor(FlxG.width, FlxG.height, 0xFFFFFFFF);
	eyeSpr.zIndex = 1234;
	game.customLuaSprites.set("eye", eyeSpr);
	eyeSpr.zIndex = 9995;
	eyeSpr.setGraphicSize(FlxG.width, FlxG.height);
	eyeSpr.screenCenter();	
	eyeSpr.scrollFactor.set();
	eyeSpr.camera = game.camHUD;
	eyeSpr.shader = eyeShader;
	game.add(eyeSpr);
	
	



	var whitebg = createSpr("whitebg", 'halved_assets/white');
	whitebg.setGraphicSize(FlxG.width, FlxG.height);
	whitebg.screenCenter();	
	whitebg.color = 0xFF000000;
	
	
	
	
	var cairoTiling = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/Haz_CairoTiling")), null);
	cairoTiling.setFloat('amount', 0.0);
	cairoTiling.setFloat('alpha_1', 0.0);
	cairoTiling.setFloat('alpha_2', 0.0);
	addUpdate(function(elapsed){
		cairoTiling.setFloat('iTime', Conductor.instance.songPosition/1000);
	});	
	
	var tileShaderSpr = createSpr("whitebg", 'halved_assets/white');
	tileShaderSpr.setGraphicSize(FlxG.width, FlxG.height);
	tileShaderSpr.screenCenter();	
	tileShaderSpr.shader = cairoTiling;

	addResetEvent(function(){
		cairoTiling.setFloat('amount', 0.0);
		cairoTiling.setFloat('alpha_1', 0.0);
		cairoTiling.setFloat('alpha_2', 0.0);
		cairoTiling.setFloat('zoom_add', 0.0);
	});	
	
	eh.funcTweenModEvent(target1, 220, 4,  ModConstants.getEaseFromString("quadOut"), 0.0, 1, function(v) {
		cairoTiling.setFloat('alpha_1', v);		
	}, "tileFade");
	
	eh.funcTweenModEvent(target1, 286, 4,  ModConstants.getEaseFromString("quadOut"), 0.0, 1, function(v) {
		cairoTiling.setFloat('alpha_1', 1.0-v);		
		cairoTiling.setFloat('alpha_2', v);		
	}, "tileFade");
	
	
	for (i in 286...304)
	{	
		if(i%2 == 0){
			eh.funcTweenModEvent(target1, i, 2,  ModConstants.getEaseFromString("pop"), 0.0, 0.05, function(v) {
				cairoTiling.setFloat('zoom_add', v);		
			}, "tileZoom");
		}
	}
	
	
	var tileModAnimate:CustomModifier = createCustomMod("tileModAnimate", 0.0);
	tileModAnimate.modPriority = -9990;
	tileModAnimate.unknown = false;
	tileModAnimate.strumsMod = false;
    tileModAnimate.notesMod = false;
    tileModAnimate.holdsMod = false;
    tileModAnimate.pathMod = false;
    tileModAnimate.specialMod = true;
    tileModAnimate.speedMod = false;
	eh.addCustomMod("bf", tileModAnimate);
	tileModAnimate.specialMathFunc = function() {
		cairoTiling.setFloat('amount', tileModAnimate.currentValue);	
	};
	
	eh.funcModEvent(target1, 304, function() {
		cairoTiling.setFloat('alpha_2', 0);	
	}, "tileFade");
	
	
	
	
	
	var popupTargetScale = 1.25;
	var sprInd:Int = 0;
	for (i in 484...610) //for some reason, one of these guys cause a memory leak for existing???
	{	
		
		if(i%4 == 0){
			sprInd += 1;
			var stringNameGame:String = "popup_game" + sprInd;
			var stringNameBorder:String = "popup_border" + sprInd;
			var stringNameBack:String = "popup_bg" + sprInd;
			
			var xPos:Float = FlxG.random.float(-300, 300);
			var yPos:Float = FlxG.random.float(-130, 130);
			var angleVel:Float = FlxG.random.float(-29, 29);
			
			var popupBG = createSpr(stringNameBack, 'halved_assets/popup_bg');
			popupBG.screenCenter();	
			popupBG.scale.set(0,0);
			popupBG.x += xPos;
			popupBG.y += yPos;
			popupBG.camera = game.camAFT;
			popupBG.visible = false;
			
			var popupGame = createSpr(stringNameGame, 'halved_assets/popup_bg');
			popupGame.screenCenter();	
			popupGame.scale.set(0,0);
			popupGame.x += xPos;
			popupGame.y += yPos;
			popupGame.camera = game.camAFT;
			
			
			
			var popupBorder = createSpr(stringNameBorder, 'halved_assets/popup_border');
			popupBorder.screenCenter();	
			popupBorder.scale.set(0,0);
			popupBorder.x += xPos;
			popupBorder.y += yPos;
			popupBorder.camera = game.camAFT;
			popupBorder.visible = false;
			
			
			popupGame.loadGraphic(getVar("notesAFT").bitmap, "popupGame");
			popupGame.x -= popupGame.width /4;
			popupGame.y -= popupGame.height /4;
			popupGame.visible = false;
			
			
			popupBG.angularVelocity = angleVel;
			popupBorder.angularVelocity = angleVel;
			popupGame.angularVelocity = angleVel;

			eh.funcModEvent(target1, i, function() {
				getSpr(stringNameGame).visible = true;
				getSpr(stringNameBorder).visible = true;
				getSpr(stringNameBack).visible = true;
				getSpr(stringNameGame).angle = 0;
				getSpr(stringNameBorder).angle = 0;
				getSpr(stringNameBack).angle = 0;
			}, ("popupangle" + sprInd));
			
			addResetEvent(function(){
				getSpr(stringNameGame).visible = false;
				getSpr(stringNameBorder).visible = false;
				getSpr(stringNameBack).visible = false;
				getSpr(stringNameBack).scale.set(0,0);
				getSpr(stringNameGame).scale.set(0,0);
				getSpr(stringNameBorder).scale.set(0,0);
				
				getSpr(stringNameGame).angle = 0;
				getSpr(stringNameBorder).angle = 0;
				getSpr(stringNameBack).angle = 0;
			});	
			
			eh.funcTweenModEvent(target1, i, 1,  ModConstants.getEaseFromString("outCubic"), 0.0, popupTargetScale, function(v) {
				getSpr(stringNameBack).scale.set(v,v);		
				getSpr(stringNameGame).scale.set(v/2,v/2);		
				getSpr(stringNameBorder).scale.set(v,v);		
			}, ("popup" + sprInd));
			
			
			eh.funcTweenModEvent(target1, 610, 1,  ModConstants.getEaseFromString("inCubic"), popupTargetScale, 0, function(v) {
				getSpr(stringNameBack).scale.set(v,v);		
				getSpr(stringNameGame).scale.set(v/2,v/2);		
				getSpr(stringNameBorder).scale.set(v,v);		
			}, ("popup" + sprInd));
			
			
			
			sprInd += 1;
			var stringNameGame:String = "popup_game" + sprInd;
			var stringNameBorder:String = "popup_border" + sprInd;
			var stringNameBack:String = "popup_bg" + sprInd;
			
			var xPos:Float = FlxG.random.float(-300, 300);
			var yPos:Float = FlxG.random.float(-130, 130);
			var angleVel:Float = FlxG.random.float(-20, 20);

			
			var popupBG = createSpr(stringNameBack, 'halved_assets/popup_bg');
			popupBG.screenCenter();	
			popupBG.scale.set(0,0);
			popupBG.x += xPos;
			popupBG.y += yPos;
			popupBG.camera = game.camAFT;
			popupBG.visible = false;
			
			var popupGame = createSpr(stringNameGame, 'halved_assets/popup_bg');
			popupGame.screenCenter();	
			popupGame.scale.set(0,0);
			popupGame.x += xPos;
			popupGame.y += yPos;
			popupGame.camera = game.camAFT;
			
			
			
			var popupBorder = createSpr(stringNameBorder, 'halved_assets/popup_border');
			popupBorder.screenCenter();	
			popupBorder.scale.set(0,0);
			popupBorder.x += xPos;
			popupBorder.y += yPos;
			popupBorder.camera = game.camAFT;
			popupBorder.visible = false;
			
			
			
			popupGame.loadGraphic(getVar("notesAFT").bitmap, "popupGame");
			popupGame.x -= popupGame.width /4;
			popupGame.y -= popupGame.height /4;
			popupGame.visible = false;
			
			popupBG.angularVelocity = angleVel;
			popupBorder.angularVelocity = angleVel;
			popupGame.angularVelocity = angleVel;
			
			eh.funcModEvent(target1, i+1.5, function() {
				getSpr(stringNameGame).visible = true;
				getSpr(stringNameBorder).visible = true;
				getSpr(stringNameBack).visible = true;
				getSpr(stringNameGame).angle = 0;
				getSpr(stringNameBorder).angle = 0;
				getSpr(stringNameBack).angle = 0;
			}, ("popupangle" + sprInd));
			
			addResetEvent(function(){
				getSpr(stringNameGame).visible = false;
				getSpr(stringNameBorder).visible = false;
				getSpr(stringNameBack).visible = false;
				getSpr(stringNameBack).scale.set(0,0);
				getSpr(stringNameGame).scale.set(0,0);
				getSpr(stringNameBorder).scale.set(0,0);
				
				getSpr(stringNameGame).angle = 0;
				getSpr(stringNameBorder).angle = 0;
				getSpr(stringNameBack).angle = 0;
			});	
			
			eh.funcTweenModEvent(target1, i+1.5, 1,  ModConstants.getEaseFromString("outCubic"), 0.0, popupTargetScale, function(v) {
				getSpr(stringNameBack).scale.set(v,v);		
				getSpr(stringNameGame).scale.set(v/2,v/2);		
				getSpr(stringNameBorder).scale.set(v,v);		
			}, ("popup" + sprInd));
			
			eh.funcTweenModEvent(target1, 610, 1,  ModConstants.getEaseFromString("inCubic"), popupTargetScale, 0, function(v) {
				getSpr(stringNameBack).scale.set(v,v);		
				getSpr(stringNameGame).scale.set(v/2,v/2);		
				getSpr(stringNameBorder).scale.set(v,v);		
			}, ("popup" + sprInd));
			
		}
	}
	

	
	
	
	
	
	var bg2 = createSpr("bg2", 'halved_assets/bg2_edit');
	bg2.setGraphicSize(FlxG.width, FlxG.height);
	bg2.screenCenter();	
	
	var bg2shader = new FlxRuntimeShader(Assets.getText(Paths.frag("halved/haz_looping")), null);
	bg2shader.setFloat('scrollX', 0.0);
	bg2shader.setFloat('scrollY', 0.0);
	addUpdate(function(elapsed){
		bg2shader.setFloat('scrollX', Conductor.instance.songPosition/1000*-0.1);
		bg2shader.setFloat('scrollY', Conductor.instance.songPosition/1000*0.2);
	});	
	bg2.shader = bg2shader;
	
	eh.funcTweenModEvent(target1, 255, 2,  ModConstants.getEaseFromString("inOutSine"), 0.0, 0.65, function(v) {
		getSpr("bg2").alpha=v;		
	}, "bg2fade");
	eh.funcTweenModEvent(target1, 286, 2,  ModConstants.getEaseFromString("inOutSine"), 0.65, 0.0, function(v) {
		getSpr("bg2").alpha=v;		
	}, "bg2fade");
			
	
	
	var bg1 = createSpr("bg1", 'halved_assets/bg1 - Copy');
	bg1.setGraphicSize(FlxG.width, FlxG.height);
	bg1.screenCenter();	
	addResetEvent(function(){
		getSpr("heart").alpha=0.0;	
		getSpr("bg1").alpha=0.0;	
		getSpr("bg2").alpha=0.0;	
	});	
	eh.funcModEvent(target1, 304, function() {
		getSpr("bg1").alpha=1.0;
		getSpr("heart").alpha=1.0;
	}, "bg1alpha");
	
	eh.funcModEvent(target1, 408, function() {
		getSpr("bg1").alpha=0.0;
		getSpr("heart").alpha=0.0;
	}, "bg1alpha");
	
	
	var heart = createSpr("heart", 'halved_assets/wiki_heart');
	heart.setGraphicSize(Std.int(heart.width * 0.4));
	heart.screenCenter();	
	heart.color = 0xFF777777;

	addUpdate(function(elapsed){
		var heartSize:Float = (FlxMath.fastSin(Conductor.instance.songPosition/1000 * 12)*0.5) ;
		heartSize *= 0.01;
		getSpr("heart").scale.set(0.43+heartSize,0.43 + heartSize);
	});
	
	
	eh.funcModEvent(target1, 482, function() {
		getSpr("bg1").alpha=0.25;
		getSpr("heart").alpha=0.4;
	}, "bg1alpha");
	

	
	
	var glitchBG:FlxSprite = new FlxSprite();
	glitchBG.frames = Paths.getSparrowAtlas('halved_assets/glitch_alt');	
	glitchBG.animation.addByPrefix('idle', 'alt', 12, true);	
	glitchBG.animation.play("idle");
	game.customLuaSprites.set("glitchBG", glitchBG);	
	glitchBG.scrollFactor.set();
	game.add(glitchBG);
	glitchBG.setGraphicSize(FlxG.width, FlxG.height);
	glitchBG.screenCenter();
	glitchBG.alpha = 0.0;
	
	addResetEvent(function(){
		getSpr("glitchBG").alpha=0.0;	
	});	
	eh.funcModEvent(target1, 611.5, function() {
		getSpr("glitchBG").alpha=0.44;
	}, "glitchBGfade");
	
	
	eh.funcTweenModEvent(target1, 676, 16,  ModConstants.getEaseFromString("outQuint"), 0.442, 0.0, function(v) {
		getSpr("glitchBG").alpha=v;	
	}, "glitchBGfade");
	
	
	var noise:FlxSprite = new FlxSprite();
	noise.frames = Paths.getSparrowAtlas('halved_assets/noise');	
	noise.animation.addByPrefix('idle', 'noise', 48, true);	
	noise.animation.play("idle");
	game.customLuaSprites.set("noise", noise);	
	noise.scrollFactor.set();
	game.add(noise);
	noise.setGraphicSize(FlxG.width, FlxG.height);
	noise.screenCenter();
	noise.alpha = 0.75;
	noise.color = 0xFFFF0000;
	
	addResetEvent(function(){
		getSpr("noise").alpha=0.75;	
		getSpr("noise").color=0xFFFF0000;
	});	
	
	eh.funcTweenModEvent(target1, 220, 4,  ModConstants.getEaseFromString("backIn"), 0.75, 0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseFade");
	
	
	eh.funcModEvent(target1, 408, function() {
		getSpr("noise").alpha=0.7;
	}, "noiseFade");
	
	eh.funcModEvent(target1, 390, function() {
		getSpr("noise").color=0xFFFFFFFF;
	}, "noiseFade");
	
	eh.funcTweenModEvent(target1, 400, 4,  ModConstants.getEaseFromString("linear"), 0.0, 1, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseFade");
	
	eh.funcTweenModEvent(target1, 404, 4,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseFade");
	
	eh.funcModEvent(target1, 472, function() {
		getSpr("noise").color=0xFFFFFFFF;
		getSpr("noise").alpha=0.05;
	}, "noiseFade");
	
	eh.funcModEvent(target1, 482.9, function() {
		getSpr("noise").color=0xFFFF0000;
		getSpr("noise").alpha=0.4;
	}, "noiseFade");
	
	

	var scrolling1:FlxTiledSprite = new FlxTiledSprite(null, 388, FlxG.height, true, true);
	scrolling1.loadGraphic(Paths.image("halved_assets/repeatingTiles1"));
	PlayState.instance.add(scrolling1);
	scrolling1.scrollFactor.set();
	scrolling1.screenCenter();
	PlayState.instance.customLuaSprites.set("scrollingback1", scrolling1);
	scrolling1.x = 0;
	
	
	var scrolling2:FlxTiledSprite = new FlxTiledSprite(null, 388, FlxG.height, true, true);
	scrolling2.loadGraphic(Paths.image("halved_assets/repeatingTiles1"));
	PlayState.instance.add(scrolling2);
	scrolling2.scrollFactor.set();
	scrolling2.screenCenter();
	PlayState.instance.customLuaSprites.set("scrollingback2", scrolling2);
	
	addResetEvent(function(){
		getSpr("scrollingback1").alpha = 0;
		getSpr("scrollingback2").alpha = 0;
	});	
	
	addUpdate(function(elapsed){
		getSpr("scrollingback1").scrollY = Conductor.instance.songPosition*-2.1;
		getSpr("scrollingback2").scrollY = (Conductor.instance.songPosition*-2.098) + 900;
	});	
	scrolling2.x = FlxG.width - 388;
	
	eh.funcTweenModEvent(target1, 160, 2,  ModConstants.getEaseFromString("outExpo"), 0.0, 0.75, function(v) {
		getSpr("scrollingback1").alpha = v;
		getSpr("scrollingback2").alpha = v;
	}, "scrollingRunes");
	
	eh.funcTweenModEvent(target1, 220, 4,  ModConstants.getEaseFromString("inOutQuad"), 0.75, 0.0, function(v) {
		getSpr("scrollingback1").alpha = v;
		getSpr("scrollingback2").alpha = v;
	}, "scrollingRunes");
	
	
	
	var introthingy1 = createSpr("introthingy1", 'halved_assets/intro');
	introthingy1.setGraphicSize(Std.int(introthingy1.width * 0.45));
	introthingy1.screenCenter();	
	introthingy1.camera = game.camHUD;
	introthingy1.alpha=1;
	introthingy1.x -= 75;
	
	var introthingy2 = createSpr("introthingy2", 'halved_assets/intro');
	introthingy2.setGraphicSize(Std.int(introthingy2.width * 0.45));
	introthingy2.screenCenter();	
	introthingy2.camera = game.camHUD;
	introthingy2.alpha=1;
	introthingy2.y += 75;
	introthingy2.angle = 90;
	
	var introthingy3 = createSpr("introthingy3", 'halved_assets/intro');
	introthingy3.setGraphicSize(Std.int(introthingy3.width * 0.45));
	introthingy3.screenCenter();	
	introthingy3.camera = game.camHUD;
	introthingy3.alpha=1;
	introthingy3.x += 75;
	introthingy3.y += 150;
	
	
	introthingy1.y -= 100;
	introthingy2.y -= 100;
	introthingy3.y -= 100;
	
	addResetEvent(function(){
		getSpr("introthingy1").alpha=0;	
		getSpr("introthingy2").alpha=0;	
		getSpr("introthingy3").alpha=0;	
	});	
	
	eh.funcTweenModEvent(target1, 157.35, 0.5,  ModConstants.getEaseFromString("inOutQuad"), 0.0, 0.9, function(v) {
		getSpr("introthingy1").alpha=v;		
	}, "???1");
	
	eh.funcTweenModEvent(target1, 158.6-0.4, 0.3,  ModConstants.getEaseFromString("inOutQuad"), 0.0, 0.9, function(v) {
		getSpr("introthingy2").alpha=v;		
	}, "???2");
	
	eh.funcTweenModEvent(target1, 159.4-0.5, 0.3,  ModConstants.getEaseFromString("inOutQuad"), 0.0, 0.9, function(v) {
		getSpr("introthingy3").alpha=v;		
	}, "???3");
	
	eh.funcTweenModEvent(target1, 160, 0.3,  ModConstants.getEaseFromString("inOutQuad"), 0.9, 0.0, function(v) {
		getSpr("introthingy1").alpha=v;		
		getSpr("introthingy2").alpha=v;		
		getSpr("introthingy3").alpha=v;		
	}, "???4");
	
	
	
	eh.funcTweenModEvent(target1, 157.35+252, 0.5,  ModConstants.getEaseFromString("inOutQuad"), 0.0, 0.9, function(v) {
		getSpr("introthingy1").alpha=v;		
	}, "???1");
	
	eh.funcTweenModEvent(target1, 158.6-0.4+252, 0.3,  ModConstants.getEaseFromString("inOutQuad"), 0.0, 0.9, function(v) {
		getSpr("introthingy2").alpha=v;		
	}, "???2");
	
	eh.funcTweenModEvent(target1, 159.4-0.5+252, 0.3,  ModConstants.getEaseFromString("inOutQuad"), 0.0, 0.9, function(v) {
		getSpr("introthingy3").alpha=v;		
	}, "???3");
	
	eh.funcTweenModEvent(target1, 160+252, 0.3,  ModConstants.getEaseFromString("inOutQuad"), 0.9, 0.0, function(v) {
		getSpr("introthingy1").alpha=v;		
		getSpr("introthingy2").alpha=v;		
		getSpr("introthingy3").alpha=v;		
	}, "???4");
	
	

	
	var blackout = createSpr("blackout", 'halved_assets/black');
	blackout.setGraphicSize(FlxG.width, FlxG.height);
	blackout.screenCenter();	
	blackout.camera = game.camHUD;
	blackout.alpha=1;
	
	addResetEvent(function(){
		getSpr("blackout").alpha=1;	
		getSpr("utopiatxt").alpha=0;	
		getSpr("nathan").alpha=0;	
	});	
	
	eh.funcTweenModEvent(target1, 0, 4,  ModConstants.getEaseFromString("cubeOut"), 1, 0, function(v) {
		getSpr("blackout").alpha=v;		
	}, "blackout");
	
	
	eh.funcTweenModEvent(target1, 401, 3,  ModConstants.getEaseFromString("inExpo"), 0.0, 1.0, function(v) {
		getSpr("blackout").alpha=v;	
	}, "blackout");
	
	eh.funcTweenModEvent(target1, 409.5, 0.25,  ModConstants.getEaseFromString("inExpo"), 1.0, 0.0, function(v) {
		getSpr("blackout").alpha=v;	
	}, "blackout");
	
	
	eh.funcTweenModEvent(target1, 471.95, 0.05,  ModConstants.getEaseFromString("outExpo"), 0.0, 1.0, function(v) {
		getSpr("blackout").alpha=v;	
	}, "blackout");
	
	eh.funcTweenModEvent(target1, 482.9, 1,  ModConstants.getEaseFromString("outExpo"), 1.0, 0.0, function(v) {
		getSpr("blackout").alpha=v;	
	}, "blackout");
	
	eh.funcTweenModEvent(target1, 692, 1,  ModConstants.getEaseFromString("linear"), 0.0, 1.0, function(v) {
		getSpr("blackout").alpha=v;	
	}, "blackout");
	
	
	var nathan = createSpr("nathan", 'halved_assets/notitg_vers/nathan');
	nathan.screenCenter();	
	nathan.camera = game.camHUD;
	nathan.alpha=1;
	
	var utopiatxt = createSpr("utopiatxt", 'halved_assets/spookytxt');
	utopiatxt.screenCenter();	
	utopiatxt.camera = game.camHUD;
	utopiatxt.alpha=1;
	
	eh.funcTweenModEvent(target1, 472, 0.05,  ModConstants.getEaseFromString("linear"), 0.0, 0.2, function(v) {
		getSpr("nathan").alpha=v*0.1;	
		getSpr("utopiatxt").alpha=v;	
	}, "utopiatxt");
	
	eh.funcTweenModEvent(target1, 479, 1,  ModConstants.getEaseFromString("inQuad"), 0.2, 0.0, function(v) {
		getSpr("nathan").alpha=v*0.1;	
		getSpr("utopiatxt").alpha=v;	
	}, "utopiatxt");
	
	
	
	var hazard:FlxSprite = new FlxSprite();
	hazard.frames = Paths.getSparrowAtlas('halved_assets/glitch');	
	hazard.animation.addByPrefix('idle', 'Idle', 18, true);	
	hazard.animation.play("idle");
	game.customLuaSprites.set("glitch", hazard);
	hazard.scrollFactor.set();
	game.add(hazard);
	hazard.setGraphicSize(FlxG.width, FlxG.height);
	hazard.screenCenter();
	hazard.alpha = 0;
	hazard.camera = game.camHUD;
	addResetEvent(function(){
		getSpr("glitch").alpha=0;	
	});	
	
	
	eh.funcTweenModEvent(target1, 546.5, 0.25,  ModConstants.getEaseFromString("inOutCubic"), 0.0, 1.0, function(v) {
		getSpr("glitch").alpha=v;		
	}, "glitch_Fade");
	
	eh.funcTweenModEvent(target1, 548, 0.25,  ModConstants.getEaseFromString("outExpo"), 1.0, 0.0, function(v) {
		getSpr("glitch").alpha=v;		
	}, "glitch_Fade");
	
	
	eh.funcTweenModEvent(target1, 611, 0.25,  ModConstants.getEaseFromString("inOutCubic"), 0.0, 1.0, function(v) {
		getSpr("glitch").alpha=v;		
	}, "glitch_Fade");
	
	eh.funcTweenModEvent(target1, 612, 0.25,  ModConstants.getEaseFromString("outExpo"), 1.0, 0.0, function(v) {
		getSpr("glitch").alpha=v;		
	}, "glitch_Fade");

		
	]])

end



function modsTimeline()	
	stageSetup()
	
	local targetTo = 0.1
	local targetEnd = 0.9
	
	
	ease(217, 1, "linear", targetTo, "tileModAnimate", "bf")
	
	for i = 220, 304-4 , 4 do
	
		add(i, 2, "inExpo", targetEnd-targetTo, "tileModAnimate", "bf")
		add(i+2, 2, "inExpo", (targetEnd-targetTo)*-1, "tileModAnimate", "bf")
		
		add(i+2, 3, "pop", -0.22, "tileModAnimate", "bf")
		add(i+4, 3, "pop", 0.22, "tileModAnimate", "bf")

	
	end
end
