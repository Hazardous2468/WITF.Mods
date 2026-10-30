function modsTimeline()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "funkin")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxTypeText", "flixel.addons.text")
	addHaxeLibrary("FunkinSound", "funkin.audio")
	addHaxeLibrary("FileUtil", "funkin.util")
	addHaxeLibrary("AdjustColorShader", "funkin.graphics.shaders")
	
	runHaxeCode(
	[[
	
		var pushBack1:Float = 862 - 734;
				
		var target1 = PlayState.instance.playerStrumline.mods;

		var insecurityEffectShader = new FlxRuntimeShader(Assets.getText(Paths.frag("inhuman/insecurity_effect")), null);
		insecurityEffectShader.setBool('flashing', Preferences.flashingLights);
		addUpdate(function(elapsed){
			insecurityEffectShader.setFloat('uTimeX', Conductor.instance.songPosition * 1.0/1000*-1.5);
			insecurityEffectShader.setFloat('uTimeY', Conductor.instance.songPosition * 0.7777777/1000*-1.5);
		});	
		
		addResetEvent(function(){
			insecurityEffectShader.setFloat('alphaMult', 0.888);
			insecurityEffectShader.setBool('flipAlpha', false);
		});
		
		var howManyEyes:Int = 7;
		for (i in 0...howManyEyes){
			var insecurityEye1:FunkinSprite = new FunkinSprite();
			insecurityEye1.frames = Paths.getSparrowAtlas('inhuman/eyes');	
			insecurityEye1.animation.addByPrefix('0', 'eye-animation1', 36, false);	
			insecurityEye1.animation.addByPrefix('1', 'eye-animation2', 36, false);	
			insecurityEye1.animation.addByPrefix('2', 'eye-animation3', 36, false);	
			insecurityEye1.animation.addByPrefix('3', 'eye-animation4', 36, false);	
			insecurityEye1.animation.play("0");
			game.customLuaSprites.set("insecurityEye"+i, insecurityEye1);
			game.currentStage.add(insecurityEye1);
			insecurityEye1.scrollFactor.set();
			insecurityEye1.screenCenter();
			insecurityEye1.zIndex = 6;
			insecurityEye1.y += FlxG.height * 4;
			insecurityEye1.alpha=0.35;
			addResetEvent(function(){
				insecurityEye1.screenCenter();
				insecurityEye1.y += FlxG.height * 4;
			});
		}



		var index:Int = 0;
		function doInsecurityEye(when:Float){

			var whichOne:String = "insecurityEye" + index;
			eh.funcModEvent(target1, when, function() {
				var eyeSpr = getSpr(whichOne);
				if(eyeSpr!=null){
					eyeSpr.animation.play(FlxG.random.int(0,3));
					eyeSpr.screenCenter();
					var randomScale:Float = FlxG.random.float(0.25,0.8);
					eyeSpr.scale.set(randomScale,randomScale);
					eyeSpr.x += FlxG.random.float(FlxG.width*-0.4, FlxG.width*0.4);
					eyeSpr.y += FlxG.random.float(FlxG.height*-0.4, FlxG.height*0.4);
					eyeSpr.angle += FlxG.random.float(-80, 80);
					eyeSpr.flipX = FlxG.random.bool();
					eyeSpr.flipY = FlxG.random.bool();
				}
			},"insecurity_eye_spawn-"+index, false);

			index += 1;
			if (index>=howManyEyes){
				index = 0;
			}
		}
		for (beat in 864...927){
			doInsecurityEye(beat);
		}
		doInsecurityEye(383);
		doInsecurityEye(383);

		doInsecurityEye(1055);
		doInsecurityEye(1055);
		doInsecurityEye(1055);
		doInsecurityEye(1055.5);
		
		
		var bg = createSpr("bg", 'inhuman/cinder/back', false);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.screenCenter();	
		PlayState.instance.customLuaSprites.set("bg", bg);
		game.currentStage.add(bg);
		bg.zIndex = 5;
		
		var adjustColShader =  new AdjustColorShader();
		bg.shader = adjustColShader;
		addResetEvent(function(){
			adjustColShader.hue = 0;
			adjustColShader.saturation = 0;
			adjustColShader.contrast = 0;
			adjustColShader.brightness = 0;
		});
		
		eh.funcTweenModEvent(target1, 224,2.5, ModConstants.getEaseFromString("outQuint"), 0, -180, function(v) {
			adjustColShader.hue = v;
		}, "bgHue");
		
		eh.funcTweenModEvent(target1, 284,4, ModConstants.getEaseFromString("inOutCubic"), -180, 0, function(v) {
			adjustColShader.hue = v;
		}, "bgHue");
		
		eh.funcTweenModEvent(target1, 351, 1, ModConstants.getEaseFromString("linear"), 0, 45, function(v) {
			adjustColShader.hue = v;
		}, "bgHue");
		
		eh.funcTweenModEvent(target1, 351, 1, ModConstants.getEaseFromString("linear"), 0, 41, function(v) {
			adjustColShader.saturation = v;
		}, "bgSaturation");
		
		eh.funcTweenModEvent(target1, 383, 2, ModConstants.getEaseFromString("outQuad"), 100, 41, function(v) {
			adjustColShader.saturation = v;
		}, "bgSaturation");
		
		
		eh.funcTweenModEvent(target1, 476, 2, ModConstants.getEaseFromString("inOutSine"), 41, 0, function(v) {
			adjustColShader.saturation = v;
		}, "bgSaturation");
		eh.funcTweenModEvent(target1, 476, 2, ModConstants.getEaseFromString("inOutSine"), 45, 0, function(v) {
			adjustColShader.hue = v;
		}, "bgHue");
		
		
		eh.funcTweenModEvent(target1, 704, 732-704, ModConstants.getEaseFromString("linear"), 0, 45, function(v) {
			adjustColShader.hue = v;
		}, "bgHue");
		
		eh.funcTweenModEvent(target1, 704, 732-704, ModConstants.getEaseFromString("linear"), 0, 45, function(v) {
			adjustColShader.saturation = v;
		}, "bgSaturation");
		
		eh.funcTweenModEvent(target1, 860, 1, ModConstants.getEaseFromString("linear"), 45, 22, function(v) {
			adjustColShader.saturation = v;
		}, "bgSaturation");
		
		
		eh.funcTweenModEvent(target1, 988, 992-988, ModConstants.getEaseFromString("linear"), 45, 21, function(v) {
			adjustColShader.hue = v;
		}, "bgHue");
		eh.funcTweenModEvent(target1, 988, 992-988, ModConstants.getEaseFromString("linear"), 22, -89, function(v) {
			adjustColShader.saturation = v;
		}, "bgSaturation");
		
		
		
		var chains6 = createSpr("chains6", 'inhuman/chains6', false);
		chains6.setGraphicSize(FlxG.width+222);
		PlayState.instance.customLuaSprites.set("chains6", chains6);
		game.currentStage.add(chains6);
		chains6.zIndex = 8;
		chains6.screenCenter();
		chains6.y = -100;
		
		var chains1 = createSpr("chains1", 'inhuman/chains1', false);
		chains1.setGraphicSize(null, FlxG.height);
		PlayState.instance.customLuaSprites.set("chains1", chains1);
		game.currentStage.add(chains1);
		chains1.zIndex = 8;
		chains1.screenCenter();
		chains1.x = 0;
		
		var chains1alt = createSpr("chains1alt", 'inhuman/chains1', false);
		chains1alt.setGraphicSize(null, FlxG.height);
		PlayState.instance.customLuaSprites.set("chains1alt", chains1alt);
		game.currentStage.add(chains1alt);
		chains1alt.zIndex =8;
		chains1alt.screenCenter();
		chains1alt.x = FlxG.width-chains1alt.width*0.9;
		chains1alt.angle=180;
		
		var chains4 = createSpr("chains4", 'inhuman/chains4', false);
		chains4.setGraphicSize(null, FlxG.height);
		PlayState.instance.customLuaSprites.set("chains4", chains4);
		game.currentStage.add(chains4);
		chains4.zIndex = 8;
		chains4.screenCenter();
		chains4.x =-50;
		chains4.angle=180;
		
		var chains5 = createSpr("chains5", 'inhuman/chains5', false);
		chains5.setGraphicSize(null, FlxG.height);
		PlayState.instance.customLuaSprites.set("chains5", chains5);
		game.currentStage.add(chains5);
		chains5.zIndex = 8;
		chains5.screenCenter();
		chains5.x = FlxG.width-chains5.width*0.6;
		
		
		var alarmSpr = createSpr("alarmSpr", 'inhuman/cinder/alarm-alpha', false);
		alarmSpr.setGraphicSize(FlxG.width, FlxG.height);
		alarmSpr.screenCenter();
		PlayState.instance.customLuaSprites.set("alarmSpr", alarmSpr);
		game.currentStage.add(alarmSpr);
		alarmSpr.zIndex = 5;
		
		eh.funcTweenModEvent(target1, 95, 5, ModConstants.getEaseFromString("pop"), 0, 0.25, function(v) {
			alarmSpr.alpha=v;
		}, "alarmSprAlpha");
		
		for (i in 104...160){
			if ((i-104) % 8 == 0){
				eh.funcTweenModEvent(target1, i, 5, ModConstants.getEaseFromString("pop"), 0, 0.25, function(v) {
					alarmSpr.alpha=v;
				}, "alarmSprAlpha");
			}
		}
		eh.funcTweenModEvent(target1, 350, 5, ModConstants.getEaseFromString("pop"), 0, 0.25, function(v) {
			alarmSpr.alpha=v;
		}, "alarmSprAlpha");
		
		eh.funcTweenModEvent(target1, 702, 5, ModConstants.getEaseFromString("pop"), 0, 0.25, function(v) {
			alarmSpr.alpha=v;
		}, "alarmSprAlpha");
		eh.funcTweenModEvent(target1, 712, 5, ModConstants.getEaseFromString("pop"), 0, 0.25, function(v) {
			alarmSpr.alpha=v;
		}, "alarmSprAlpha");
		
		
		var bg_intro = createSpr("bg_intro", 'inhuman/cinder/back_intro', false);
		bg_intro.setGraphicSize(FlxG.width, FlxG.height);
		bg_intro.screenCenter();
		PlayState.instance.customLuaSprites.set("bg_intro", bg_intro);
		game.currentStage.add(bg_intro);
		bg_intro.zIndex = 55;
		
		var bg_chained = createSpr("bg_intro", 'inhuman/cinder/back_chained', false);
		bg_chained.setGraphicSize(FlxG.width, FlxG.height);
		bg_chained.screenCenter();
		PlayState.instance.customLuaSprites.set("bg_chained", bg_chained);
		game.currentStage.add(bg_chained);
		bg_chained.zIndex = 45;
		
		var bg_blackOut:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		bg_blackOut.scrollFactor.set();
		game.customLuaSprites.set("bg_blackOut", bg_blackOut);
		bg_blackOut.screenCenter();
		game.currentStage.add(bg_blackOut);
		bg_blackOut.zIndex = 400;
		
		addResetEvent(function(){
			bg_chained.alpha=0;	
			bg_intro.alpha=1;	
			bg.alpha = 1;
			alarmSpr.alpha = 0;
			bg_blackOut.alpha = 1;
		});
		
		eh.funcTweenModEvent(target1, 0, 16, ModConstants.getEaseFromString("linear"), 1, 0.5, function(v) {
			bg_blackOut.alpha=v;
		}, "bg_blackOutAlpha");
		
		eh.funcTweenModEvent(target1, 32, 8, ModConstants.getEaseFromString("linear"), 0.5, 0, function(v) {
			bg_blackOut.alpha=v;
		}, "bg_blackOutAlpha");
		
		eh.funcTweenModEvent(target1, 477, 1.5, ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			bg_chained.alpha=v;
		}, "bgChainedAlpha");
		eh.funcTweenModEvent(target1, 543.25, 0.5, ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			bg_chained.alpha=v;
		}, "bgChainedAlpha");
		
		eh.funcTweenModEvent(target1, 732, 1, ModConstants.getEaseFromString("outQuint"), 0, 1, function(v) {
			bg_chained.alpha=v;
		}, "bgChainedAlpha");
		
		eh.funcTweenModEvent(target1, 860, 1, ModConstants.getEaseFromString("outQuint"), 1, 0, function(v) {
			bg_chained.alpha=v;
		}, "bgChainedAlpha");
		
		
		eh.funcTweenModEvent(target1, 94, 0.5, ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
			bg_intro.alpha=v;
		}, "bgIntroAlpha");

		
		var p = PlayState.instance.variables.get("particlesEmitter");
		if(p != null){
			game.currentStage.remove(p);
			game.currentStage.add(p);
		}else{
			//print("no particles?");
		}
		
		
		// INSECURITY FACE
		
		
		var insecurityFace:FunkinSprite = new FunkinSprite();
		insecurityFace.frames = Paths.getSparrowAtlas('inhuman/TranceOverlay');	
		insecurityFace.animation.addByPrefix('idle', 'tranceOverlay', 24, true);	
		insecurityFace.animation.play("idle");
		game.customLuaSprites.set("insecurityFace", insecurityFace);
		game.currentStage.add(insecurityFace);
		insecurityFace.scrollFactor.set();
		insecurityFace.setGraphicSize(FlxG.width, FlxG.height);
		insecurityFace.screenCenter();
		insecurityFace.zIndex = 200;
		addResetEvent(function(){
			insecurityFace.alpha = 0;
		});
		
		eh.funcTweenModEvent(target1, 734+pushBack1, 2, ModConstants.getEaseFromString("linear"), 0.0, 0.1, function(v) {
			insecurityFace.alpha = v;
		}, "insecurityFaceFade");
		eh.funcTweenModEvent(target1, 736+pushBack1, 797-736, ModConstants.getEaseFromString("linear"), 0.1, 0.35, function(v) {
			insecurityFace.alpha = v;
		}, "insecurityFaceFade");
		eh.funcTweenModEvent(target1, 798+pushBack1, 2, ModConstants.getEaseFromString("inOutCubic"), 0.35, 0.0, function(v) {
			insecurityFace.alpha = v;
		}, "insecurityFaceFade");
		
		
		// NOISE and BlackOut
		
		
		var fade = createSpr("fade", 'inhuman/cinder/fade');
		fade.setGraphicSize(FlxG.width, FlxG.height);
		fade.screenCenter();
		fade.cameras = [game.camAFT];
		
		addResetEvent(function(){
			fade.alpha = 0;
		});
		eh.funcTweenModEvent(target1, 158, 4, ModConstants.getEaseFromString("inOutCubic"), 0, 1, function(v) {
			fade.alpha = v;
		}, "edgefade");
		eh.funcTweenModEvent(target1, 349, 3, ModConstants.getEaseFromString("inOutCubic"), 1, 0, function(v) {
			fade.alpha = v;
		}, "edgefade");
		eh.funcTweenModEvent(target1, 639, 1, ModConstants.getEaseFromString("inOutCubic"), 0, 1, function(v) {
			fade.alpha = v;
		}, "edgefade");
		eh.funcTweenModEvent(target1, 696, 8, ModConstants.getEaseFromString("inOutCubic"), 1, 0, function(v) {
			fade.alpha = v;
		}, "edgefade");
		eh.funcTweenModEvent(target1, 800, 59, ModConstants.getEaseFromString("linear"), 0, 0.7, function(v) {
			fade.alpha = v;
		}, "edgefade");
		eh.funcTweenModEvent(target1, 859.99, 0.1, ModConstants.getEaseFromString("outExpo"), 0.7, 0, function(v) {
			fade.alpha = v;
		}, "edgefade");
		eh.funcTweenModEvent(target1, 1055, 0.5, ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
			fade.alpha = v;
		}, "edgefade");
		
		
		
		var blackOut:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOut.scrollFactor.set();
		game.customLuaSprites.set("blackOut", blackOut);
		PlayState.instance.add(blackOut);
		blackOut.screenCenter();
		blackOut.cameras = [game.camAFT];
		
		var noise:FunkinSprite = new FunkinSprite();
		noise.frames = Paths.getSparrowAtlas('inhuman/noise');	
		noise.animation.addByPrefix('idle', 'noise', 48, true);	
		noise.animation.play("idle");
		game.customLuaSprites.set("noise", noise);
		game.add(noise);
		noise.scrollFactor.set();
		noise.setGraphicSize(FlxG.width, FlxG.height);
		noise.screenCenter();
		noise.cameras = [game.camAFT];
		
		addResetEvent(function(){
			noise.alpha = 0;
			blackOut.alpha = 0;
		});
		
		eh.funcModEvent(target1, 599, function() {
			noise.alpha = 0.3;
		});
		eh.funcModEvent(target1, 600, function() {
			noise.alpha = 0.0;
		});
		
		eh.funcModEvent(target1, 608, function() {
			noise.alpha = 0.3;
		});
		eh.funcModEvent(target1, 608.25, function() {
			noise.alpha = 0.0;
		});
		
		eh.funcModEvent(target1, 609.8, function() {
			noise.alpha = 0.35;
		});
		eh.funcModEvent(target1, 609.99, function() {
			noise.alpha = 0.0;
		});
		eh.funcModEvent(target1, 612, function() {
			noise.alpha = 0.3;
		});
		eh.funcModEvent(target1, 612.49, function() {
			noise.alpha = 0.0;
		});
		eh.funcModEvent(target1, 613.5, function() {
			noise.alpha = 0.4;
		});
		eh.funcModEvent(target1, 613.8, function() {
			noise.alpha = 0.0;
		});
		eh.funcModEvent(target1, 616.24, function() {
			noise.alpha = 0.41;
		});
		eh.funcModEvent(target1, 616.74, function() {
			noise.alpha = 0.0;
		});
		eh.funcModEvent(target1, 618.5, function() {
			noise.alpha = 0.6;
			blackOut.alpha = 1;
		});
		
		eh.funcModEvent(target1, 619.75, function() {
			noise.alpha = 0.0;
			blackOut.alpha = 1;
		});
		
		eh.funcModEvent(target1, 628, function() {
			bg_intro.alpha = 0;
			bg.alpha = 0;
			blackOut.alpha = 0;
		});
		
		eh.funcModEvent(target1, 640, function() {
			noise.alpha = 0.0;
			blackOut.alpha = 0;
			bg.alpha = 1;
		});
		
		eh.funcModEvent(target1, 639, function() {
			noise.alpha = 0.9;
		});
		

		eh.funcTweenModEvent(target1, 1120, 2, ModConstants.getEaseFromString("impulse"), 0.1, 0.35, function(v) {
			noise.alpha = v;
		}, "noiseAlpha");
		
		eh.funcTweenModEvent(target1, 1120, 2, ModConstants.getEaseFromString("linear"), 0.1, 0.35, function(v) {
			blackOut.alpha = v;
		}, "blackoutAlpha");
		
		eh.funcTweenModEvent(target1, 1122, 1130-1122, ModConstants.getEaseFromString("outSine"), 0.35, 1, function(v) {
			blackOut.alpha = v;
		}, "blackoutAlpha");
		
		
		// CINDER

		var cinderAndQTChar:ZSprite = new ZSprite();
		cinderAndQTChar.frames = Paths.getSparrowAtlas('inhuman/cinder/Cinder grabs QT');	
		cinderAndQTChar.animation.addByPrefix('idle', 'idle', 6, true);	
		cinderAndQTChar.animation.addByPrefix('closed', 'closed', 12, true);	
		cinderAndQTChar.animation.addByPrefix('xd', 'xd', 12, true);	
		cinderAndQTChar.animation.play("idle");
		game.customLuaSprites.set("cinderAndQTChar", cinderAndQTChar);
		game.currentStage.add(cinderAndQTChar);
		cinderAndQTChar.scrollFactor.set();
		cinderAndQTChar.screenCenter();
		cinderAndQTChar.zIndex = 175;
		
		var cinderChar:ZSprite = new ZSprite();
		//cinderChar.loadGraphic(Paths.image('inhuman/cinder/cinder placeholder'));
		cinderChar.frames = Paths.getSparrowAtlas('inhuman/cinder/Cinder');	
		cinderChar.animation.addByPrefix('idle', 'neutral', 24, true);	
		cinderChar.animation.addByPrefix('smug', 'smug', 24, true);	
		cinderChar.animation.addByPrefix('annoyed', 'annoyed', 24, true);	
		cinderChar.animation.play("idle");
		game.customLuaSprites.set("cinderChar", cinderChar);
		game.currentStage.add(cinderChar);
		cinderChar.zIndex = 178;
		cinderChar.scrollFactor.set();
		cinderChar.screenCenter();
		cinderChar.y += 16;
		if(!Preferences.downscroll) cinderChar.y += 22; //push cinder lower for upscroll
		
		addResetEvent(function(){
			cinderChar.animation.play("smug");
			cinderChar.alpha = 0;
			cinderChar.z = -64;
			
			cinderAndQTChar.alpha = 0;
			cinderAndQTChar.animation.play("idle");
		});
		
		addUpdate(function(elapsed){
			cinderChar.offset.y = FlxMath.fastSin(Conductor.instance.songPosition/1000)*8;
			cinderAndQTChar.offset.y = FlxMath.fastSin(Conductor.instance.songPosition/1000)*8;
		});	
		
		eh.funcModEvent(target1, 414, function() {
			cinderChar.animation.play("smug");
		});
		
		eh.funcModEvent(target1, 639, function() {
			cinderChar.animation.play("idle");
		});
		
		eh.funcModEvent(target1, 702, function() {
			cinderChar.animation.play("smug");
		});
		
		eh.funcModEvent(target1, 710, function() {
			cinderChar.animation.play("idle");
		});
		
		eh.funcModEvent(target1, 927+pushBack1, function() {
			cinderChar.animation.play("annoyed");
		});
		
		eh.funcTweenModEvent(target1, 415.2, 2, ModConstants.getEaseFromString("inOutCubic"), 0.0, 0.2, function(v) {
			cinderChar.alpha = v;
		}, "cinderCharAlpha");
		
		eh.funcTweenModEvent(target1, 476, 1, ModConstants.getEaseFromString("outExpo"), 0.2, 0.0, function(v) {
			cinderChar.alpha = v;
		}, "cinderCharAlpha");
		
		eh.funcTweenModEvent(target1, 640, 0.5, ModConstants.getEaseFromString("outExpo"), 0.0, 0.8, function(v) {
			cinderChar.alpha = v;
		}, "cinderCharAlpha");
		
		eh.funcTweenModEvent(target1, 702, 2, ModConstants.getEaseFromString("inOutCubic"), 0.8, 0.0, function(v) {
			cinderChar.alpha = v;
		}, "cinderCharAlpha");
		
		eh.funcTweenModEvent(target1, 800+pushBack1, 5, ModConstants.getEaseFromString("outBack"), FlxG.height*0.9, 0, function(v) {
			cinderChar.y2 = v;
		}, "cinderCharY2");
		
		eh.funcTweenModEvent(target1, 800+pushBack1, 2, ModConstants.getEaseFromString("inOutExpo"), 0.0, 0.87, function(v) {
			cinderChar.alpha = v;
		}, "cinderCharAlpha");
		
		eh.funcTweenModEvent(target1, 862+pushBack1, 2, ModConstants.getEaseFromString("inOutExpo"), 0.87, 0.0, function(v) {
			cinderChar.alpha = v;
		}, "cinderCharAlpha");
		
		//eh.funcTweenModEvent(target1, 927+pushBack1, 0.5, ModConstants.getEaseFromString("outExpo"), 0.0, 0.88, function(v) {
		//	cinderChar.alpha = v;
		//}, "cinderCharAlpha");
		
		eh.funcTweenModEvent(target1, 927+pushBack1, 0.5, ModConstants.getEaseFromString("outExpo"), 0.0, 1, function(v) {
			cinderAndQTChar.alpha = v;
		}, "cinderQTCharAlpha");
		
		
		
		var cinderTaunt:FunkinSprite = new FunkinSprite();
		cinderTaunt.frames = Paths.getSparrowAtlas('inhuman/cinder/cinderTaunt_v2');	
		cinderTaunt.animation.addByPrefix('idle', 'cinderTAUNT', 24, true);	
		cinderTaunt.animation.play("idle");
		game.customLuaSprites.set("cinderTaunt", cinderTaunt);
		game.currentStage.add(cinderTaunt);
		cinderTaunt.zIndex = 199;
		cinderTaunt.setGraphicSize(FlxG.width+160);
		cinderTaunt.scrollFactor.set();
		cinderTaunt.screenCenter();
		cinderTaunt.y += 52;
		cinderTaunt.alpha = 1;
		
		addResetEvent(function(){
			cinderTaunt.alpha = 0;
			cinderTaunt.animation.play("idle");
		});
		
		
		eh.funcTweenModEvent(target1, 158, 0.5, ModConstants.getEaseFromString("outExpo"), 0, 0.35, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");
		
		eh.funcTweenModEvent(target1, 159, 1.5, ModConstants.getEaseFromString("inOutExpo"), 0.35, 0.0, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");
		
		eh.funcTweenModEvent(target1, 349.25, 0.75, ModConstants.getEaseFromString("inExpo"), 0.0, 0.45, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");
		eh.funcTweenModEvent(target1, 351.25, 0.75, ModConstants.getEaseFromString("inOutQuint"), 0.45, 0.0, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");
		
		
		
		// ERR
		
		var error = createSpr("error", 'inhuman/cinder/back - Copy');
		error.setGraphicSize(FlxG.width, FlxG.height);
		error.screenCenter();

		for (i in 416...443){
			if(i%4 == 0){
				eh.funcTweenModEvent(target1, i, 0.25, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
					error.alpha = v;
				}, "error_fade");
			}else if(i%4 == 2){
				eh.funcTweenModEvent(target1, i-0.4, 1.2, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0, function(v) {
					error.alpha = v;
				}, "error_fade");
			}
		}
		eh.funcTweenModEvent(target1, 456, 0.25, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
			error.alpha = v;
		}, "error_fade");
		eh.funcTweenModEvent(target1, 456+2-0.4, 1.2, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0, function(v) {
			error.alpha = v;
		}, "error_fade");
		eh.funcTweenModEvent(target1, 464, 0.25, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
			error.alpha = v;
		}, "error_fade");
		eh.funcTweenModEvent(target1, 464+2-0.4, 1.2, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0, function(v) {
			error.alpha = v;
		}, "error_fade");
		eh.funcTweenModEvent(target1, 472, 0.25, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
			error.alpha = v;
		}, "error_fade");
		eh.funcTweenModEvent(target1, 472+2-0.4, 1.2, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0, function(v) {
			error.alpha = v;
		}, "error_fade");
		
		
		
		var error2 = createSpr("error2", 'inhuman/SMPTE_Color_Bars');
		error2.setGraphicSize(FlxG.width, FlxG.height);
		error2.screenCenter();

		addResetEvent(function(){
			error2.alpha=0;	
			error.alpha=0;	
		});
		
		eh.funcTweenModEvent(target1, 444-0.06, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 448-0.06, 0.1, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		
		eh.funcTweenModEvent(target1, 476-0.06, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 476+4-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 543-0.06, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 544-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		
		
		eh.funcTweenModEvent(target1, 860-0.06, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0.0, 1.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 862-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 1.0, 0.0, function(v) {
			error2.alpha = v;
		}, "error2_fade");


		var insecurityBuildupErrorAlpha:Float = 0.25;
		eh.funcTweenModEvent(target1, 808-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0, insecurityBuildupErrorAlpha, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 810-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"),insecurityBuildupErrorAlpha, 0, function(v) {
			error2.alpha = v;
		}, "error2_fade");

		eh.funcTweenModEvent(target1, 812-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0, insecurityBuildupErrorAlpha, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 812+2-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), insecurityBuildupErrorAlpha, 0, function(v) {
			error2.alpha = v;
		}, "error2_fade");

		eh.funcTweenModEvent(target1, 824-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0, insecurityBuildupErrorAlpha, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 824+2-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"),insecurityBuildupErrorAlpha, 0, function(v) {
			error2.alpha = v;
		}, "error2_fade");

		eh.funcTweenModEvent(target1, 824+4-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0, insecurityBuildupErrorAlpha, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 824+4+2-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), insecurityBuildupErrorAlpha, 0, function(v) {
			error2.alpha = v;
		}, "error2_fade");


		eh.funcTweenModEvent(target1, 840-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0, insecurityBuildupErrorAlpha, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 840+2-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"),insecurityBuildupErrorAlpha, 0, function(v) {
			error2.alpha = v;
		}, "error2_fade");

		eh.funcTweenModEvent(target1, 840+4-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0, insecurityBuildupErrorAlpha, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 840+4+2-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), insecurityBuildupErrorAlpha, 0, function(v) {
			error2.alpha = v;
		}, "error2_fade");

		eh.funcTweenModEvent(target1, 856-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), 0, insecurityBuildupErrorAlpha, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		eh.funcTweenModEvent(target1, 856+2-0.1, 0.1, ModConstants.getEaseFromString("inOutExpo"), insecurityBuildupErrorAlpha, 0, function(v) {
			error2.alpha = v;
		}, "error2_fade");
		
		
		
		// INSECURITY TEXT
		
		var insecurityEffectSprite = createSpr("insecurityEffectSprite", 'inhuman/cinder/insecurity-text/cRematch_text_FOCUS_cut');
		insecurityEffectSprite.setGraphicSize(FlxG.width);
		insecurityEffectSprite.screenCenter();
		insecurityEffectSprite.shader=insecurityEffectShader;
		insecurityEffectSprite.zIndex = 222;
		
		addResetEvent(function(){
			insecurityEffectSprite.loadGraphic(Paths.image('inhuman/cinder/insecurity-text/cRematch_text_FOCUS_cut'));
			insecurityEffectSprite.visible = false;
			insecurityEffectSprite.cameras = [game.camGame];
		});
		
		eh.funcModEvent(target1, 222, function() {
			insecurityEffectSprite.loadGraphic(Paths.image('inhuman/cinder/insecurity-text/cRematch_text_FOCUS_cut'));
			insecurityEffectSprite.visible = true;
			insecurityEffectShader.setBool('flipAlpha', false);
		});
		
		eh.funcModEvent(target1, 223, function() {
			insecurityEffectSprite.loadGraphic(Paths.image('inhuman/cinder/insecurity-text/cRematch_text_FOCUS'));
			insecurityEffectShader.setBool('flipAlpha', true);
		});
		
		eh.funcModEvent(target1, 224, function() {
			insecurityEffectSprite.visible = false;
		});
		
		
		eh.funcModEvent(target1, 734+pushBack1, function() {
			insecurityEffectSprite.visible = true;
			insecurityEffectShader.setBool('flipAlpha', true);
			insecurityEffectSprite.loadGraphic(Paths.image('inhuman/cinder/insecurity-text/text_MY'));
		});
		eh.funcModEvent(target1, 735+pushBack1, function() {
			insecurityEffectSprite.visible = true;
			insecurityEffectShader.setBool('flipAlpha', false);
			insecurityEffectSprite.loadGraphic(Paths.image('inhuman/cinder/insecurity-text/text_TURN'));
		});
		eh.funcModEvent(target1, 736+pushBack1, function() {
			insecurityEffectSprite.visible = false;
			
		});
		
		
		eh.funcModEvent(target1, 768+pushBack1, function() {
			insecurityEffectSprite.visible = true;
			insecurityEffectSprite.loadGraphic(Paths.image('inhuman/cinder/insecurity-text/cRematch_text_HA'));
			insecurityEffectShader.setBool('flipAlpha', true);
			insecurityEffectSprite.cameras = [game.camAFT];
		});
		
		for (i in 768...800){
			if(i%4 == 0){
				eh.funcModEvent(target1, i+1+pushBack1, function() {
					insecurityEffectShader.setBool('flipAlpha', false);
				});
			}else if(i%4 == 2){
				eh.funcModEvent(target1, i+1+pushBack1, function() {
					insecurityEffectShader.setBool('flipAlpha', true);
				});
			}
		}
		
		eh.funcModEvent(target1, 798.26+pushBack1, function() {
			insecurityEffectSprite.visible = false;
		});
		
		eh.funcModEvent(target1, 798.75+pushBack1, function() {
			insecurityEffectSprite.visible = true;
		});
		
		eh.funcModEvent(target1, 798.99+pushBack1, function() {
			insecurityEffectSprite.visible = false;
		});
		
		eh.funcModEvent(target1, 799.5+pushBack1, function() {
			insecurityEffectSprite.visible = true;
		});
		
		eh.funcModEvent(target1, 799.72+pushBack1, function() {
			insecurityEffectSprite.visible = false;
		});
		
		
		// SHADERS
		
		var glitch2 = new FlxRuntimeShader(Assets.getText(Paths.frag("inhuman/glitch2")), null);
		glitch2.setFloat('amount', 0.0);
		addUpdate(function(elapsed){
			glitch2.setFloat('uTime', Conductor.instance.songPosition/1000*2);
		});	
		
		var glitch2Mod:CustomModifier = createCustomMod("glitch2", 0.00);
		glitch2Mod.modPriority = -9990;
		glitch2Mod.strumsMod = false;
		glitch2Mod.notesMod = false;
		glitch2Mod.holdsMod = false;
		glitch2Mod.pathMod = false;
		glitch2Mod.specialMod = true;
		glitch2Mod.speedMod = false;
		glitch2Mod.unknown = false;
		eh.addCustomMod("1", glitch2Mod);
		glitch2Mod.specialMath = function() {
			glitch2.setFloat('amount', glitch2Mod.currentValue);
		};		
		
		var glitchLinesShader = new FlxRuntimeShader(Assets.getText(Paths.frag("inhuman/GlitchLineShader")), null);
		glitchLinesShader.setFloat('uFrequency', 0.0);
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
		eh.addCustomMod("1", glitchLinesMod);
		glitchLinesMod.specialMath = function() {
			glitchLinesShader.setFloat('uFrequency', glitchLinesMod.currentValue);
		};
		
		
		var pixelateShader = new FlxRuntimeShader(Assets.getText(Paths.frag("inhuman/pixelate_effect")), null);
		addResetEvent(function(){
			pixelateShader.setFloat('xAmount', 1.0);
			pixelateShader.setFloat('yAmount', 1.0);
		});
		
		eh.funcTweenModEvent(target1, 608, 10, ModConstants.getEaseFromString("linear"), 1, 20, function(v) {
			pixelateShader.setFloat('xAmount', v);
			pixelateShader.setFloat('yAmount', v);
		}, "pixelFuck");
		
		eh.funcTweenModEvent(target1, 620, 0.1, ModConstants.getEaseFromString("outExpo"), 1, 1, function(v) {
			pixelateShader.setFloat('xAmount', v);
			pixelateShader.setFloat('yAmount', v);
		}, "pixelFuck");

		
		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(glitch2));
		newCamEffects.push(new ShaderFilter(glitchLinesShader));
		newCamEffects.push(new ShaderFilter(pixelateShader));
	
	
		addResetEvent(function(){
			if(Conductor.instance.currentBeatTime < 620){
				//game.camHUD.filters = (newCamEffects);
				game.camNotes.filters = (newCamEffects);
				game.camGame.filters = (newCamEffects);
			}
		});
		
		eh.funcModEvent(target1, 640, function() {
			//game.camHUD.filters = (newCamEffects);
			game.camNotes.filters = (newCamEffects);
			game.camGame.filters = (newCamEffects);
		});
		
		
		
		
		
		
		var sawbladeAlert:ZSprite = new ZSprite();
		sawbladeAlert.frames = Paths.getSparrowAtlas('inhuman/kb/attack_alert_NEW');	
		sawbladeAlert.animation.addByPrefix('alert', 'kb_attack_animation_alert-single', 24, false);	
		sawbladeAlert.animation.play("alert");
		game.customLuaSprites.set("sawbladeAlert", sawbladeAlert);
		game.currentStage.add(sawbladeAlert);
		sawbladeAlert.scrollFactor.set();
		sawbladeAlert.screenCenter();
		sawbladeAlert.x += FlxG.width * 0.33;
		sawbladeAlert.zIndex = 190;
		
		addResetEvent(function(){
			sawbladeAlert.alpha = 0;
		});
		
		
		
		//Dialogue
		
		var txtSound_cinder = FunkinSound.load(Paths.sound('inhuman/dialogue/cinder'), 0.65, false);
        txtSound_cinder.volume = 0.6;
		var cinderCol = 0xFFC600FF;
		
		var txtSound_qt = FunkinSound.load(Paths.sound('inhuman/dialogue/qt'), 0.65, false);
        txtSound_qt.volume = 0.6;
		var qtCol = 0xFFFB96B7;
		
		var txtSound_kb = FunkinSound.load(Paths.sound('inhuman/dialogue/kb'), 0.65, false);
        txtSound_kb.volume = 0.6;
		var kbCol = 0xFF808080;
		
		cinderTypedText = new FlxTypeText(12,24,FlxG.width,"hi :)", 64);
		cinderTypedText.setFormat(Paths.font("vcr.ttf"), 30, 0xFFFFFFFF, "center", textBorderStyle("outline"), 0xFF000000);
		cinderTypedText.useDefaultSound = false;
		cinderTypedText.sounds = [txtSound_cinder];
		cinderTypedText.delay = 0.02;
		cinderTypedText.cameras = [game.camHUD];
		game.add(cinderTypedText);
		cinderTypedText.scrollFactor.set();
		cinderTypedText.screenCenter();
		game.customLuaSprites.set("cinderTypedText", cinderTypedText);
		cinderTypedText.zIndex = 187;
		
		
		addResetEvent(function(){
			cinderTypedText.resetText("");
			cinderTypedText.color = cinderCol;
			cinderTypedText.sounds = [txtSound_cinder];
		});	
		
		
		
		
		var postDarkScapeText:Array<String> = [
			"There you are!",
			"Did you think you could hide from me?",
			"I'll be honest,\nI was surprised you managed to sneak your way out of here.",
			"I don't even know where you went...",
			"But I don't care.",
			"Anyway, I think it's time we get back on track.",
			"Good luck I guess."
		];
		
		eh.funcModEvent(target1, 641, function() {
			cinderTypedText.resetText(postDarkScapeText[0]);
			cinderTypedText.delay = 0.035;
			cinderTypedText.start();
		});
		
		eh.funcModEvent(target1, 647, function() {
			cinderTypedText.resetText(postDarkScapeText[1]);
			cinderTypedText.start();
		});
		
		
		eh.funcModEvent(target1, 655.8, function() {
			cinderTypedText.resetText(postDarkScapeText[2]);
			cinderTypedText.start();
		});
		
		eh.funcModEvent(target1, 671, function() {
			cinderTypedText.resetText(postDarkScapeText[3]);
			cinderTypedText.start();
		});
		eh.funcModEvent(target1, 679.2, function() {
			cinderTypedText.resetText(postDarkScapeText[4]);
			cinderTypedText.start();
		});
		eh.funcModEvent(target1, 687.6, function() {
			cinderTypedText.resetText(postDarkScapeText[5]);
			cinderTypedText.start();
		});
		
		eh.funcModEvent(target1, 697.82, function() {
			cinderTypedText.resetText(postDarkScapeText[6]);
			cinderTypedText.start();
		});
		
		eh.funcModEvent(target1, 704, function() {
			cinderTypedText.resetText("");
		});
		
		
		var giveUpText:Array<String> = [
			"You're still here?",
			"You really don't know when to give up... do you?",
			"You know what...",
			"I'll make you give up.",
			"By making you attempt something impossible."
		];
		
		eh.funcModEvent(target1, 807.8+pushBack1, function() {
			cinderTypedText.resetText(giveUpText[0]);
			cinderTypedText.start();
			cinderTypedText.delay = 0.02;
		});
		
		eh.funcModEvent(target1, 816+pushBack1, function() {
			cinderTypedText.resetText(giveUpText[1]);
			cinderTypedText.start();
		});
		eh.funcModEvent(target1, 831.7+pushBack1, function() {
			cinderTypedText.resetText(giveUpText[2]);
			cinderTypedText.start();
		});
		
		eh.funcModEvent(target1, 839.77+pushBack1, function() {
			cinderTypedText.resetText(giveUpText[3]);
			cinderTypedText.start();
		});
		eh.funcModEvent(target1, 847.77+pushBack1, function() {
			cinderTypedText.resetText(giveUpText[4]);
			cinderTypedText.start();
		});
		
		
		eh.funcModEvent(target1, 864+pushBack1, function() {
			cinderTypedText.resetText("");
		});
	
		
		
		var endText:Array<String> = [
			"C:What are YOU doing here?!",
			"Q:To save a friend.",
			"C:pft",
			"C:Hahaha!",
			"C:What friend?! There is nobody here.\nNothing is left you idiot.",
			"Q:You're wrong. I know Ashley is still here.",
			"C:Ashley?",
			"C:Well, even if she was still around,\nwhat makes you think I'll just let you talk to her?",
			"Q:...",
			"C:As if I'm just going to let you be in control here.",
			"*sawblade*",
			"C:Wh..Whatt?!",
			"K:Did you think QT would just come here alone?",
		];
		
		function endDialogueFunc(id){

			var sawblade:Bool = id == -1;
			var theText = endText[id];
			if(sawblade || theText == "*sawblade*" ){
				cinderTypedText.resetText("");
				return;
			}
			
			if(StringTools.contains(theText, "C:")){
				theText = StringTools.replace(theText, "C:", "");
				cinderTypedText.color = cinderCol;
				cinderTypedText.sounds = [txtSound_cinder];
			}else if(StringTools.contains(theText, "Q:")){
				theText = StringTools.replace(theText, "Q:", "");
				cinderTypedText.color = qtCol;
				cinderTypedText.sounds = [txtSound_qt];
			}else if(StringTools.contains(theText, "K:")){
				theText = StringTools.replace(theText, "K:", "");
				cinderTypedText.color = kbCol;
				cinderTypedText.sounds = [txtSound_kb];

			}else{
				cinderTypedText.color = 0xFFFFFFFF;
			}
		
			cinderTypedText.resetText(theText);
			cinderTypedText.start();
		}
		
		
		eh.funcModEvent(target1, 928+pushBack1, function() {
			endDialogueFunc(0);
			cinderTypedText.delay = 0.02;
			cinderAndQTChar.animation.play("xd");
		});
		
		eh.funcModEvent(target1, 1062, function() {
			endDialogueFunc(1);
			cinderTypedText.delay = 0.025;
			cinderAndQTChar.animation.play("idle");
		});

		eh.funcModEvent(target1, 1066, function() {
			endDialogueFunc(2);
			cinderTypedText.delay = 0.02;
		});
		eh.funcModEvent(target1, 1067, function() {
			endDialogueFunc(3);
		});
		eh.funcModEvent(target1, 1069, function() {
			endDialogueFunc(4);
		});
		eh.funcModEvent(target1, 1079, function() {
			endDialogueFunc(5);
		});
		eh.funcModEvent(target1, 1087, function() {
			endDialogueFunc(6);
		});
		eh.funcModEvent(target1, 1090, function() {
			endDialogueFunc(7);
		});
		eh.funcModEvent(target1, 1103, function() {
			endDialogueFunc(8);
			cinderTypedText.delay = 0.4;
			cinderAndQTChar.animation.play("closed");
		});
		eh.funcModEvent(target1, 1110, function() {
			endDialogueFunc(9);
			cinderTypedText.delay = 0.025;
		});
		
		eh.funcModEvent(target1, 1120, function() {
			cinderTypedText.resetText("");
		});
		

		eh.funcModEvent(target1, 1118, function() {
			FunkinSound.playOnce(Paths.sound('inhuman/qt/alert'), 0.4);
			sawbladeAlert.animation.play("alert");
			sawbladeAlert.alpha = 1;
		}, "sawbladesfx1", false);
		
		eh.funcModEvent(target1, 1119, function() {
			FunkinSound.playOnce(Paths.sound('inhuman/qt/alert'), 0.4);
			sawbladeAlert.alpha = 1;
			sawbladeAlert.animation.play("alert");
		}, "sawbladesfx2", false);
		
		eh.funcModEvent(target1, 1120, function() {
			FunkinSound.playOnce(Paths.sound('inhuman/qt/attack'), 0.45);
			
		}, "sawbladesfx3", false);


		eh.funcModEvent(target1, 1127.5, function() {
			endDialogueFunc(12);
			cinderTypedText.delay = 0.034;
		});
		
		
		
		game.currentStage.refresh();
	]])
	
	ease(1120, 0.25, "outExpo", 0.8, "glitch2", "1")
	ease(1120, 0.25, "outExpo", 0.1, "glitchLines", "1")
	ease(1120.4, 1, "linear", 0.02, "glitchLines", "1")
	ease(1122, 4, "linear", 2, "glitch2", "1")
end


