function onCreate()
end


function setUp()
	centerOpponent("")
	centerPlayer("")
end


function stageVisuals()
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")
	runHaxeCode(
	[[
	var target1 = game.playerStrumline.mods;

	
	var bg = createSpr("bg", 'emergency_reset/bg');
	//bg.setGraphicSize(FlxG.width, FlxG.height);
	bg.setGraphicSize(Std.int(FlxG.width));
	bg.screenCenter();
	bg.active = false;
	
	var bgScrolling:FlxTiledSprite = new FlxTiledSprite(null, FlxG.width, FlxG.height, true, true);
	bgScrolling.loadGraphic(Paths.image("emergency_reset/perlin_noise"));
	PlayState.instance.add(bgScrolling);
	bgScrolling.camera = game.camGame;
	bgScrolling.scrollFactor.set();
	bgScrolling.screenCenter();
	PlayState.instance.customLuaSprites.set("scrollingBG", bgScrolling);	
	bgScrolling.alpha = 0.1;
	
	var bg2 = createSpr("bg2", 'emergency_reset/detailsKB');
	bg2.setGraphicSize(Std.int(FlxG.width));
	bg2.screenCenter();
	bg2.active = false;
	
	var gradient = createSpr("gradient", 'emergency_reset/gradient');
	gradient.setGraphicSize(Std.int(FlxG.width));
	gradient.screenCenter();
	gradient.active = false;
	gradient.y = FlxG.height - gradient.height;
	
	//dumb layering moment lmfao
	game.remove(game.opponentStrumline);
	game.remove(game.playerStrumline);
	game.opponentStrumline.zIndex = 999;
	game.add(game.opponentStrumline);
	game.add(game.playerStrumline);
	game.remove(game.customZspritesGroup);
	game.customZspritesGroup.zIndex = 1000;
	game.add(game.customZspritesGroup);
	
	var howManyPincers:Int = 4;
	//Create pincers!
	for (i in 0...howManyPincers){
		var pincerName:String = "pincer_" + i;
	
		var pincer:ZSprite = createZSpr(pincerName, 'emergency_reset/pincer-close', false);
		pincer.zIndex = 1000;
		
		//game.customZspritesGroup.add(pincer);
		PlayState.instance.customZspritesGroup.add(pincer);
		PlayState.instance.customLuaSprites.set(pincerName, pincer);
		
		pincer.angle = -90;		
		pincer.camera = game.camNotes;
		
		pincerName = "pincer_reverse_" + i;
	
		var pincer = createZSpr(pincerName, 'emergency_reset/pincer-close', false);
		pincer.zIndex = 1000;
		game.customZspritesGroup.add(pincer);
		PlayState.instance.customLuaSprites.set(pincerName, pincer);
		
		game.remove(game.customZspritesGroup);
		game.customZspritesGroup.zIndex = 500;
		game.add(game.customZspritesGroup);
		
		pincer.angle = 90;		
		pincer.camera = game.camNotes;
	}
	
	
	var plusOffsetYMod:CustomModifier = createCustomMod("pincers_angle", 0.0);
	plusOffsetYMod.modPriority = -9990;
	plusOffsetYMod.strumsMod = false;
    plusOffsetYMod.notesMod = false;
    plusOffsetYMod.holdsMod = false;
    plusOffsetYMod.pathMod = false;
    plusOffsetYMod.specialMod = true;
    plusOffsetYMod.unknown = false;
    plusOffsetYMod.speedMod = false;
	eh.addCustomMod("bf", plusOffsetYMod);
	plusOffsetYMod.specialMathFunc = function() {
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			if(p==null) continue;
			p.angle = -90;
			p.angle += plusOffsetYMod.currentValue;
			
			pincerName = "pincer_reverse_" + i;
			p = getSpr(pincerName);
			p.angle = 90;
			p.angle += plusOffsetYMod.currentValue;
		}
	};
	
	
	var vignette = createSpr("vignette", 'emergency_reset/vignette');
	vignette.setGraphicSize(FlxG.width, FlxG.height);
	vignette.screenCenter();
	vignette.zIndex = 5001;
	vignette.camera = game.camNotes;
	vignette.active = false;
	
	
	
		
	var spook = createSpr("spook", 'emergency_reset/spook');
	spook.setGraphicSize(FlxG.width, FlxG.height);
	spook.screenCenter();
	spook.zIndex = 5000;
	spook.camera = game.camNotes;
	spook.active = false;
	spook.alpha=0;
	
	setResetEvent(function(){
		getSpr("spook").alpha = 0;
	});
	eh.funcTweenModEvent(target1, 190, 0.2, ModConstants.getEaseFromString("cubeOut"), 0,1, function(v) {
		getSpr("spook").alpha = v;
	}, "spook");
	eh.funcTweenModEvent(target1, 191, 1, ModConstants.getEaseFromString("expoIn"), 1,0, function(v) {
		getSpr("spook").alpha = v;
	}, "spook");
	
	//make it only use the AFT when needed!
	eh.funcModEvent(target1, 190, function() {
		game.camHUD.shake(0.006,0.7);
		game.camNotes.shake(0.007,0.7);
		game.camGame.shake(0.005,0.7);
	}, "camShake", false);
	
	
	//Wait, just set pos to strum?
	addUpdate(function(elapsed){
		
		var b = getSpr("scrollingBG");
		b.scrollY += elapsed * 120;
		b.scrollX = FlxMath.fastSin(Conductor.instance.songPosition * 0.01 * 0.25) * 40;
	
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			var s = game.playerStrumline.getByIndex(i);
			p.x = s.x - s.strumExtraModData.noteStyleOffsetX;
			p.y = s.y - s.strumExtraModData.noteStyleOffsetY;		
			p.z = s.z;
			
			p.alpha = s.alpha;	
			p.x -= 170*2; //offset
			p.y -= 142;
			
			//To automatically swap the pincers around for upscroll / downscroll
			//if we're past the middle, fuck off
			var distanceFromCenter:Float =  ((FlxG.height/6) - p.y) * 2.35;
			distanceFromCenter = FlxMath.bound(distanceFromCenter, 0, 2000) *1.5;
			p.y += distanceFromCenter;
			if(distanceFromCenter == 0){
				//swap to grab
				p.loadGraphic(Paths.image("emergency_reset/pincer-close"));
			}else{
				//swap to open
				p.loadGraphic(Paths.image("emergency_reset/pincer-open"));
			}
			
			//if(i == 0){
			//	game.modDebugNotif(distanceFromCenter, 0xFFFFFFFF, 0.045, 0.001, 0.001);
			//}
			
			
			//CLOSE ENOUGH LMFAO
			var zThing:Float = s.z;
			zThing *= 0.001;
			var noteScaleX = zThing+1;
			var noteScaleY = zThing+1;
			p.scale.set(noteScaleX, noteScaleY);
			
			pincerName = "pincer_reverse_" + i;
			var p = getSpr(pincerName);
			var s = game.playerStrumline.getByIndex(i);
			p.x = s.x - s.strumExtraModData.noteStyleOffsetX;
			p.y = s.y - s.strumExtraModData.noteStyleOffsetY;	
			p.z = s.z;
			p.alpha = s.alpha;	
			p.x -= 170*2; //offset
			p.y -= 170;
			
			//To automatically swap the pincers around for upscroll / downscroll
			//if we're past the middle, fuck off
			var distanceFromCenter:Float =  (p.y - (FlxG.height/6)) * 2.35;
			distanceFromCenter = FlxMath.bound(distanceFromCenter, 0, 4000) *1.5;
			p.y -= distanceFromCenter;
			
			if(distanceFromCenter == 0){
				//swap to grab
				p.loadGraphic(Paths.image("emergency_reset/pincer-close"));
			}else{
				//swap to open
				p.loadGraphic(Paths.image("emergency_reset/pincer-open"));
			}
			
			//CLOSE ENOUGH LMFAO
			var zThing:Float = s.z;
			zThing *= 0.001;
			var noteScaleX = zThing+1;
			var noteScaleY = zThing+1;
			p.scale.set(noteScaleX, noteScaleY);
		}		
	});	
	
	
	
	var blackOverlay = createSpr("black", 'emergency_reset/black');
	blackOverlay.setGraphicSize(FlxG.width, FlxG.height);
	blackOverlay.screenCenter();
	blackOverlay.zIndex = 5005;
	blackOverlay.camera = game.camNotes;
	blackOverlay.active = false;
	
		
	eh.funcTweenModEvent(target1, 0, 64, ModConstants.getEaseFromString("cubeOut"), 1,0, function(v) {
		blackOverlay.alpha=v;
	}, "blackFade");
	
	eh.funcTweenModEvent(target1, 640, 12, ModConstants.getEaseFromString("linear"), 0,1, function(v) {
		blackOverlay.alpha=v;
	}, "blackFade");
	
	]])
end


function goofyThing(when)
	add(when, 1, "spike", 1.2, "invert")
	add(when+1, 1, "spike", 1.2, "invert")
	
	add(when+0.5, 0.5, "bounce", 45, "noteskewx")
	add(when+1.5, 0.5, "bounce", -45, "noteskewx")
end

function gasThing(when)
	add(when, 2, "outQuint", 360*2, "angle")
end

local lazyAlt = 1

function modsTimeline()
	stageVisuals()
	
	
	--TEMP FIX FOR NOW
	add(508,4, "inOutExpo", 0, "y", "dad")
	--TEMP FIX FOR NOW
	

	runHaxeCode(
	[[
	setResetEvent(function(){
		PlayState.instance.comboPopUps.offsets[0] = -400;
		PlayState.instance.comboPopUps.offsets[1] = 17;
	});	
	]])
	
	--go away dad
	setdefault(1, "alpha", "dad")
	setdefault(1, "debugalpha", "dad")
	setasleep(0, "dad", true) --dad doesn't do anything lmao
	
	setasleep(250, "dad", false)
	

	setdefault(1, "showlanemods", "bf")
	
	--Intro
	
	set(-16, -3, "center")
	set(-16, 1, "alpha", "bf")
	set(-16, 2, "tipsy")
	set(-16, 2, "waveyx")
	set(-16, -4, "movez")
	
	
	ease(0, 24, "outSine", 0, "center")
	ease(8, 24, "linear", 0, "alpha", "bf")
	ease(12, 48-12, "inOutQuad", 0, "movez")
	
	ease(48, 64-48, "inOutQuad", 0, "tipsy")
	ease(48, 64-48, "inOutQuad", 0, "waveyx")
	
	
	setdefault(70, "grain", "bf")
	setdefault(-0.2, "flip")
	
	set(-16, 1.5, "speedmod")
	
	for i = 64, 190-1 do 
		if lazyAlt == 1 then
			lazyAlt = -1
		else
			lazyAlt = 1
		end
		
		--add(i, 1, "pop", 30 * lazyAlt / 2, "pincers_angle","1")
		add(i, 1, "pop", 30 * lazyAlt, "rotatez")
		
		
		add(i, 1, "pop", -1, "tiny")
		add(i, 1, "pop",0.5, "tinystrum")
		
		add(i, 1, "pop", 0.5 , "brake")
		
	end
	
	
	ease(64+16, 4, "sineInOut", 0.1, "bumpyspeed")
	
	ease(128, 4, "sineInOut", 1, "tipsy")
	
	ease(190, 2, "sineInOut", 0, "bumpyspeed")
	ease(190, 2, "sineInOut", 0, "tipsy")
	
	goofyThing(94)
	goofyThing(126)
	goofyThing(158)

	gasThing(164)
	gasThing(172)
	gasThing(132)
	gasThing(140)
	
	
	
	
	
	
	--set(-16, 0.3, "arrowpath", 1)
	--set(-16, 0.3, "arrowpathwidth", 1)
	
	ease(191, 1, "quadInOut", 2, "beat")
	
	for i = 192, 192+64-1 + 64 - 4 do 
		if lazyAlt == 1 then
			lazyAlt = -1
		else
			lazyAlt = 1
		end
		
		add(i, 1, "bounce", 1 * lazyAlt, "moveX", 1)
		add(i, 1, "bounce", 0.5 * lazyAlt, "waveyx", 1)		
		add(i, 1, "bounce", 1 * lazyAlt, "circX", 1)
		
		add(i, 1, "bounce", 1 * lazyAlt *-1, "moveX", 2)
		add(i, 1, "bounce", 0.5 * lazyAlt*-1, "waveyx", 2)		
		add(i, 1, "bounce", 1 * lazyAlt*-1, "circX", 2)
		
	end
	
	
	for i = 208, 216-1, 1 do 		
		add(i, 0.5, "pop", -1, "tipsy", 1)		
		add(i+0.5, 0.5, "pop", 1, "tipsy", 1)		
	end
	for i = 220, 223-1, 1 do 		
		add(i, 0.5, "pop", -1, "tipsy", 1)		
		add(i+0.5, 0.5, "pop", 1, "tipsy", 1)		
	end
	for i = 224, 232-1, 1 do 		
		add(i, 0.5, "pop", -1, "tipsy", 1)		
		add(i+0.5, 0.5, "pop", 1, "tipsy", 1)		
	end
	
	add(240, 1, "pop", -0.28, "center--2", 1)
	add(241.5, 1, "pop", -0.28, "center--2", 1)
	add(243, 1, "pop", -0.23, "center--2", 1)
	add(241, 1, "pop", -0.28, "center--1", 1)
	add(242.5, 1, "pop", -0.28, "center--1", 1)
	add(243.5, 1, "pop", -0.18, "center--3", 1)
	add(244, 1, "pop", -0.18, "center--2", 1)
	add(244.5, 1, "pop", -0.18, "center--0", 1)
	add(245, 1, "pop", -0.18, "center--3", 1)
	add(245.5, 1, "pop", -0.18, "center--2", 1)
	add(246, 1, "pop", -0.18, "center--0", 1)
	add(246.5, 1, "pop", -0.18, "center--3", 1)
	add(247, 1, "pop", -0.18, "center--1", 1)
	add(247.5, 1, "pop", -0.18, "center--2", 1)
	
	
	ease(254, 0.5, "pop", -0.5, "brake", 1)
	ease(255, 0.5, "pop", -0.5, "brake", 1)
	
	local nextSect = 64
	add(nextSect+240, 1, "pop", -0.28, "center--2", 1)
	add(nextSect+241.5, 1, "pop", -0.28, "center--2", 1)
	add(nextSect+243, 1, "pop", -0.23, "center--2", 1)
	add(nextSect+241, 1, "pop", -0.28, "center--1", 1)
	add(nextSect+242.5, 1, "pop", -0.28, "center--1", 1)
	add(nextSect+243.5, 1, "pop", -0.18, "center--3", 1)
	add(nextSect+244, 1, "pop", -0.18, "center--2", 1)
	add(nextSect+244.5, 1, "pop", -0.18, "center--0", 1)
	add(nextSect+245, 1, "pop", -0.18, "center--3", 1)
	add(nextSect+245.5, 1, "pop", -0.18, "center--2", 1)
	add(nextSect+246, 1, "pop", -0.18, "center--0", 1)
	add(nextSect+246.5, 1, "pop", -0.18, "center--3", 1)
	add(nextSect+247, 1, "pop", -0.18, "center--1", 1)
	add(nextSect+247.5, 1, "pop", -0.18, "center--2", 1)
	
	
	
	for i = 208+nextSect, 216-1+nextSect, 1 do 		
		add(i, 0.5, "pop", -1, "tipsy", 1)		
		add(i+0.5, 0.5, "pop", 1, "tipsy", 1)		
	end
	for i = 220+nextSect, 223-1+nextSect, 1 do 		
		add(i, 0.5, "pop", -1, "tipsy", 1)		
		add(i+0.5, 0.5, "pop", 1, "tipsy", 1)		
	end
	for i = 224+nextSect, 232-1+nextSect, 1 do 		
		add(i, 0.5, "pop", -1, "tipsy", 1)		
		add(i+0.5, 0.5, "pop", 1, "tipsy", 1)		
	end
	
	ease(250, 1, "linear",-1 , "movez", "dad")
	ease(320, 4, "linear",0, "movez", "dad")

	ease(315.5, 0.5, "linear",0, "beat")
	
	ease(414, 2, "linear",0.7, "beat")
	set(440, 2, "beat__speed")
	
	set(446, -1.5, "beat")
	set(446, 4, "beat__speed")
	
	set(448, 1, "beat")
	set(448, 1, "beat__speed")
	
	
	ease(250, 64+6, "linear",360*20 , "angle", "dad")
	
	setdefault(1, "alpha", "dad")
	ease(254, 2, "linear", 0 , "alpha", "dad")
		
	
	set(250, 0.25, "stealth", "dad")
	ease(316, 4, "backIn", 1 , "stealth", "dad")
	ease(316, 4, "inOutSine", 1 , "alphastrum", "dad")
	
	
	
	
	for i = 320, 446, 16 do
		add(i, 8, "bounce", 20 , "rotatey", "bf")
		add(i+8, 8, "bounce", -20 , "rotatey", "bf")
	end
	
	for i = 320, 446, 16 do
		add(i+8, 4, "pop", 0.5 , "stealth", "bf")
	end
	
	

	ease(320, 4, "backInOut", 1 , "reverse--1", "bf")
	ease(324, 4, "backInOut", 1 , "reverse--3", "bf")
	ease(336, 4, "backInOut", 1 , "reverse--0", "bf")
	ease(338, 4, "backInOut", 1 , "reverse--2", "bf")
	ease(344, 4, "backInOut", 0 , "reverse--0", "bf")
	ease(346, 4, "backInOut", 0 , "reverse--3", "bf")
	ease(354, 4, "backInOut", 0 , "reverse--2", "bf")
	ease(361, 4, "backInOut", 1 , "reverse--0", "bf")
	
	ease(369, 4, "backInOut", 1 , "reverse--3", "bf")
	ease(370, 4, "backInOut", 1 , "reverse--2", "bf")
	
	ease(378, 4, "backInOut", 0 , "reverse--1", "bf")
	ease(378+2, 4, "backInOut", 0 , "reverse--0", "bf")
	
	
	
	--brutality motify
	ease(396, 4, "backInOut", 1 , "reverse--0", "bf")
	ease(396, 4, "backInOut", 0 , "reverse--2", "bf")
	
	ease(412, 4, "backInOut", 1 , "reverse--1", "bf")
	ease(412, 4, "backInOut", 0 , "reverse--3", "bf")
	
	
	ease(445.5, 2, "bounceOut", 0 , "reverse--0", "bf")
	ease(445.5, 2, "bounceOut", 0 , "reverse--1", "bf")
	ease(445.5, 2, "bounceOut", 0 , "reverse--2", "bf")
	ease(445.5, 2, "bounceOut", 0 , "reverse--3", "bf")
	
	
	add(398, 2, "bounce", 1.3 , "invert", "bf")
	add(414, 2, "bounce", 1.3 , "invert", "bf")
	add(430, 2, "bounce", 1.3 , "invert", "bf")
	add(446-4, 4, "tap", 1.3 , "invert", "bf")
	--add(398+16, 2, "bounce", 1.3 , "invert", "bf")
	--add(414+16, 2, "bounce", 1.3 , "invert", "bf")
	
	
	
	set(380,25, "grain", "bf")
	ease(380, 4, "inOutSine", 0.25 , "zigzag", "bf")
	--ease(380, 4, "inOutSine", 0.2 , "bumpyx", "bf")
	ease(380, 4, "inOutSine", -3.5 , "straightholds", "bf")
	
	ease(446, 4, "inOutSine", 0. , "wave", "bf")
	ease(446, 4, "inOutSine", 0. , "zigzag", "bf")
	ease(446, 4, "inOutSine", 0 , "straightholds", "bf")
	set(446.5,70, "grain", "bf")
	
	ease(320, 448-320, "linear", 360*120 , "anglez", "bf")
	ease(316, 4, "inOutSine", 1 , "speedmod", "bf")
	ease(316, 4, "inOutSine", 0.5 , "wave", "bf")
	
	
	ease(379.5, 1, "inOutSine", 1 , "longholds", "bf")
	ease(446, 2, "inOutSine", 1.5 , "speedmod", "bf")
	
	
	ease(446, 2, "inOutSine", 320 , "rotatez__offset_y", "bf")
	for i = 448, 446+64-1 do 
		if lazyAlt == 1 then
			lazyAlt = -1
		else
			lazyAlt = 1
		end
		
		add(i, 1, "bounce", 20 * lazyAlt / 2, "pincers_angle","1")
		add(i, 1, "bounce", 20 * lazyAlt, "rotatez")
	end
	
	
	
	
	
	--ending wall
	set(508, 4, "drunk__speed", "dad")
	set(508, 2, "drunk", "dad")
	set(508, 1.5, "orient", "dad")
	
	ease(512-4, 1, "linear", -0.7, "center", "dad")
	
	ease(512-2, 2, "linear", 0.9, "stealth", "dad")
	ease(512-2, 2, "linear", 0.0, "alphastrum", "dad")
	
	set(512-8, 3, "drunky__mult", "bf")
	set(512-8, 1.4, "drunky__desync", "bf")
	set(512-8, 3, "drunky__speed", "bf")
	ease(512-4, 4, "sineInOut", 0.5, "drunky", "bf")
	
	ease(511, 1, "outCube", 1.3 , "speedmod", "bf")
	for i = 448+64, 448+64+64-1 do 
		add(i, 1, "pop", -0.2 , "stealth", "dad")
	
		for l = 0, 4 do
			if l == 1 or l == 2 then
				add(i, 1, "linear", 45 , "rotatex--"..l, "bf")
			else
				add(i, 1, "linear", 45*-1 , "rotatex--"..l, "bf")
			end
		end
	end
	
	
	
	ease(576, 64+32, "cubeInOut", -2, "moveZ")
	
	ease(575.5, 0.75, "linear", 1, "alpha", "dad")
	
	ease(575.5, 0.5, "linear", 0, "beat")
	
	ease(576, 64, "cubeInOut", 1, "reverse")
	
	ease(640, 10, "backIn", 2.1, "reverse")
	
	add(640, 10, "backIn", -1, "flip")
	
	
	
	ease(576, 16, "pop", 0.5, "strumstealth")
	
	
	ease(575.79, 1, "expoOut", 1, "z--0")
	ease(575.79, 1, "expoOut", 0, "z--1")
	ease(575.79, 1, "expoOut", -1, "z--2")
	ease(575.79, 1, "expoOut", 0, "z--3")
	
	
end
