function setUp()

end

function modsTimeline()

	runHaxeCode(
	[[

		var target1 = PlayState.instance.playerStrumline.mods;
		
		addResetEvent(function(){
			PlayState.instance.comboPopUps.offsets[0] = -400;
			PlayState.instance.comboPopUps.offsets[1] = 17;
			
			setVar("squareSineBlend", 0.0);
		});
		
		
		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.arrowPathFileName = "matoi/arrowPath";
		
			var spinAroundMod:CustomModifier = createCustomMod("circlez", 0.0);
			spinAroundMod.modPriority = 100;
			spinAroundMod.notesMod = true;
			spinAroundMod.holdsMod = true;
			spinAroundMod.pathMod = true;
			strumLine.mods.addCustomMod(spinAroundMod);	
			
			spinAroundMod.createSubMod("speed", 1.0);
						
			spinAroundMod.noteMathFunc = function(data){
				var p:Float = data.curPos / (ModConstants.strumSize * spinAroundMod.getSubVal("speed"));
			
				var _movey:Float = FlxMath.fastCos(p * Math.PI);
				var _movez:Float = FlxMath.fastSin(p * Math.PI);
				
				data.y += _movez * spinAroundMod.currentValue * ModConstants.strumSize;
				data.z += _movey * spinAroundMod.currentValue* ModConstants.strumSize;
				data.z -= ModConstants.strumSize*spinAroundMod.currentValue ;
			}
			
			
		}

		
		]])


	set(-8, 0.2, "arrowpathwidth")
	ease(-2, 2, "inOutQuad", 0.2, "arrowpath")

	setdefault(1, "3d", "bf")
	setdefault(1, "3d", "dad")
	
	set(-16, 40, "grain")
	set(-16, 40, "arrowpathgrain")
	
	

	set(-4, 0, "spiralholds")
	
	--set(0, 0.4, "jump")
	--set(-6, 0.4, "speedmod")
	
	set(-4, 1, "centeredx")
	--ease(-1, 1 ,"linear", 2.125*112, "x","bf")
	--ease(-1, 1 ,"linear", -2.125*112, "x","dad")
	
	ease(-1, 1 ,"linear", 2.125, "movex","bf")
	ease(-1, 1 ,"linear", -2.125, "movex","dad")
			


	ease(0, 2, "inOutQuad", -4*112, "z")
	ease(0, 2, "inOutQuad", 1, "centered")
	
	ease(2, 2, "inOutQuad", -1, "lineary")
	ease(2, 2, "inOutQuad", 4, "circlez")
	ease(2, 2, "inOutQuad", 6, "circlez__speed")
	
	set(-4, 112*-4,"rotatey__offset_y")
	ease(12, 32-12, "inOutQuad", 360*2, "rotatey")
	ease(12, 32-12, "inOutQuad", 360*2, "angley")
	
	set(-4,350, "sudden__offset")
	ease(2, 2, "inOutQuad", 1, "sudden")

	--ease(0, 1, "inOutQuad", 45, "skewx")
	
	
	for i = 6, 32-4, 4 do
		add(i, 2, "bounce", 12 , "skewx")
		add(i+2, 2, "bounce", -12 , "skewx")
	end

	
	for i = 6, 31 do
		add(i, 1, "linear", beatLength * 1 * 1.39 , "drive2")
		--add(i, 1, "linear", beatLength * 1 * 1.0 *-1, "drive")
	end
	
end


