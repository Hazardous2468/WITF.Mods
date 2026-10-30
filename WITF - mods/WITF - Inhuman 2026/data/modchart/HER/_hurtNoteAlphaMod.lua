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
			if(data.noteKind == "hurt"){
				data.alpha -= hurtNoteAlphaMod.currentValue;
			}		
		};
		customStrummer.mods.addCustomMod(hurtNoteAlphaMod, false);
		
	}
	]])

end


