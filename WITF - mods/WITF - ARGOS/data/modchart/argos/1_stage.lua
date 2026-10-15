function stageSetup()	
	
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FlxTypeText", "flixel.addons.text")
	--addHaxeLibrary("FlxTrail", "flixel.addons.effects")
	addHaxeLibrary("FunkTrail", "funkin.effects")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	--Stage setup
	runHaxeCode(
	[[
	
	//Change this to true if you wanna reduce bloom quality lol
	var lowerQualityShaders = false;
	
	
	
	var target1 = PlayState.instance.playerStrumline.mods;	
	var doShaders = true;
	//Shader setup!
	
	var reduceBloomIt:Int = 0;
	var reduceBloomSubdivs:Int = 0;
	if(lowerQualityShaders){
		reduceBloomIt = 1;
		reduceBloomSubdivs = 4;
	}
	
	var bloomShader = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/bloom")), null);
	bloomShader.setFloat('BLOOM_INTENSITY', 1.0);
	bloomShader.setFloat('BLOOM_THRESHOLD', 0.56);
	bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
	bloomShader.setFloat('BLUR_SIZE', 0.029);
	bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
	
	bloomShader.setBool('BLOOM_ONLY', false);
	
	
	
	addResetEvent(function(){
		bloomShader.setFloat('BLOOM_INTENSITY', 1.0);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.56);
		bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
		bloomShader.setFloat('BLUR_SIZE', 0.025);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
		bloomShader.setBool('BLOOM_ONLY', false);
	});	
	
	eh.funcModEvent(target1, 259, function() {
		bloomShader.setBool('BLOOM_ONLY', true);
	});
	eh.funcModEvent(target1, 264, function() {
		bloomShader.setBool('BLOOM_ONLY', false);
	});
	
	eh.funcModEvent(target1, 49.5, function() {
		bloomShader.setFloat('BLOOM_INTENSITY', 1.85);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.51);
		bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
		bloomShader.setFloat('BLUR_SIZE', 0.032);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 28-reduceBloomSubdivs);
	}, "bloomShaderSettings");
	
	eh.funcModEvent(target1, 88, function() {
		bloomShader.setFloat('BLOOM_INTENSITY', 1.7);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.53);
		bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
		bloomShader.setFloat('BLUR_SIZE', 0.031);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 26-reduceBloomSubdivs);
	}, "bloomShaderSettings");
	
	eh.funcModEvent(target1, 183.98, function() {
		bloomShader.setFloat('BLOOM_INTENSITY', 1.45);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.55);
		bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
		bloomShader.setFloat('BLUR_SIZE', 0.03);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
	}, "bloomShaderSettings");
	
	eh.funcModEvent(target1, 248, function() {
		bloomShader.setFloat('BLOOM_INTENSITY', 1.1);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.55);
		bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
		bloomShader.setFloat('BLUR_SIZE', 0.025);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
	}, "bloomShaderSettings");
	
	eh.funcModEvent(target1, 312, function() {
		bloomShader.setFloat('BLOOM_INTENSITY', 1.2);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.45);
		bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
		bloomShader.setFloat('BLUR_SIZE', 0.026);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
	}, "bloomShaderSettings");
	
	eh.funcModEvent(target1, 377.859, function() {
		bloomShader.setFloat('BLOOM_INTENSITY', 1.25);
		bloomShader.setFloat('BLOOM_THRESHOLD', 0.5);
		bloomShader.setInt('BLUR_ITERATIONS', 3-reduceBloomIt);
		bloomShader.setFloat('BLUR_SIZE', 0.0265);
		bloomShader.setInt('BLUR_SUBDIVISIONS', 24-reduceBloomSubdivs);
	}, "bloomShaderSettings");
	
	eh.funcTweenModEvent(target1, 440, 4,  ModConstants.getEaseFromString("outSine"), 1.25, 1.7, function(v) {
		bloomShader.setFloat('BLOOM_INTENSITY', v);
	}, "bloomShaderSettings");
	
	
	
	var invertShader = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/haz_invertCol")), null);
	invertShader.setFloat('_active', 0.0);
	addResetEvent(function(){
		invertShader.setFloat('_active', 0.0);
	});	
	
	eh.funcModEvent(target1, 252.5, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 253.5, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 254.5, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 255, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 256.75, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 257, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 258, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 258.25, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	
	eh.funcModEvent(target1, 259.3, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	eh.funcModEvent(target1, 260, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	
	
	
	eh.funcModEvent(target1, 383, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	eh.funcModEvent(target1, 383.5, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 395-0.09, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	eh.funcModEvent(target1, 396-0.05, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 399, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	eh.funcModEvent(target1, 399.5, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 415.7, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 416.2, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	
	eh.funcModEvent(target1, 423.5, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 424, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	
	eh.funcModEvent(target1, 436, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 436.5, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 437.5, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 438.5, function() {
		invertShader.setFloat('_active', 0.0);
	}, "invertCols");
	
	eh.funcModEvent(target1, 439.5, function() {
		invertShader.setFloat('_active', 1.0);
	}, "invertCols");
	
	
	
	eh.funcTweenModEvent(target1, 376, 3,  ModConstants.getEaseFromString("outCubic"), 1, 0, function(v) {
		invertShader.setFloat('_active', v);
	}, "invertCols");
	
	eh.funcTweenModEvent(target1, 378, 0.1,  ModConstants.getEaseFromString("instant"), 0.01, 0, function(v) {
		invertShader.setFloat('_active', v);
	}, "invertCols");
	
	eh.funcTweenModEvent(target1, 440, 4,  ModConstants.getEaseFromString("outSine"), 1, 0, function(v) {
		invertShader.setFloat('_active', v);
	}, "invertCols");
	
	
	var scrollShader = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/haz_looping")), null);
	scrollShader.setFloat('scrollX', 0.0);
	scrollShader.setFloat('scrollY', 0.0);
	
	var scrollX:CustomModifier = createCustomMod("scrollx", 0.0);
	scrollX.modPriority = -9990+1;
	scrollX.strumsMod = false;
    scrollX.notesMod = false;
    scrollX.holdsMod = false;
    scrollX.pathMod = false;
    scrollX.specialMod = true;
    scrollX.speedMod = false;
	scrollX.unknown = false;
	eh.addCustomMod("bf", scrollX);
	scrollX.specialMath = function() {
		scrollShader.setFloat('scrollX', scrollX.currentValue);
	};
	
	
	var glitch2 = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/glitch2")), null);
	glitch2.setFloat('amount', 0.0);
	if(!lowerQualityShaders){
		glitch2.setInt('NUM_SAMPLES', 18);
	}else{
		glitch2.setInt('NUM_SAMPLES', 14);
	}
	
	
	
	addUpdate(function(elapsed){
		glitch2.setFloat('uTime', Conductor.instance.songPosition/1000*2);
	});	
	
	var glitch2Mod:CustomModifier = createCustomMod("glitch2", 0.01);
	glitch2Mod.modPriority = -9990;
	glitch2Mod.strumsMod = false;
    glitch2Mod.notesMod = false;
    glitch2Mod.holdsMod = false;
    glitch2Mod.pathMod = false;
    glitch2Mod.specialMod = true;
    glitch2Mod.speedMod = false;
	glitch2Mod.unknown = false;
	eh.addCustomMod("bf", glitch2Mod);
	glitch2Mod.specialMath = function() {
		glitch2.setFloat('amount', glitch2Mod.currentValue);
	};
	
	
	
	var glitchLinesShader = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/glitch-lines")), null);
	glitchLinesShader.setFloat('amount', 0.0);
	addUpdate(function(elapsed){
		glitchLinesShader.setFloat('uTime', Conductor.instance.songPosition/1000);
	});	
	
	var glitchLinesMod:CustomModifier = createCustomMod("glitchLines", 0.00);
	glitchLinesMod.modPriority = -9990;
	glitchLinesMod.strumsMod = false;
    glitchLinesMod.notesMod = false;
    glitchLinesMod.holdsMod = false;
    glitchLinesMod.pathMod = false;
    glitchLinesMod.specialMod = true;
    glitchLinesMod.speedMod = false;
    glitchLinesMod.unknown = false;
	eh.addCustomMod("bf", glitchLinesMod);
	glitchLinesMod.specialMath = function() {
		glitchLinesShader.setFloat('amount', glitchLinesMod.currentValue);
	};
	
	
	
	
	
	var fisheye = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/fisheye")), null);
	fisheye.setFloat('amount', 0.5);
	var fishEyeMod:CustomModifier = createCustomMod("fisheye", 0.01);
	fishEyeMod.modPriority = -9990;
	fishEyeMod.strumsMod = false;
    fishEyeMod.notesMod = false;
    fishEyeMod.holdsMod = false;
    fishEyeMod.pathMod = false;
    fishEyeMod.specialMod = true;
    fishEyeMod.speedMod = false;
	fishEyeMod.unknown = false;
	eh.addCustomMod("bf", fishEyeMod);
	fishEyeMod.specialMath = function() {
		fisheye.setFloat('amount', fishEyeMod.currentValue);
	};
	
	
	var glitchbars = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/haz_glitchBars")), null);
	glitchbars.setBool('_active', false);
	glitchbars.setInt('loops', 8);

	
	addUpdate(function(elapsed){
		glitchbars.setFloat('uTime', Conductor.instance.songPosition/1000);
	});	
	addResetEvent(function(){
		glitchbars.setBool('_active', false);
		glitchbars.setInt('loops', 8);
	});	
	
	eh.funcModEvent(target1, 46, function() {
		glitchbars.setBool('_active', true);
	});
	eh.funcModEvent(target1, 48, function() {
		glitchbars.setBool('_active', false);
	});
	
	
	eh.funcModEvent(target1, 115.9, function() {
		glitchbars.setBool('_active', true);
	});
	eh.funcModEvent(target1, 118, function() {
		glitchbars.setBool('_active', false);
	});
	
	eh.funcModEvent(target1, 256, function() {
		glitchbars.setBool('_active', true);
		glitchbars.setInt('loops', 6);
	});
	eh.funcModEvent(target1, 264, function() {
		glitchbars.setBool('_active', false);
	});
	eh.funcModEvent(target1, 304.95, function() {
		glitchbars.setBool('_active', true);
	});
	eh.funcModEvent(target1, 306.01, function() {
		glitchbars.setBool('_active', false);
	});
	
	eh.funcModEvent(target1, 312, function() {
		glitchbars.setBool('_active', true);
	});
	eh.funcModEvent(target1, 316, function() {
		glitchbars.setBool('_active', false);
	});
	eh.funcModEvent(target1, 379.95, function() {
		glitchbars.setBool('_active', true);
		glitchbars.setInt('loops', 4);
	});
	eh.funcModEvent(target1, 440, function() {
		glitchbars.setBool('_active', false);
	});
	eh.funcModEvent(target1, 474, function() {
		glitchbars.setBool('_active', true);
	});
	eh.funcModEvent(target1, 475, function() {
		glitchbars.setInt('loops', 10);
	});
	
	

	var aberration = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/aberration distortion")), null);
	aberration.setFloat('amount', 0.0);
	var aberrationMod:CustomModifier = createCustomMod("aberration", 0.0);
	aberrationMod.modPriority = -9998;
	aberrationMod.strumsMod = false;
    aberrationMod.notesMod = false;
    aberrationMod.holdsMod = false;
    aberrationMod.pathMod = false;
    aberrationMod.specialMod = true;
    aberrationMod.speedMod = false;
	aberrationMod.unknown = false;
	eh.addCustomMod("bf", aberrationMod);
	aberrationMod.specialMath = function() {
		aberration.setFloat('amount', aberrationMod.currentValue);
	};
	

	
	var glitchfuck = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/argos_glitchfrag")), null);
	glitchfuck.setFloat('amount', 0.0);
	addUpdate(function(elapsed){
		glitchfuck.setFloat('uTime', Conductor.instance.songPosition / 1000);
	});	
	
	eh.funcModEvent(target1, 44, function() {
		glitchfuck.setFloat('amount', 1.0);
	}, "glitchfuck");
	eh.funcModEvent(target1, 48, function() {
		glitchfuck.setFloat('amount', 0.0);
	}, "glitchfuck");
	eh.funcModEvent(target1, 472, function() {
		glitchfuck.setFloat('amount', 1.0);
	}, "glitchfuck");
	
	eh.funcModEvent(target1, 312.8, function() {
		glitchfuck.setFloat('amount', 1.0);
	}, "glitchfuck");
	eh.funcModEvent(target1, 314.02, function() {
		glitchfuck.setFloat('amount', 0.0);
	}, "glitchfuck");
	
	
	var vcr = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/vcr")), null);
	
	vcr.setFloat('iTime', 0.0);
	vcr.setFloat('glitchModifier', 0.1);
	vcr.setBool('vignetteOn', true);
	vcr.setBool('perspectiveOn', true);
	vcr.setBool('distortionOn', true);
	vcr.setBool('scanlinesOn', true);
	vcr.setBool('vignetteMoving', true);
	vcr.setBool('alphaCorrect', true);
	addUpdate(function(elapsed){
		vcr.setFloat('iTime', Conductor.instance.songPosition / 1000);
	});	
	
	var vcrGlitchAmountModifier:CustomModifier = createCustomMod("vcrglitch", 0.07);
	vcrGlitchAmountModifier.modPriority = -9990;
	vcrGlitchAmountModifier.strumsMod = false;
    vcrGlitchAmountModifier.notesMod = false;
    vcrGlitchAmountModifier.holdsMod = false;
    vcrGlitchAmountModifier.pathMod = false;
    vcrGlitchAmountModifier.specialMod = true;
    vcrGlitchAmountModifier.speedMod = false;
	vcrGlitchAmountModifier.unknown = false;
	eh.addCustomMod("bf", vcrGlitchAmountModifier);
	vcrGlitchAmountModifier.specialMath = function() {
		vcr.setFloat('glitchModifier', vcrGlitchAmountModifier.currentValue);
	};
	
	
	
	
	

	var perspectiveShader = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/psych_3d")), null);
	perspectiveShader.setFloat('xrot', 0);
	perspectiveShader.setFloat('yrot', Math.PI);
	perspectiveShader.setFloat('zrot', 0);
	perspectiveShader.setFloat('xpos', 0);
	perspectiveShader.setFloat('ypos', 0);
	perspectiveShader.setFloat('dept', 0.5);
	perspectiveShader.setBool('_active', false);
	
	addResetEvent(function(){
		perspectiveShader.setFloat('xrot', 0);
		perspectiveShader.setFloat('yrot', Math.PI);
		perspectiveShader.setFloat('zrot', 0);
		perspectiveShader.setFloat('xpos', 0);
		perspectiveShader.setFloat('ypos', 0);
		perspectiveShader.setFloat('dept', 0.5);
		perspectiveShader.setBool('_active', false);
	});	
	
	eh.funcModEvent(target1, 120, function() {
		perspectiveShader.setBool('_active', true);
	});
	
	eh.funcModEvent(target1, 184, function() {
		perspectiveShader.setBool('_active', false);
	});
	
	eh.funcTweenModEvent(target1, 120, 16,  ModConstants.getEaseFromString("quadOut"), 0.2, 0.77, function(v) {
		perspectiveShader.setFloat('xrot', v);
	}, "perspective_rotx");
	
	eh.funcTweenModEvent(target1, 120, 16+8,  ModConstants.getEaseFromString("quadOut"), Math.PI, Math.PI+0.1, function(v) {
		perspectiveShader.setFloat('yrot', v);
	}, "perspective_roty");
	
	eh.funcTweenModEvent(target1, 120, 16+16,  ModConstants.getEaseFromString("quadOut"), -0.1, 0.25, function(v) {
		perspectiveShader.setFloat('zrot', v);
	}, "perspective_rotz");
	
	eh.funcTweenModEvent(target1, 152, 16+16,  ModConstants.getEaseFromString("quadOut"), Math.PI+0.1, Math.PI-0.31, function(v) {
		perspectiveShader.setFloat('yrot', v);
	}, "perspective_roty");
	
	eh.funcTweenModEvent(target1, 152, 16+16,  ModConstants.getEaseFromString("quadOut"), 0.25, -0.4, function(v) {
		perspectiveShader.setFloat('zrot', v);
	}, "perspective_rotz");
	
	eh.funcTweenModEvent(target1, 174, 183-174,  ModConstants.getEaseFromString("quadIn"), 0.77, 0.39, function(v) {
		perspectiveShader.setFloat('xrot', v);
	}, "perspective_rotx");
	
	eh.funcTweenModEvent(target1, 183, 1,  ModConstants.getEaseFromString("quadOut"), Math.PI-0.31, Math.PI*3, function(v) {
		perspectiveShader.setFloat('yrot', v);
	}, "perspective_roty");
	
	eh.funcTweenModEvent(target1, 183, 1,  ModConstants.getEaseFromString("quadOut"), 0.39, 0, function(v) {
		perspectiveShader.setFloat('xrot', v);
	}, "perspective_rotx");
	
	eh.funcTweenModEvent(target1, 183, 1,  ModConstants.getEaseFromString("quadOut"),-0.4, 0, function(v) {
		perspectiveShader.setFloat('zrot', v);
	}, "perspective_rotz");
	
	
	
	
	var newCamEffects:Array<BitmapFilter>=[];
	newCamEffects.push(new ShaderFilter(scrollShader));
	newCamEffects.push(new ShaderFilter(perspectiveShader));
	newCamEffects.push(new ShaderFilter(invertShader));
	newCamEffects.push(new ShaderFilter(aberration));
	newCamEffects.push(new ShaderFilter(glitchbars));
	newCamEffects.push(new ShaderFilter(vcr));
	//newCamEffects.push(new ShaderFilter(bloomShader));
	newCamEffects.push(new ShaderFilter(fisheye));
	newCamEffects.push(new ShaderFilter(glitchfuck));
	newCamEffects.push(new ShaderFilter(glitch2));
	newCamEffects.push(new ShaderFilter(glitchLinesShader));
	
	
	if(doShaders){
		game.camHUD.filters=newCamEffects;
		game.camNotes.filters=newCamEffects;
	}
	
	
	
	var fakeCamShader = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/haz_cam")), null);
	fakeCamShader.setFloat('zoom', 1.0);
	fakeCamShader.setFloat('angle', 0.0);
	var fakeCamAngle:CustomModifier = createCustomMod("fakeCamAngle", 0.0);
	fakeCamAngle.modPriority = -9990;
	fakeCamAngle.strumsMod = false;
    fakeCamAngle.notesMod = false;
    fakeCamAngle.holdsMod = false;
    fakeCamAngle.pathMod = false;
    fakeCamAngle.specialMod = true;
    fakeCamAngle.speedMod = false;
	fakeCamAngle.unknown = false;
	eh.addCustomMod("bf", fakeCamAngle);
	fakeCamAngle.specialMath = function() {
		fakeCamShader.setFloat('angle', fakeCamAngle.currentValue);
	};
	var fakeCamZoom:CustomModifier = createCustomMod("fakeCamZoom", 1.0);
	fakeCamZoom.modPriority = -9990;
	fakeCamZoom.strumsMod = false;
    fakeCamZoom.notesMod = false;
    fakeCamZoom.holdsMod = false;
    fakeCamZoom.pathMod = false;
    fakeCamZoom.specialMod = true;
    fakeCamZoom.speedMod = false;
	fakeCamZoom.unknown = false;
	eh.addCustomMod("bf", fakeCamZoom);
	fakeCamZoom.specialMath = function() {
		fakeCamShader.setFloat('zoom', fakeCamZoom.currentValue);
	};
	
	var newCamEffects_back:Array<BitmapFilter>=[];
	newCamEffects_back.push(new ShaderFilter(fakeCamShader));
	newCamEffects_back.push(new ShaderFilter(perspectiveShader));
	newCamEffects_back.push(new ShaderFilter(scrollShader));
	newCamEffects_back.push(new ShaderFilter(invertShader));
	newCamEffects.push(new ShaderFilter(aberration));
	newCamEffects_back.push(new ShaderFilter(glitchbars));
	newCamEffects_back.push(new ShaderFilter(vcr));
	newCamEffects_back.push(new ShaderFilter(bloomShader));

	newCamEffects_back.push(new ShaderFilter(fisheye));
	newCamEffects_back.push(new ShaderFilter(glitchfuck));
	newCamEffects_back.push(new ShaderFilter(glitch2));
	newCamEffects_back.push(new ShaderFilter(glitchLinesShader));
	
	if(doShaders){
		game.camGame.filters = (newCamEffects_back);
	}else{
		var emptyEffects:Array<BitmapFilter>=[];
		game.camHUD.filters=(emptyEffects);
		game.camNotes.filters=(emptyEffects);
		game.camGame.filters=(emptyEffects);
	}

	
	
	
	var bg1 = createSpr("bg1", 'argos/bg1');
	bg1.setGraphicSize(FlxG.width, FlxG.height);
	bg1.screenCenter();	
	
	
	var bg3 = createSpr("bg3", 'argos/bg3');
	bg3.setGraphicSize(FlxG.width, FlxG.height);
	bg3.screenCenter();	
	bg3.visible = false;
	
	var wormsBG = createSpr("wormsBG", 'argos/white');
	wormsBG.setGraphicSize(FlxG.width, FlxG.height);
	wormsBG.screenCenter();	
	wormsBG.visible = false;
		
	var worms = new FlxRuntimeShader(Assets.getText(Paths.frag("argos/worms")), null);
	worms.setFloat('amount', 0.0);
	addUpdate(function(elapsed){
		worms.setFloat('iTime', Conductor.instance.songPosition/1000);
	});	
	
	wormsBG.shader = worms;
	

	var whitebg = createSpr("whitebg", 'argos/white');
	whitebg.setGraphicSize(FlxG.width, FlxG.height);
	whitebg.screenCenter();	
	whitebg.visible = false;
	
	
	var blobhead = createSpr("blobhead", 'argos/blob', false);
	game.customLuaSprites.set("blobhead", blobhead);
	blobhead.screenCenter();	
	blobhead.visible = false;
	blobhead.scale.set(0,0);
	
	
	var blobTRAIL = new FunkTrail(blobhead, Paths.image("argos/blob_trail"), 32, 1/60, 1.0, 0.1);
	game.customLuaSprites.set("blobTRAIL", blobTRAIL);
	
	blobTRAIL.scrollFactor.set();
	game.add(blobTRAIL);
	game.add(blobhead);
	
	
	addUpdate(function(elapsed){
		var blobby = getSpr("blobhead");
		blobby.y = (FlxG.height/2) - (blobby.height/2) + (FlxMath.fastSin(Conductor.instance.songPosition/1000 * 3.14 * 1.6) * 120);		
		blobby.angle = Conductor.instance.songPosition/1000 * 70;
		
		getSpr("blobTRAIL").visible = blobby.visible;
	});	
	
	eh.funcTweenModEvent(target1, 54, 19,  ModConstants.getEaseFromString("quadInOut"), 200, FlxG.width - 300, function(v) {
		getSpr("blobhead").x=v;		
	}, "blobxmove");
	
	
	
	
	
	
	//idfk?
	
	var timingOffset:Float = -0.36;
	var watback1 = createSpr("watback1", 'argos/wat');
	watback1.screenCenter();	
	watback1.scale.set(0.53,0.6);
	watback1.y += 97;
	watback1.angle = 13;
	watback1.x += 28;
	
	for (i in 103...121)
	{	
		if(i%2 == 0){
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.45, 0.59, function(v) {
				getSpr("watback1").scale.y = v;
			}, "watback1Scale");
		}else{
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.59, 0.45, function(v) {
				getSpr("watback1").scale.y = v;
			}, "watback1Scale");
		}
	}
	
	timingOffset = 0.419;
	var watback2 = createSpr("watback2", 'argos/wat');
	watback2.screenCenter();	
	watback2.scale.set(0.53,0.6);
	watback2.y += 90;
	watback2.angle = -8;
	watback2.x -= 10;
	
	for (i in 104...120)
	{	
		if(i%2 == 0){
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.45, 0.59, function(v) {
				getSpr("watback2").scale.y = v;
			}, "watback2Scale");
		}else{
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.59, 0.45, function(v) {
				getSpr("watback2").scale.y = v;
			}, "watback2Scale");
		}
	}
	
	timingOffset = -0.2;
	var wat1 = createSpr("wat1", 'argos/wat');
	wat1.screenCenter();	
	wat1.scale.set(0.58,0.6);
	wat1.y += 100;
	wat1.angle = -27;
	wat1.x -= 42;
	
	for (i in 104...120)
	{	
		if(i%2 == 0){
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.45, 0.59, function(v) {
				getSpr("wat1").scale.y = v;
			}, "wat1Scale");
		}else{
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.59, 0.45, function(v) {
				getSpr("wat1").scale.y = v;
			}, "wat1Scale");
		}
	}
	
	timingOffset = 0.2;
	var wat2 = createSpr("wat2", 'argos/wat');
	wat2.screenCenter();	
	wat2.scale.set(0.63,0.6);
	wat2.y += 100;
	wat2.angle = 29;
	wat2.x += 49;
	
	for (i in 104...120)
	{	
		if(i%2 == 0){
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.46, 0.6, function(v) {
				getSpr("wat2").scale.y = v;
			}, "wat2Scale");
		}else{
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.6, 0.46, function(v) {
				getSpr("wat2").scale.y = v;
			}, "wat2Scale");
		}
	}
	timingOffset = 0.0;
	var wat_test = createSpr("wat_test", 'argos/wat');
	wat_test.screenCenter();	
	wat_test.scale.set(0.5,0.5);
	wat_test.y += 122;
	wat_test.x += 11;
	wat_test.angle = 9;
	
	for (i in 104...120)
	{	
		if(i%2 == 0){
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.4, 0.5, function(v) {
				getSpr("wat_test").scale.y = v;
			}, "watTestScale");
		}else{
			eh.funcTweenModEvent(target1, i-timingOffset, 1,  ModConstants.getEaseFromString("outElastic"), 0.5, 0.4, function(v) {
				getSpr("wat_test").scale.y = v;
			}, "watTestScale");
		}
	}
	
	watback1.y += 50;
	watback2.y += 50;
	wat_test.y += 50;
	wat1.y += 50;
	wat2.y += 50;
	
	watback1.visible = false;
	watback2.visible = false;
	wat_test.visible = false;
	wat1.visible = false;
	wat2.visible = false;
	
	addResetEvent(function(){
		getSpr("wat_test").visible=false;
		getSpr("wat1").visible=false;
		getSpr("wat2").visible=false;
		getSpr("watback2").visible=false;
		getSpr("watback1").visible=false;
	});	
	
	eh.funcModEvent(target1, 104, function() {
		getSpr("wat_test").visible=true;
		getSpr("wat1").visible=true;
		getSpr("wat2").visible=true;
		getSpr("watback2").visible=true;
		getSpr("watback1").visible=true;
	});
	eh.funcModEvent(target1, 120, function() {
		getSpr("wat_test").visible=false;
		getSpr("wat1").visible=false;
		getSpr("wat2").visible=false;
		getSpr("watback2").visible=false;
		getSpr("watback1").visible=false;
	});
	
	
	
	
	
	
	var accesstext = createSpr("ACCESS", 'argos/txt');
	//accesstext.setGraphicSize(Std.int(accesstext.width * 2));
	accesstext.screenCenter();		
	addResetEvent(function(){
		var a = getSpr("ACCESS");
		a.alpha=0;	
		a.scale.x=0;	
		a.scale.y=0;	
		a.angle=0;	
	});	
	
	eh.funcTweenModEvent(target1, 50, 2,  ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
		getSpr("ACCESS").alpha = v;	
	}, "access_Alpha");
	
	eh.funcTweenModEvent(target1, 50, 2,  ModConstants.getEaseFromString("cubeIn"), 0, 2, function(v) {
		getSpr("ACCESS").scale.y = v;	
	}, "access_scaleY");
	
	eh.funcTweenModEvent(target1, 52, 4,  ModConstants.getEaseFromString("expoOut"), 2, 2.3, function(v) {
		getSpr("ACCESS").scale.y = v;	
	}, "access_scaleY");
	
	eh.funcTweenModEvent(target1, 50, 2,  ModConstants.getEaseFromString("cubeIn"), -5, -2, function(v) {
		getSpr("ACCESS").scale.x = v;	
	}, "access_scaleX");
	
	eh.funcTweenModEvent(target1, 52, 2,  ModConstants.getEaseFromString("backOut"), -2, 2, function(v) {
		getSpr("ACCESS").scale.x = v;	
	}, "access_scaleX");
	
	eh.funcTweenModEvent(target1, 54, 2,  ModConstants.getEaseFromString("outSine"), 1, 0, function(v) {
		getSpr("ACCESS").alpha = v;	
	}, "access_Alpha");
	
	
	
	
	var blobContain = createSpr("blobContainer", 'argos/bgcontainer');
	blobContain.setGraphicSize(FlxG.width, FlxG.height);
	blobContain.screenCenter();	
	blobContain.visible = false;
	

	var symbol1 = createSpr("symbol1", 'argos/symbol1');
	symbol1.setGraphicSize(Std.int(symbol1.width * 0.74));
	symbol1.screenCenter();	
	symbol1.visible = false;
	symbol1.y += 50;
	
	var symbol2 = createSpr("symbol2", 'argos/symbol2');
	symbol2.setGraphicSize(Std.int(symbol2.width * 0.78));
	symbol2.x = FlxG.width - symbol2.width - 40;
	symbol2.y = 40; 
	symbol2.visible = false;
	
	var symbol2_big = createSpr("symbol2_big", 'argos/symbol2');
	symbol2_big.setGraphicSize(Std.int(symbol2_big.width * 1.35));
	symbol2_big.x = FlxG.width - symbol2.width - 40;
	symbol2_big.y = 40 + symbol2.height - 80; 
	symbol2_big.visible = false;
	
	var symbol2_bigger = createSpr("symbol2_bigger", 'argos/symbol2');
	symbol2_bigger.setGraphicSize(Std.int(symbol2_bigger.width * 2.4));
	symbol2_bigger.x = FlxG.width - symbol2.width - 40 - 20;
	symbol2_bigger.y = 40 + symbol2.height + 58; 
	symbol2_bigger.visible = false;
	
	var video_screenshot1 = createSpr("video_screenshot1", 'argos/video_screenshot1');
	video_screenshot1.setGraphicSize(FlxG.width, FlxG.height);
	video_screenshot1.screenCenter();	
	video_screenshot1.visible = false;
	var video_screenshot2 = createSpr("video_screenshot2", 'argos/video_screenshot2');
	video_screenshot2.setGraphicSize(FlxG.width, FlxG.height);
	video_screenshot2.screenCenter();	
	video_screenshot2.visible = false;
	var video_screenshot3 = createSpr("video_screenshot3", 'argos/video_screenshot3');
	video_screenshot3.setGraphicSize(FlxG.width, FlxG.height);
	video_screenshot3.screenCenter();	
	video_screenshot3.visible = false;
	var video_screenshot4 = createSpr("video_screenshot4", 'argos/video_screenshot4');
	video_screenshot4.setGraphicSize(FlxG.width, FlxG.height);
	video_screenshot4.screenCenter();	
	video_screenshot4.visible = false;
	var video_screenshot5 = createSpr("video_screenshot5", 'argos/video_screenshot5');
	video_screenshot5.setGraphicSize(FlxG.width, FlxG.height);
	video_screenshot5.screenCenter();	
	video_screenshot5.visible = false;
	
	
	var symbol3 = createSpr("symbol3", 'argos/symbol3');
	symbol3.setGraphicSize(Std.int(symbol3.width * 0.78));
	symbol3.x = FlxG.width - symbol3.width - 40;
	symbol3.y = FlxG.height - symbol3.height - 27; 
	symbol3.visible = false;
	
	
	
	
	
	
	var char:FlxSprite = new FlxSprite();
	char.frames = Paths.getSparrowAtlas('argos/argos_v2');	
	char.animation.addByPrefix('idle', 'animation_idle', 24, true);	
	char.animation.play("idle");
	game.customLuaSprites.set("char", char);
	
	char.scrollFactor.set();
	game.add(char);
	char.setGraphicSize(Std.int(char.width * 0.29));
	char.screenCenter();
	char.y += 25;
	char.alpha = 1;
	
	
	var char_rise:FlxSprite = new FlxSprite();
	char_rise.frames = Paths.getSparrowAtlas('argos/argos_v2_rise');	
	char_rise.animation.addByPrefix('idle', 'animation_armlift', 24, false);	
	char_rise.animation.play("idle");
	game.customLuaSprites.set("char_rise", char_rise);
	
	char_rise.scrollFactor.set();
	game.add(char_rise);
	char_rise.setGraphicSize(Std.int(char_rise.width * 0.5));
	char_rise.screenCenter();
	char_rise.y += 25;
	char_rise.alpha = 0;
	eh.funcModEvent(target1, 248, function() {
		char_rise.animation.play("idle", true);
		char_rise.alpha = 1;
	});
	eh.funcModEvent(target1, 264, function() {
		char_rise.alpha = 0;
	});
	
	
	
	var char_end:FlxSprite = new FlxSprite();
	char_end.frames = Paths.getSparrowAtlas('argos/argos_end');	
	char_end.animation.addByPrefix('idle', 'animation_fucked_end2', 24, false);	
	char_end.animation.play("idle");
	game.customLuaSprites.set("char_end", char_end);
	
	char_end.scrollFactor.set();
	game.add(char_end);
	//char_end.setGraphicSize(Std.int(char_end.width * 1.9));
	
	char_end.screenCenter();
	char_end.alpha =0;
	
	eh.funcModEvent(target1, 442, function() {
		char_end.alpha = 1;
		char_end.scale.set(0,0);
		char_end.animation.play("idle", true);
	});
	eh.funcTweenModEvent(target1, 442, 8,  ModConstants.getEaseFromString("expoOut"), 0, 1.8, function(v) {
		getSpr("char_end").scale.set(v,v);		
	}, "endZoom");
	
	
	
	var char_fucked:FlxSprite = new FlxSprite();
	char_fucked.frames = Paths.getSparrowAtlas('argos/argos_fucked');	
	char_fucked.animation.addByPrefix('idle', 'animation_fucked_idle', 24, true);	
	char_fucked.animation.play("idle");
	game.customLuaSprites.set("char_fucked", char_fucked);
	
	char_fucked.scrollFactor.set();
	game.add(char_fucked);
	char_fucked.setGraphicSize(Std.int(char_fucked.width * 0.82));
	char_fucked.screenCenter();
	char_fucked.y += -6;
	char_fucked.alpha = 1;
	
	eh.funcTweenModEvent(target1, 316, 32,  ModConstants.getEaseFromString("cubeOut"), char_fucked.y, char_fucked.y+112, function(v) {
		getSpr("char_fucked").y=v;		
	}, "fuckedcharmove");
	
	
	
	var noise:FlxSprite = new FlxSprite();
	noise.frames = Paths.getSparrowAtlas('argos/noise');	
	noise.animation.addByPrefix('idle', 'noise', 48, true);	
	noise.animation.play("idle");
	game.customLuaSprites.set("noise", noise);
	
	noise.scrollFactor.set();
	game.add(noise);
	noise.setGraphicSize(FlxG.width, FlxG.height);
	noise.screenCenter();
	noise.alpha = 0.09;
	
	eh.funcTweenModEvent(target1, 16, 16,  ModConstants.getEaseFromString("inCubic"), 0.09, 0.75, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 32, 48-32,  ModConstants.getEaseFromString("pop"), 0.75, 0.5, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 48, 0.1,  ModConstants.getEaseFromString("instant"), 0.0, 0.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 54.5, 1.5,  ModConstants.getEaseFromString("bounce"), 0.0, 0.4, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	
	eh.funcTweenModEvent(target1, 85.87, 0.1,  ModConstants.getEaseFromString("outExpo"), 0.0, 0.7, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 85.87+0.1, 0.1,  ModConstants.getEaseFromString("linear"), 0.7, 0.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	
	eh.funcTweenModEvent(target1, 86.4, 0.1,  ModConstants.getEaseFromString("outExpo"), 0.0, 0.89, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 86.4+0.1, 0.5,  ModConstants.getEaseFromString("linear"), 0.89, 0.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	
	eh.funcTweenModEvent(target1, 87.2, 0.8,  ModConstants.getEaseFromString("inSine"), 0, 1.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 88, 1,  ModConstants.getEaseFromString("linear"), 1, 0.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	
	eh.funcTweenModEvent(target1, 103, 1,  ModConstants.getEaseFromString("inSine"), 0, 1.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 104, 1,  ModConstants.getEaseFromString("linear"), 1, 0.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	
	eh.funcTweenModEvent(target1, 311.8, 0.2,  ModConstants.getEaseFromString("inExpo"), 0, 1.0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	eh.funcTweenModEvent(target1, 314.8, 1.2,  ModConstants.getEaseFromString("inQuint"), 1, 0, function(v) {
		getSpr("noise").alpha=v;		
	}, "noiseAlpha");
	
	
	addResetEvent(function(){
		glitchfuck.setFloat('amount', 0.0);
	
		getSpr("noise").visible=true;	
		getSpr("noise").alpha=0.09;	
	
		getSpr("blobhead").scale.set(0,0);
		getSpr("blobhead").visible=false;	
		getSpr("blobContainer").visible=false;	
		
		getSpr("symbol1").visible=false;	
		getSpr("symbol2").visible=false;	
		getSpr("symbol2_bigger").visible=false;	
		getSpr("symbol2_big").visible=false;	
		getSpr("symbol3").visible=false;	
		getSpr("video_screenshot1").visible=false;	
		getSpr("video_screenshot2").visible=false;	
		getSpr("video_screenshot3").visible=false;	
		getSpr("video_screenshot4").visible=false;	
		getSpr("video_screenshot5").visible=false;	
	
		getSpr("char").alpha = 1;
		getSpr("char_fucked").alpha = 0;
		getSpr("char_fucked").screenCenter();
		getSpr("char_fucked").y += -10;
		
		getSpr("char_end").alpha = 0;
		getSpr("char_rise").alpha = 0;
		getSpr("char_rise").flipY=false;	
		
		
		getSpr("bg1").alpha = 1;
		getSpr("blackout").alpha = 0;
		getSpr("error").alpha=0;	
		getSpr("blackoutbg").alpha=1;	
		getSpr("bg3").visible=false;	
		getSpr("wormsBG").visible=false;	
		getSpr("wormsBG").color = 0xFFFFFFFF;
		getSpr("whitebg").visible=false;	
		getSpr("whitebg").alpha=1;	
		getSpr("whitebg").color = 0xFFFFFFFF;
		
		game.camNotes.visible = true;	
		
		if (game.variables.exists("argos_cellsFloor"))
		{
		game.variables.get("argos_cellsFloor").visible = false;
		}
	});	
	
	
	
	createSprGroup("argos_maggotsBG", true);
	addResetEvent(function(){
		if (game.variables.exists("argos_maggotsBG"))
		{
			game.variables.get("argos_maggotsBG").visible = false;
		}
	});	
	
	var magcount:Int = 0;
	for (k in 0...6)
	{
		for (i in 0...12)
		{
			var maggot:FlxSprite = new FlxSprite().loadGraphic(Paths.image('argos/maggot'));
			var resizeThing:Float = 0.75;
			maggot.setGraphicSize(Std.int(maggot.width * resizeThing));
			maggot.updateHitbox();
			maggot.x = 0 + ((212*resizeThing)*i) +FlxG.random.float(-45,45);
			maggot.y = 0 + ((212*resizeThing)*k) +FlxG.random.float(-45,45);
			maggot.angle = FlxG.random.float(0,360);
			//argos_maggotsBG.add(maggot);
			addToSprGrp("argos_maggotsBG", maggot);
			game.customLuaSprites.set("maggot" + Std.string(magcount), maggot);
			magcount += 1;
		}
	}
	
	
	createSprGroup("argos_cellsWallRight", true);
	if (game.variables.exists("argos_cellsWallRight"))
	{
		game.variables.get("argos_cellsWallRight").visible = false;
	}
	
	createSprGroup("argos_cellsWallLeft", true);
	if (game.variables.exists("argos_cellsWallLeft"))
	{
		game.variables.get("argos_cellsWallLeft").visible = false;
	}
	
	eh.funcModEvent(target1, 72, function() {
		game.variables.get("argos_cellsWallRight").visible = true;
		game.variables.get("argos_cellsWallLeft").visible = true;
	}, "swapbg");
	
	var dumbCounter:Int = 0;
	for (k in 0...10)
	{
		for (i in 0...7)
		{
			var cellThing_w:FlxSprite = new FlxSprite();
			cellThing_w.frames = Paths.getSparrowAtlas('argos/argos_cell');
			if(i % 2 == 0){
				cellThing_w.animation.addByPrefix('idle', 'idle_empty', 24, true);	
			}else{
				cellThing_w.animation.addByPrefix('idle', 'idle_filled', 24, true);	
			}
			
			if(k % 2 == 0){
				addToSprGrp("argos_cellsWallRight", cellThing_w);
			}else{
				addToSprGrp("argos_cellsWallLeft", cellThing_w);
			}			
			cellThing_w.setGraphicSize(Std.int(cellThing_w.width * 0.4));
			cellThing_w.updateHitbox();
			cellThing_w.animation.play("idle");
			cellThing_w.x = 0 + (cellThing_w.width * i);
			cellThing_w.y = 0 + (cellThing_w.height * k);
			cellThing_w.scrollFactor.set();
			//cellThing_w.velocity.x = 96 * (k % 2 == 0 ? 1 : -1);
			game.customLuaSprites.set("cellthing_wall" + Std.string(dumbCounter), cellThing_w);
			dumbCounter += 1;
		}
	}
	

	addResetEvent(function(){
		if (game.variables.exists("argos_cellsWallLeft"))
		{
			game.variables.get("argos_cellsWallLeft").x = 0;
			game.variables.get("argos_cellsWallLeft").visible = false;
		}
		if (game.variables.exists("argos_cellsWallRight"))
		{
			game.variables.get("argos_cellsWallRight").x = 0;
			game.variables.get("argos_cellsWallRight").visible = false;
		}
	});	
	
	eh.funcModEvent(target1, 88, function() {
		game.variables.get("argos_cellsWallLeft").visible = false;
		game.variables.get("argos_cellsWallRight").visible = false;
		
		game.variables.get("argos_maggotsBG").visible = true;
		
	});
	
	eh.funcModEvent(target1, 104, function() {
		game.variables.get("argos_maggotsBG").visible = false;
	});
	
	eh.funcTweenModEvent(target1, 72, 64,  ModConstants.getEaseFromString("linear"), -12, 128*5.3, function(v) {
		if (game.variables.exists("argos_cellsWallRight"))
		{
			game.variables.get("argos_cellsWallRight").x = v*-1;
		}	
		if (game.variables.exists("argos_cellsWallLeft"))
		{
			game.variables.get("argos_cellsWallLeft").x = v;
		}	
	}, "wallMoving");
	
	
	
	
	
	
	
	//var cellThings:Array<FlxSprite> = [];
	createSprGroup("argos_cellsFloor", true);
	if (game.variables.exists("argos_cellsFloor"))
	{
		game.variables.get("argos_cellsFloor").visible = false;
	}


	
	for (k in 0...6)
	{
		for (i in 0...30)
		{
			var cellThing:FlxSprite = new FlxSprite();
			cellThing.frames = Paths.getSparrowAtlas('argos/argos_cell_grey');
			if(i % 2 == 0){
				cellThing.animation.addByPrefix('idle', 'idle_empty', 24, true);	
			}else{
				cellThing.animation.addByPrefix('idle', 'idle_filled', 24, true);	
			}
			cellThing.setGraphicSize(Std.int(cellThing.width * 0.4));
			cellThing.updateHitbox();
			cellThing.animation.play("idle");
			cellThing.screenCenter();
			cellThing.x -= -100 + ((cellThing.width/3) * k);

			cellThing.angle = ((360.0/30.0)*i) + FlxG.random.float(-6,6); //Just some slight random variation.

			//Rotate around screen center lol
			//https://stackoverflow.com/questions/34372480/rotate-point-about-another-point-in-degrees-python
			var angle:Float = ((360.0/30.0)*i) * (Math.PI / 180);
			var qx = (FlxG.width/2) + Math.cos(angle) * (cellThing.x - (FlxG.width/2)) - Math.sin(angle) * (cellThing.y - (FlxG.height/2));
			var qy = (FlxG.height/2) + Math.sin(angle) * (cellThing.x - (FlxG.width/2)) + Math.cos(angle) * (cellThing.y - (FlxG.height/2));
			cellThing.x = qx;
			cellThing.y = qy;
			cellThing.x -= 82;
			cellThing.scrollFactor.set();

			//cellThing.velocity.set(25*(0.9/(k+1)),0);
			//cellThing.velocity.rotate(FlxPoint.weak(0,0),cellThing.angle);

			//argos_cellsFloor.add(cellThing);
			
			addToSprGrp("argos_cellsFloor", cellThing);
			
			game.customLuaSprites.set("cellthing" + Std.string(i+k), cellThing);
			
			//game.add(cellThing);
			//cellThing.visible = false;
			//cellThings.push(cellThing);
		}
	}
	
	
	
	
	var blackout = createSpr("blackoutbg", 'argos/black');
	blackout.setGraphicSize(FlxG.width, FlxG.height);
	blackout.screenCenter();	
	blackout.alpha=1;
	

	var error = createSpr("error", 'argos/SMPTE_Color_Bars');
	error.setGraphicSize(FlxG.width, FlxG.height);
	error.screenCenter();	
	error.cameras = [game.camHUD];
	error.alpha=0;
	
	
	var blackout = createSpr("blackout", 'argos/black');
	blackout.setGraphicSize(FlxG.width, FlxG.height);
	blackout.screenCenter();	
	blackout.cameras = [game.camHUD];
	blackout.alpha=0;
	
	
	
	
	var argos_text1:FlxTypeText;
	var argos_text2:FlxTypeText;
	var argos_text3:FlxTypeText;
	var argos_text4:FlxTypeText;
	
	
	var txt1:String = "Even the sustainability and the animal protection are based on Anthropocentrism. If human is really the load of creation, \n\nthey should think of all lives instead of only the human prosperity!!";
	var txt2:String = "You say killing us is the justice!!\nBut is your justice better than our justice!?";
	var txt3:String = "We keep the balance of all lives by infesting human being.";
	var txt4:String =  'Compared to that,\nYOU should be called "the Parasite" infesting the earth!';

	
	
	argos_text1 = new FlxTypeText(12,24,FlxG.width,txt1, 64);
	argos_text1.setFormat(Paths.font("vcr.ttf"), 30, 0xFFFFFFFF, 0, textBorderStyle("outline"), 0xFF0000FF);
	argos_text1.useDefaultSound = false;
	//argos_text1.delay = 0.00666 / playbackRate;
	argos_text1.delay = 0.00666;
	//argos_text1.cameras = [game.camHUD];
	game.add(argos_text1);
	argos_text1.alpha=0.77;
	game.customLuaSprites.set("argos_text1", argos_text1);
	
	argos_text2 = new FlxTypeText(12,24,FlxG.width,txt2, 64);
	argos_text2.y = argos_text1.y + 30+30+30+30+30 + 40;
	argos_text2.setFormat(Paths.font("vcr.ttf"), 30, 0xFFFFFFFF, 0,  textBorderStyle("outline"), 0xFF0000FF);
	argos_text2.useDefaultSound = false;
	//argos_text2.delay = 0.0042 / playbackRate;
	argos_text2.delay = 0.0042;
	//argos_text2.cameras = [game.camHUD];
	game.add(argos_text2);
	argos_text2.alpha=0.77;
	game.customLuaSprites.set("argos_text2", argos_text2);
	
	argos_text3 = new FlxTypeText(12,24,FlxG.width,txt3, 64);
	argos_text3.y = argos_text2.y + 30+30+30 + 40;
	argos_text3.setFormat(Paths.font("vcr.ttf"), 30, 0xFFFFFFFF, 0,  textBorderStyle("outline"), 0xFF0000FF);
	argos_text3.useDefaultSound = false;
	//argos_text3.delay = 0.003 / playbackRate;
	argos_text3.delay = 0.003;
	//argos_text3.cameras = [game.camHUD];
	game.add(argos_text3);
	argos_text3.alpha=0.77;
	game.customLuaSprites.set("argos_text3", argos_text3);
	
	argos_text4 = new FlxTypeText(12,24,FlxG.width,txt3, 64);
	argos_text4.y = argos_text3.y + 30+30+30 + 40;
	argos_text4.setFormat(Paths.font("vcr.ttf"), 30, 0xFFFFFFFF, 0,  textBorderStyle("outline"), 0xFF0000FF);
	argos_text4.useDefaultSound = false;
	//argos_text4.delay = 0.003 / playbackRate;
	argos_text4.delay = 0.003;
	//argos_text4.cameras = [game.camHUD];
	game.add(argos_text4);
	argos_text4.alpha=0.77;
	game.customLuaSprites.set("argos_text4", argos_text4);
	
	argos_text1.scrollFactor.set();
	argos_text2.scrollFactor.set();
	argos_text3.scrollFactor.set();
	argos_text4.scrollFactor.set();
	
	
	
	eh.funcModEvent(target1, 267.74, function() {
		argos_text1.resetText(txt1);
		argos_text1.start();
	});
	eh.funcModEvent(target1, 274.1, function() {
		argos_text2.resetText(txt2);
		argos_text2.start();
	});
	eh.funcModEvent(target1, 277.4, function() {
		argos_text3.resetText(txt3);
		argos_text3.start();
	});
	
	eh.funcModEvent(target1, 279.9, function() {
		argos_text4.resetText(txt4);
		argos_text4.start();
	});
	
	eh.funcModEvent(target1, 284, function() {
		argos_text1.resetText("");
		argos_text2.resetText("");
		argos_text3.resetText("");
		argos_text4.resetText("");
	});
	
	addResetEvent(function(){
		argos_text1.resetText("");
		argos_text2.resetText("");
		argos_text3.resetText("");
		argos_text4.resetText("");
	});	
	
	]])
	
	
	--Stage events
	runHaxeCode(
	[[
	
	var target1 = PlayState.instance.playerStrumline.mods;

	eh.funcTweenModEvent(target1, 0, 8,  ModConstants.getEaseFromString("quadOut"), 1, 0, function(v) {
		getSpr("blackoutbg").alpha=v;		
	}, "blackoutbg");
	

	
	eh.funcModEvent(target1, 48, function() {
		getSpr("blackout").alpha=1;	
		getSpr("char").alpha = 0;		
		getSpr("bg1").alpha = 0;		
	}, "blackout");
	
	eh.funcTweenModEvent(target1, 50, 2,  ModConstants.getEaseFromString("cubeIn"), 1, 0, function(v) {
		getSpr("blackout").alpha=v;		
	}, "blackout");
	
	
	eh.funcModEvent(target1, 50, function() {	
		getSpr("blobContainer").visible = true;		
	}, "blobcontainer");
	eh.funcModEvent(target1, 71, function() {	
		getSpr("blobContainer").visible = false;		
	}, "blobcontainer");
	
	

	
	eh.funcModEvent(target1, 70.859, function() {
		getSpr("error").alpha=1;
		game.camNotes.visible = false;		
	}, "error");
	
	eh.funcModEvent(target1, 71.9, function() {
		getSpr("error").alpha=0;	
		game.camNotes.visible = true;	
	}, "error");
	
	eh.funcModEvent(target1, 55, function() {
		getSpr("blobhead").visible=true;	
	}, "blobbg");
	
	eh.funcTweenModEvent(target1, 55, 2,  ModConstants.getEaseFromString("inExpo"), 0.0, 1.0, function(v) {
		getSpr("blobhead").scale.set(v,v);
	}, "blobscale");
	
	
	
	eh.funcModEvent(target1, 71.9, function() {
		getSpr("blobhead").visible=false;	
	}, "blobbg");
	
	
	
	
	eh.funcModEvent(target1, 377.859, function() {
		getSpr("error").alpha=1;
		game.camNotes.visible = false;		
	}, "error");
	
	eh.funcModEvent(target1, 378.9, function() {
		getSpr("error").alpha=0;	
		game.camNotes.visible = true;	
	}, "error");
	
	
	eh.funcModEvent(target1, 118.38, function() {
		getSpr("blackout").alpha=1;		
	}, "blackout");
	
	eh.funcModEvent(target1, 118.9, function() {
		getSpr("blackout").alpha=0;		
	}, "blackout");
	
	eh.funcModEvent(target1, 118.38+0.75, function() {
		getSpr("blackout").alpha=1;		
	}, "blackout");
	
	eh.funcModEvent(target1, 118.8+0.75, function() {
		getSpr("blackout").alpha=0;		
	}, "blackout");
	
	eh.funcModEvent(target1, 118.38+1.5, function() {
		getSpr("blackout").alpha=1;		
	}, "blackout");
	
	eh.funcModEvent(target1, 118.8+1.5, function() {
		getSpr("blackout").alpha=0;		
	}, "blackout");
	
	
	
	//REVEAL maggots floor
	eh.funcModEvent(target1, 120, function() {
		if (game.variables.exists("argos_cellsFloor"))
		{
			game.variables.get("argos_cellsFloor").visible = true;
		}
	}, "ew");
	
	eh.funcModEvent(target1, 184, function() {
		if (game.variables.exists("argos_cellsFloor"))
		{
			game.variables.get("argos_cellsFloor").visible = false;
		}
		getSpr("bg3").visible=true;	
	}, "ew");
	
	
	eh.funcTweenModEvent(target1, 120, 184-120,  ModConstants.getEaseFromString("linear"), 0.75, 1.2, function(v) {
		game.camGame.zoom = v;
	}, "camGameZoom");
	


	
	
	
	eh.funcModEvent(target1, 248, function() {
		getSpr("bg3").visible=false;		
		getSpr("whitebg").visible=true;		
	}, "bgswap");
	
	eh.funcModEvent(target1, 252.09, function() {
		getSpr("char_rise").flipY=true;		
		//getSpr("whitebg").color = 0xFF0000FF;
		getSpr("whitebg").color = 0xFFFFA3A3;
	});
	
	eh.funcModEvent(target1, 253, function() {
		getSpr("char_rise").flipY=false;	
		getSpr("whitebg").color = 0xFFFFFFFF;		
	});
	
	eh.funcModEvent(target1, 254.48, function() {
		getSpr("char_rise").flipY=true;		
		getSpr("whitebg").color = 0xFFFFA3A3;
	});
	
	eh.funcModEvent(target1, 254.95, function() {
		getSpr("char_rise").flipY=false;	
		getSpr("whitebg").color = 0xFFFFFFFF;		
	});
	
	eh.funcModEvent(target1, 257.7, function() {	
		getSpr("whitebg").color = 0xFF0000FF;
	});
	
	
	
	
	//Glitch freakout
	
	addResetEvent(function(){
		game.camHUD.visible=true;	
		game.camNotes.visible=true;	
		game.camHUD.alpha=1;	
		game.camNotes.alpha=1;	
	});	
	
	eh.funcModEvent(target1, 264, function() {
		getSpr("blackout").alpha=1;		
		game.camHUD.visible=false;		
		game.camNotes.visible=false;	
		getSpr("whitebg").color = 0xFF000000;
	}, "blackout");
	
	eh.funcModEvent(target1, 264+20, function() {
		getSpr("blackout").alpha=0;		
	}, "blackout");
	
	
	
	eh.funcModEvent(target1, 284, function() {
		getSpr("whitebg").visible=true;	
		getSpr("whitebg").color = 0xFF0000FF;
	});
	
	eh.funcModEvent(target1, 290, function() {
		getSpr("whitebg").color = 0xFF8E8E8E;
	});
	eh.funcModEvent(target1, 292, function() {
		getSpr("whitebg").color = 0xFF0000FF;
	});
	eh.funcModEvent(target1, 293, function() {
		getSpr("whitebg").color = 0xFF8E8E8E;
	});
	eh.funcModEvent(target1, 294, function() {
		getSpr("whitebg").color = 0xFFF3002A;
		game.camNotes.visible=false;
	});
	
	
	
	eh.funcModEvent(target1, 291, function() {	
		game.camNotes.visible=true;	
	});
	
	//cross thing
	for (i in 0...8)
	{
		var crossThing = createSpr("cross" + i, 'argos/cross');
		crossThing.setGraphicSize(Std.int(crossThing.width * 0.8));
		crossThing.updateHitbox();
		crossThing.screenCenter();	
		crossThing.x += 60 * (4-i);
		crossThing.alpha=0.9;
		if(i==0||i>=7) crossThing.angle=45;
		crossThing.scale.set(0,0);
		addResetEvent(function(){
			crossThing.scale.set(0,0);
			crossThing.visible = true;
		});	
		
		eh.funcTweenModEvent(target1, 294+(0.24*i), 0.55,  ModConstants.getEaseFromString("pop"), 0, 1.2, function(v) {
			crossThing.scale.set(v,v);	
		});
		
		eh.funcTweenModEvent(target1, 302+(0.21*i), 0.5,  ModConstants.getEaseFromString("pop"), 0, 1.2, function(v) {
			crossThing.scale.set(v,v);	
		});
		
		//eh.funcModEvent(target1, 296, function() {
		//	crossThing.visible = false;
		//});
	}
	
	eh.funcModEvent(target1, 295.8, function() {
		getSpr("whitebg").color = 0xFF0000FF;
	});
	
	eh.funcModEvent(target1, 296.8, function() {
		getSpr("symbol1").visible = true;
	});
	eh.funcModEvent(target1, 297.25, function() {
		getSpr("symbol1").visible = false;
	});
	eh.funcModEvent(target1, 297.5, function() {
		getSpr("video_screenshot1").visible = true;
	});
	eh.funcModEvent(target1, 298, function() {
		getSpr("video_screenshot1").visible = false;
		getSpr("video_screenshot2").visible = true;
	});
	eh.funcModEvent(target1, 298.75, function() {
		getSpr("video_screenshot2").visible = false;
	});
	eh.funcModEvent(target1, 299.9, function() {
		getSpr("symbol2").visible = true;
		getSpr("whitebg").color = 0xFFFF0000;
	});
	eh.funcModEvent(target1, 300.95, function() {
		getSpr("video_screenshot3").visible = true;
		getSpr("symbol2").visible = false;
	});
	eh.funcModEvent(target1, 301.5, function() {
		getSpr("video_screenshot4").visible = true;
	});
	eh.funcModEvent(target1, 302, function() {
		getSpr("video_screenshot3").visible = false;
		getSpr("video_screenshot4").visible = false;
		getSpr("whitebg").color = 0xFF027EF6;
	});
	eh.funcModEvent(target1, 303.9, function() {
		getSpr("whitebg").color = 0xFF000000;
	});
	eh.funcModEvent(target1, 304.2, function() {
		getSpr("video_screenshot5").visible = true;
	});
	eh.funcModEvent(target1, 304.8, function() {
		getSpr("video_screenshot5").visible = false;
	});
	eh.funcModEvent(target1, 304.95, function() {
		getSpr("video_screenshot5").visible = false;
	});
	
	eh.funcModEvent(target1, 305, function() {
		getSpr("symbol1").visible = true;
	});
	eh.funcModEvent(target1, 305.9, function() {
		getSpr("symbol1").visible = false;
	});
	
	eh.funcModEvent(target1, 306.8, function() {
		getSpr("whitebg").color = 0xFFFFFF00;
	});
	eh.funcModEvent(target1, 306.99, function() {
		getSpr("whitebg").color = 0xFF000000;
	});
	eh.funcModEvent(target1, 307.5, function() {
		getSpr("symbol3").visible = true;
	});
	eh.funcModEvent(target1, 308, function() {
		getSpr("symbol3").visible = false;
	});
	
	eh.funcModEvent(target1, 308.86, function() {
		getSpr("whitebg").color = 0xFFFF0000;
		game.camNotes.visible=true;	
	});
	
	eh.funcModEvent(target1, 309.39, function() {
		getSpr("symbol2").visible = true;
	});
	
	eh.funcModEvent(target1, 309.8, function() {
		getSpr("symbol2_big").visible = true;
	});
	
	eh.funcModEvent(target1, 309.8+0.6, function() {
		getSpr("symbol2_bigger").visible = true;
	});
	
	eh.funcModEvent(target1, 311, function() {
		getSpr("whitebg").color = 0xFFFFFFFF;
		getSpr("whitebg").visible=false;	
		game.camNotes.visible=false;
	});
	eh.funcModEvent(target1, 311.79, function() {
		getSpr("symbol2").visible = false;
		getSpr("symbol2_bigger").visible = false;
		getSpr("symbol2_big").visible = false;
	});
	
	eh.funcModEvent(target1, 315, function() {
		game.camNotes.visible=true;
		game.camHUD.visible=true;
		game.camNotes.alpha=0;
		game.camHUD.alpha=0;
	}, "camFade");
	eh.funcTweenModEvent(target1, 315.1, 0.9,  ModConstants.getEaseFromString("inSine"), 0, 1, function(v) {
		game.camNotes.alpha=v;
		game.camHUD.alpha=v;
	}, "camFade");
	
	
	
	eh.funcModEvent(target1, 315.5, function() {
		getSpr("whitebg").visible=true;	
		getSpr("char_fucked").alpha = 1;
	}, "bgswapanother");
	
	eh.funcModEvent(target1, 376, function() {
		getSpr("whitebg").visible=false;	
		getSpr("char_fucked").alpha = 0;
	}, "bgswapanother");
	
	
	eh.funcModEvent(target1, 379, function() {
		getSpr("wormsBG").visible = true;
		getSpr("whitebg").visible=true;	
		getSpr("whitebg").alpha=0;	
	}, "bgswapanotheranother");
	
	
	eh.funcModEvent(target1, 411.85, function() {
		getSpr("wormsBG").visible = false;
		getSpr("char").alpha=1;	
		getSpr("bg1").alpha=1;	
	}, "bgswapanotheranother");
	eh.funcModEvent(target1, 415.7, function() {
		getSpr("char").alpha=0;	
	}, "bgswapanotheranother");
	eh.funcModEvent(target1, 416, function() {
		getSpr("wormsBG").visible = true;
		getSpr("char").alpha=0;	
		getSpr("bg1").alpha=0;	
	}, "bgswapanotheranother");
	
	
	eh.funcTweenModEvent(target1, 440, 4,  ModConstants.getEaseFromString("outSine"), 0, 1, function(v) {
		getSpr("whitebg").alpha=v;	
	}, "bgwhitefade");

	

	var curCol:Int = 0;
	var colArray = [0xFFFFF0F5, 0xFFFF9500, 0xFFFF0000, 0xFFFFFF00, 0xFF5500FF, 0xFF00FF00, 0xFF0000FF];
	
	var l = (444-380);
	l *= 2;
	for (i_ in 0...l){
		var i = 380 + (i_/2);
		eh.funcModEvent(target1, i, function() {			
			getSpr("wormsBG").color = colArray[FlxG.random.int(0,colArray.length-1)];
		}, "wormsColor");
	}
		
	
	]])
end



function modsTimeline()	
	stageSetup()
	
	add(31.5, 1, "outExpo", 0.03, "glitch2", 1)
	add(31.5+4, 1, "outExpo", 0.035, "glitch2", 1)
	add(31.5+4+4, 1, "outExpo", 0.035, "glitch2", 1)
	add(31.5+4+4+2, 1, "outExpo", 0.037, "glitch2", 1)
	
	add(40, 0.5, "outExpo", 0.02, "glitchLines", 1)
	add(42, 0.5, "outExpo", 0.012, "glitchLines", 1)
	
	add(46, 0.5, "outExpo", 0.01, "glitchLines", 1)
	
	add(46.9, 0.5, "outExpo", 0.1, "glitchLines", 1)
	
	add(18, 32-18, "tap", 0.019, "glitchLines", 1)
	
	
	
	--add(0, 16, "linear", 0.2, "glitch2", 1)
	ease(0, 16, "outExpo", 0.4, "fisheye", 1)
	ease(0+16, 24, "inOutCubic", 0.0, "fisheye", 1)
	
	ease(242-2, 6+2, "inCubic", -0.45, "fisheye", 1)
	set(248, 0.4, "fisheye", 1)
	ease(248.1, 4, "outQuint", 0.0, "fisheye", 1)
	
	ease(183, 1, "outQuint", -0.7, "fisheye", 1)
	
	set(-16, 0.25, "vcrglitch", 1)
	
	ease(315, 1, "inQuint", -0.7, "fisheye", 1)
	ease(316, 32, "outQuint", 0.0, "fisheye", 1)
	
	ease(366, 376-366, "inCubic", -0.6, "fisheye", 1)
	
	ease(375.9, 0.1, "outExpo", 1, "fisheye", 1)
	ease(376, 4, "outQuad", 0.0, "fisheye", 1)
	
	
	
	add(252, 0.1, "inOutExpo", 0.1, "glitch2", 1)
	add(253.5, 0.1, "inOutExpo", -0.1, "glitch2", 1)
	
	add(254.48, 0.1, "inOutExpo", 0.1, "glitch2", 1)
	add(255, 0.1, "inOutExpo", -0.1, "glitch2", 1)
	add(255.3, 0.5, "outSine", 0.1, "glitch2", 1)
	
	add(252.3, 3, "inOutSine", 0.4, "vcrglitch", 1)
	add(252.3+58, 4, "inOutSine", -0.4, "vcrglitch", 1)
	
	
	ease(314, 2, "inOutExpo", 0.035, "glitch2", 1)
	
	ease(321, 1, "inOutExpo", 0.013, "glitchLines", 1)
	ease(322, 1, "inOutExpo", 0.0, "glitchLines", 1)
	
	ease(325-0.025, 1, "inOutExpo", 0.01395, "glitchLines", 1)
	ease(347, 0.5, "inOutExpo", 0.0, "glitchLines", 1)
	ease(347.5, 0.75, "inOutExpo", 0.0138, "glitchLines", 1)
	
	ease(376, 2, "outCubic", 0.0, "glitchLines", 1)
	
	
	add(184.001, 32, "inOutQuad", 5, "scrollx", 1)
	
	add(184+32, 32, "inOutQuad", -4, "scrollx", 1)
	
	
	
	
	
	ease(440, 0.4, "outSine", 0.4, "fisheye", 1)
	ease(440+0.4, 0.6, "inOutSine", -0.03, "fisheye", 1)
	ease(440+0.4+0.6, 0.75, "inOutSine", 0.3, "fisheye", 1)
	ease(440+0.4+0.6+0.75, 1, "inOutSine", 0.0, "fisheye", 1)
	
	
	
	
	
	--Camera motions
	add(52, 2, "pop", 0.04, "fakeCamZoom", 1)
	add(52, 1.5, "outSine", 0.04, "fakeCamZoom", 1)
	add(54, 1, "inOutQuad", -0.04, "fakeCamZoom", 1)
	
	ease(71, 1, "linear", 10, "fakeCamAngle", 1)
	ease(72, (88-10)-72, "outSine", 13, "fakeCamAngle", 1)
	ease(71, 1, "linear", 1.21, "fakeCamZoom", 1)
	ease(88-10, 10, "inQuint", 2.75, "fakeCamZoom", 1)
	ease(88-10, 10, "inCubic", -21, "fakeCamAngle", 1)
	
	--set(120, 0.8, "fakeCamZoom", 1)
	--ease(120, 10, "inCubic", , "fakeCamZoom", 1)
	
	for i = 184, 248-1 do
		add(i-0.1, 0.75, "pop", 0.04, "fakeCamZoom", 1)
	end
	add(242, 6, "inQuad", -0.8, "fakeCamZoom", 1)
	
	ease(248, 4, "outCubic", 1.0, "fakeCamZoom", 1)
	
	ease(88, 16, "outCubic", 1.1, "fakeCamZoom", 1)
	ease(88, 16, "outCubic", 0, "fakeCamAngle", 1)
	
	
	ease(104, 116-104, "linear", 1.4, "fakeCamZoom", 1)
	ease(116, 4, "inSine", 1.7, "fakeCamZoom", 1)
	
	
	add(184.001, 32, "inOutQuad", -180, "fakeCamAngle", 1)
	add(184+32, 32, "inOutQuad", 180+360, "fakeCamAngle", 1)
	
	add(258-1, 2, "inOutExpo", 7, "fakeCamAngle", 1)
	set(264, 0, "fakeCamAngle", 1)
	
	
	
	ease(0, 16, "outExpo", 0.2, "aberration", 1)
	
	

	ease(54, 2, "inOutExpo", 0.4, "aberration", 1)
	
	set(70.859, 0, "aberration", 1)
	set(71.9, -0.35, "aberration", 1)
	
	ease(184.001, 2, "outExpo", 0.1, "aberration", 1)
	
	
end
