
function modsTimeline()
	addHaxeLibrary("ZSprite", "funkin.graphics")
	runHaxeCode(
	[[
	var target1 = game.playerStrumline.mods;

	var downScroll:bool = Preferences.downscroll;

	var howManyPincers:Int = 8;
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

			p.scale.set(s.scale.x, s.scale.y);
		}

	});	



	addResetEvent(function(){
		togglePincerState(false,-1);
	});



	eh.funcModEvent(target1, 695.3, function() {
		togglePincerState(true, -1);
	});

	eh.funcModEvent(target1, 758, function() {
		togglePincerState(false, -1);
	});





	eh.funcModEvent(target1, 386-26, function() {
		togglePincerState(true,0);
		togglePincerState(true,3);
	});
	eh.funcModEvent(target1, 396.5-26, function() {
		togglePincerState(false,0);
		togglePincerState(false,3);
	});
	eh.funcModEvent(target1, 399.5-26, function() {
		togglePincerState(true,1);
		togglePincerState(true,2);
	});
	eh.funcModEvent(target1, 410-26, function() {
		togglePincerState(false,1);
		togglePincerState(false,2);
	});


	eh.funcModEvent(target1, 487.5, function() {
		togglePincerState(true, -1);
	});

	eh.funcModEvent(target1, 612, function() {
		togglePincerState(false, -1);
	});


	eh.funcModEvent(target1, 763.5, function() {
		togglePincerState(true, -1);
	});


	eh.funcModEvent(target1, 823.35, function() {
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
	});
	*/


	
	]])



	for i=488, 616-4-2,2 do
		add(i+1,1, "bounce", -4, "pincers_angle", "1")
		add(i,1, "bounce", 4, "pincers_angle", "1")
	end 


	local offScreen = 112*3


	ease(360, 4, "outCubic", 0, "pincers_yoffset--0","1")
	ease(360, 4, "outCubic", 0, "pincers_yoffset--3","1")
	ease(424, 2, "inBack", offScreen, "pincers_yoffset--0","1")
	ease(424, 2, "inBack", offScreen, "pincers_yoffset--3","1")

	--ease(366, 4, "inOutSmootherStep", -180, "rotatey","bf")
	--ease(404, 424-404, "inOutSmootherStep", 360, "rotatey","bf")
	--set(432, 0, "rotatey","bf")



	ease(388-26, 2, "inOutSine", {0.9, "moveyd--3", -1, "moveyd--0"},"1")
	ease(390-26, 4, "inOutSine", {-3, "movex--3", 3, "movex--0"},"1")
	ease(394-26, 2, "inOutSine", {0, "moveyd--3", 0, "moveyd--0"},"1")

	ease(388+12-26, 3, "inOutSine", {0.58, "moveyd--1", -0.58, "moveyd--2"},"1")
	ease(390+12-26+1, 3, "inOutSine", {1, "movex--1", -1, "movex--2"},"1")
	ease(394+12-26, 3, "inOutSine", {0, "moveyd--2", 0, "moveyd--1"},"1")


	ease(383-26, 3, "outCubic", {0, "pincers_yoffset--0",0, "pincers_yoffset--3"},"1")
	ease(397-26, 2, "inBack", {offScreen, "pincers_yoffset--0",offScreen, "pincers_yoffset--3"},"1")

	ease(397-26, 3, "outCubic", {0, "pincers_yoffset--1",0, "pincers_yoffset--2"},"1")
	ease(411-26, 2, "inBack", {offScreen, "pincers_yoffset--1",offScreen, "pincers_yoffset--2"},"1")
	


	value(488, 2, "outBack", -180, 0,"rotatey","bf")
	value(488, 2, "outBack", -360, 0,"angle","bf")
	for c=0,3 do
		set(488, 0,"movex--"..c,"bf")
	end


	ease(482, 6, "outCubic", 0, "pincers_yoffset--0",{"1","2"})
	ease(482, 6, "outCubic", 0, "pincers_yoffset--3",{"1","2"})
	ease(613, 3, "inBack", offScreen, "pincers_yoffset--0",{"1","2"})
	ease(613, 3, "inBack", offScreen, "pincers_yoffset--3",{"1","2"})


	ease(768-8, 4, "outCubic", {0, "pincers_yoffset--1", 0, "pincers_yoffset--2", 0, "pincers_yoffset--3", 0, "pincers_yoffset--0"},"1")
	ease(822.3, 2.8, "inBack", {offScreen, "pincers_yoffset--1",offScreen, "pincers_yoffset--2",offScreen, "pincers_yoffset--0",offScreen, "pincers_yoffset--3"},"1")


	for again = 0, 1 do
		again = again*32


		add(again+776-0.25, 1.1, "tri", -2, "tipsy","1")
		add(again+778-0.25, 1.1, "tri", 2, "tipsy","1")


		ease(again+780, 1, "linear", 180, "blacksphere--0","1")
		ease(again+780, 1, "linear", 180, "blacksphere--1","1")
		ease(again+780+2, 1, "linear", 360, "blacksphere--0","1")
		ease(again+780+2, 1, "linear", 360, "blacksphere--1","1")


		ease(again+781, 1, "tri", -1, "moveyd--1","1")
		ease(again+783, 1, "tri", -1, "moveyd--1","1")

		ease(again+780.5, 1, "outSine", 1, "moveyd--2","1")
		ease(again+782.5, 1, "outSine", 1, "moveyd--3","1")
		ease(again+782.5, 1, "outSine", 0, "moveyd--2","1")

		ease(again+784, 1, "outSine", -0.4, "movex--0","1")
		ease(again+784, 1, "outSine", 0.5, "moveyd--0","1")

		ease(again+784.5, 1, "outSine", 0.5, "moveyd--1","1")

		ease(again+785, 1, "outSine", 0.0, "moveyd--3","1")
		ease(again+785.5, 1, "outSine", -0.5, "moveyd--1","1")


		ease(again+786.5, 1, "outSine", 1, "movex--0","1")
		ease(again+786.5, 1, "outSine", -1, "movex--1","1")

		ease(again+788.5, 1, "outSine", 0, "movex--1","1")
		ease(again+788.5, 1, "outSine", 0, "movex--0","1")

		ease(again+789, 1, "outSine", 0, "moveyd--0","1")
		ease(again+789, 1, "outSine", 0, "moveyd--1","1")

		--ease(again+787.0, 1, "linear", 180, "blacksphere--3","1")
		--ease(again+787.0, 1, "linear", 180, "blacksphere--2","1")
		--ease(again+789-0.5, 1, "linear", 0, "blacksphere--3","1")
		--ease(again+789-0.5, 1, "linear", 0, "blacksphere--2","1")


		add(again+790-0.5, 2, "inOutSine", 360, "blacksphere","1")


	end

	ease(787, 1, "outSine", 1, "movex--3","1")
	ease(788.5, 1, "outSine", 0, "movex--3","1")

	ease(32+787.0, 1, "linear", 180, "blacksphere--3","1")
	ease(32+787.0, 1, "linear", 180, "blacksphere--2","1")
	ease(32+789-0.5, 1, "linear", 0, "blacksphere--3","1")
	ease(32+789-0.5, 1, "linear", 0, "blacksphere--2","1")



	add(796, 2, "linear", 360, "blacksphere","1")
	add(796+2, 2, "linear", -360, "blacksphere","1")
	add(796+2+2, 2, "linear", 360, "blacksphere","1")
	add(796+2+2+2, 2, "linear", -360, "blacksphere","1")
	add(804, 1, "linear", 180, "blacksphere","1")
	add(805, 1, "linear", -180, "blacksphere","1")
	add(806, 2, "inOutSine", 360, "blacksphere","1")



end

