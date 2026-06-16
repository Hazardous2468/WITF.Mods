function comboSetup()	
	runHaxeCode(
	[[

	var target1 = PlayState.instance.playerStrumline.mods;
	
	var comboX:CustomModifier = createCustomMod("combox", -255);
	comboX.modPriority = -9990+2;
	comboX.strumsMod = false;
    comboX.notesMod = false;
    comboX.holdsMod = false;
    comboX.pathMod = false;
    comboX.specialMod = true;
    comboX.speedMod = false;
    comboX.unknown = false;
	eh.addCustomMod("bf", comboX);
	comboX.specialMathFunc = function() {
		if(game.comboPopUps != null){
			game.comboPopUps.offsets[0] = comboX.currentValue;
		}
	};
	
	var comboY:CustomModifier = createCustomMod("comboy", 0.0);
	comboY.modPriority = -9990+2;
	comboY.strumsMod = false;
    comboY.notesMod = false;
    comboY.holdsMod = false;
    comboY.pathMod = false;
    comboY.specialMod = true;
    comboY.speedMod = false;
	comboY.unknown = false;
	eh.addCustomMod("bf", comboY);
	comboY.specialMathFunc = function() {
		if(game.comboPopUps != null){
			game.comboPopUps.offsets[1] = comboY.currentValue;
		}
	};
	
	]])
end



function modsTimeline()	
	comboSetup()
	ease(118, 2, "inOutSine", -120, "comboy", 1)
	set(120.01,  -120, "comboy", 1)
	
	set(183.8,  50, "combox", 1)
	set(183.8,  0, "comboy", 1)
	set(184.01,  50, "combox", 1)
	set(184.01,  0, "comboy", 1)
	
	set(266.01,  -255, "combox", 1)
	set(266.01,  0, "comboy", 1)
	
	set(378.01,  50, "combox", 1)
	set(378.01,  0, "comboy", 1)
end
