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
	
	set(164, 460, "combox", 1)
	set(169.5, -444, "combox", 1)
	set(189, -444, "combox", 1)
	set(178.4, 400, "combox", 1)
	set(194.5, -444, "combox", 1)
	
	
	set(-16, -444, "combox", 1)
	set(42, 155, "combox", 1)
	set(59.45, 460, "combox", 1)
	set(51, -444, "combox", 1)
	set(66.5, -444, "combox", 1)
	
	set(-16, 74, "comboy", 1)
	
	set(115, 224, "combox", 1)
	set(131, -444, "combox", 1)
	
	set(243, 224, "combox", 1)
	set(259.375, -444, "combox", 1)
	
end
