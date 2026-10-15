function modsTimeline()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("AdjustColorShader", "funkin.graphics.shaders")
	addHaxeLibrary("ZProjectSpriteGroup", "funkin.graphics")
	addHaxeLibrary("ZSpriteProjected", "funkin.graphics")
	addHaxeLibrary("CharacterType", "funkin.play.character")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
	
		var bf = PlayState.instance.currentStage.getBoyfriend();
		addResetEvent(function(){
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.scrollFactor.set();
			bf.screenCenter();
			bf.scale.set(0.7,0.7);
			bf.x += 300;
			bf.y += 16;
			bf.alpha = 0;
		});

		
		eh.funcTweenModEvent(target1, 228, 1,  FlxEase.expoOut, 0, 0.5, function(v) {
			bf.alpha=v;
		}, "bf-alpha");
		eh.funcTweenModEvent(target1, 259, 1,  FlxEase.cubeOut, 0.5, 0, function(v) {
			bf.alpha=v;
		}, "bf-alpha");
		
	
		
		var bg = createSpr("bg", 'SHIBUYA-HIGH/back', false);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.screenCenter();	
		PlayState.instance.customLuaSprites.set("bg", bg);
		game.currentStage.add(bg);
		bg.zIndex = 5;
		
		

		
		var scrollingBottom:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image('SHIBUYA-HIGH/scrolling_text_bar') );
		scrollingBottom.cullMode = "back";
		game.currentStage.add(scrollingBottom);
		PlayState.instance.customLuaSprites.set("scrollingBottom", scrollingBottom);
		scrollingBottom.zIndex = 10;
		scrollingBottom.screenCenter();	
		scrollingBottom.scrollFactor.set();
		scrollingBottom.y = FlxG.height - scrollingBottom.height;
		scrollingBottom.textureRepeat = true;

		var scrollingTop:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image('SHIBUYA-HIGH/scrolling_text_bar') );
		scrollingTop.cullMode = "back";
		game.currentStage.add(scrollingTop);
		PlayState.instance.customLuaSprites.set("scrollingTop", scrollingTop);
		scrollingTop.zIndex = 10;
		scrollingTop.screenCenter();	
		scrollingTop.scrollFactor.set();
		scrollingTop.y = 0;
		scrollingTop.textureRepeat = true;
		
		scrollingBottom.alpha=0.35;
		scrollingTop.alpha=0.35;
		
		scrollingTop.scaleX = 2;
		scrollingBottom.scaleX = 2;
		scrollingBottom.uvScale.x = 2;
		scrollingTop.uvScale.x = 2;
		
		addUpdate(function(elapsed){
			scrollingBottom.uvOffset.x = Conductor.instance.songPosition/1000*0.2;
			scrollingTop.uvOffset.x = Conductor.instance.songPosition/1000*-0.2;
		});	
		

		
		
		var scrollAngleY:CustomModifier = createCustomMod("scrolling_angle_y", 0.0);
		scrollAngleY.modPriority = -9990;
		scrollAngleY.specialMod = true;
		scrollAngleY.unknown = false;
		eh.addCustomMod("bf", scrollAngleY);
		scrollAngleY.specialMath = function() {
			scrollingTop.angleY = scrollAngleY.currentValue;
			scrollingBottom.angleY = scrollAngleY.currentValue;
		};		
		
		var scrollBounce:CustomModifier = createCustomMod("scrolling_y_bounce", 0.0);
		scrollBounce.modPriority = -9991;
		scrollBounce.specialMod = true;
		scrollBounce.unknown = false;
		eh.addCustomMod("bf", scrollBounce);
		scrollBounce.specialMath = function() {
			scrollingTop.y2 = -scrollBounce.currentValue;
			scrollingBottom.y2 = scrollBounce.currentValue;
		};
		
		

		

		
		var spinAlpha = 0.025;
		var spin = createSpr("spin", 'SHIBUYA-HIGH/spin', false);
		spin.screenCenter();	
		PlayState.instance.customLuaSprites.set("spin", spin);
		game.currentStage.add(spin);
		spin.zIndex = 6;
		spin.angularVelocity = 45;
		if(Preferences.downscroll){
			spin.y -= FlxG.height/2;
		}else{
			spin.y += FlxG.height/2;
		}
		spin.scale.set(2,2);
		
		addResetEvent(function(){
			spin.alpha=0;
		});	
		
		eh.funcTweenModEvent(target1, 36, 8,  FlxEase.sineOut, 0.0, spinAlpha, function(v) {
			getSpr("spin").alpha=v;
		}, "spin-fade");
		
		eh.funcTweenModEvent(target1, 64, 0.1,  FlxEase.sineOut, spinAlpha, 0.0, function(v) {
			getSpr("spin").alpha=v;
		}, "spin-fade");
		
		eh.funcTweenModEvent(target1, 68, 1,  FlxEase.sineOut, 0, spinAlpha, function(v) {
			getSpr("spin").alpha=v;
		}, "spin-fade");
		
		eh.funcTweenModEvent(target1, 324, 16,  FlxEase.linear, spinAlpha, 0, function(v) {
			getSpr("spin").alpha=v;
		}, "spin-fade");
		
		
		
		
		
		
		var screenOverlay:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFFFFFFFF);
		screenOverlay.scrollFactor.set();
		game.customLuaSprites.set("screenOverlay", screenOverlay);
		PlayState.instance.add(screenOverlay);
		screenOverlay.screenCenter();
		screenOverlay.color = 0xFFFF5BBA;
		screenOverlay.alpha = 0.28;
		screenOverlay.blend = getBlendMode("screen");
		screenOverlay.cameras = [game.camHUD, game.camNotes];
		
		
		
		var blackOverlay:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOverlay.scrollFactor.set();
		game.customLuaSprites.set("blackOverlay", blackOverlay);
		PlayState.instance.add(blackOverlay);
		blackOverlay.screenCenter();
		blackOverlay.alpha = 1;
		blackOverlay.cameras = [game.camAFT];
		addResetEvent(function(){
			blackOverlay.alpha = 1;
		});	
		eh.funcTweenModEvent(target1, 0, 4,  FlxEase.cubeOut, 1, 0.1, function(v) {
			getSpr("blackOverlay").alpha=v;
		}, "blackOverlay-fade");
		eh.funcTweenModEvent(target1, 32, 16,  FlxEase.linear, 0.1, 0.0, function(v) {
			getSpr("blackOverlay").alpha=v;
		}, "blackOverlay-fade");
		
		eh.funcTweenModEvent(target1, 64, 1,  FlxEase.expoOut, 0.0, 1, function(v) {
			getSpr("blackOverlay").alpha=v;
		}, "blackOverlay-fade");
		eh.funcTweenModEvent(target1, 65, 0.1,  FlxEase.expoOut, 1, 0, function(v) {
			getSpr("blackOverlay").alpha=v;
		}, "blackOverlay-fade");
		eh.funcTweenModEvent(target1, 324, 16,  FlxEase.linear, 0, 0.4, function(v) {
			getSpr("blackOverlay").alpha=v;
		}, "blackOverlay-fade");
		eh.funcTweenModEvent(target1, 340, 4,  FlxEase.linear, 0.4, 1, function(v) {
			getSpr("blackOverlay").alpha=v;
		}, "blackOverlay-fade");
		
		
		
		
		var targetRatio:Float = 4/3;
		//Shrink the x Resolution to be 4:3 ratio
		var newWidth:Float = FlxG.width / targetRatio;
		//print(newWidth);

		var leftBorder = createSpr("leftBorder", 'SHIBUYA-HIGH/aspectRatioBorder', false);
		leftBorder.screenCenter();	
		PlayState.instance.customLuaSprites.set("leftBorder", leftBorder);
		game.add(leftBorder);
		leftBorder.zIndex = 9999;
		leftBorder.cameras = [game.camHUD];
		leftBorder.x -= leftBorder.width/2;
		leftBorder.x -= newWidth/2;
		
		var rightBorder = createSpr("rightBorder", 'SHIBUYA-HIGH/aspectRatioBorder', false);
		rightBorder.screenCenter();	
		PlayState.instance.customLuaSprites.set("rightBorder", rightBorder);
		game.add(rightBorder);
		rightBorder.zIndex = 9999;
		rightBorder.cameras = [game.camHUD];
		rightBorder.x += rightBorder.width/2;
		rightBorder.x += newWidth/2;
		
		
		
		
		
		
		var vcrShader = new FlxRuntimeShader(Assets.getText(Paths.frag("shibuya_high/vcr")), null);
		vcrShader.setBool('vignetteOn', true);
		vcrShader.setBool('perspectiveOn', true);
		vcrShader.setBool('scanlinesOn', true);
		vcrShader.setBool('distortionOn', true);
		vcrShader.setBool('vignetteMoving', false);
		vcrShader.setFloat('glitchModifier', 0.0175);
		addUpdate(function(elapsed){
			vcrShader.setFloat('iTime', Conductor.instance.songPosition/1000);
		});	
		
		
		
		var bloomShader = new FlxRuntimeShader(Assets.getText(Paths.frag("shibuya_high/bloom")), null);
		addResetEvent(function(){
			bloomShader.setFloat('BLOOM_INTENSITY', 1.21);
			bloomShader.setFloat('BLOOM_THRESHOLD', 0.04);
			bloomShader.setInt('BLUR_ITERATIONS', 3);
			bloomShader.setFloat('BLUR_SIZE', 0.02);
			bloomShader.setInt('BLUR_SUBDIVISIONS', 12);
			bloomShader.setBool('BLOOM_ONLY', false);
			bloomShader.setBool('DO_ALPHA', true);
			bloomShader.setBool('ENABLED', true);
		});	
		
		
		var pixelateShader = new FlxRuntimeShader(Assets.getText(Paths.frag("shibuya_high/pixelate_effect")), null);
		addResetEvent(function(){
			pixelateShader.setFloat('xAmount', 1.0);
			pixelateShader.setFloat('yAmount', 1.0);
		});
		
		var pixelMod:CustomModifier = createCustomMod("pixelate", 0.0);
		pixelMod.modPriority = -9990;
		pixelMod.strumsMod = false;
		pixelMod.notesMod = false;
		pixelMod.holdsMod = false;
		pixelMod.pathMod = false;
		pixelMod.specialMod = true;
		pixelMod.speedMod = false;
		pixelMod.unknown = false;
		eh.addCustomMod("bf", pixelMod);
		pixelMod.specialMath = function() {
			pixelateShader.setFloat('xAmount', pixelMod.currentValue + 4.0);
			pixelateShader.setFloat('yAmount', pixelMod.currentValue + 4.0);
		};
		
		
		
		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(pixelateShader));
		newCamEffects.push(new ShaderFilter(vcrShader));
		newCamEffects.push(new ShaderFilter(bloomShader));

		addResetEvent(function(){
			game.camHUD.filters = (newCamEffects);
			game.camNotes.filters=(newCamEffects);
			game.camGame.filters=(newCamEffects);
		});
		
		
		
		addResetEvent(function(){
			PlayState.instance.comboPopUps.offsets[0] = -276;
			PlayState.instance.comboPopUps.offsets[1] = 0;
		});
		
		
		game.currentStage.refresh();
		
	]])
	
	local function pixelThing(when)
		ease(when, 5, "linear", 12, "pixelate", "1")
		ease(when+5, 1, "linear", 0, "pixelate", "1")
	end
	
	pixelThing(110)
	pixelThing(78)
	
	ease(284.5, 4, "linear", 12, "pixelate", "1")
	ease(289, 3, "linear", 0, "pixelate", "1")
	ease(284.5+32, 4, "linear", 12, "pixelate", "1")
	ease(289+32, 3, "linear", 0, "pixelate", "1")
	
	
	local offScreen = 224
	setdefault(offScreen, "scrolling_y_bounce", "1")
	ease(65.5, 68-65.5, "inOutSine", 0, "scrolling_y_bounce", "1")
	ease(132, 3, "inOutSine", offScreen, "scrolling_y_bounce", "1")
	ease(194, 2, "outSine", 0, "scrolling_y_bounce", "1")
	ease(258, 2, "outSine", 0, "scrolling_y_bounce", "1")
	ease(228, 2, "outSine", offScreen, "scrolling_y_bounce", "1")
	ease(319, 6, "inCubic", offScreen*1.1, "scrolling_y_bounce", "1")
end
