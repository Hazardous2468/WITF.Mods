function onCreate()
	notesBehindHUD(true)
end
local tinyMultFix = 2 --WITF 1.0.0a fix

function setUp()
	centerPlayer("")
	createNewPlayer(true)
	copyZoom(false)
	hideNotifs(true)
end



function setupAFTloops()
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
	
		//Create AFT to capture notesCameras
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
		notesAFT.recursive=false;
		notesAFT.updateAFT();	
		setVar("notesAFT",notesAFT);
		
		
		setResetEvent(function(){			
			game.camAFT.visible = false;
			game.camNotes.x = 0;
		});
		
		
		
		addUpdate(function(elapsed){
			if(game.camAFT.visible == true){
				notesAFT.updateAFT();	
			}
		});	
		
		//make it only use the AFT when needed!
		eh.funcModEvent(target1, 220, function() {
			game.camAFT.visible = true;
			getSpr("scrolling1").visible =true;
			getSpr("scrolling3").visible = true;
			game.camNotes.x -= 10000;
			//game.modDebugNotif("aft active");
		}, "showAFT");
		
		eh.funcModEvent(target1, 304, function() {
			game.camAFT.visible = false;
			game.camNotes.x = 0;
			getSpr("scrolling1").visible = false;
			getSpr("scrolling3").visible = false;
		}, "showAFT");
		
		
		
		eh.funcModEvent(target1, 482, function() {
			game.camAFT.visible = true;
			game.camNotes.x = 0;
		}, "showAFT");
		
		eh.funcModEvent(target1, 612, function() {
			game.camAFT.visible = false;
		}, "showAFT");
		
		
		
		//Create a scrollingSprite to render the AFT
		var scrolling1:FlxTiledSprite = new FlxTiledSprite(null, FlxG.width, FlxG.height, true, true);
		scrolling1.loadGraphic(notesAFT.bitmap, "popupGame");
		PlayState.instance.add(scrolling1);
		scrolling1.camera = game.camAFT;
		scrolling1.scrollFactor.set();
		scrolling1.screenCenter();
		PlayState.instance.customLuaSprites.set("scrolling1", scrolling1);
		
		var scrolling3:FlxTiledSprite = new FlxTiledSprite(null, FlxG.width, FlxG.height, true, true);
		scrolling3.loadGraphic(notesAFT.bitmap, "popupGame");
		PlayState.instance.add(scrolling3);
		scrolling3.camera = game.camAFT;
		scrolling3.scrollFactor.set();
		scrolling3.screenCenter();
		PlayState.instance.customLuaSprites.set("scrolling3", scrolling3);
		

		var scrollAmountAll:Float = 0;
		var scrollAmount1:Float = 0;
		setResetEvent(function(){	
			scrollAmountAll = 0;
			scrollAmount1 = 0;
			getSpr("scrolling1").scrollX = 0;
			getSpr("scrolling3").scrollX = 0;
			
			getSpr("scrolling1").visible = false;
			getSpr("scrolling3").visible = false;
		});


		addUpdate(function(elapsed){
			getSpr("scrolling1").scrollX = scrollAmountAll+scrollAmount1;
			getSpr("scrolling3").scrollX = scrollAmountAll;
		});	
		
		eh.funcTweenModEvent(target1, 220, 4,  ModConstants.getEaseFromString("inOutExpo"), 0,  FlxG.width /2, function(v) {
			scrollAmount1 = v;	
		}, "scrolling1MoveX");
		
		
		var scrollingCameraMod:CustomModifier = createCustomMod("camerascroll", 0.0);
		scrollingCameraMod.modPriority = -9990;
		scrollingCameraMod.unknown = false;
		scrollingCameraMod.strumsMod = false;
		scrollingCameraMod.notesMod = false;
		scrollingCameraMod.holdsMod = false;
		scrollingCameraMod.pathMod = false;
		scrollingCameraMod.specialMod = true;
		scrollingCameraMod.speedMod = false;
		eh.addCustomMod("bf", scrollingCameraMod);
		scrollingCameraMod.specialMathFunc = function() {
			scrollAmountAll = scrollingCameraMod.currentValue;
		};

		
		
		
		
	]])

end

function modsTimeline()
	setupAFTloops()
	setdefault({1,"spiralx__altcurpos",1,"spiraly__altcurpos",1,"spiralz__altcurpos"})

	setdefault(1, "oldstealthholds")
	
	--TEMP FIX FOR NOW
	if downScroll then
		add(220,4, "inOutExpo", 112/1.75*0.9, "y")
	end
	
	--add(483,1, "inOutExpo", -48, "y")
	--add(547.5,0.5, "inOutExpo", 24, "y")
	--TEMP FIX FOR NOW
	

	
	add(400-0.25,0.25, "pop", -4*tinyMultFix, "tiny")
	add(400,0.25, "pop", -4*tinyMultFix, "tiny")
	
	setdefault(76, "grain")
	ease(380,8, "linear", 60, "grain")
	
	
	--Make holds transparent to make directions and notes easier to read / hit
	ease(483,0.5, "inOutExpo",0.44, "alphaholds", "all")
	ease(612.1,0.5, "inOutExpo",0.45, "alphaholds", "all")
	
	
	
	setdefault(1, "3d", 1)
	setdefault(1, "3d", 3)
	
	setdefault(0.6, "drawdistance") --fix for fnf v0.6.3

	setasleep(0, "dad", true) 
	setasleep(0, "3", true)
		targetExclude("dad")
		
	local upscrollFix = -1
	if downScroll then
		upscrollFix = 1
	end
		
		
	setdefault(-16, "movex", "dad")
	setdefault(-16*112, "debugx", "dad")
	setdefault(1, "alpha", "dad")
	setdefault(-16, "movex", "3")
	setdefault(-16*112, "debugx", "3")
	setdefault(1, "alpha", "3")
	
	setdefault(0.1, "arrowpathwidth")
	
	
	set(-16, -0.2, "eye_open", 1)
	ease(0, 4, "inSine", 0.6, "eye_open",1)
	
	
	set(-4, 4, "spiralx__mult")
	
	local lazyAlternate = false
	for i = 0, 156-4, 4 do
		ease(i, 3.5, "inOutSine", 0.55, "eye_open",1)
		
		if i == 152 then
			ease(i+3.5, 0.5, "inSine", -0.1, "eye_open",1)
		else
			ease(i+3.5, 0.5, "inSine", 0.1, "eye_open",1)
		end
		
		ease(i, 4, "bounce", -1, "brake")
		add(i, 4, "bounce", 0.2, "speedmod")
		
		if i >= 64 then
			ease(i, 4, "tap", 0.69, "spiralx")
		else
			ease(i, 4, "tap", 0.3, "spiralx")
		end
		
		if i >= 92 then
			if lazyAlternate then
				if i >= 140 then
					ease(i, 4, "tap", 1, "tanbumpyx")
				end
				ease(i, 4, "tap", 4, "bumpyx")
				ease(i, 4, "tap", 0.1, "tandrunkx")
			else
				if i >= 140 then
					ease(i, 4, "tap", -1, "tanbumpyx")
				end
			
				ease(i, 4, "tap", -4, "bumpyx")
				ease(i, 4, "tap", -0.1, "tandrunkx")
			end
				
			if i >= 140 then
				ease(i, 4, "tap", 0.4, "bumpyscale")
			end
				
		end
		lazyAlternate = not lazyAlternate
	end
	
	
	set(-16, 0.4, "alphahold")
	
	set(-16, -0.5*tinyMultFix, "tiny")
	
	set(-16, 0.5, "drunk")
	set(-16, -0.2, "tipsy")
	set(-16, 0.3, "speedmod")
	set(-15, 0.1, "speedmod")
	add(32, 24, "linear", 0.2, "speedmod")
	
	set(-16, 0.5, "beatscale")
	
	set(-16, -0.35, "circz")
	set(-16,1, "attenuate")
	
	set(-16, -0.45, "roll2")
	

	set(-16, -55*upscrollFix, "rotatex")
	set(-16, -55*upscrollFix, "anglex")
	set(-16, -0.5, "moveyd")
	
	
	
	
	
	
	
	
	
	
	
	
	reset(157)
	set(157,0, "3d",1)
	
	set(157,-0.1, "eye_open",1)
	
	set(157,0.5, "speedmod",1)
	
	ease(157.8, 1, "outBack", 0.55, "eye_open",1)
	
	
	ease(157.8, 2, "bounce", -0.4*tinyMultFix, "tiny",1)
	
	ease(157.8, 2, "outQuad", -0.1, "flip",1)
	ease(176, 2, "outElastic", -0.1, "flip",1)
	
	
	ease(157.8, 2, "linear", 1, "speedmod",1)
	
	
	
	
	
	ease(160, 2, "outExpo", 2, "tanbumpyz")
	
	ease(176, 2, "outExpo", 0.25, "tanbumpyx--0")
	ease(176, 2, "outExpo", -0.25, "tanbumpyx--1")
	ease(176, 2, "outExpo", 0.25, "tanbumpyx--2")
	ease(176, 2, "outExpo", -0.25, "tanbumpyx--3")
	
	ease(176, 2, "outExpo", 0.5, "bouncescale")
	
	
	set(158,8*4, "drunk__speed")
	set(174.5,8*4, "drunk__speed")
	ease(160, 2, "outExpo", 1, "drunk")
	ease(176, 2, "outExpo", -1.2, "drunk")
	
	
	ease(160, 2, "outExpo", 0.08, "glitch2")
	add(206.8, 2, "pop", 0.1, "glitch2")
	
	add(168, 1, "pop", -2*tinyMultFix, "tiny")
	add(168, 1, "outBounce", 20, "noteskewx")
	add(184, 1, "outBounce",20, "noteskewx")
	ease(192, 1, "outBounce",0, "noteskewx")
	ease(200, 1, "outBounce",-20, "noteskewx")
	ease(204, 5, "linear",0, "noteskewx")
	ease(216, 1, "outBounce",-20, "noteskewy")
	ease(220, 4, "linear",0, "noteskewy")
	add(184, 1, "pop", -2*tinyMultFix, "tiny")
	add(200, 1, "pop", -2*tinyMultFix, "tiny")
	add(216, 1, "pop", -2*tinyMultFix, "tiny")
	
	for i = 160, 174-0.1, 0.1 do
		ease(i, 0.1, "outExpo",math.random(-10,10), "rotatez")
	end
	for i = 176, 176+32-0.1, 0.1 do
		ease(i, 0.1, "outExpo",math.random(-12,12), "rotatez")
	end
	
	ease(172, 1, "outExpo", -4, "square")
	
	
	ease(160, 174-160, "linear", -0.5, "fisheye",1)
	ease(176, 188-176, "linear", -0.51, "fisheye",1)
	set(192, 0, "fisheye",1)
	ease(192, 188-176, "linear", -0.55, "fisheye",1)
	
	set(206.92, 0, "fisheye",1)
	ease(206.92, 1, "pop", 0.8, "fisheye",1)
	ease(208, 220-208, "linear", -0.6189, "fisheye",1)
	ease(220, 4, "inOutBack", 0, "fisheye",1)
	
	
	ease(204, 0.5, "outExpo", 2, "square")
	ease(206, 0.5, "outExpo", 0, "square")
	
	
	reset(174)
	ease(174, 2, "outExpo", -1, "tipsy")
	
	add(174, 2, "outQuad", 45, "angle")
	
	ease(176, 1, "outExpo", 0, "angle")
	
	ease(175, 2, "inOutQuint", 0, "tipsy")
	
	ease(174, 2, "outCube", 0.5, "speedmod")
	set(174,0, "3d",1)
	ease(174, 2, "outCube", -0.3, "flip")
	ease(174, 2, "inCube", 3, "center")
	ease(176, 1, "outExpo", 0, "center")
	ease(176, 1, "outBack", 1, "speedmod")
	
	
	
	
	add(188, 1, "outExpo", 0.035/2, "glitchLines",1)
	add(188, 1, "outExpo", 0.05, "glitch2",1)
	
	ease(188, 1, "outExpo", 2.1, "square")
	ease(190, 2, "inExpo", 0, "square")
	
	
	add(192, 1, "outExpo", 0.05*-1, "glitchLines",1)
	add(192, 1, "outExpo", 0.035/2*-1, "glitch2",1)
	
	
	--ease(204, 207-204, "inExpo", 1, "reverse")
	
	ease(192, 0.1, "outExpo", 1, "reverse")
	
	add(207, 1, "bounce", -0.07, "reverse")
	
	add(207, 0.09, "outExpo", -4.8*tinyMultFix, "tiny")
	add(207, 2, "outCubic", 4.8*tinyMultFix, "tiny")
	
	add(207, 2, "outCubic", 360+45, "angle")
	add(216, 1.5, "outElastic", 180, "angle")
	ease(220, 4, "inOutCubic", 0, "angle")
--	add(207, 1, "pop", -1.5*tinyMultFix, "tiny")
	
	add(207, 1, "pop", 1, "oldboost")
	
	
	ease(220, 4, "inOutCubic", 0.0, "drunk")
	
	add(219, 5, "inOutCubic", 360*2.5, "rotatex")
	add(219, 5, "inOutCubic", -0.5, "moveyd")
	--add(220, 4, "inOutCubic", 360*2.5, "anglex")
	
	
	
	
	
	ease(220,4, "inOutExpo", 0, "bouncescale")
	
	
	ease(220,4, "inOutExpo", screenWidth / 4 *-1, "camerascroll", "bf")
	
	for i = 224, 304-2, 2 do
		add(i,2, "inExpo", screenWidth / 3, "camerascroll", "bf")
		add(i+2,2, "bounce", -100, "camerascroll", "bf")
	end
	
	
	
	for i=224, 302-2, 2 do
		add(i, 2, "inOutQuad", -0.4, "eye_open")
		
		add(i+2, 2, "outExpo", 0.4, "eye_open")
		
		add(i, 2, "pop", 0.15, "eye_open")
		
		
		--add(i, 2, "tap", -0.36, "eye_open")
		
		add(i, 1, "pop", 1, "arrowpathwidth")
	end
	
	ease(220, 4, "inOutQuad" , 0.5, "arrowpath" ,"bf")
	ease(220, 0.1, "inOutQuad" , 0.0, "arrowpathwidth" ,"bf")
	
	for i=224, 302-1, 1 do
		add(i, 1, "pop", -1*tinyMultFix, "tiny")
	end
	
	for i=224, 302-4, 4 do
		add(i, 2, "pop", 20, "angle")
		
		add(i, 1, "pop", -0.3, "circx")
		add(i+2, 1, "pop", 0.3, "circx")
		add(i, 2, "pop", -0.3, "circx")
		add(i+2, 2, "pop", 0.3, "circx")
		
		add(i+2, 2, "pop", -20, "angle")
	end
	
	for i=224, 302-16, 16 do
		add(i+14, 2, "linear", 360*2, "angle--0")
		add(i+14, 2, "linear", 360*-2, "angle--1")
		add(i+14, 2, "linear", 360*2, "angle--2")
		add(i+14, 2, "linear", 360*-2, "angle--3")
		
		add(i+14, 2, "linear", 360*2*-1, "notesangle--0")
		add(i+14, 2, "linear", 360*-2*-1, "notesangle--1")
		add(i+14, 2, "linear", 360*2*-1, "notesangle--2")
		add(i+14, 2, "linear", 360*-2*-1, "notesangle--3")
	end
	
	ease(256, 2, "inOutCubic", 0.8, "oldWave")
	add(256, 2, "inOutCubic", -0.2, "speedmod")
	
	set(250, 8, "waveyy__speed")
	add(256, 2, "inOutCubic", 0.2, "waveyy")
	
	set(224, 16, "drunk__speed")
	ease(287, 2, "inOutCubic", 0.25, "orient2")
	ease(287, 2, "inOutCubic", 0.9, "drunk")
	add(292, 301-292, "tap", 1, "drunk")
	
	ease(302, 2, "inOutCubic", 0, "drunk")
	ease(302, 2, "inOutCubic", 0.3, "orient2")
	
	ease(302, 2, "inQuad", -360*2, "rotatez")
	
	
	ease(302, 1, "inOutSine", 0.54, "eye_open", "bf")
	ease(303, 1, "inSine", -0.2, "eye_open", "bf")
	
	set(302, 1, "spiralholds")
	
	reset(304)
	
	set(304, 0.2, "eye_open", "bf")
	ease(304, 1, "outSine", 0.5, "eye_open", "bf")
	
	set(304, 0.6, "dark")
	
	
	ease(304, 1, "outSine", -1, "waveyx", "3")
	ease(304, 1, "outSine", -1, "waveyy", "3")
	ease(304, 1, "outSine", -0.25, "movez", "1")
	
	ease(311, 1, "outSine", 20, "rotatey", "3")
	ease(311, 1, "outSine", 20, "angley", "3")
	
	
	
	ease(326, 10, "inOutSine", 1, "movex", "3")
	ease(326, 10, "inOutSine", -1, "movex", "1")
	ease(334, 4, "outSine", 0, "movex", "3")
	ease(334, 4, "outSine", 0, "movex", "1")
	
 
	
	set(304,0.7, "beatscale__speed")
	set(304,-0.6, "beatscale")
	ease(375, 1, "linear", 0, "beatscale")
	
	set(304,0.005, "glitchLines")
	
	setasleep(304, "3", false)

	set(304,1, "zsort")
	
	set(304,2, "drunkx__mult")
	
	set(304,1, "spiralholds")
	set(304,1, "spiralpaths")
	--set(304,1, "old3Dholds")
	
	set(304,0, "movex", "3")
	set(304,0, "alpha", "3")
	
	set(304,400, "debugx", "3")
	set(304,-400, "debugx", "1")
	
	set(304, 0.3, "orient2")
	set(304, 1, "drunk")
	set(304, 0.2, "drunkz")
	set(304, -0.2, "circz")
	
	ease(304, 1, "linear", 0.1, "arrowpath")
	
	ease(304, 1, "linear", 0.6, "speedmod")
	ease(304, 2, "outCubic", -20, "rotatey")
	ease(304, 2, "outCubic", -20, "angley")
	
	ease(315, 2, "inOutCubic", 20, "rotatey")
	ease(315, 2, "inOutCubic", 20, "angley")
	
	ease(311, 2, "outCubic", 10, "rotatez")
	ease(311+2, 4, "inOutSine", 0, "rotatez")
	ease(311, 2, "outCubic", 0.5, "circx")
	ease(311+2, 4, "inOutSine", 0.0, "circx")
	

	ease(334, 8, "pop", -1.2, "spiralx")
	ease(334, 2, "outCubic", 25*upscrollFix, "rotatex", "1")
	ease(334, 2, "outCubic", 25*upscrollFix, "anglex", "1")
	ease(334, 2, "outCubic", -1, "moveyd", "1")
	
	ease(334, 2, "outCubic", 10*upscrollFix*-1, "rotatex", "3")
	ease(334, 2, "outCubic", 10*upscrollFix*-1, "anglex", "3")
	
	ease(334, 2, "outCubic", -20, "rotatey", "3")
	ease(334, 2, "outCubic", -40, "angley", "3")
	
	ease(334, 7, "outCubic", 0, "rotatez", "1")
	
	
	
	add(319.9, 4, "outSine", -20, "rotatez", "1")
	
	
	
	add(344.9, 8, "inOutCubic", -60, "rotatey", "1")
	add(344.9, 8, "inOutCubic", -60, "angley", "1")
	
	add(344.9, 8, "inOutCubic", -10, "angley", "3")
	
	add(344.9+8, 8, "inOutCubic", 10, "angley", "3")
	
	
	add(376, 32, "pop", -2.5, "straightholds")
	
	
	
	add(352.9, 8, "inOutCubic", -30, "rotatez", "3")
	
	
	add(304, 2, "pop", 1.2, "glitch2","bf")
	
	
	
	
	ease(376, 32, "outSine", 0, "rotatex")
	ease(376, 32, "outSine", 0, "rotatey")
	ease(376, 32, "outSine", 0, "rotatez")
	ease(376, 16, "outSine", -0.1, "circz")
	
	ease(376, 32, "outSine", 0.5, "flip")
	
	add(376, 32, "outSine", -4*112, "z")
	
	
	set(304,1, "spiralx__cos")
	set(304,0, "spiraly__cos")
	
	add(376, 30, "outSine", -0.01/2*100, "spiralx")
	add(376, 30, "outSine", 0.01/2*100, "spiraly")
	
	add(376, 30, "outSine", -0.89, "lineary")
	ease(376, 30, "outSine", 0, "drunkz")
	

	add(311, 6, "outSine", 10, "drunkx__time_add")
	add(318, 6, "inOutSine", 3, "drunkx__time_add")
	add(334, 8, "outSine", 30, "drunkx__time_add")
	add(344, 6, "inOutSine", 5, "drunkx__time_add")
	add(364, 6, "inOutSine", 7, "drunkx__time_add")
	add(369, 7.5, "inOutSine", 32, "drunkx__time_add")
	--ease(372, 8, "bounce", 2, "drunkx")
	

	
	
	
	
	
	
	
	--2ND HALF
	reset(409.49)
	
	set(409.95,1.4, "beatscale__speed")
	set(409.95,1, "beatscale")
	
	--set(409.5, 1, "fisheye","bf")
	
	ease(410, 4, "inOutExpo", 1, "fisheye","bf")
	
	set(409.95,0.75, "moveyd","bf")
	
	--For that dumb fucking left note
	set(409.5,0.5, "glitch2","bf")
	ease(409.5, 4, "linear", 0.08, "glitch2","bf")
	add(440, 4, "pop",0.5, "drawdistance")
	
	
	
	
	ease(440.5, 4, "outExpo",-45 * upscrollFix, "rotatex")
	ease(445, 1, "outElastic",0, "rotatex")
	
	
	add(439, 6, "bell", -2, "fisheye","bf")
	
	set(445, -5*tinyMultFix, "tiny")
	add(445.01, 3, "outCubic", 5*tinyMultFix, "tiny")
	
	add(445.01, 3, "outCubic", 0.5, "drunk")
	
	for i = 412, 472-4, 4 do
		if i >= 446 then
			add(i, 4, "tap", 0.5, "drunk")
			add(i, 4, "tap", 0.5, "invert")
		end
	end
	
	add(464, 1, "pop", -1, "movez")
	add(465, 4, "pop", -1, "movez")
	
	add(468, 4, "inExpo", -20, "tipsyz")
	add(468, 4, "inExpo", -2, "fisheye","bf")
	
	
	ease(410, 2, "inExpo", 0.0, "flip")
	
	set(409.5,0.5, "flip")
	
	set(409.5,0.55, "speedmod")
	
	
	add(438, 6, "pop", 0.25, "drawdistance")
	add(438, 6, "pop", 0.5, "oldboost")
	
	--add(439, 2, "inOutSine", -1, "lineary")
	--add(440, 3.5 , "inOutSine", 1, "lineary")
	
	ease(462, 2 , "inOutSine", -0.5, "straightholds")
	ease(468, 2 , "inOutSine", 0.0, "straightholds")
	
	
	ease(412, 2, "outExpo", 0.75, "brake")
	
	ease(410, 2, "inExpo", 0.175, "eye_open")
	
	for i = 412, 472-4, 4 do
		add(i, 4, "tap", 1.75, "oldboost")
		add(i, 4, "tap", 0.15, "eye_open")
	end
	
	add(444, 2, "bounce",12, "oldboost")
	
	ease(440, 4, "inOutSine",1, "videogames")
	ease(444, 1, "outElastic",0, "videogames")
	
	
	ease(412, 2, "outExpo", 0.75, "twirl")
	
	
	add(460, 12, "linear",0.2, "glitch2","bf")
	
	
	ease(470-2, 4, "inCubic", 4, "longholds")
	
	reset(472)
	set(472,2, "movez")
	set(472,0.25, "moveyd")
	set(472,0.5, "speedmod")
	set(472,0.5, "oldWave")
	
	set(473,1.4, "drawdistance","bf")
	
	set(482,-0.5,  "fisheye","bf")
	ease(483, 1, "linear", 0.5, "fisheye","bf")
	
	if not downScroll then
		ease(483, 2, "inOutSine",0.5, "movey")
	end
	
	
	ease(483, 1, "linear", 0.89, "arrowpath","bf")
	
	
	ease(483, 1, "linear", 360*2, "angle")
	
	
	ease(483, 1, "inExpo", 0.04, "glitch2","bf")
	ease(483, 1, "inExpo", 0.012, "glitchLines","bf")
	
	
	add(484, 1, "outQuad", 0.4, "circx")
	add(484, 4, "inQuad", -0.4, "circx")
	
	add(487, 1, "outQuad", 2, "attenuate")
	add(487, 4, "inQuad", -2, "attenuate")
	
	add(491, 1, "inQuad", -0.5, "circx")
	add(492, 6, "inQuad", 0.5, "circx")
	
	add(500, 1.2, "outCubic", 4, "bumpy")
	add(505, 6, "inSine", -4, "bumpy")
	
	add(508, 2, "outQuint", 6, "attenuate")
	
	add(511, 1, "bounce", -1, "waveyx")
	add(512, 1, "bounce", 2, "waveyx")
	add(513, 4, "pop", -2, "waveyx")
	
	add(514, 2, "inQuint", -10, "attenuate")
	add(517, 5, "linear", 4, "attenuate")
	
	

	add(517, 1, "linear", 2.5, "drunk")
	add(517.5, 4, "inOutSine", 12, "drunk__time_add")
	add(541, 547.5-541, "inSine", 20, "drunk__time_add")
	add(541, 547.5-541, "inOutCubic", 4, "drunk__time_add")
	add(520,6, "inOutSine", -2.5, "drunk")
	
	
	add(524,1, "inOutSine", 0.5, "linearx")
	add(526,2, "inBack", 1, "circx")
	
	ease(528,4, "inOutSine", 0, "linearx")
	ease(528,2, "inOutSine", 0, "circx")
	
	add(532,2, "outSine", -0.2, "flip")
	add(540,2, "outSine", -0.2, "flip")
	
	
	add(539,1, "inBack", 1.5, "drunk")
	
	
	set(547, 0, "drunk")
	set(547, 0, "flip")
	
	
	add(546.13,1, "tri", 0.2, "glitchLines")
	
	for i = 484, 612-4, 4 do
		add(i, 1.5, "pop", 0.1, "fisheye", "bf")
		add(i+1.5, 2.5, "pop", 0.0679, "fisheye", "bf")
		
		add(i, 1.5, "pop",-0.87*tinyMultFix, "tiny")
		add(i+1.5, 2.5, "pop",-0.82*tinyMultFix, "tiny")
	end
	
	
	
	ease(532,1, "outSine", -0.4, "spiralx")
	ease(546,2, "linear", 0.0, "spiralx")
	
	
	add(575,1, "bounce", 1, "waveyx")
	add(576,6, "pop", -3, "waveyx")
	
	
	add(542,3+2, "inSine",-0.5, "lineary")
	add(547.2,1, "outQuint",0.5, "lineary")
	
	
	add(588,6, "pop", -1.3, "bumpyx")
	add(596,6, "pop", 0.3, "spiralx")
	add(604,6, "pop", 0.35, "spiralx")
	
	
	add(555,1, "outSine", 0.4, "linearx")
	add(556,1, "outSine", -0.4*2, "linearx")
	add(557,1.5, "inOutSine", 0.4*2, "bumpyx")
	ease(559,4, "inOutSine", 0.0, "bumpyx")
	ease(559,4, "inOutSine", 0.0, "linearx")
	
	add(564,4, "outQuad", 0.6, "circx")
	add(565,4, "inOutQuad", -0.3, "circx")
	
	add(570,4, "inOutQuint", -0.6, "circx")
	
	ease(578,4, "inOutQuint", 0.0, "circx")
	ease(578,4, "inOutQuint", 1, "attenuate")
	
	add(578,4, "inOutQuint", 1, "attenuate")
	
	
	add(596,4, "pop", 4, "bumpy")
	
	add(580,2, "outQuad", 1, "tipsyz")
	
	add(578,611-578, "linear", 1, "attenuate")
	
	
	ease(542, 5, "inOutCubic", -1, "moveyd")
	
	ease(547, 2, "inOutCubic", 1, "reverse")
	ease(547, 2, "inOutCubic", -0.76, "moveyd") --to make sure strums can still be seen lol?
	
	ease(588, 4, "inOutCubic", -0.6, "moveyd")
	ease(596, 4, "inOutCubic", -0.4, "moveyd")
	ease(604, 4, "inOutCubic", 0.0, "moveyd")
	
	ease(610, 1, "inCubic", 0.0, "reverse")
	ease(610, 1, "inCubic", 0.0, "moveyd")
	
	for i = 484, 612-0.25, 0.25 do
		for l = 0, 3 do
			ease(i, 0.1, "outExpo", math.random(-45,45), "anglex--"..l)
			ease(i, 0.1, "outExpo", math.random(-45,45), "angley--"..l)
			ease(i, 0.1, "outExpo", math.random(-45,45), "angle--"..l)
		end
	end
	

	
	
	reset(612)
	set(612,-0.2, "flip")
	set(612,3, "beatscale__speed")
	ease(612, 64, "linear", -8, "beatscale")
	ease(675, 1, "linear", 0, "beatscale")
	add(612, 64, "linear", -0.75, "fisheye")
	set(612, 0.05, "glitch2")
	add(612, 64, "linear", 0.06/2, "glitch2")
	add(612, 64, "linear", 0.01/1.5, "glitchLines")
	
	add(612, 64, "linear", -0.16, "flip")
	
	
	ease(612, 64, "outQuad", 64, "snap")
	ease(612, 64, "outQuad", 60, "x") --try and keep it centered lol?
	
	
	add(612, 8, "inOutSine", -0.2*tinyMultFix, "tiny")
	add(612, 64, "linear", -0.5*tinyMultFix, "tiny")
	
	for i = 612, 612+64-4, 4 do
		--ease(i, 2, "inOutCubic", 1, "reverse")
		--ease(i+2, 2, "inOutCubic", 0, "reverse")
		
		for l = 0, 3 do
			local delay = l / 3 * 0.45
			ease(i+delay, 2, "inOutCubic", 1, "reverse--"..l)
			ease(i+2+delay, 2, "inOutCubic", 0, "reverse--"..l)
		end
		--ease(i, 2, "inOutCubic", 1, "reverse")
		--ease(i+2, 2, "inOutCubic", 0, "reverse")

	end
	
	ease(675, 2, "inOutQuad", 1, "tipsy")
	ease(675, 2, "inOutQuad", 1, "drunk")
	
	ease(675, 8, "inOutQuad", 0, "twirl")
	ease(675, 8, "inOutQuad", 0, "roll")
	ease(675, 8, "inOutQuad", 0, "dizzy")
	
	ease(612, 0.5, "outExpo", 1, "twirl")
	ease(612, 0.5, "outExpo", 1.1, "roll")
	ease(612, 0.5, "outExpo", 1.3, "dizzy")
	
	for i = 612, 612+64-0.5, 0.5 do
		for l = 0, 3 do
			ease(i, 0.5, "outExpo", math.random(-64,64), "anglex--"..l)
			ease(i, 0.5, "outExpo", math.random(-66,66), "angley--"..l)
			ease(i, 0.5, "outExpo", math.random(-180,180), "angle--"..l)
		end
		
		add(i, 0.5, "bounce", -0.05, "eye_open", "bf")
	end
	
	add(676, 690-676, "linear", 0.4, "fisheye","bf")
	
	add(691, 1, "outQuint", -2, "fisheye","bf")
	add(691, 2.75, "inQuint", -22, "fisheye","bf")
	
	add(691, 2.4, "inQuint", -1, "eye_open","bf")
	
end
