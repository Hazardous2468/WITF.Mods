function comboSetup()	
	runHaxeCode(
	[[

	var target1 = PlayState.instance.playerStrumline.mods;
	
	var comboX:CustomModifier = createCustomMod("combox", -300);
	comboX.modPriority = -9990+2;
	comboX.unknown = false;
	comboX.strumsMod = false;
    comboX.notesMod = false;
    comboX.holdsMod = false;
    comboX.pathMod = false;
    comboX.specialMod = true;
    comboX.speedMod = false;
	eh.addCustomMod("bf", comboX);
	comboX.specialMathFunc = function() {
		if(game.comboPopUps != null){
			game.comboPopUps.offsets[0] = comboX.currentValue;
		}
	};
	
	var comboY:CustomModifier = createCustomMod("comboy", 0.0);
	comboY.modPriority = -9990+2;
	comboY.unknown = false;
	comboY.strumsMod = false;
    comboY.notesMod = false;
    comboY.holdsMod = false;
    comboY.pathMod = false;
    comboY.specialMod = true;
    comboY.speedMod = false;
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
	set(-16, -100, "comboy",1)
end
