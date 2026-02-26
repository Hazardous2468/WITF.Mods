function modsTimeline()	

	--Vibrate Mod V0.1 !
	--Make sure you are using the 3D renderer for notes! (3DMod enabled)

	runHaxeCode(
	[[
	var vibrateMod:CustomModifier = createCustomMod("vibrateMod", 0.0);
	vibrateMod.modPriority = -9990;
	vibrateMod.strumsMod = false;
    vibrateMod.notesMod = false;
	vibrateMod.unknown = false;
    vibrateMod.holdsMod = false;
    vibrateMod.pathMod = false;
    vibrateMod.specialMod = true;
    vibrateMod.speedMod = false;
	eh.addCustomMod("bf", vibrateMod);
	vibrateMod.specialMathFunc = function() {
		var curValue = vibrateMod.currentValue;
		
		for (strumLine in PlayState.instance.allStrumLines)
		{
			for (note in strumLine.strumlineNotes)
			{
				note.vibrateEffect = curValue;
				
			}
			
			for (note in strumLine.notes)
			{
				note.vibrateEffect = curValue;
				
			}
		}
	};
	]])

	--set(0, 1, "3d")
	ease(152, 1, "outExpo", 6, "vibrateMod", "bf")
	ease(156, 4, "inOutQuad", 0, "vibrateMod", "bf")
	
	
	ease(535.75, 0.25, "inExpo", 120, "vibrateMod", "bf")
	
	
end


