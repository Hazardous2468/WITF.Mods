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

	set(314, 0.37, "hurtnotealpha", "all")
	set(379, 0.37, "hurtnotealpha", "all")
	
end


