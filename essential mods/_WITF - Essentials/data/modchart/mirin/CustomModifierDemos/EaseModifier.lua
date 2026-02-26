function modsTimeline()
	runHaxeCode(
	[[

	var easeString:String = "inOutBack";

	var easeFunc = ModConstants.getEaseFromString(easeString);
	
	for (strumLine in PlayState.instance.allStrumLines)
	{	
		var easeModifier:CustomModifier = createCustomMod("easex", 0.0);
		easeModifier.modPriority = -100;
		easeModifier.strumsMod = false;
		easeModifier.notesMod = true;
		easeModifier.holdsMod = true;
		easeModifier.pathMod = true;
		easeModifier.specialMod = false;
		easeModifier.speedMod = false;
		easeModifier.createSubMod("start", 575.0);
		easeModifier.createSubMod("end", 75.0);
		easeModifier.createSubMod("offset", 0.0);
		strumLine.mods.addCustomMod(easeModifier);	

		easeModifier.noteMathFunc = function(data){
		
			var curPos:Float = data.curPos;
			
			
			var pos:Float = data.curPos_unscaled * (Preferences.downscroll ? -1 : 1);

			// Copy of Sudden math
			var a:Float = FlxMath.remapToRange(pos, easeModifier.getSubVal("start") + easeModifier.getSubVal("offset"), easeModifier.getSubVal("end") + easeModifier.getSubVal("offset"), 1, 0);
			a = FlxMath.bound(a, 0, 1); // clamp

			var b:Float = 1 - a;
			
			var value:Float = easeFunc(a);
			
			data.x += (ModConstants.strumSize) * easeModifier.currentValue * value;
		}

	}

	
	]])
		
	set(-16, 1, "showallmods")

	set(-4, 0.1, "arrowpath")
	set(-4, 0.25, "arrowpathwidth")
	set(-4, 35, "pathgrain")
	set(-4, 40, "grain")
	
	set(0, -4, "easex")
	

	
end


