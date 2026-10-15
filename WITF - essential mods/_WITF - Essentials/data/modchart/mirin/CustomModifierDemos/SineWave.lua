function setUp()
	centerPlayer("")
	centerOpponent("")
end

function modsTimeline()
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	runHaxeCode(
	[[

	var target1 = PlayState.instance.playerStrumline.mods;

	for (strumLine in PlayState.instance.allStrumLines)
	{
		var isLine:Bool = strumLine == PlayState.instance.opponentStrumline;
		strumLine.arrowPathFileName = "19ZZ/arrowPath";
	
		var spinAroundMod:CustomModifier = createCustomMod("sinewavey", 0.0);
		spinAroundMod.modPriority = -100;

		spinAroundMod.strumsMod = !isLine;
		spinAroundMod.notesMod = isLine;
		spinAroundMod.holdsMod = isLine;
		spinAroundMod.pathMod = isLine;
		spinAroundMod.specialMod = false;
		spinAroundMod.speedMod = false;
		strumLine.mods.addCustomMod(spinAroundMod);	
		
		spinAroundMod.createSubMod("mult", 1.0);
		spinAroundMod.createSubMod("timeadd", 0.0);
		spinAroundMod.createSubMod("speed", 1);
		
		spinAroundMod.strumMathFunc = function(data){
		
			var timmy:Float = Conductor.instance.currentBeatTime / 4 * spinAroundMod.getSubVal("speed");
			timmy += spinAroundMod.getSubVal("timeadd");
			
			var vv:Float = (data.x / 112/2) + timmy;
			//timmy
			var sine:Float = ModConstants.strumSize * FlxMath.fastSin(vv * Math.PI * spinAroundMod.getSubVal("mult"));
			
			data.y += sine* spinAroundMod.currentValue;

		}
		
		spinAroundMod.noteMathFunc = function(data){
		
			var timmy:Float = Conductor.instance.currentBeatTime / 4 * spinAroundMod.getSubVal("speed");
			timmy += spinAroundMod.getSubVal("timeadd");
			
			
			var vv:Float = (data.x / ModConstants.strumSize/2) + timmy;
			//timmy
			var sine:Float = ModConstants.strumSize * FlxMath.fastSin(vv * Math.PI * spinAroundMod.getSubVal("mult"));
			
			data.y += sine* spinAroundMod.currentValue;
			
			data.y += (ModConstants.strumSize/2);
			data.x += (ModConstants.strumSize/2);
		}

	}

	
	]])
	


	
	set(-16, 1, "showallmods")
	
	set(-16, -3*112, "debugx","dad")
	set(-16, 1, "alpha","dad")
	set(-16, 0.5, "flip","dad")
	set(-16, 90, "rotatez","dad")
	set(-16, 1, "spiralpaths","dad")
	if downScroll then
		set(-16, 1.8, "movex","dad")	
		set(-16, -2.5, "moveyd","dad")
	else
		set(-16, -2.78, "movex","dad")	
		set(-16, -1, "moveyd","dad")
	end
	
	
	--set(-16, 1, "arrowpath--0","dad")
	set(-16, 25, "arrowpathgrain--0","dad")
	set(-16, 0.2, "arrowpathwidth--0","dad")
	set(-16, 1600, "arrowpathlength--0","dad")
	
	ease(-3, 3, "linear", 1, "arrowpath--0", "dad")
	
	set(-16, 3*112, "debugx","bf")
	

	
	set(-16, 0.8, "speedmod", "bf")
	
	
	--set(-16, 1, "sinewavey")
	ease(3, 2, "inOutQuint", -0.4, "sinewavey")
	ease(7, 2, "inOutQuint", 0.6, "sinewavey")
	set(-16, 0.75, "sinewavey__mult")
	
	add(12.5, 0.9, "outSine", -1, "sinewavey__timeadd")
	add(13.5, 0.9, "outSine", -1, "sinewavey__timeadd")
	add(14.5, 1.8, "outSine", 1, "sinewavey__timeadd")
	ease(14.5, 1, "outSine", 0.4, "sinewavey__mult")
	
	ease(15.8, 3.75, "inOutCubic", 0.75, "sinewavey__mult")
	
	ease(22.5, 1, "outCubic", 1.5, "sinewavey__mult")
	ease(22.5, 1, "outCubic", 0.75, "sinewavey")
	
	
	ease(-3, 3, "linear", 1, "alphastrum", "bf")
	set(-16, -1, "alphasplash","bf")
	set(-16, 0.85, "tinyhold","bf")
	set(-16, 0.1, "tiny","bf")
	set(-16, -500, "straightholds","bf")
	ease(29.5, 3.5, "linear", 0, "alphastrum", "bf")
	
	
	ease(0, 1, "linear", -0.01, "bumpyscale", "bf")
	
	
	
	ease(19, 1, "inOutQuad", -0.2, "flip", "bf")
	
	--set(-1, 1, "orient","bf")
	
end


