function comboSetup()	
	runHaxeCode(
	[[

	var target1 = PlayState.instance.playerStrumline.mods;
	
	var comboX:CustomModifier = createCustomMod("combox", -285);
	comboX.modPriority = -9990+2;
	comboX.strumsMod = false;
    comboX.notesMod = false;
    comboX.holdsMod = false;
    comboX.pathMod = false;
    comboX.specialMod = true;
    comboX.speedMod = false;
    comboX.unknown = false;
	eh.addCustomMod("1", comboX);
	comboX.specialMathFunc = function() {
		if(game.comboPopUps != null){
			game.comboPopUps.offsets[0] = comboX.currentValue;
		}
	};
	
	var comboY:CustomModifier = createCustomMod("comboy", -100);
	comboY.modPriority = -9990+2;
	comboY.strumsMod = false;
    comboY.notesMod = false;
    comboY.holdsMod = false;
    comboY.pathMod = false;
    comboY.specialMod = true;
    comboY.speedMod = false;
	comboY.unknown = false;
	eh.addCustomMod("1", comboY);
	comboY.specialMathFunc = function() {
		if(game.comboPopUps != null){
			game.comboPopUps.offsets[1] = comboY.currentValue;
		}
	};
	
	]])
end



function modsTimeline()	
	comboSetup()
	set(61.5,  -160, "comboy", 1)
	set(61.5,  -290, "combox", 1)
end
