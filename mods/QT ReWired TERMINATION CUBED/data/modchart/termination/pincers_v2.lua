
function modsTimeline()
	addHaxeLibrary("ZSprite", "funkin.graphics")
	runHaxeCode(
	[[
	var target1 = game.playerStrumline.mods;

	var downScroll:bool = Preferences.downscroll;

	var howManyPincers:Int = 4;
	//Create pincers!
	for (i in 0...howManyPincers){
		var pincerName:String = "pincer_" + i;

		var pincer:ZSprite = new ZSprite(0,0);
		pincer.loadTextureAtlas("kb_2026/rewired_pincers", "shared", {cacheOnLoad: true});
		pincer.scrollFactor.set();
		PlayState.instance.customZspritesGroup.add(pincer);
		PlayState.instance.customLuaSprites.set(pincerName, pincer);

		pincer.animation.play("base");
		pincer.scale.set(0.8,0.8);
		
		pincer.angle = downScroll ? 0 : 180;		
		pincer.camera = game.camNotes;
		pincer.zIndex = 1100;

		pincer.origin.y = 92;
		pincer.offset.x = 2.5;
		pincer.offset.y = 6-31;
		pincer.perspectiveCenterOffset.y = 80;
		pincer.screenCenter();
		pincer.y += FlxG.height * 6;
	}

	PlayState.instance.customZspritesGroup.zIndex = 1100;


	PlayState.instance.refresh();

	//addResetEvent(function(){
	//	PlayState.instance.refresh();
	//});



	function togglePincerState(closePincer:bool = false, pincerID:int = -1){
		if(pincerID == -1){
			for (i in 0...howManyPincers){
				togglePincerState(closePincer, i);
			}
		}else{
			var pincerName:String = "pincer_" + pincerID;
			var p = getSpr(pincerName);
			if(p==null) return;
			if(closePincer){
				//p.loadGraphic(Paths.image("kb_2026/pincer-close"));
				p.animation.play("close");
			}else{
				//p.loadGraphic(Paths.image("kb_2026/pincer-open"));
				p.animation.play("open");
			}
			
		}

	}




	
	
	var pincerModOffsetAngle:CustomModifier = createCustomMod("pincers_angle", 0.0);
	pincerModOffsetAngle.modPriority = -9990;
	pincerModOffsetAngle.strumsMod = false;
    pincerModOffsetAngle.notesMod = false;
    pincerModOffsetAngle.holdsMod = false;
    pincerModOffsetAngle.pathMod = false;
    pincerModOffsetAngle.specialMod = true;
    pincerModOffsetAngle.unknown = false;
    pincerModOffsetAngle.speedMod = false;
	eh.addCustomMod("1", pincerModOffsetAngle);
	pincerModOffsetAngle.specialMathFunc = function(lane) {
		var pincerName:String = "pincer_" + lane;
		var p = getSpr(pincerName);
		if(p==null) return;
		p.angle = downScroll ? 0 : 180;		
		p.angle += pincerModOffsetAngle.currentValue;	
	};

	var pincerOffsetsY:Array<float> = [0.0,0.0,0.0,0.0];
	//var pincerOffsetY:float = 0;

	for (i in 0...howManyPincers){
		var pincerModOffsetY:CustomModifier = createCustomMod("pincers_yoffset--"+i, 112*4);
		pincerModOffsetY.modPriority = -9990;
		pincerModOffsetY.strumsMod = false;
	    pincerModOffsetY.notesMod = false;
	    pincerModOffsetY.holdsMod = false;
	    pincerModOffsetY.pathMod = false;
	    pincerModOffsetY.specialMod = true;
	    pincerModOffsetY.unknown = false;
	    pincerModOffsetY.speedMod = false;
	    pincerModOffsetY.targetLane = i;
		eh.addCustomMod("1", pincerModOffsetY);
		pincerModOffsetY.specialMathFunc = function(lane) {
			pincerOffsetsY[lane] = pincerModOffsetY.currentValue;
			//pincerOffsetY = pincerModOffsetY.currentValue;
		};
	}


	
	addUpdate(function(elapsed){
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			if(p==null) continue;

			//var s = game.playerStrumline.getByIndex(i);
			var s = ModConstants.grabStrumModTarget("bf").strum.getByIndex(i);
			
			p.z = s.z;
			p.alpha = s.alpha;	

			p.x = s.x - s.strumExtraModData.noteStyleOffsetX;
			p.x += s.width/2;
			p.x -= p.width/2;

			p.y = s.y - s.strumExtraModData.noteStyleOffsetY;
			if(downScroll){
				p.y += pincerOffsetsY[i];
				p.y += -34;
			}else{
				p.y -= pincerOffsetsY[i];
				p.y += -34;
			}
		}

	});	



	addResetEvent(function(){
		togglePincerState(false,-1);
	});

	eh.funcModEvent(target1, 321, function() {
		togglePincerState(true, 2);
	});

	eh.funcModEvent(target1, 323.9, function() {
		togglePincerState(false, 2);
	});

	eh.funcModEvent(target1, 336, function() {
		togglePincerState(true, 2);
		togglePincerState(true, 0);
	});

	eh.funcModEvent(target1, 339.9, function() {
		togglePincerState(false, 2);
		togglePincerState(false, 0);
	});

	eh.funcModEvent(target1, 336+16, function() {
		togglePincerState(true, 0);
		togglePincerState(true, 1);
		togglePincerState(true, 3);
	});

	eh.funcModEvent(target1, 339.9+16, function() {
		togglePincerState(false, 0);
		togglePincerState(false, 1);
		togglePincerState(false, 3);
	});

	eh.funcModEvent(target1, 336+16+16, function() {
		togglePincerState(true, -1);
	});

	eh.funcModEvent(target1, 339.9+16+16, function() {
		togglePincerState(false,-1);
	});

	eh.funcModEvent(target1, 386, function() {
		togglePincerState(true,0);
		togglePincerState(true,3);
	});
	eh.funcModEvent(target1, 396.5, function() {
		togglePincerState(false,0);
		togglePincerState(false,3);
	});
	eh.funcModEvent(target1, 399.5, function() {
		togglePincerState(true,1);
		togglePincerState(true,2);
	});
	eh.funcModEvent(target1, 410, function() {
		togglePincerState(false,1);
		togglePincerState(false,2);
	});

	eh.funcModEvent(target1, 511, function() {
		togglePincerState(true,-1);
	});
	eh.funcModEvent(target1, 648, function() {
		togglePincerState(false,-1);
	});


	/*
	addResetEvent(function(){
		PlayState.instance.currentStage.getCharacter("dad").active = true;
	});
	eh.funcModEvent(target1, 1248, function() {
		var dad = PlayState.instance.currentStage.getCharacter("dad");
		dad.active = false;
		dad.canPlayOtherAnims = false;
        dad.holdTimer -= 99999;
        return;
	});
	*/


	var songPositionWhereAngleStart:Float = Conductor.instance.getBeatTimeInMs(512);
	addUpdate(function(elapsed){
		var beatPosition:Float = Conductor.instance.currentBeatTime;
		var songPosition:Float = Conductor.instance.songPosition;
		if(beatPosition >= 512 && beatPosition < 648){
			var pos:Float = songPosition-songPositionWhereAngleStart;
			var angle:Float = FlxMath.fastSin(pos/1000*8);
			angle *= 9;

			var effectFader:Float = (beatPosition - 640) / (648-640);
			effectFader = FlxMath.bound(1-effectFader,0,1);
			angle *= -effectFader;
			//print(effectFader);

			//var playerModHandler = PlayState.instance.playerStrumline.mods;
			var playerModHandler = ModConstants.grabStrumModTarget("bf");


			pos = (songPosition+8000)-songPositionWhereAngleStart;
			var angle2:Float = FlxMath.fastSin(pos/1000*8);
			angle2 *= -0.3*effectFader;

			if(!Preferences.downscroll){
				angle2 *= -1;
			}

			playerModHandler.setModVal("circx", angle2);

			// get the rotatez mod, angle mod, and pincers_angle mod and rotate!
			playerModHandler.setModVal("angle", angle);
			playerModHandler.setModVal("rotatez", angle);
			playerModHandler.setModVal("pincers_angle", angle);

		}
	});	


	
	]])

	setdefault(0, "circx")

	local offScreen = 112*3

	for c=0,3 do
		--ease(1, 2, "outCubic", 0, "pincers_yoffset--"..c,"1")

		--ease(220, 3, "outCubic", 0, "pincers_yoffset--"..c,"1")
		--ease(350, 2, "inBack", 112*3, "pincers_yoffset--"..c,"1")
	end


	ease(319, 2, "outCubic", 0, "pincers_yoffset--2","1")
	ease(322, 2, "inOutSine", 0.5, "moveyd--2","1")
	ease(324, 2, "inBack", offScreen, "pincers_yoffset--2","1")

	ease(335, 2, "outCubic", 0, "pincers_yoffset--2","1")
	ease(336+4, 2, "inBack", offScreen, "pincers_yoffset--2","1")
	ease(335, 2, "outCubic", 0, "pincers_yoffset--0","1")
	ease(336+4, 2, "inBack", offScreen, "pincers_yoffset--0","1")

	ease(336+2, 2, "inOutSine", 0, "moveyd--2","1")

	ease(336+2, 2, "inOutSine", 0.5, "moveyd--0","1")
	ease(336+2, 2, "inOutSine", -0.4, "movex--0","1")


	ease(351, 2, "outCubic", {0, "pincers_yoffset--0",0, "pincers_yoffset--1",0, "pincers_yoffset--3"},"1")
	ease(352+4, 2, "inBack", {offScreen, "pincers_yoffset--0",offScreen, "pincers_yoffset--1",offScreen, "pincers_yoffset--3"},"1")
	ease(352+2, 2, "inOutSine", {0, "movex--0",0, "moveyd--0"},"1")
	ease(352+2, 2, "inOutSine", {0.4, "movex--3",0.39, "moveyd--3"},"1")
	ease(352+2, 2, "inOutSine", {0.1, "movex--1",0.52, "moveyd--1"},"1")

	ease(351+16, 2, "outCubic", {0, "pincers_yoffset--0",0, "pincers_yoffset--1",0, "pincers_yoffset--3",0, "pincers_yoffset--2"},"1")
	ease(352+4+16, 2, "inBack", {offScreen, "pincers_yoffset--0",offScreen, "pincers_yoffset--1",offScreen, "pincers_yoffset--3",offScreen, "pincers_yoffset--2"},"1")
	ease(352+2+16, 2, "inOutSine", {0.0, "movex--1",-0.15, "moveyd--1"},"1")
	ease(352+2+16, 2, "inOutSine", {-0.15, "moveyd--2"},"1")
	ease(352+2+16, 2, "inOutSine", {-0.17, "movex--0",0.25, "moveyd--0"},"1")
	ease(352+2+16, 2, "inOutSine", {0.17, "movex--3",0.25, "moveyd--3"},"1")
	--ease(352+2+16, 2, "inOutSine", {35, "angle--0",-35, "angle--3"},"1")



	ease(383, 3, "outCubic", {0, "pincers_yoffset--0",0, "pincers_yoffset--3"},"1")
	ease(397, 2, "inBack", {offScreen, "pincers_yoffset--0",offScreen, "pincers_yoffset--3"},"1")

	ease(397, 3, "outCubic", {0, "pincers_yoffset--1",0, "pincers_yoffset--2"},"1")
	ease(411, 2, "inBack", {offScreen, "pincers_yoffset--1",offScreen, "pincers_yoffset--2"},"1")



	ease(388, 2, "inOutSine", {0.9, "moveyd--3", -1, "moveyd--0"},"1")
	ease(390, 4, "inOutSine", {-3, "movex--3", 3, "movex--0"},"1")
	ease(394, 2, "inOutSine", {0, "moveyd--3", 0, "moveyd--0"},"1")

	ease(388+12, 3, "inOutSine", {0.58, "moveyd--1", -0.58, "moveyd--2"},"1")
	ease(390+12+1, 3, "inOutSine", {1, "movex--1", -1, "movex--2"},"1")
	ease(394+12, 3, "inOutSine", {0, "moveyd--2", 0, "moveyd--1"},"1")





	reset(446,"bf")
	set(446, -180, "rotatey","bf")
	ease(446, 2, "outBack", 0,"rotatey","bf")
	value(446, 2, "outBack", -360, 0,"angle","bf")
	set(446, 0.7, "speedmod","bf")
	ease(510, 4, "inOutSmoothStep", 1,"speedmod","bf")



	ease(509, 2, "outCubic", {0, "pincers_yoffset--0",0, "pincers_yoffset--3"},"1")
	ease(648, 2, "inBack", {offScreen, "pincers_yoffset--0",offScreen, "pincers_yoffset--3"},"1")


	if downScroll then
		set(512, 112*5, "rotatez__offset_y","bf")
	else
		set(512, 112*-5, "rotatez__offset_y","bf")
	end
	--[[
	for i=512,648-2,2 do



		add(i,1,"bounce",{-8,"rotatez",-8,"anglez"},"bf")
		add(i+1,1,"bounce",{8,"rotatez",8,"anglez"},"bf")

		add(i,1,"bounce",{-8,"pincers_angle"},"1")
		add(i+1,1,"bounce",{8,"pincers_angle"},"1")
	end
	--]]

	--set(641, {0, "circx", 0, "angle", 0, "rotatez", 0, "pincers_angle"},"1")
	set(648, {0, "circx", 0, "angle", 0, "rotatez", 0, "pincers_angle"},"1")
	set(648.1, {0, "circx", 0, "angle", 0, "rotatez", 0, "pincers_angle"},"1")

end

