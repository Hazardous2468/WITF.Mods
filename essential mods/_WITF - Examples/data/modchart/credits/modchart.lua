function onCreate()
	notesBehindHUD(true)
end
local tinyMultFix = 2 --WITF 1.0.0a fix

function setUp()
	centerStrum("both")
	createNewPlayer(false)
end

function modsTimeline()
	local lazyAlternate = false

	--import flixel.addons.display.FlxTiledSprite;
	
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")
	
	runHaxeCode(
	[[
	var target1 = PlayState.instance.playerStrumline.mods;
	
	var enableShaders:Bool = true;
	
	var bgScrolling:FlxTiledSprite = null;
	bgScrolling = new FlxTiledSprite(Paths.image('credits/bg_temp'), FlxG.width, FlxG.height, true, true);
	PlayState.instance.add(bgScrolling);
	bgScrolling.scrollFactor.set();
	bgScrolling.screenCenter();
	PlayState.instance.customLuaSprites.set("scrollingBG", bgScrolling);
	
	var shaderFilter = getVar("credits_shader");
	if (shaderFilter != null && enableShaders){
		FlxG.camera.filters=([shaderFilter]);
		game.camHUD.filters=([shaderFilter]);
		if(game.camNotes != null)
			game.camNotes.filters=([shaderFilter]);
		if(game.camAFT != null)
			game.camAFT.filters=([shaderFilter]);
	}
	else{
		FlxG.camera.filters=([]);
		game.camHUD.filters=([]);
		if(game.camNotes != null)
			game.camNotes.filters=([]);
		if(game.camAFT != null)
			game.camAFT.filters=([]);
	}

	eh.funcTweenModEvent(target1, 0, 360, FlxEase.linear, 0,100*100, function(v) {
		bgScrolling.scrollX = v/0.777;
		bgScrolling.scrollY = v*-1;
	}, "bgScrolling");
	

	var face:FlxSprite = createSpr("face_bottom","credits/face");	
	face.setGraphicSize(Std.int(face.width * 2.2));
	face.x = 60;
	face.y = FlxG.height - face.height - 30;
	face.antialiasing = false;
	
	face = createSpr("face_top","credits/face");	
	face.setGraphicSize(Std.int(face.width * 2.2));
	face.x = FlxG.width - face.width - 60;
	face.y = 30;
	face.antialiasing = false;
	
	
	var face:FlxSprite = createSpr("face_inverted_bottom","credits/face_inv");	
	face.setGraphicSize(Std.int(face.width * 2.2));
	face.x = 60;
	face.y = FlxG.height - face.height - 30;
	face.antialiasing = false;
	
	face = createSpr("face_inverted_top","credits/face_inv");	
	face.setGraphicSize(Std.int(face.width * 2.2));
	face.x = FlxG.width - face.width - 60;
	face.y = 30;
	face.antialiasing = false;
	addResetEvent(function(){
		getSpr("face_bottom").visible = false;
		getSpr("face_top").visible = false;
		getSpr("face_inverted_top").visible = false;
		getSpr("face_inverted_bottom").visible = false;
	});
	
	// 96 -> 98
	//Appear at 0.0, disappear at 0.25
	//0.5 interval
	for (i in 0...8)
	{
		var t:Float = i/4;
		//print(96+t);
	
		eh.funcModEvent(target1, 94+t, function() {
			getSpr("face_bottom").visible = true;
			getSpr("face_top").visible = true;
		},"face");
		eh.funcModEvent(target1, 94+t+0.125, function() {
			getSpr("face_bottom").visible = false;
			getSpr("face_top").visible = false;
		},"face");
	}
	eh.funcModEvent(target1, 96, function() {
		getSpr("face_bottom").visible = true;
		getSpr("face_top").visible = true;
	},"face");
	
	
	eh.funcModEvent(target1, 160, function() {
		getSpr("face_bottom").visible = false;
		getSpr("face_top").visible = false;
		getSpr("face_inverted_top").visible = true;
		getSpr("face_inverted_bottom").visible = true;
	},"face");
	
	
	
	
	var bracket:FlxSprite = createSpr("bracket_left","credits/bracket");	
	bracket.setGraphicSize(Std.int(bracket.width * 1.2));
	bracket.screenCenter();
	bracket.x -= 450;
	bracket.antialiasing = false;
	
	bracket = createSpr("bracket_right","credits/bracket");	
	bracket.setGraphicSize(Std.int(bracket.width * 1.2));
	bracket.flipX = true;
	bracket.screenCenter();
	bracket.x +=450;
	bracket.antialiasing = false;
	
	var bracketXmod:CustomModifier = createCustomMod("bracketposx", 0.0);
	bracketXmod.modPriority = -9990;
	bracketXmod.unknown = false;
	bracketXmod.strumsMod = false;
    bracketXmod.notesMod = false;
    bracketXmod.holdsMod = false;
    bracketXmod.pathMod = false;
    bracketXmod.specialMod = true;
    bracketXmod.speedMod = false;
	eh.addCustomMod("dad", bracketXmod);
	
	bracketXmod.specialMathFunc = function() {
		var bracket = getSpr("bracket_left");
		if(bracket != null)
			bracket.offset.x = bracketXmod.currentValue;
			
		bracket = getSpr("bracket_right");
		if(bracket != null)
			bracket.offset.x = bracketXmod.currentValue *-1;
	};
	

	addResetEvent(function(){
	//Layering moment lol
		PlayState.instance.remove(PlayState.instance.playerStrumline);
		PlayState.instance.remove(PlayState.instance.customStrumLines[0]);
		PlayState.instance.add(PlayState.instance.customStrumLines[0]);
		PlayState.instance.add(PlayState.instance.playerStrumline);	
		
		PlayState.instance.comboPopUps.offsets[0] = -400;
		PlayState.instance.comboPopUps.offsets[1] = 17;
	});

	
	//eh.funcModEvent(target1, 96, function() {
	//	PlayState.instance.modDebugNotif("FUNDING FOR THIS PROGRAM WAS MADE POSSIBLE BY BY BY-");
	//}, "fundingNotif", false);
	
	]])
	
	--for i = 32, 230-5, 4 do
	for i = 32, 284, 4 do
		ease(i,2, "pop", 5, "bracketposx",2)
	end

	--Increase drawdistance for fnf v0.6.3
	setdefault(0.5,"drawdistance",1)
	set(192, 0.52, "drawdistance",1)
	set(159.5, 0.55, "drawdistance",1)
	ease(160,4,"linear", 1, "sudden", 1)
	set(159.9, 625, "sudden__offset",1)
	
	setdefault(0,"movex", 2)
	setdefault(-50*112,"debugx", 2)
	setdefault(1,"alpha", 2)
	
	setdefault(0,"movex", 3)
	setdefault(-50*112,"debugx", 3)
	setdefault(1,"alpha", 3)

	--setdefault(0,"3d")
	
	setdefault(-0.25,"flip",2)
	setdefault(1,"arrowpath--0",2)
	setdefault(1,"arrowpath--3",2)
	setdefault(0.5,"arrowpathwidth",2)
	
	setdefault(1,"debugalpha",2)
	setdefault(1,"debugalpha",3)
	
	setdefault(90,"arrowpathgrain",2)
	setdefault(111,"arrowpathgrain",3)
	
	setdefault(1,"arrowpath",3)
	setdefault(3.4,"arrowpathwidth",3)
	setdefault(0,"arrowpathred",3)
	setdefault(0,"arrowpathgreen",3)
	setdefault(0,"arrowpathblue",3)
	
	setdefault(0.6,"drunk__mult")
	
	if doArrowPathForP1 then
		setdefault(0.35, "arrowpathwidth",1)
		setdefault(160, "arrowpathgrain",1)
	end
	
	setdefault(1600, "arrowpathlength")
	setdefault(200, "arrowpathbacklength")
	
	setdefault(-1*tinyMultFix,"tinyholds",1)
	setdefault(1900,"mathcutoff")
	
	local doArrowPathForP1 = false --optimisation cuz we already using a lot of arrowpath
	
	
	
	local introKicks = {32, 33.5, 35, 36, 37.5}
	
	for i, v in ipairs(introKicks) do
	
		if lazyAlternate then
			lazyAlternate = false
		else
			lazyAlternate = true
		end
	
		for b=32, 154, 8 do
			if lazyAlternate then
				add(v+b-32,0.5,"pop", -0.2*112,"x")
				if doArrowPathForP1 then
					add(v+b-32,0.5, "pop", 0.29, "arrowpath",1)
				end
				
				lazyAlternate = false
			else
				add(v+b-32,0.5,"pop", 0.2*112,"x")
				if doArrowPathForP1 then
					add(v+b-32,0.5, "pop", 0.28, "arrowpath",1)
				end
				
				lazyAlternate = true
			end
		end
	end
	
	
	
	
	set(-16, 0.25, "waveyy")
	
	ease(64,16, "smoothStepInOut", 1, "drunk")
	
	
	if difficulty == "hard" then
		set(118, -1, "invert",1)
		set(119.5, 0, "invert",1)
		set(121, -1, "invert",1)
		set(122.5, 0, "invert",1)
		set(124.0, -1, "invert",1)
		set(125.5, 0, "invert",1)
		set(124+1.5, -1, "invert",1)
		set(125.5+1.5, 0, "invert",1)
		
		set(16+16+118, -1, "invert",1)
		set(16+16+119.5, 0, "invert",1)
		set(16+16+121, -1, "invert",1)
		set(16+16+122.5, 0, "invert",1)
		set(16+16+124.0, -1, "invert",1)
		set(16+16+125.5, 0, "invert",1)
		set(16+16+124+1.5, -1, "invert",1)
		set(16+16+125.5+1.5, 0, "invert",1)
	elseif difficulty == "normal" then
	
		set(118, -1, "invert",1)
		set(119.5, 0, "invert",1)
		set(121, 1, "invert",1)
		set(122.5, 0, "invert",1)
		set(124.0, 1, "invert",1)
		set(125.5, 0, "invert",1)
		set(124+1.5, -1, "invert",1)
		set(125.5+1.5, 0, "invert",1)
		
		set(16+16+118, -1, "invert",1)
		set(16+16+119.5, 0, "invert",1)
		set(16+16+121, 1, "invert",1)
		set(16+16+122.5, 0, "invert",1)
		set(16+16+124.0, 1, "invert",1)
		set(16+16+125.5, 0, "invert",1)
		set(16+16+124+1.5, 1, "invert",1)
		set(16+16+125.5+1.5, 0, "invert",1)
	end
	
	--trace("difficulty: "..difficulty);

	
	for k = 223, 223+10, 0.25 do
		local p = (k-223) / 10
		if difficulty ~= "easy" then
			ease(k,  0.125, "outExpo", 1*(1-p), "stealth--0",1)
			ease(k+0.125,  0.125, "outExpo", 0, "stealth--0",1)
		end
		
		ease(k,  0.125, "outExpo", 1*(1-p), "alphastrum",1)
		ease(k+0.125,  0.125, "outExpo", 0, "alphastrum",1)
	end
	
	local bumpAlternateLol = 1
	set(0,0.75-0.125, "bumpyx__mult")
	set(200,0.75-0.125, "bumpyx__mult")
	
	local brakeAmount = 0.38
	if difficulty == "hard" then
		brakeAmount = 0.7
	end
	
	--oops
	if difficulty ~= "easy" then
		ease(280+0.5,  0.75, "tap", brakeAmount, "brake",1 )
		ease(280+0.5+1.5,  0.75, "tap", brakeAmount, "brake",1 )
		ease(280+0.5+1.5+2.5,  0.75, "tap", brakeAmount, "brake",1 )
	end
	
	for i = 32, 95, 8 do
		
		if difficulty ~= "easy" then
			ease(i+0.5,  0.75, "tap", brakeAmount, "brake",1 )
			ease(i+0.5+1.5,  0.75, "tap", brakeAmount, "brake",1 )
			ease(i+0.5+1.5+2.5,  0.75, "tap", brakeAmount, "brake",1 )
		end
	
	
		ease(i+6,  2, "pop", 0.7 * bumpAlternateLol, "bumpyx")
		if difficulty == "normal" then
			ease(i+6,  2, "pop", 1 * bumpAlternateLol, "bumpyy")
		end
		if bumpAlternateLol == 1 then
			bumpAlternateLol = -1
		else
			bumpAlternateLol = 1
		end
		for k = 0, 2-0.25, 0.25 do
			local p = k / 3
			ease(i+k+6,  0.125, "outExpo", 1*(1-p), "stealth",1)
			ease(i+k+0.125+6,  0.125, "outExpo", 0, "stealth",1)
			
			ease(i+k+6,  0.125, "outExpo", 1, "straightholds",1)
			ease(i+k+0.125+6,  0.125, "outExpo", 0, "straightholds",1)
		end
	end
	for i = 224, 286-8, 8 do
		if difficulty ~= "easy" then
			ease(i+0.5,  0.75, "tap", brakeAmount, "brake",1 )
			ease(i+0.5+1.5,  0.75, "tap", brakeAmount, "brake",1 )
			ease(i+0.5+1.5+2.5,  0.75, "tap", brakeAmount, "brake",1 )
		end
	
		ease(i+6,  2, "pop", 0.7 * bumpAlternateLol, "bumpyx")
		if difficulty == "normal" then
			ease(i+6,  2, "pop", 1 * bumpAlternateLol, "bumpyy")
		end
		if bumpAlternateLol == 1 then
			bumpAlternateLol = -1
		else
			bumpAlternateLol = 1
		end
		for k = 0, 2-0.25, 0.25 do
			local p = k / 3
			ease(i+k+6,  0.125, "outExpo", 1*(1-p), "stealth",1)
			ease(i+k+0.125+6,  0.125, "outExpo", 0, "stealth",1)
			ease(i+k+6,  0.125, "outExpo", 1, "straightholds",1)
			ease(i+k+0.125+6,  0.125, "outExpo", 0, "straightholds",1)
		end
	end
	
	local lazyReverse = true
	--for k = 0, 158-8, 8 do
	for k = 0, 287-8, 8 do
		if k >= 158-8 and k < 222 then
			if k >158 then
				if lazyReverse then
					lazyReverse = false
					--add(k+5.5,2.5, "linear", 90, "rotatez")
					--add(k+5.5,2.5, "linear", 90, "rotatex")
				else
					--add(k+5.5,2.5, "linear", 90, "rotatez")
					--add(k+5.5,2.5, "linear", 90, "rotatex")
					lazyReverse = true
				end
				for i = 5.5, 8-0.5, 0.25 do
					if not (i+k >= 191 and i+k < 194) and not (i+k >= 223) then
						set(i+k, math.random(-100,100)/100, "tipsy")
						set(i+k, math.random(-360,360), "anglez")
					end
				end
				local f = 8-0.25
				if not (f+k >= 191 and f+k < 194) and not (f+k >= 223) then
					set(f+k, math.random(-360,360), "anglez")
					set(f+k, math.random(-20,20)/100, "tipsy")
				else
					set(f+k-2, math.random(-360,360), "anglez")
					set(f+k-2, math.random(-20,20)/100, "tipsy")
				end
			else
			if lazyReverse then
				lazyReverse = false
			else
				lazyReverse = true
			end
			end
		else
	
			for i = 5.5, 8-0.5, 0.25 do
				set(i+k, math.random(-100,100)/100, "tipsy")
				set(i+k, math.random(-360,360), "anglez")
			end
			set(8-0.25+k, math.random(-360,360), "anglez")
			set(8-0.25+k, math.random(-20,20)/100, "tipsy")
			
			
			if difficulty ~= "hard" then
				ease(k+5.5+0.1,0.5, "instant", {180, "rotatey",1, "reverse"}, {2,3})
				ease(k+8,0.5, "instant", {0, "rotatey",0, "reverse"}, {2,3})
				--add(k+5.5+0.1,0.5, "instant", 1, "rotatey", {2,3})
				
				ease(k+5.5+0.1,0.5, "instant", 1, "reverse",1)
				ease(k+5.5+0.1,0.5, "instant", 1, "flip",1)
				ease(k+5.5+0.1,0.5, "instant", 180, "rotatey",1)
				ease(k+8,0.5, "instant", 0, "reverse")
				ease(k+8,0.5, "instant", 0, "flip",1)
				ease(k+8,0.5, "instant", 0, "rotatey",1)
				
			else
				if lazyReverse then
					ease(k+5.5,2.5, "linear", 1, "reverse",1)
					lazyReverse = false
					ease(k+5.5,2.5, "linear", 1, "flip",1)
				else
					ease(k+5.5,2.5, "linear", 0, "reverse",1)
					
					ease(k+5.5,2.5, "linear", 0, "flip",1)
					lazyReverse = true
				end
				add(k+5.5,2.5, "smoothStepInOut", -180, "rotatey",1)
			end
			if difficulty == "hard" then
				add(k+6, 2, "pop", 3, "bumpy",1)
			elseif difficulty == "normal"  then
				add(k+6, 2, "pop", -1.0, "bumpy",1)
			else
				add(k+6, 2, "pop", 0.3, "bumpy",1)
			end
			--add(k+5.5,2.5, "smoothStepInOut", -360, "rotatey",1)
		end
	end
	
	ease(158,1, "outCubic", -1, "flip",1)
	ease(158,1, "expoOut", 1, "alpha",1)
	ease(158,1, "expoOut", 1, "brake",1)
	ease(158,1, "expoOut", 90, "noteskewx",1)
	reset(159)
	set(159, 1*tinyMultFix, "tinyy", 1)
	
	ease(159,1, "expoOut", 0, "tinyy",1)
	
	for i = 160, 160+32-4, 4 do
		ease(i-0.2,1.5, "tri", 0.77, "zigzagx")
		ease(i+2-0.2,1.5, "tri", -0.77, "zigzagx")
	end
	for i = 160+16, 160+32-4, 4 do
		ease(i,2, "bounce", 0.2, "circx")
		ease(i+2,2, "bounce", -0.2, "circx")
	end
	
	ease(160+6,2, "linear",2, "circz")
	ease(160+6+8,2, "linear",0, "circz")
	ease(160+6+16,2, "linear",2, "circz")
	ease(160+6+8+16,1, "linear",1, "circz")
	
	
	add(191,1, "bounce", 0.5, "oldWave")
	add(191,1, "bounce", 0.5, "boost")
	
	add(191,1, "linear", 2.2, "tornadoangle",1)
	ease(222,1, "linear", 0, "tornadoangle",1)
	
	if difficulty ~= "easy" then
		ease(191,1, "linear", 0.8, "vanish",1)
		
		set(191,10, "drunk__speed")
		ease(191,1, "linear", -0.3, "drunk")
		
		ease(222,1, "linear", 0.0, "vanish",1)
		ease(222,1, "linear", 0.0, "drunk")
	end
	
	ease(222,2, "quadInOut", 0, "circz")
	
	
	
	if difficulty == "hard" then
		ease(190.5,0.4, "linear", 6, "oldWave__mult")
		ease(191,1, "outQuad", 0.4, "oldWave")
		ease(224,14, "linear", 0.0, "oldWave")
	end
	
	
	
	
	ease(286,1.2, "quadIn", 490, "bracketposx",2)
	
	add(286,1, "pop", -2*tinyMultFix, "tiny",1)
	add(286,1, "linear", 1*tinyMultFix, "tiny",1)
	
	ease(286,1, "pop", 2, "longholds",1)
	ease(285.5,1.25, "cubeIn", 0.5, "reverse")
	ease(285,1.5, "expoIn", 0.0, "arrowpathlength")
	ease(285,1.5, "expoIn", 0.0, "arrowpathbacklength")

end