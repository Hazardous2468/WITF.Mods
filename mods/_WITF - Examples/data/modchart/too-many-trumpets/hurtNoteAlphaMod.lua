function modsTimeline()	
	runHaxeCode(
	[[
	
	
	
	for (customStrummer in PlayState.instance.allStrumLines)
	{
		var hurtNoteAlphaMod:CustomModifier = createCustomMod("hurtnotealpha", 0.0);
		hurtNoteAlphaMod.modPriority = 555;
		hurtNoteAlphaMod.unknown = false;
		hurtNoteAlphaMod.strumsMod = false;
		hurtNoteAlphaMod.notesMod = true;
		hurtNoteAlphaMod.holdsMod = false;
		hurtNoteAlphaMod.pathMod = false;
		hurtNoteAlphaMod.specialMod = false;
		hurtNoteAlphaMod.speedMod = false;
		hurtNoteAlphaMod.noteMathFunc = function(data) {
			//data.x += hurtNoteAlphaMod.currentValue;
			if(data.noteType == "hurt"){
				data.alpha -= hurtNoteAlphaMod.currentValue;
			}		
		};
		customStrummer.mods.addCustomMod(hurtNoteAlphaMod, false);
	}
	]])

	set(0, 0.575, "hurtnotealpha", "all")
	
	ease(152, 2 , "outExpo",1, "hurtnotealpha")
	set(154, 0, "hurtnotealpha", "all")
	ease(154.01, 2 , "outExpo",1, "hurtnotealpha")
	ease(156, 2 , "linear",0.575, "hurtnotealpha")
	
	ease(316, 4 , "inCubic",0.66, "hurtnotealpha")
	
	set(392, 0.8, "hurtnotealpha", "all")
	set(392.01, 0.8, "hurtnotealpha", "all")
	
	ease(526, 2 , "linear",0, "hurtnotealpha")
end


