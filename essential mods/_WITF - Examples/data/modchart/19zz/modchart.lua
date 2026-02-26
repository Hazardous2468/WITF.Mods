function onCreate()
	notesBehindHUD(true)
end
local tinyMultFix = 2 --WITF 1.0.0a fix


function setUp()
	centerPlayer("")
	createNewPlayer(true)
	createNewPlayer(true)
	createNewPlayer(true)
	createNewPlayer(true)
	
	--Display a little notification recommending the player to increase max FPS to 160 for the AFT to work as intended.
	--Because we are inside setUp(), this will only appear once when loading.
	runHaxeCode(
	[[
		if(Preferences.framerate < 144){
			print("This modchart is best experienced at 144+ FPS!");
		}
	]]
	)
end

function modsTimeline()

	--fix for fnf v0.6.3
	setdefault(1,"drawdistance")
	set(192.3, 0.5, "drawdistance")
	ease(251, 1, "inQuad", 2.2, "drawdistance","bf")
	set(254, 1, "drawdistance")
	
	ease(316, 1, "outSine", 0.5, "drawdistance","bf")
	ease(316, 1, "outSine", 2, "drawdistance","3")
	
	set(317,1, "sudden","bf")
	set(317,420, "sudden__offset","bf")
	

	
	
	set(316,112*-2, "debugx","bf")
	set(316,112*2, "debugx","3")
	set(316,112*-2, "alpha","3")
	

	setasleep(-16, "dad", true)
	
	setasleep(-16, "4", false)
	setasleep(-16, "5", false)
	setasleep(-16, "6", false)
	
	setasleep(63, "4", true)
	setasleep(63, "5", true)
	setasleep(63, "6", true)


	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode(
	[[

	var doShader:Bool = true;
	
	
	var target1 = PlayState.instance.playerStrumline.mods;	
	for (strumLine in PlayState.instance.allStrumLines)
	{
		strumLine.arrowPathFileName = "19ZZ/arrowPath";
	
		var spinAroundMod:CustomModifier = createCustomMod("spinaround", 0.0);
		spinAroundMod.modPriority = 100;
		spinAroundMod.unknown = false;
		spinAroundMod.strumsMod = true;
		spinAroundMod.notesMod = true;
		spinAroundMod.holdsMod = true;
		spinAroundMod.pathMod = false;
		spinAroundMod.specialMod = false;
		spinAroundMod.speedMod = false;
		strumLine.mods.addCustomMod(spinAroundMod);	
		
		spinAroundMod.createSubMod("offset", 0.0);
		spinAroundMod.createSubMod("timeoffset", 0.25);
		spinAroundMod.createSubMod("timeadd", 0.0);
		spinAroundMod.createSubMod("speed", 1);
		
		spinAroundMod.strumMathFunc = function(data){
		
			var timmy:Float = Conductor.instance.currentBeatTime / 4 * spinAroundMod.getSubVal("speed");
			timmy += spinAroundMod.getSubVal("timeadd");
			var timeoffset:Float = spinAroundMod.getSubVal("timeoffset");

			timmy += timeoffset * (data.direction + spinAroundMod.getSubVal("offset"));

			var _movex:Float = FlxMath.fastCos(timmy * Math.PI);
			var _movez:Float = FlxMath.fastSin(timmy * Math.PI);
			
			data.x += _movex * spinAroundMod.currentValue;
			data.z += _movez * spinAroundMod.currentValue;
			
			
			//data.angleY += 90 + (timmy*90*2);
		}
		
		spinAroundMod.noteMathFunc = function(data){
		
			var timmy:Float = Conductor.instance.currentBeatTime / 4 * spinAroundMod.getSubVal("speed");
			var timeoffset:Float = spinAroundMod.getSubVal("timeoffset");
			timmy += timeoffset * (data.direction + spinAroundMod.getSubVal("offset"));
			//data.angleY += 90 + (timmy*90*2);
		}
	}
	
	for (strumLine in PlayState.instance.allStrumLines)
	{
		var z_tempfix:CustomModifier = createCustomMod("z_tempfix", 0.0);
		z_tempfix.modPriority = -500;
		z_tempfix.strumsMod = true;
		z_tempfix.unknown = false;
		strumLine.mods.addCustomMod(z_tempfix);	
		
		z_tempfix.strumMathFunc = function(data){
			data.z += z_tempfix.currentValue;
		}
		
	}
	
	
	//Create AFT to capture notesCameras
	var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
	notesAFT.recursive=false;
	notesAFT.updateAFT();	
	setVar("notesAFT",notesAFT);
	
	var aftSprite = createSpr("aftSprite");
	aftSprite.loadGraphic(getVar("notesAFT").bitmap);
	aftSprite.screenCenter();	
	aftSprite.camera = game.camAFT;
	
	addResetEvent(function(){		
		game.camAFT.visible = false;
		game.camNotes.x = 0;
		aftSprite.alpha = 0.0;
		notesAFT.recursive=false;
		aftSprite.setGraphicSize(Std.int(notesAFT.w),  Std.int(notesAFT.h));
	});
	
	eh.funcModEvent(target1, 63.9, function() {
		notesAFT.clearAFT();
	}, "clear", false);
	
	eh.funcModEvent(target1, 64, function() {
		game.camNotes.x = 0;
		game.camAFT.visible = true;
		aftSprite.alpha = 1.0;
		aftSprite.camera = game.camNotes;
		notesAFT.recursive=true;
	}, "showAFT");
	
	addUpdate(function(elapsed){
		if(aftSprite.alpha > 0)
			notesAFT.updateAFT();	
	});	
	
	
	
	var aftControl_Width:CustomModifier = createCustomMod("aftscale", 1.0);
	aftControl_Width.createSubMod("width", 0);
	aftControl_Width.createSubMod("height", 0);
	aftControl_Width.modPriority = -9990;
	aftControl_Width.unknown = false;
	aftControl_Width.strumsMod = false;
    aftControl_Width.notesMod = false;
    aftControl_Width.holdsMod = false;
    aftControl_Width.pathMod = false;
    aftControl_Width.speedMod = false;
	aftControl_Width.specialMod = true;
	eh.addCustomMod("bf", aftControl_Width);
	
	aftControl_Width.specialMathFunc = function() {
		var aft = getVar("notesAFT");
		var aftSprite = PlayState.instance.customLuaSprites.get("aftSprite");
		if(aftSprite != null && aft != null){
			var width:Float = aftControl_Width.currentValue + aftControl_Width.getSubVal("width");
			var height:Float = aftControl_Width.currentValue + aftControl_Width.getSubVal("height");
			aftSprite.setGraphicSize(Std.int(aft.w * width),  Std.int(aft.h* height));
		}
	};

	var aftControl_angle:CustomModifier = createCustomMod("aftangle", 0.0);
	aftControl_angle.modPriority = -9990;
	aftControl_angle.strumsMod = false;
    aftControl_angle.notesMod = false;
	aftControl_angle.unknown = false;
    aftControl_angle.holdsMod = false;
    aftControl_angle.pathMod = false;
    aftControl_angle.speedMod = false;
	aftControl_angle.specialMod = true;
	eh.addCustomMod("bf", aftControl_angle);
	
	aftControl_angle.specialMathFunc = function() {
		if(aftSprite == null) return;
		var upscrollFix:Float = 1;
		if(Preferences.downscroll) upscrollFix = -1;

		aftSprite.angle = aftControl_angle.currentValue * upscrollFix;
	};
	
	
	var aftControl_pos:CustomModifier = createCustomMod("aftposition", 0.0);
	aftControl_pos.createSubMod("x", 0);
	aftControl_pos.createSubMod("y", 0);
	aftControl_pos.createSubMod("spinblend", 0);
	aftControl_pos.createSubMod("spinspeed", 1);
	aftControl_pos.modPriority = -9990;
	aftControl_pos.strumsMod = false;
    aftControl_pos.notesMod = false;
    aftControl_pos.holdsMod = false;
	aftControl_pos.unknown = false;
    aftControl_pos.pathMod = false;
    aftControl_pos.speedMod = false;
	aftControl_pos.specialMod = true;
	eh.addCustomMod("bf", aftControl_pos);
	
	aftControl_pos.specialMathFunc = function() {
		var upscrollFix:Float = -1;
		if(Preferences.downscroll) upscrollFix = 1;
	
		aftSprite.screenCenter();	
		aftSprite.x += aftControl_pos.getSubVal("x");
		aftSprite.y += aftControl_pos.getSubVal("y")*upscrollFix;
		
		//Spin
		var spinBlend = aftControl_pos.getSubVal("spinblend");
		if(spinBlend != 0){
		
			var timmy:Float = Conductor.instance.currentBeatTime / 4 * aftControl_pos.getSubVal("spinspeed");


			var _movex:Float = FlxMath.fastCos(timmy * Math.PI) ;
			var _movez:Float = FlxMath.fastSin(timmy * Math.PI) * upscrollFix;
			
			aftSprite.x += _movex * spinBlend;
			aftSprite.y += _movez* spinBlend;
		}
	};
	
	
	
	
	var binaryGlitch:FlxRuntimeShader = new FlxRuntimeShader(Assets.getText(Paths.frag("binaryglitch")), null);
	binaryGlitch.setBool('_active', false);
	binaryGlitch.setFloat('glitchStrength', 2.0);
	
	addResetEvent(function(){
		binaryGlitch.setBool('_active', false);
		binaryGlitch.setFloat('glitchStrength', 0.1);
	});	
	
	eh.funcTweenModEvent(target1, 120, 8,  ModConstants.getEaseFromString("outSine"), 0.1, 0.5, function(v) {
		binaryGlitch.setFloat('glitchStrength',v);
	}, "glitch shader strength");
	
	eh.funcTweenModEvent(target1, 128, 0.1,  ModConstants.getEaseFromString("outExpo"), 0.5, 0.01, function(v) {
		binaryGlitch.setFloat('glitchStrength',v);
	}, "glitch shader strength");
	
	eh.funcTweenModEvent(target1, 129, 1,  ModConstants.getEaseFromString("outBack"), 0.01, 0.22, function(v) {
		binaryGlitch.setFloat('glitchStrength',v);
	}, "glitch shader strength");
	
	eh.funcTweenModEvent(target1, 192, 0.1,  ModConstants.getEaseFromString("outExpo"), 0.22, 0.7, function(v) {
		binaryGlitch.setFloat('glitchStrength',v);
	}, "glitch shader strength");
	
	eh.funcTweenModEvent(target1, 192.7, 0.3,  ModConstants.getEaseFromString("inSine"), 0.7, 0.1, function(v) {
		binaryGlitch.setFloat('glitchStrength',v);
	}, "glitch shader strength");
	
	eh.funcTweenModEvent(target1, 252, 0.1,  ModConstants.getEaseFromString("outExpo"), 0.1, 0.666, function(v) {
		binaryGlitch.setFloat('glitchStrength',v);
	}, "glitch shader strength");
	
	eh.funcTweenModEvent(target1, 254, 2,  ModConstants.getEaseFromString("inExpo"), 0.666, 0.01, function(v) {
		binaryGlitch.setFloat('glitchStrength',v);
	}, "glitch shader strength");
	
	
	eh.funcModEvent(target1, 64, function() {
		binaryGlitch.setBool('_active', true);
	}, "invertCols");
	
	var camEffects:Array<BitmapFilter>=[];
	
	if(doShader){
		camEffects.push(new ShaderFilter(binaryGlitch));
	}

	game.camHUD.filters = camEffects;
	game.camNotes.filters = camEffects;
	game.camGame.filters = camEffects;
	game.camAFT.filters = camEffects;
	
	var coconut:bool = true; //?????????????

	
	]])
	
	setdefault(0.65, "drunk__mult")
	
	set(-16,1,"3d","bf")
	set(-4,1,"zsort","bf")
	
	set(-8,1,"alpha","bf")

	
	set(-16,1,"reverse", "3")
	set(-16,1,"reverse", "5")
	
	set(-16,0,"spinaround__offset", "3")
	set(-16,4,"spinaround__offset", "4")
	set(-16,0,"spinaround__offset", "5")
	set(-16,4,"spinaround__offset", "6")
	set(-16,0.5,"spinaround__speed", "6")
	set(-16,0.5,"spinaround__speed", "5")
	set(-16,0.333,"spinaround__speed", "3")
	set(-16,0.333,"spinaround__speed", "4")
	
	set(-16,1,"debugalpha")
	set(-15,0,"debugalpha","1")
	
	add(-4.2, 0.1, "instant", 90, "rotatex","6")
	add(-4.2, 0.1, "instant", 90, "rotatex","5")
	
	ease(-4, 6, "inOutSine", 112*4.2, "spinaround", "6")
	ease(-4, 6, "inOutSine", 112*4.2, "spinaround", "5")
	ease(-4, 6, "inOutSine", 112*2.8, "spinaround", "4")
	ease(-4, 6, "inOutSine", 112*2.8, "spinaround", "3")
	
	setdefault(1,"spiralpaths")
	setdefault(0.1,"arrowpathwidth")
	
	setdefault(82,"grain")
	
	for l = 3, 6 do
		
		setdefault(1,"alpha",l)
		set(-16,1,"sudden",l)
		set(-16,666,"sudden__offset",l)
		
		set(-16,1,"center",l)
		set(-16,0.5,"flip",l)
	
		set(-8,-112*4,"z_tempfix",l)
		
		set(-8,120,"arrowpathgrain",l)
		set(-8,1500,"arrowpathbacklength",l)
		set(-8,1500,"arrowpathlength",l)
		
		set(-8,1,"alpha",l)
		ease(-4, 4, "linear", 0.333, "alpha",l)
		
		ease(-4, 4, "linear", 0.333, "arrowpath",l)
		
		
		add(-4, 66, "linear", 90*12, "rotatex",l)
		add(-4, 66, "linear", 90*8, "rotatez",l)
		
		
		--add(-4, 62, "linear", 90*12, "anglex",l)
		--add(-4, 62, "linear", 90*7, "angle",l)
		
		ease(30, 1, "linear", 0.75, "stealth", l)
		ease(30, 1, "linear", 0.75, "strumstealth", l)
	end
	
	
	set(10, 0.75, "oldWave", "bf")
	set(10, 0.5, "speedmod", "bf")
	set(10, -4*tinyMultFix, "tinyx", "bf")
	
	ease(12.5, 2, "inOutSine", 0, "tinyx", "bf")
	ease(12.5, 1.5, "inOutSine", -1, "alpha--3", "bf")
	ease(19, 2, "inOutSine", 0, "alpha--3", "bf")
	
	ease(10, 1, "inOutSine", -1, "flip", "bf")
	
	
	set(26,-0.2, "flip", "bf")
	
	set(28, 1, "orient", "bf")
	set(28, 1, "drunk", "bf")
	set(28, 0.5, "speedmod", "bf")
	
	
	ease(30, 1, "linear", 0, "alpha", "bf")
	
	set(28, 0.85*tinyMultFix, "tinyx", "bf")
	set(28, -2*tinyMultFix, "tinyy", "bf")
	ease(30, 1.5*tinyMultFix, "outBack", 0, "tinyy", "bf")
	ease(30, 1.5*tinyMultFix, "outBack", 0, "tinyx", "bf")
	
	--dumb fix for arrowpath being in front of strums XD
	set(28, -2, "arrowpathoffsetz", "bf")
	ease(30, 1, "linear", 0.25, "arrowpath", "bf")
	
	ease(30, 1.75, "outBack", 2, "arrowpathwidth", "bf")
	
	ease(58, 62-58, "inSine", 0, "arrowpathwidth", "bf")
	
	
	add(46, 1, "linear", 360*2, "angley", "bf")
	add(47, 1, "linear", -360*2, "angley", "bf")
	
	add(52, 62-52, "inCubic", -360*5, "angley", "bf")
	add(52, 62-52, "inCubic", 1.1, "spinaround__timeadd")
	
	
	
	for i = 32, 60-8, 8 do
		add(i+2, 1.5, "outSine", 1, "drunk__time_add", "bf")
		add(i+4.5, 1.5, "outSine", 1, "drunk__time_add", "bf")
		add(i+7, 1.5, "outSine", 1, "drunk__time_add", "bf")
		
		add(i+2, 2, "pop", 4, "rotatez", "bf")
		add(i+4.5, 2, "pop", -4, "rotatez", "bf")
		add(i+7, 2, "pop", 4, "rotatez", "bf")
		
	
		add(i, 1, "pop", -0.6*tinyMultFix, "tiny", "bf")
		add(i+1, 1, "pop", -0.6*tinyMultFix, "tiny", "bf")
		add(i+2, 1, "pop", -0.7*tinyMultFix, "tiny", "bf")
		add(i+2.5, 1, "pop", -0.6*tinyMultFix, "tiny", "bf")
		add(i+3.5, 1, "pop", -0.6*tinyMultFix, "tiny", "bf")
		add(i+4.5, 1, "pop", -0.7*tinyMultFix, "tiny", "bf")
		add(i+5.5, 1, "pop", -0.6*tinyMultFix, "tiny", "bf")
		add(i+7, 1, "pop", -0.7*tinyMultFix, "tiny", "bf")
	end
	add(56, 1, "pop", -0.7*tinyMultFix, "tiny", "bf")
	
	
	
	for i = 60, 62-0.5, 0.5 do
		set(i, 0, "alpha","bf")
		set(i+0.25, 1, "alpha","bf")
		add(i+0.25,0.25, "outQuad", -0.5*tinyMultFix, "tiny")
		
	end
	
	reset(62)
	set(62.0001, 0, "alpha","3")
	
	set(62.0001, 0.001, "aftscale__height","bf")
	set(62.0001, 0.003, "aftscale__width","bf")
	
	set(62.0001, 1, "alpha","4")
	set(62.0001, 1, "alpha","5")
	set(62.0001, 1, "alpha","6")
	set(62.0001, 1, "alpha","bf")
	
	
	set(62.0001,255/255, "stealthglowred","bf")
	set(62.0001,153/255, "stealthglowgreen","bf")
	set(62.0001,0, "stealthglowblue","bf")
	
	set(62.0001,-0.5, "flip","bf")
	
	set(62.0001,90, "grain","bf")
	
	
	set(62.25,20, "drunk__speed","bf")
	set(62.25,1.3, "drunk__mult","bf")
	set(62.25,3, "drunk","bf")
	set(62.25,2.5, "reverse","bf")
	set(62.25,0.9, "stealth","bf")
	set(62.25,1, "dark","bf")
	set(62.25,-6, "movez","bf")
	ease(63.25, 0.75, "linear", 0.0, "alpha","bf")
	
	
	add(64, 2, "pop", 1, "stealthglowblue","bf")
	add(68, 2, "pop", 1, "stealthglowblue","bf")
	add(80, 2, "pop", 1, "stealthglowblue","bf")
	add(80+4, 2, "pop", 1, "stealthglowblue","bf")
	add(96, 2, "pop", 1, "stealthglowblue","bf")
	add(96+4, 2, "pop", 1, "stealthglowblue","bf")
	add(112, 2, "pop", 1, "stealthglowblue","bf")
	add(112+4, 2, "pop", 1, "stealthglowblue","bf")
	
	
	set(62.0001,1, "3d")
	set(62.0001,0.5, "speedmod")
	
	--set(62.0001,255/255, "arrowpathred","3")
	--set(62.0001,153/255, "arrowpathgreen","3")
	--set(62.0001,0, "arrowpathblue","3")
	--ease(63.25, 0.75, "linear", 0.2, "arrowpath","3")
	
	
	set(62.0001,0.3333, "bumpy__mult","3")
	if downscroll then
		ease(63.25, 0.75, "linear", -90, "anglex","3")
		ease(63.25, 0.75, "linear", -0.26, "roll","3")
		ease(63.25, 0.75, "linear", 12, "bumpy","3")
	else
		ease(63.25, 0.75, "linear", 90, "anglex","3")
		ease(63.25, 0.75, "linear", -0.26, "roll","3")
		ease(63.25, 0.75, "linear", -12, "bumpy","3")
	end
	
	
	

	
	set(62.0001,10, "drunk__speed","3")
	set(62.0001,3, "drunk__mult","3")
	ease(63.25, 0.75, "linear", 0.23, "drunk","3")
	
	add(64, 8, "outCubic", 20,"drunk__time_add","3")
	add(68, 8, "outCubic", 20, "drunk__time_add","3")
	add(80, 8, "outCubic", 20,"drunk__time_add","3")
	add(80+4, 8, "outCubic", 20, "drunk__time_add","3")
	ease(94, 0.5, "linear", 0.0, "drunk","3")
	ease(96, 0.5, "outExpo", -0.24, "drunk","3")
	add(96, 8, "outCubic", 20,"drunk__time_add","3")
	add(96+4, 8, "outCubic", 20, "drunk__time_add","3")
	add(112, 8, "outCubic", 20,"drunk__time_add","3")
	add(112+4, 8, "outCubic", 20, "drunk__time_add","3")
	add(120, 8, "outCubic", 20, "drunk__time_add","3")
	add(121, 7, "inQuint", 20, "drunk__time_add","3")
	
	
	ease(64, 1, "linear", 0.5, "aftposition__y","bf")
	
	add(78, 0.75, "pop",5, "aftposition__x","bf")
	add(78+0.5, 0.75, "pop",-5, "aftposition__x","bf")
	add(78+1, 0.75, "pop",5, "aftposition__x","bf")
	add(78+1.5, 0.75, "pop",-5, "aftposition__x","bf")
	
	add(78, 0.75, "pop",-0.5, "movex","3")
	add(78+0.5, 0.75, "pop",0.5, "movex","3")
	add(78+1, 0.75, "pop",-0.5, "movex","3")
	add(78+1.5, 0.75, "pop",0.5, "movex","3")
	
	add(78, 0.75, "pop",0.5, "strumstealth","3")
	add(78+0.5, 0.75, "pop",0.5, "strumstealth","3")
	add(78+1, 0.75, "pop",0.5, "strumstealth","3")
	add(78+1.5, 0.75, "pop",0.5, "strumstealth","3")
	
	
	ease(94, 1, "outExpo", 1, "dark","3")
	ease(95.75, 0.25, "inQuint", 0, "dark","3")
	
	add(94, 1, "linear", -0.5, "aftangle","bf")
	add(96, 0.25, "outExpo", 0.5, "aftangle","bf")
	
	
	
	
	
	
	ease(110, 1, "outExpo", 1, "alpha","bf")
	ease(110, 1, "outExpo", 1, "alpha","3")
	
	ease(112, 0.5, "outExpo", 0, "alpha","bf")
	ease(112, 0.5, "outExpo", 0, "alpha","3")
	
	
	add(120, 8, "inCubic", 360*4, "rotatez","bf")
	add(120, 8, "inCubic", 360*4, "angley","3")
	add(120, 8, "inCubic", 360*4*-1, "notesangley","3")
	
	ease(117, 0.1, "instant",-500, "hidden--3__offset","3")
	ease(118, 2, "inCubic",1, "hidden--3","3")
	ease(120, 8, "inCubic",0, "hidden--3__offset","3")
	ease(128, 1, "linear",0, "hidden--3","3")
	for i = 128, 129,1/3 do
		add(i, 1/3, "pop", -2*tinyMultFix, "tinyx")
	end
	
	
	--DROP
	
	for i = 130, 191,2 do
		add(i, 2, "bounce", -2*tinyMultFix, "tiny")
		
		if i % 4 == 2 then
			add(i, 2, "pop", 0.0075, "aftscale__width","bf")
		else
			add(i, 2, "pop", 0.0075, "aftscale__height","bf")
		end
	end
	
	
	
	ease(129, 0.5, "inOutCubic",6, "tipsyz","3")
	ease(129.5, 0.5, "inOutCubic",0, "tipsyz","3")
	
	ease(129.5, 0.5, "inOutCubic",0.2, "waveyy","3")
	
	
	
	ease(137, 0.5, "outCubic", 1, "alpha","3")
	ease(138, 0.5, "outCubic", 0, "alpha","3")
	ease(139, 0.5, "outCubic", 1, "alpha","3")
	ease(140, 0.5, "outCubic", 0, "alpha","3")
	
	ease(141, 0.5, "outCubic", 1, "alpha","3")
	
	add(141, 1, "linear", 360, "angle")
	
	ease(141, 1, "linear", 1, "flip","3")
	ease(142, 2, "linear", 0, "flip","3")
	
	add(142, 1, "bounce", -1, "alpha","3")
	
	ease(144, 0.5, "outCubic", 0, "alpha","3")
	
	
	
	
	ease(153, 0.5, "outCubic", 1, "alpha","3")
	ease(154, 0.5, "outCubic", 0, "alpha","3")
	ease(155, 0.5, "outCubic", 1, "alpha","3")
	ease(156, 0.5, "outCubic", 0, "alpha","3")
	
	add(155, 1.5, "pop", 0.75, "aftangle","bf")
	
	ease(157, 0.5, "outCubic", 1, "stealth","3")
	ease(158, 0.5, "outCubic", 0, "stealth","3")
	add(157.5, 2.5, "bell", -1, "tornado","3")
	add(157.5, 2.5, "bell", 1, "zigzag","3")
	
	set(158, 2, "tandrunk__mult","3")
	ease(159, 1, "bell",1, "tandrunk","3")
	
	
	
	add(169, 1.5, "pop", 4, "aftposition__x","bf")
	add(171, 1.5, "pop", -5, "aftposition__x","bf")
	
	ease(169, 0.5, "outCubic", 1, "alpha","3")
	ease(170, 0.5, "outCubic", 0, "alpha","3")
	ease(171, 0.5, "outCubic", 1, "alpha","3")
	ease(172, 0.5, "outCubic", 0, "alpha","3")
	
	add(173, 1.5, "pop", -5, "aftposition__y","bf")
	add(173, 1.5, "pop", 2, "aftposition__x","bf")
	
	add(173, 2, "spike", 16, "longholds","3")
	
	ease(173, 2, "linear", 1, "flip","3")
	ease(175, 1, "linear", 0, "flip","3")
	
	ease(174, 0.5, "outCubic", 1, "alpha","3")
	ease(174, 0.5, "outCubic", 1, "alpha","bf")
	
	ease(176, 0.5, "outCubic", 0, "alpha","3")
	ease(176, 0.5, "outCubic", 0, "alpha","bf")
	
	ease(192, 0.2, "outExpo", 1, "alpha","3")
	ease(192, 0.2, "outExpo", 1, "alpha","bf")
	
	
	ease(192, 0.2, "outExpo", 0, "aftscale__width","bf")
	ease(192, 0.2, "outExpo", 0, "aftscale__height","bf")
	ease(192, 0.2, "outExpo", 0, "aftposition__y","bf")
	
	reset(192.45)
	set(192.45, 1*tinyMultFix, "tinyy")
	ease(192.5, 0.5, "linear", 0, "tinyy","bf")
	
	
	ease(192.5, 0.5, "inOutCubic",0.15, "waveyx","bf")
	
	
	ease(193, 1, "inOutSine", 2, "bumpy","bf")
	
	set(192.45, 75, "grain","bf")
	
	set(192.45, 4 + (1/3)*2, "drunk__speed","bf")
	
	ease(193, 1, "inOutSine", 1, "aftposition__spinblend","bf")
	ease(252, 0.5, "outExpo", 0, "aftposition__spinblend","bf")
	
	ease(252, 0.5, "outExpo", 0, "bumpy","bf")
	
	ease(252, 0.5, "outExpo", 1, "alpha","bf")
	ease(252, 0.5, "outExpo", 0, "waveyx","bf")
		
	for i = 193, 251-4, 4 do
		add(i, 4, "bounce", 0.0025, "aftscale__width","bf")
		add(i+2, 4, "bounce", 0.0025, "aftscale__height","bf")
	end
	
	add(200, 2, "pop", 0.24, "speedmod","bf")
	add(200+16, 2, "pop", 0.24, "speedmod","bf")
	add(32+200, 2, "pop", 0.241, "speedmod","bf")
	add(32+200+16, 2, "pop", 0.242, "speedmod","bf")
	
	set(193, 1, "3d", "bf")
	local function clap(w, m)
		add(w, 2, "pop", 1 * m, "drunk","bf")
		add(w, 2, "outExpo", 360 * m, "anglex","bf")
		add(w, 2, "pop", -1*tinyMultFix, "tiny","bf")
	end
	clap(200, 1)
	clap(216, -1)
	clap(32+200, 1)
	clap(32+216, -1)
	
	local function ffff(w)
		add(w, 1, "bounce", 4, "tipsyz","bf")
		add(w, 1, "bounce", 45, "angle","bf")
	end
	ffff(208)
	ffff(240)
	
	
	for i = 193, 193+64, 8 do
		
		add(i, 2, "pop", -0.2, "flip","bf")
		add(i+1.5, 2.5, "pop", -0.2, "flip","bf")
		
		add(i, 2, "pop", -1*tinyMultFix, "tiny","bf")
		add(i+1.5, 2.5, "pop", -1*tinyMultFix, "tiny","bf")
	end
	
	
	
	
	
	add(221.5, 2.75, "bell", -1, "aftangle","bf")
	
	for i = 222, 224-0.25, 0.25 do
		add(i, 0.1, "outExpo", -45, "angle","bf")
	end
	
	
	
	ease(251, 0.8, "inQuad", 1, "brake","bf")
	add(251, 0.8, "inQuad", -0.2, "speedmod","bf")
	--ease(251, 1, "inQuad", 0.2, "drawsize","bf")
	
	--Final
	reset(253)
	
	ease(256, 1, "linear", 0.99, "aftscale","bf")
	ease(256, 1, "inQuint", -0.05, "aftangle","bf")
	
	set(253, 1, "alpha","1")
	set(253, 1, "alpha","3")
	ease(254, 1.75, "inQuint", 0, "alpha","3")
	set(254,80, "grain","3")
	

	
	
	for i = 262.5, 262.5 + 64-16, 8 do
		add(i, 1.5, "inOutSine", 180, "rotatex","3")
		
		add(i, 1.5, "inOutSine", 360, "anglex","3")
	end
	
	for i = 262.5+64, 262.5 + 64-16+64, 8 do
		add(i, 1.5, "inOutSine", 360, "anglex","3")
	end
	
	
	
	
	local lazyAlt = 1
	
	local function endHit(i, timeMult)
		for l = 0, 3 do
			add(i, timeMult, "pop", math.random(-45,45), "noteskewx--"..l,"3")
		end
		
		add(i, timeMult, "pop", 0.02, "aftscale__width","bf")
		
		add(i, timeMult/2, "pop", 1, "alpha","3")
		
		add(i, timeMult, "pop", -2*tinyMultFix, "tiny","3")
		add(i, timeMult, "pop", -0.24, "flip","3")
		
		if lazyAlt == 1 then
			lazyAlt = -1
		else
			lazyAlt = 1
		end
		add(i, timeMult, "pop", 1*lazyAlt, "drunk","3")
		add(i, timeMult, "pop", 1*lazyAlt*2, "tipsyz","3")
		
		add(i, timeMult, "pop", 0.25, "strumstealth","3")
	end
	
	local function endHitGroup(i)
		endHit(i, 0.75)
		endHit(i+0.75, 0.75)
		endHit(i+0.75+0.75, 0.75)
		
		add(i+2, 1, "pop", 1, "drunk","3")
		add(i+6, 1, "pop", -1, "drunk","3")
		
		add(i+2, 1, "pop",-1*tinyMultFix, "tiny","3")
		add(i+6, 1, "pop", -1*tinyMultFix, "tiny","3")
		
		endHit(i+3, 0.75)
		endHit(i+3+0.75, 0.75)
		endHit(i+3+0.75+0.75, 0.5)
		endHit(i+3+0.75+0.75+0.5, 0.5)
		endHit(i+3+0.75+0.75+1, 0.5)
	end
	
	local function endFunnyThingPart(i)
		for l = 0, 3 do
			add(i, 0.75, "pop", math.random(-45,45), "noteskewx--"..l,"3")
		end
		
		add(i, 0.75, "pop", -1*tinyMultFix, "tiny","3")
		
		
		if lazyAlt == 1 then
			lazyAlt = -1
		else
			lazyAlt = 1
		end
		
		
		if i < 320 then
			add(i, 0.75, "pop", -2*lazyAlt, "aftposition__x","bf")
		else
			add(i, 0.75, "pop", -0.4, "aftangle","bf")
			
			add(i, 0.75, "pop", -0.001, "aftscale__height","bf")
		end
		
		add(i, 0.75, "pop", 0.01, "aftscale__height","bf")
	end
	
	local function endFunnyThing(i)
		endFunnyThingPart(i)
		endFunnyThingPart(i+0.75)
		endFunnyThingPart(i+(0.75*2))
		endFunnyThingPart(i+(0.75*3))
		endFunnyThingPart(i+(0.75*4))
		endFunnyThingPart(i+(0.75*5))
		endFunnyThingPart(i+(0.75*6))
		endFunnyThingPart(i+(0.75*7))
		endFunnyThingPart(i+(0.75*8))
		
		ease(i, 0.75, "outExpo", 1, "alpha","3")
		ease(i+0.75, 0.75, "outSine", 0, "alpha","3")
		ease(i+1.5, 0.75, "outExpo", 1, "alpha","3")
		ease(i+0.75+1.5, 0.75, "outSine", 0, "alpha","3")
		ease(1.5+i+1.5, 0.75, "outExpo", 1, "alpha","3")
		ease(1.5+i+0.75+1.5, 0.75, "outSine", 0, "alpha","3")
		ease(3+i+1.5, 0.75, "outExpo", 1, "alpha","3")
		ease(3+i+0.75+1.5, 0.75, "outSine", 0, "alpha","3")
	end
	
	
	--Funny bits
	ease(258.5, 0.25, "outExpo", 1, "videogames","3")
	ease(258.75, 0.25, "outExpo", 0, "videogames","3")
	ease(258.5, 0.25, "outExpo", 0.8, "stealth","3")
	ease(258.75, 0.25, "outExpo", 0, "stealth","3")
	
	ease(266.25, 0.25, "outExpo", 1, "videogames","3")
	ease(266.5, 0.25, "outExpo", 0, "videogames","3")
	
	ease(290.25, 0.25, "outExpo", 1, "videogames","3")
	ease(290.5, 0.25, "outExpo", 0, "videogames","3")
	
	
	ease(298, 0.5, "outExpo", 1, "stealth","3")
	ease(298.5, 0.5, "outExpo",0, "stealth","3")
	ease(298, 0.5, "outExpo", 1, "invert","3")
	ease(298.5, 0.5, "outExpo", 0, "invert","3")
	

	for i = 274, 275-0.25, 0.25 do
		add(i, 0.25, "bell", 0.5, "stealth","3")
		
	end
	add(274, 1, "linear", -360*2, "angle","3")
	for i = 306, 307-0.25, 0.25 do
		add(i, 0.25, "bell", 0.5, "stealth","3")
	end
	add(306, 1, "linear", -360*2, "angle","3")
	
	
	add(286, 1, "pop", -45, "noteskewy","3")
	
	
	
	
	
	
	ease(64+258.5, 0.25, "outExpo", 1, "videogames","3")
	ease(64+258.75, 0.25, "outExpo", 0, "videogames","3")
	ease(64+258.5, 0.25, "outExpo", 0.8, "stealth","3")
	ease(64+258.75, 0.25, "outExpo", 0, "stealth","3")
	
	ease(64+266.25, 0.25, "outExpo", 1, "videogames","3")
	ease(64+266.5, 0.25, "outExpo", 0, "videogames","3")
	
	ease(64+290.25, 0.25, "outExpo", 1, "videogames","3")
	ease(64+290.5, 0.25, "outExpo", 0, "videogames","3")
	
	
	ease(64+298, 0.5, "outExpo", 1, "stealth","3")
	ease(64+298.5, 0.5, "outExpo",0, "stealth","3")
	ease(64+298, 0.5, "outExpo", 1, "invert","3")
	ease(64+298.5, 0.5, "outExpo", 0, "invert","3")

	
	
	for i = 64+274, 64+275-0.25, 0.25 do
		add(i, 0.25, "bell", 0.5, "stealth","3")
		
	end
	add(64+274, 1, "linear", -360*2, "angle","3")
	for i = 64+306, 64+307-0.25, 0.25 do
		add(i, 0.25, "bell", 0.5, "stealth","3")
	end
	add(64+306, 1, "linear", -360*2, "angle","3")
	
	
	add(64+286, 1, "pop", -45, "noteskewy","3")
	
	--Core
	endHitGroup(256)
	endHitGroup(264)
	endHitGroup(272)
	endFunnyThing(280)
	endFunnyThing(280+64)
	
	endHitGroup(288)
	endHitGroup(296)
	endHitGroup(304)
	
	
	add(312, 8, "linear", 0.03, "aftscale__height","bf")
	add(318, 2, "outSine", -0.03, "aftscale__height","bf")
	
	
	endHitGroup(256+64)
	endHitGroup(264+64)
	endHitGroup(272+64)
	
	endHitGroup(288+64)
	endHitGroup(296+64)
	endHitGroup(304+64)
	
	
	
	
	
	
	
	ease(312, 2, "inOutQuad", 0.4, "brake--0","3")
	ease(318, 2, "outCubic", 0.0, "brake--0","3")
	
	
	--Finale 2
	
	ease(318.8, 1, "inOutSine", 0.4, "aftangle","bf")
	
	ease(376, 6, "inSine", 5, "aftangle","bf")
	
	

	
	
	set(312,60, "grain","3")
	set(318,90, "grain","3")
	
	set(318,1, "3d","3")
	set(318,1, "spiralholds","3")
	
	if downscroll then
		ease(312, 318-312, "inOutQuad", -10, "bumpy","3")
	else
		ease(312, 318-312, "inOutQuad", 10, "bumpy","3")
	end
	ease(318, 4, "outQuint", 0, "bumpy","3")
	
	ease(312, 318-312, "inOutQuad", 360*10, "angle","3")
	--ease(318, 4, "outQuint", 0, "angle","3")
	
	
	--set(318, 1250, "sudden__offset","3")
	--ease(318, 4, "outQuint", 1, "sudden","3")
	--ease(318, 4, "outQuint", 0.5, "drawsize","3")
	
	
	add(318, 4, "outQuint", -0.7, "movex","3")
	add(318, 4, "outQuint", -0.2, "tipsy","3")
	add(318, 4, "outQuint", -0.2, "waveyx","3")
	
	setdefault(1,"spiraly__altcurpos")
	
	if downscroll then
		add(318, 4, "outQuint", -20, "rotatey","3")
		add(318, 4, "outQuint", 20, "rotatex","3")
		
		add(318, 4, "outQuint", 30, "angley","3")
		add(318, 4, "outQuint", 20, "anglex","3")
		
		
		
		add(318, 4, "outQuint", -10, "rotatez","3")
	
	
		add(318, 4, "outQuint", 1.2, "linearz","3")
		add(318, 4, "outQuint", -0.5, "linearx","3")	
		add(318, 4, "outQuint", -0.5, "circx","3")
		add(318, 4, "outQuint", 0.35, "lineary","3")
		
		add(318, 4, "outQuint", 3, "spiraly","3")
	else
		add(318, 4, "outQuint", -20, "rotatey","3")
		add(318, 4, "outQuint", -10, "rotatex","3")
		add(318, 4, "outQuint", 30, "angley","3")
		add(318, 4, "outQuint", -10, "anglex","3")
		
		add(318, 4, "outQuint", 3, "spiraly","3")
		add(318, 4, "outQuint", 10, "rotatez","3")
		
		add(318, 4, "outQuint", -0.5, "linearx","3")	
		add(318, 4, "outQuint", 1.2, "linearz","3")
		
		add(318, 4, "outQuint", -0.5, "circx","3")
		add(318, 4, "outQuint", 0.2, "lineary","3")
		
	end
	set(318, 0.01, "spiraly__mult","3")
	add(318, 4, "outQuint", -0.4, "speedmod","3")

	
	--set(317,2, "dizzy","bf")
	set(317,2, "tornadoangle","bf")
	set(317,0.666, "tornado","bf")
	ease(374, 2, "inOutSine", 0.0, "tornado","bf")
	ease(374, 16, "inOutSine", -0.75, "circx","bf")
	ease(374, 16, "inOutSine", 3.0, "circz","bf")
	
	set(317,90, "grain","bf")
	set(317,-0.25, "drunk","bf")
	set(317, -4, "movex","bf")
	set(317, 1.5, "movez","bf")
	set(317, 0.25, "flip","bf")
	set(317, 0.5*tinyMultFix, "tiny","bf")
	set(317, 1, "3d","bf")
	set(317, 0.5, "oldWave","bf")
	set(317, 0.75, "speedmod","bf")
	set(317, 10, "rotatey","bf")
	set(317, 10, "angley","bf")
	ease(318, 4, "outQuint", 0.0, "alpha","bf")
	
	
	set(318, -0.7*112, "strumrotatey__offset_z","3")
	add(376, 8, "outQuint", 360*4, "strumrotatey","3")
	add(375, 9, "inQuint", 360*12, "strumrotatey","3")
	
	
	set(318, -4*112, "strumrotatey__offset_z","bf")
	add(376, 8, "outQuint", 360*4, "strumrotatey","bf")
	add(375, 9, "inQuint", 360*12, "strumrotatey","bf")
	
	
	
	ease(381.9, 0.12, "outSine", 50, "noteskewx","3")
	ease(382.4, 0.13, "outExpo", 1, "alpha","all")
	
	
end



