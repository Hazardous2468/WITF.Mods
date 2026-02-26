function setUp()
	centerStrum("1")
	createNewPlayer(true)
end
local tinyMultFix = 2 --WITF 1.0.0a fix


function modsTimeline()	
	runHaxeCode(
	[[
		addResetEvent(function(){
			game.comboPopUps.offsets[0] = 470;
			game.comboPopUps.offsets[1] = -22;
		});
	]])
	
	
	runHaxeCode(
	[[
	for (strumLine in PlayState.instance.allStrumLines)
	{
		strumLine.arrowPathFileName = "matoi/arrowPath";

		var spinAroundMod:CustomModifier = createCustomMod("spinaround", 0.0);
		spinAroundMod.modPriority = 100;
		spinAroundMod.strumsMod = true;
		spinAroundMod.notesMod = false;
		spinAroundMod.holdsMod = false;
		spinAroundMod.pathMod = false;
		spinAroundMod.specialMod = false;
		spinAroundMod.speedMod = false;
		spinAroundMod.unknown = false;
		
		strumLine.mods.addCustomMod(spinAroundMod);	
		
		spinAroundMod.createSubMod("timeoffset", 0.0);
		spinAroundMod.createSubMod("speed", 1);
		
		spinAroundMod.strumMathFunc = function(data){
		
			var timmy:Float = Conductor.instance.currentBeatTime / 4 * spinAroundMod.getSubVal("speed");
			timmy += spinAroundMod.getSubVal("timeoffset");

			var _movex:Float = FlxMath.fastCos(timmy * Math.PI);
			var _movez:Float = FlxMath.fastSin(timmy * Math.PI);
			
			data.x += _movex * spinAroundMod.currentValue;
			data.z += _movez * spinAroundMod.currentValue;
			
			
			data.z -= spinAroundMod.currentValue/2;
		}
	}	
	]])


	
	
	

	setasleep(-20, "dad", true)
	targetExclude("dad")
	
	local b = getNoteBeats(0, 148, "bf")
	for i, v in ipairs(b) do
		if(v[5] ~= "hurt")then
			add(v[1]-0.07, 0.4, "pop",-0.1, "centered--"..v[2])
		end
	end
	
	
	
	setdefault(-112*2.5, "debugx","3")
	setdefault(112*2.5, "debugx","1")
	
	setdefault(112*-1.75, "z")
	setdefault(-22, "yd")
	
	setdefault(0.4, "drawsize")
	setdefault(0.4, "orient")
	
	set(-16,1, "alpha")
	set(-16,-0.5, "alphanotes","1")
	set(-16,-0.5, "alphaholds","1")
	set(4,0, "alphanotes")
	set(4,0, "alphaholds")
	set(-16,-1.5*tinyMultFix, "tiny")
	
	setdefault(0.55, "drunk__mult")
	set(-16,-0.5, "drunk")
	set(-16,0.25, "waveyy")
	
	ease(0,4, "linear", 0 ,"tiny")
	ease(0,4, "linear", 0 ,"alpha","1")
	ease(3,1, "linear", 1 ,"beat")
	
	add(4,3, "outSine", -1.5 ,"movex")
	add(4,3, "outSine", -360 ,"angle")
	
	add(4+8,3, "outSine", 1.5 ,"movex")
	add(4+8,3, "outSine", 360 ,"angle")
	
	
	ease(19.15,0.75, "linear", 0 ,"beat")
	
	
	ease(20, 1.5, "bounce", 0.2,"linearx")
	ease(21.5, 24-21.5, "bounce",-0.2,"linearx")
	
	
	ease(20+4, 1.5, "bounce", 0.2,"linearx")
	ease(21.5+4, 24-21.5, "bounce", -0.2,"linearx")
	
	
	
	add(26.5,1.5, "inOutSine", -360 ,"angle","1")
	add(26.5,1.5, "inOutSine", 360 ,"angle","3")
	
	add(26.5,1.5, "inOutSine", 0.175 ,"waveyy")
	
	ease(26,0.1, "inOutQuad", 0 ,"alpha","3")
	
	--ease(26.5,1.5, "inOutSine", 2.5 ,"movex","3")
	--ease(26.5,1.5, "inOutSine", -2.5 ,"movex","1")
	
	set(28, 1, "zsort", "1")
	
	set(-16, 1, "spinaround__timeoffset", "3")
	set(-16, 0.5, "spinaround__speed")
	
	ease(26.5,1.5, "inOutSine", 112*2.25,"spinaround")
	ease(26.5,1.5, "inOutSine", 0.44,"orient")
	
	set(-16, 1.09, "bumpy__mult")
	
	if downScroll then
		ease(26.5,1.5, "inOutSine", -1,"bumpy")
	else
		ease(26.5,1.5, "inOutSine", 1,"bumpy")
	end
	
	
	
	for i = 28, 91 do
		add(i, 1, "outCubic", 0.25/4, "spinaround__timeoffset")
		
		add(i, 1, "bounce", -0.2*tinyMultFix, "tiny")
		add(i, 0.8, "pop", 0.1*tinyMultFix, "tinyy")
		add(i, 0.8, "pop", -0.1*tinyMultFix, "tinyx")
		
		if (i%2 == 0) then
			add(i, 1, "bounce", 0.25, "tipsy")
		else
			add(i, 1, "bounce", -0.25, "tipsy")
		end
		
		
	end
	
	add(25, 1, "outCubic", -0.5, "spinaround__timeoffset")

	

	ease(124, 4, "outCubic", 0, "spinaround")
	ease(124, 4, "outCubic", 112*2.2, "x","3")
	ease(124, 4, "outCubic", 112*-2.2, "x","1")
	ease(124, 8, "outCubic",0.2, "waveyy")
	ease(124, 8, "outCubic",0, "bumpy")
	
	
	set(124,1,"3d")
	
	add(124, 12, "outCubic", -90, "rotatex")
	add(124, 12, "outCubic", -90, "anglex")

	
	ease(131, 5, "inOutQuad", 1, "alpha")
	
	
	ease(91.5, 0.5, "inOutQuad",0.54, "beat","3")
	ease(91.5, 0.5, "inOutQuad",-0.54, "beat","1")
	
	ease(123.5, 0.4, "inOutQuad",0.0, "beat")
	
end


