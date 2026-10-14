
function modsTimeline()
	addHaxeLibrary("ZSprite", "funkin.graphics")
	runHaxeCode(
	[[
	var target1 = game.playerStrumline.mods;

	var downScroll:bool = Preferences.downscroll;

	var pincerScale:Float = 0.79;

	var howManyPincers:Int = 8;
	//Create pincers!
	for (i in 0...howManyPincers){
		var pincerName:String = "pincer_" + i;

		var pincer:ZSprite = new ZSprite(0,0);
		pincer.loadTextureAtlas("kb_2026/rewired_pincers", "shared", {cacheOnLoad: true});
		pincer.scrollFactor.set();
		PlayState.instance.customZspritesGroup.add(pincer);
		PlayState.instance.customLuaSprites.set(pincerName, pincer);

		
		//pincer.frames = Paths.getSparrowAtlas('kb_2026/rewired_pincers_BTA');	
		//pincer.animation.addByPrefix('base', 'base', 24, false);	
		//pincer.animation.addByPrefix('ref', 'ref', 24, false);	
		//pincer.animation.addByPrefix('close', 'close', 24, false);	
		//pincer.animation.addByPrefix('open', 'open', 24, false);	
		pincer.animation.play("base");
		pincer.scale.set(pincerScale,pincerScale);
		
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

	/*
	addResetEvent(function(){
		PlayState.instance.noteRenderMode = false;
		PlayState.instance.noteRenderMode = true;
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			if(p==null) continue;
			PlayState.instance.allStrumSprites.add(p);
		}
	});
	*/
	

	PlayState.instance.customZspritesGroup.zIndex = 1100;


	PlayState.instance.refresh();

	//addResetEvent(function(){
	//	PlayState.instance.refresh();
	//});



	function togglePincerState(closePincer:bool = false, pincerID:int = -1){
		//return;
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




	var pincerModOffsetAngle:CustomModifier = createCustomMod("pincers_angle", 1);
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


	var pincerOffsetsY:Array<float> = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

	for (i in 0...4){
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
			//pincerOffsetsY[3] = 0;
			//pincerOffsetY = pincerModOffsetY.currentValue;
		};

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
		eh.addCustomMod("2", pincerModOffsetY);
		pincerModOffsetY.specialMathFunc = function(lane) {
			pincerOffsetsY[lane+4] = pincerModOffsetY.currentValue;
		};
	}


	
	addUpdate(function(elapsed){
		for (_i in 0...howManyPincers){
			var i:Int = _i % 4;
			var pincerName:String = "pincer_" + _i;
			var p = getSpr(pincerName);
			if(p==null) continue;

			var targetStrumName:String = _i >= 4 ? "dad" : "bf";
			var s = ModConstants.grabStrumModTarget(targetStrumName).strum.getByIndex(i);

			p.z = s.z;//+5;
			p.alpha = s.alpha;	

			p.x = s.x - s.strumExtraModData.noteStyleOffsetX;
			p.x += s.width/2;
			p.x -= p.width/2;

			p.y = s.y - s.strumExtraModData.noteStyleOffsetY;
			if(downScroll){
				p.y += pincerOffsetsY[_i];
				p.y += -34;
			}else{
				p.y -= pincerOffsetsY[_i];
				p.y += -34;
			}
		}

	});	



	addResetEvent(function(){
		togglePincerState(false,-1);
	});

	eh.funcModEvent(target1, 223, function() {
		togglePincerState(true, -1);
	});

	eh.funcModEvent(target1, 350, function() {
		togglePincerState(false, -1);
	});



	eh.funcModEvent(target1, 99.75, function() {
		togglePincerState(true, 3);
		togglePincerState(true, 0);
	});
	eh.funcModEvent(target1, 124.8, function() {
		togglePincerState(false, 3);
		togglePincerState(false, 0);
	});



	eh.funcModEvent(target1, 581, function() {
		togglePincerState(true, -1);
	});
	eh.funcModEvent(target1, 605.85, function() {
		togglePincerState(false, -1);
	});

	addResetEvent(function(){
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			if(p==null) continue;
			p.scale.set(pincerScale,pincerScale);
		}
	});

	eh.funcTweenModEvent(target1, 576, 606-576,  ModConstants.getEaseFromString("linear"), 1.0, 0.5, function(v) {
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			if(p==null) continue;
			p.scale.x = v*pincerScale;
		}
	},"pincersScale");

	eh.funcTweenModEvent(target1, 606, 1,  ModConstants.getEaseFromString("outBack"), 0.5, 1.0, function(v) {
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			if(p==null) continue;
			p.scale.x = v*pincerScale;
		}
	},"pincersScale");

	eh.funcModEvent(target1, 612, function() {
		for (i in 0...howManyPincers){
			var pincerName:String = "pincer_" + i;
			var p = getSpr(pincerName);
			if(p==null) continue;
			p.scale.x = pincerScale;
		}
	},"pincersScale");

	




	eh.funcModEvent(target1, 733.5, function() {
		togglePincerState(true, -1);
	});
	eh.funcModEvent(target1, 796.01, function() {
		togglePincerState(false, -1);
	});

	eh.funcModEvent(target1, 161, function() {
		togglePincerState(true, 0);
	});
	eh.funcModEvent(target1, 164.8, function() {
		togglePincerState(true, 2);
	});
	eh.funcModEvent(target1, 171, function() {
		togglePincerState(false, 0);
	});
	eh.funcModEvent(target1, 172.95, function() {
		togglePincerState(true, 1);
	});
	eh.funcModEvent(target1, 191.45, function() {
		togglePincerState(false, 1);
		togglePincerState(false, 2);
	},"");


	eh.funcModEvent(target1, 673.5, function() {
		togglePincerState(true, -1);
	});

	eh.funcModEvent(target1, 702.23, function() {
		togglePincerState(false,-1);
	});

	eh.funcModEvent(target1, 993.5, function() {
		togglePincerState(true, -1);
	},"pincerToggleState");
	eh.funcModEvent(target1, 1022.15, function() {
		togglePincerState(false, -1);
	});

	eh.funcModEvent(target1, 1055.5, function() {
		togglePincerState(true, -1);
	});

	eh.funcModEvent(target1, 1248, function() {
		togglePincerState(false, -1);
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
	},"");
	*/



	// The swinging motion:

	var songPositionWhereAngleStart:Float = Conductor.instance.getBeatTimeInMs(224);
	addUpdate(function(elapsed){
		var beatPosition:Float = Conductor.instance.currentBeatTime;
		var songPosition:Float = Conductor.instance.songPosition;
		if(beatPosition >= 224 && beatPosition < 352){
			var pos:Float = beatPosition-224;
			pos *= Math.PI;
			var angle:Float = FlxMath.fastSin(pos/2);
			angle *= 9;

			var effectFader:Float = (beatPosition - 350) / (352-350);
			effectFader = FlxMath.bound(1-effectFader,0,1);
			angle *= -effectFader;
			//print(effectFader);

			//var playerModHandler = PlayState.instance.playerStrumline.mods;
			var playerModHandler = ModConstants.grabStrumModTarget("bf");

			pos = (beatPosition)-224;
			pos += 0.5;
			pos *= Math.PI;
			var angle2:Float = FlxMath.fastSin(pos/2);
			angle2 *= -0.3*effectFader;
			//angle2 *= 4;

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

	-- Making sure the mods are properly reset after the shaking effect
	for i= 352,352.1, 0.05 do
		--trace(i)
		set(i, {0, "circx",0, "pincers_angle",0,"angle"},"bf")
	end
	
	--set(-16, 1, "arrowpath","bf")


	local offScreen = 112*3

	for c=0,3 do
		--ease(1, 2, "outCubic", 0, "pincers_yoffset--"..c,"1")

		--ease(220, 3, "outCubic", 0, "pincers_yoffset--"..c,"1")
		--ease(350, 2, "inBack", 112*3, "pincers_yoffset--"..c,"1")
	end


	ease(219, 4, "outCubic", 0, "pincers_yoffset--0","1")
	ease(219, 4, "outCubic", 0, "pincers_yoffset--3","1")
	ease(350, 2, "inBack", offScreen, "pincers_yoffset--0","1")
	ease(350, 2, "inBack", offScreen, "pincers_yoffset--3","1")




	ease(576, 4, "outCubic", 0, "pincers_yoffset--0",{"1","2"})
	ease(576, 4, "outCubic", 0, "pincers_yoffset--3",{"1","2"})
	ease(606, 2, "linear", offScreen, "pincers_yoffset--0",{"1","2"})
	ease(606, 2, "linear", offScreen, "pincers_yoffset--3",{"1","2"})


	ease(731, 3, "outCubic", 0, "pincers_yoffset--0",{"1","2"})
	ease(731, 3, "outCubic", 0, "pincers_yoffset--3",{"1","2"})


	
	add(107, 2, "inOutSine", 180, "rotatey", "bf")
	add(123, 2, "inOutSine", 180, "rotatey", "bf")
	ease(97, 3, "outCubic", 0, "pincers_yoffset--3","1")
	ease(125, 2, "inBack", offScreen, "pincers_yoffset--3","1")
	ease(97, 3, "outCubic", 0, "pincers_yoffset--0","1")
	ease(125, 2, "inBack", offScreen, "pincers_yoffset--0","1")




	ease(158, 3, "outCubic", 0, "pincers_yoffset--0","1")
	ease(168+4, 3, "inBack", offScreen, "pincers_yoffset--0","1")

	ease(164, 2, "inOutSine", 1, "moveyd--0","1")

	ease(162, 3, "outCubic", 0, "pincers_yoffset--2","1")


	ease(170, 3, "outCubic", 0, "pincers_yoffset--1","1")


	ease(168, 3, "inOutSine", 0, "moveyd--0","1")
	ease(168, 3, "inOutSine", 1, "moveyd--2","1")
	ease(175, 2, "inOutSine", 0, "moveyd--2","1")
	ease(176, 2, "inOutSine", -0.5, "moveyd--1","1")

	ease(179, 2, "inOutSine", 0.5, "moveyd--2","1")

	ease(181, 2, "inOutSine", 0.5, "moveyd--1","1")
	ease(181, 2, "inOutSine", -0.5, "moveyd--2","1")

	ease(180, 2, "inOutSine", 1, "videogames","1")
	ease(187.5, 3, "inOutBack", 0, "videogames","1")

	ease(188, 2, "outInBack", 0, "moveyd--2","1")
	ease(188, 3, "outInBack", 0, "moveyd--1","1")


	ease(191, 3, "inBack", offScreen, "pincers_yoffset--2","1")
	ease(191, 3, "inBack", offScreen, "pincers_yoffset--1","1")



	add(684, 3, "inOutBack", -180, "rotatey", "bf")
	add(684, 3, "inOutBack", -180, "blacksphereflip--1", "bf")
	add(684, 3, "inOutBack", -180, "blacksphereflip--2", "bf")
	add(684+16, 3, "inOutBack", -180, "rotatey", "bf")
	add(684+16, 3, "inOutBack", 180, "blacksphereflip--2", "bf")
	add(684+16, 3, "inOutBack", 180, "blacksphereflip--1", "bf")




	for c=0,3 do
		ease(671, 3, "outCubic", 0, "pincers_yoffset--"..c,"1")
		ease(703, 2, "inBack", offScreen, "pincers_yoffset--"..c,"1")
	end
	--ease(671, 3, "outCubic", 0, "pincers_yoffset--3","1")
	--ease(703, 2, "inBack", offScreen, "pincers_yoffset--3","1")

	--ease(671, 3, "outCubic", 0, "pincers_yoffset--0","1")
	--ease(703, 2, "inBack", offScreen, "pincers_yoffset--0","1")






	add(1004, 2, "inOutSine", -180, "rotatey", "bf")
	add(1004+16, 2, "inOutSine", -180, "rotatey", "bf")



	ease(1000,1, "outSine", 180, "blacksphere", "bf")
	ease(1000+1.5,1, "outSine", 0, "blacksphere", "bf")
	ease(1000+3,1, "outSine", 180, "blacksphere", "bf")
	ease(1016,1, "outSine", 0, "blacksphere", "bf")
	ease(1016+1.5,1, "outSine", 180, "blacksphere", "bf")
	ease(1016+3,1, "outSine", 0, "blacksphere", "bf")
	ease(1021,3, "inOutCubic", -360, "blacksphere", "bf")



	ease(991, 3, "outCubic", 0, "pincers_yoffset--3","1")
	ease(1022, 2, "inBack", offScreen, "pincers_yoffset--3","1")

	ease(991, 3, "outCubic", 0, "pincers_yoffset--0","1")
	ease(1022, 2, "inBack", offScreen, "pincers_yoffset--0","1")

	ease(991, 3, "outCubic", 0, "pincers_yoffset--1","1")
	ease(1022, 2, "inBack", offScreen, "pincers_yoffset--1","1")

	ease(991, 3, "outCubic", 0, "pincers_yoffset--2","1")
	ease(1022, 2, "inBack", offScreen, "pincers_yoffset--2","1")




	for c=0,3 do
		ease(1053, 3, "outQuint", 0, "pincers_yoffset--"..c,"1")
		--ease(1248, 2, "inBack", offScreen, "pincers_yoffset--"..c,"1")
	end
	ease(1248, 12, "linear", offScreen, "pincers_yoffset--2","1")
	ease(1248, 8, "inBack", offScreen, "pincers_yoffset--1","1")
	ease(1248, 12, "inBack", offScreen, "pincers_yoffset--3","1")
	ease(1248, 9, "inCubic", offScreen, "pincers_yoffset--0","1")

	ease(1248, 10, "inCubic", -23, "pincers_angle","1")


	--ease(1022, 2, "inBack", offScreen, "pincers_yoffset","1")

	add(1058, 16, "inOutSine", 360*2.5, "blacksphere","1")
	add(1083, 5, "inOutBack", 360*0.5, "blacksphere","1")
	add(1120, 16, "inOutSine", -360*2, "blacksphere","1")
	add(1144, 4, "inOutSine", 360*0.5, "blacksphere","1")
	add(1144+4, 4, "inOutBack", 360*0.5, "blacksphere","1")

	add(1183.5, 4, "inOutSine", -360*1.5, "blacksphere","1")
	add(1191.5, 4, "inOutSine", 360*1.5, "blacksphere","1")

	--add(1200, 48, "inSine", 360*5, "blacksphere","1")
	--add(1200, 48, "linear", 360*5, "blacksphere","1")


	for i=1088,1120-4, 4 do
		add(i, 2, "bounce", .8, "drunk","bf")
		add(i+2, 2, "bounce", -.8, "drunk","bf")
		add(i+64, 2, "bounce", .8, "drunk","bf")
		add(i+2+64, 2, "bounce", -.8, "drunk","bf")
	end



	-- this math is stupid and wrong
	for i=1200,1248-4, 4 do

		local _start = 1216
		local _end = 1248
		local funnyMult = i-_start
		if funnyMult < 0 then
			funnyMult = 0
		else
			local dif = _end-_start
			local a = i-_start
			local b = dif
			local c = (a/b) / dif

			--trace(c)


			funnyMult = funnyMult * c
		end


		local rAmount = 0.075*(funnyMult+1)
		--trace(rAmount)

		ease(i, 2, "bounce", -rAmount, "reverse--0","1")
		ease(i, 2, "bounce", rAmount, "reverse--1","1")
		ease(i, 2, "bounce", -rAmount, "reverse--2","1")
		ease(i, 2, "bounce", rAmount, "reverse--3","1")

		ease(i+2, 2, "bounce", rAmount, "reverse--0","1")
		ease(i+2, 2, "bounce", -rAmount, "reverse--1","1")
		ease(i+2, 2, "bounce", rAmount, "reverse--2","1")
		ease(i+2, 2, "bounce", -rAmount, "reverse--3","1")
	end




end

