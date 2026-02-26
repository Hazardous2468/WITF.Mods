function modsTimeline()	

	--Vibrate Mod V0.1 !
	--Make sure you are using the 3D renderer for notes! (3DMod enabled)

	runHaxeCode(
	[[
	var vibrateMod:CustomModifier = createCustomMod("vibrateMod", 0.0);
	vibrateMod.modPriority = -9990;
	vibrateMod.unknown = false;
	vibrateMod.strumsMod = false;
    vibrateMod.notesMod = false;
    vibrateMod.holdsMod = false;
    vibrateMod.pathMod = false;
    vibrateMod.specialMod = true;
    vibrateMod.speedMod = false;
	eh.addCustomMod("bf", vibrateMod);
	vibrateMod.specialMath = function() {
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

	set(0, 1, "3d")
	ease(0, 16, "inExpo", 666, "vibrateMod", "bf")
end


