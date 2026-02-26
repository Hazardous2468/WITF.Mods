function onCreate()
	notesBehindHUD(true)
end
function setUp()
end

function modsTimeline()	
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxAngle", "flixel.math")
	runHaxeCode(
	[[
	var target1 = PlayState.instance.playerStrumline.mods;
	
	//change healthbar to black and white to match colour palette
	
	game.healthBar.createFilledBar(0xFF000000, 0xFFFFFFFF);

	game.comboPopUps.offsets[0] = 40;
	game.comboPopUps.offsets[1] = 350;
	

	
	
	var bg = createSpr("bg", 'operator_bg');
	bg.setGraphicSize(Std.int(FlxG.width*1.1), Std.int(FlxG.height*1.1) );
	bg.screenCenter();
	
	var blackOutBG:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
	blackOutBG.alpha=1;
	blackOutBG.zIndex = 645;
	PlayState.instance.add(blackOutBG);
	game.customLuaSprites.set("black", blackOutBG);
	addResetEvent(function(){
		getSpr("black").alpha = 1;
	});	
	
	eh.funcTweenModEvent(target1, 68, 4,  ModConstants.getEaseFromString("outSine"), 1, 0.2, function(v) {
		getSpr("black").alpha = v;
	}, "black");
	
	eh.funcTweenModEvent(target1, 130, 0.1,  ModConstants.getEaseFromString("outExpo"), 0.2, 0.45, function(v) {
		getSpr("black").alpha = v;
	}, "black");
	
	eh.funcTweenModEvent(target1, 132, 2,  ModConstants.getEaseFromString("outSine"), 0.45, 0.0, function(v) {
		getSpr("black").alpha = v;
	}, "black");
	
	
	
	eh.funcTweenModEvent(target1, 194, 0.1,  ModConstants.getEaseFromString("outExpo"), 0.0, 0.45, function(v) {
		getSpr("black").alpha = v;
	}, "black");
	
	eh.funcTweenModEvent(target1, 196, 4,  ModConstants.getEaseFromString("inOutQuad"), 0.45, 0.62, function(v) {
		getSpr("black").alpha = v;
	}, "black");
	
	eh.funcTweenModEvent(target1, 257.5, 1,  ModConstants.getEaseFromString("linear"), 0.62, 1, function(v) {
		getSpr("black").alpha = v;
	}, "black");
	
	var boxBackgroundColour:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFFFFFFFF);
	boxBackgroundColour.alpha=1;
	boxBackgroundColour.color=0xFF000000;
	boxBackgroundColour.zIndex = -2000;
	PlayState.instance.add(boxBackgroundColour);
	game.customLuaSprites.set("boxBackgroundColour", boxBackgroundColour);
	boxBackgroundColour.camera = PlayState.instance.camNotes;
	
	var operatorBoxBG_rainbowSHADER = new FlxRuntimeShader(Assets.getText(Paths.frag("operator/operator_rainbow")), null);
	addUpdate(function(elapsed){
		operatorBoxBG_rainbowSHADER.setFloat('uTime', Conductor.instance.songPosition/1000);
	});	
	boxBackgroundColour.shader = operatorBoxBG_rainbowSHADER;
	
	
	
	
	/*
	var aftCapture:HazardAFT = new HazardAFT(game.camNotes);
	aftCapture.recursive=false;
	setVar("aftCapture",aftCapture);
	aftCapture.updateRate = 0.0;
	aftCapture.recursive = false;
	aftCapture.copyFilters = true;
	aftCapture.testTEST = false;
				
	addUpdate(function(elapsed){
		aftCapture.update(elapsed);
	});	

	game.camAFT.visible = true;
	
	var aftSprite:FunkinSprite = new FunkinSprite(0, 0);
	aftSprite.cameras = [game.camAFT];
	aftSprite.zIndex = -1500;
	PlayState.instance.add(aftSprite);
	aftSprite.x = 0;
	aftSprite.y = 0;
	aftSprite.loadGraphic( aftCapture.bitmap );	
	game.customLuaSprites.set("aftsprite", aftSprite);
	
	//aftSprite.setGraphicSize(Std.int(aftCapture.w * 1.02));	
	
	*/
	
	
	
	
	
	var operator_boxMask = new FlxRuntimeShader(Assets.getText(Paths.frag("operator/operator_boxMask")), null);
	
	var mosaicEffectCAMERA = new FlxRuntimeShader(Assets.getText(Paths.frag("operator/operator_mosaicEffect")), null);
	//mosaicEffectCAMERA.setStrength(5,5);
	mosaicEffectCAMERA.setFloat('xStrength', 5);
	mosaicEffectCAMERA.setFloat('yStrength', 5);
	
	
	var infinityGlow = new FlxRuntimeShader(Assets.getText(Paths.frag("operator/operator_glow")), null);
	infinityGlow.setFloat('distance', 0.0);
	infinityGlow.setFloat('alphaMultiplier', 0.0);
	setResetEvent(function(){
		infinityGlow.setFloat('distance', 0.0);
		infinityGlow.setFloat('alphaMultiplier', 0.0);
	});
	eh.funcTweenModEvent(target1, 131, 2.5,  ModConstants.getEaseFromString("sineInOut"), 0,  0.5, function(v) {
		infinityGlow.setFloat('alphaMultiplier', v);
		infinityGlow.setFloat('distance', v/10);
	}, "infinityGlow");

		
	
	
	var glitchLineShader =   new FlxRuntimeShader(Assets.getText(Paths.frag("GlitchLineShader")), null); 
	addUpdate(function(elapsed){
		glitchLineShader.setFloat('uTime', Conductor.instance.songPosition/1000);
	});	
	
	
	
	var colorOverrideShader = new FlxRuntimeShader(Assets.getText(Paths.frag("operator/operator_basicColor")), null);
	eh.funcModEvent(target1, -16, function() {
		colorOverrideShader.setFloat('r', 0.0);
		colorOverrideShader.setFloat('g', 0.0);
		colorOverrideShader.setFloat('b', 0.0);
		colorOverrideShader.setFloat('blend', 1.0);
		getSpr("boxBackgroundColour").alpha = 1;
		getSpr("boxBackgroundColour").color = 0xFF000000;
		operatorBoxBG_rainbowSHADER.setBool('_active',false);
	});
	eh.funcModEvent(target1, 130, function() {
		getSpr("boxBackgroundColour").alpha = 0.25;
		colorOverrideShader.setFloat('r', 1.0);
		colorOverrideShader.setFloat('g', 0.0);
		colorOverrideShader.setFloat('b', 0.0);
		colorOverrideShader.setFloat('blend', 0.25);
	});
	eh.funcModEvent(target1, 131, function() {
		
		colorOverrideShader.setFloat('r', 0.0);
		colorOverrideShader.setFloat('g', 1.0);
		colorOverrideShader.setFloat('b', 1.0);
		colorOverrideShader.setFloat('blend', 0.25);
	});
	eh.funcModEvent(target1, 132, function() {
		operatorBoxBG_rainbowSHADER.setBool('_active',true);
		getSpr("boxBackgroundColour").color = 0xFFFFFFFF;
		getSpr("boxBackgroundColour").alpha = 0.2;
		colorOverrideShader.setFloat('r', 0.0);
		colorOverrideShader.setFloat('g', 0.0);
		colorOverrideShader.setFloat('b', 0.0);
		colorOverrideShader.setFloat('blend', 1.0);
	});
	eh.funcModEvent(target1, 194, function() {
		operatorBoxBG_rainbowSHADER.setBool('_active',false);
		getSpr("boxBackgroundColour").color = 0xFF000000;
		getSpr("boxBackgroundColour").alpha = 0.25;
		colorOverrideShader.setFloat('r', 1.0);
		colorOverrideShader.setFloat('g', 0.0);
		colorOverrideShader.setFloat('b', 0.0);
		colorOverrideShader.setFloat('blend', 0.25);
	});
	eh.funcModEvent(target1, 195, function() {
		
		colorOverrideShader.setFloat('r', 0.0);
		colorOverrideShader.setFloat('g', 1.0);
		colorOverrideShader.setFloat('b', 1.0);
		colorOverrideShader.setFloat('blend', 0.25);
	});
	eh.funcModEvent(target1, 196, function() {
		operatorBoxBG_rainbowSHADER.setBool('_active',false);
		getSpr("boxBackgroundColour").color = 0xFF000000;
		getSpr("boxBackgroundColour").alpha = 1;
		colorOverrideShader.setFloat('r', 0.0);
		colorOverrideShader.setFloat('g', 0.0);
		colorOverrideShader.setFloat('b', 0.0);
		colorOverrideShader.setFloat('blend', 1.0);
	});

	
	var threeD = new FlxRuntimeShader(Assets.getText(Paths.frag("operator/operator_3d")), null); 
	//threeD.setFloat('yrot', Math.PI);
	
	var emptyCamEffects:Array<BitmapFilter>=[];
	
	var newCamEffects:Array<BitmapFilter>=[];
	newCamEffects.push(new ShaderFilter(colorOverrideShader));	
	newCamEffects.push(new ShaderFilter(operator_boxMask));	
	newCamEffects.push(new ShaderFilter(threeD));	
	newCamEffects.push(new ShaderFilter(infinityGlow));	
	newCamEffects.push(new ShaderFilter(mosaicEffectCAMERA));	
	newCamEffects.push(new ShaderFilter(glitchLineShader));	
	
	game.camNotes.filters=(newCamEffects);
	eh.funcModEvent(target1, -16, function() {
		game.camNotes.filters=(newCamEffects);
	});
	
	addUpdate(function(elapsed){
		if(game.isPlayerDying){
			game.camNotes.filters=(emptyCamEffects);
		}
	});	
	
	
	var glitchMod:CustomModifier = createCustomMod("glitch", 0.0);
	glitchMod.modPriority = -9990;
	glitchMod.strumsMod = false;
    glitchMod.notesMod = false;
    glitchMod.holdsMod = false;
	glitchMod.unknown = false;
    glitchMod.pathMod = false;
    glitchMod.specialMod = true;
    glitchMod.speedMod = false;
	eh.addCustomMod("1", glitchMod);
	glitchMod.specialMathFunc = function() {
		glitchLineShader.setFloat('uFrequency', glitchMod.currentValue);
	};
	
	
	
	var squareRotation:CustomModifier = createCustomMod("squareRotation", 0.0);
	squareRotation.modPriority = -9990;
	squareRotation.strumsMod = false;
	squareRotation.unknown = false;
    squareRotation.notesMod = false;
    squareRotation.holdsMod = false;
    squareRotation.pathMod = false;
    squareRotation.specialMod = true;
    squareRotation.speedMod = false;
	eh.addCustomMod("1", squareRotation);
	squareRotation.specialMathFunc = function() {
		var degreeToRad:Float = squareRotation.currentValue * FlxAngle.TO_RAD;
		operator_boxMask.setFloat('rot', degreeToRad);
	};
	
	
	var squareSize:CustomModifier = createCustomMod("squareSize", 2.5);
	squareSize.modPriority = -9990;
	squareSize.strumsMod = false;
	squareSize.unknown = false;
    squareSize.notesMod = false;
    squareSize.holdsMod = false;
    squareSize.pathMod = false;
    squareSize.specialMod = true;
    squareSize.speedMod = false;
	eh.addCustomMod("1", squareSize);
	squareSize.specialMathFunc = function() {
		operator_boxMask.setFloat('size', squareSize.currentValue);
	};
	
	
	var bgParticlesScale:CustomModifier = createCustomMod("bgParticlesScale", 0.55);
	bgParticlesScale.modPriority = -9990;
	bgParticlesScale.strumsMod = false;
    bgParticlesScale.notesMod = false;
	bgParticlesScale.unknown = false;
    bgParticlesScale.holdsMod = false;
    bgParticlesScale.pathMod = false;
    bgParticlesScale.specialMod = true;
    bgParticlesScale.speedMod = false;
	eh.addCustomMod("1", bgParticlesScale);
	bgParticlesScale.specialMathFunc = function() {
		var curVal:Float = bgParticlesScale.currentValue;
		var particlesEmitter = getVar("particlesEmitter");
		if(particlesEmitter != null){

			for (p in particlesEmitter){
				p.scale.x = curVal;
				p.scale.y = curVal;
			}
		}
	};
	
	threeD.setFloat('dept', 0.5);
	
	setVar("square_posLerp",0.0);
	setResetEvent(function(){
		setVar("square_posLerp",0.0);
	});	
	
	
	
	operator_boxMask.setFloat('xpos', 0.5);
	operator_boxMask.setFloat('ypos', 0.5);
	
	addUpdate(function(elapsed){	
		var square_xPos:Float = Math.sin((((Conductor.instance.songPosition/(Conductor.instance.beatLengthMs*2)) /4))*Math.PI) * 0.1;
		var square_yPos:Float = Math.cos((((Conductor.instance.songPosition/(Conductor.instance.beatLengthMs*4)) /4))*Math.PI) * 0.05;

		square_xPos *= getVar("square_posLerp");
		square_yPos *= getVar("square_posLerp");
		
		//Oh, turns out we didn't need this lol
		//game.camNotes.scroll.x = square_xPos * -FlxG.width *0.5;
		//game.camNotes.scroll.y = square_yPos * -FlxG.height *0.5;
		
		operator_boxMask.setFloat('xpos', 0.5 + square_xPos);
		operator_boxMask.setFloat('ypos', 0.5 + square_yPos);
		
		
		//game.camNotes.x = square_xPos*getVar("square_posLerp") * 1280;
		//game.camNotes.y = square_yPos*getVar("square_posLerp") * 1280;
		
		//threeD.setFloat('xpos', square_xPos*getVar("square_posLerp"));
		//threeD.setFloat('ypos', square_yPos*getVar("square_posLerp"));
	});	
	
	eh.funcTweenModEvent(target1, 132, 16,  ModConstants.getEaseFromString("linear"),  0, 1, function(v) {
		setVar("square_posLerp",v);
	}, "square_posLerp");
	
	eh.funcTweenModEvent(target1, 196, 8,  ModConstants.getEaseFromString("linear"),  1, 0.5, function(v) {
		setVar("square_posLerp",v);
	}, "square_posLerp");
	
	
	
	
	
	/*
	var threeD_posX:CustomModifier = createCustomMod("3d_x", 0.0);
	threeD_posX.modPriority = -9990;
	threeD_posX.strumsMod = false;
    threeD_posX.notesMod = false;
    threeD_posX.holdsMod = false;
    threeD_posX.pathMod = false;
    threeD_posX.specialMod = true;
	threeD_posX.unknown = false;
    threeD_posX.speedMod = false;
	eh.addCustomMod("1", threeD_posX);
	threeD_posX.specialMathFunc = function() {
		threeD.setFloat('xpos', threeD_posX.currentValue);
	};
	var threeD_posY:CustomModifier = createCustomMod("3d_y", 0);
	threeD_posY.modPriority = -9990;
	threeD_posY.strumsMod = false;
    threeD_posY.notesMod = false;
    threeD_posY.holdsMod = false;
    threeD_posY.pathMod = false;
    threeD_posY.specialMod = true;
    threeD_posY.unknown = false;
    threeD_posY.speedMod = false;
	eh.addCustomMod("1", threeD_posY);
	threeD_posY.specialMathFunc = function() {
		threeD.setFloat('ypos', threeD_posY.currentValue);
	};
	var threeD_posZ:CustomModifier = createCustomMod("3d_z", 0.5);
	threeD_posZ.modPriority = -9990;
	threeD_posZ.strumsMod = false;
    threeD_posZ.notesMod = false;
    threeD_posZ.holdsMod = false;
	threeD_posZ.unknown = false;
    threeD_posZ.pathMod = false;
    threeD_posZ.specialMod = true;
    threeD_posZ.speedMod = false;
	eh.addCustomMod("1", threeD_posZ);
	threeD_posZ.specialMathFunc = function() {
		threeD.setFloat('dept', threeD_posZ.currentValue);
	};
	*/
	
	var threeD_rotX:CustomModifier = createCustomMod("3d_rotatex", 0.0);
	threeD_rotX.modPriority = -9990;
	threeD_rotX.strumsMod = false;
    threeD_rotX.notesMod = false;
    threeD_rotX.holdsMod = false;
    threeD_rotX.pathMod = false;
	threeD_rotX.unknown = false;
    threeD_rotX.specialMod = true;
    threeD_rotX.speedMod = false;
	eh.addCustomMod("1", threeD_rotX);
	threeD_rotX.specialMathFunc = function() {
		threeD.setFloat('xrot', threeD_rotX.currentValue);
	};
	var threeD_rotY:CustomModifier = createCustomMod("3d_rotatey", Math.PI);
	threeD_rotY.modPriority = -9990;
	threeD_rotY.strumsMod = false;
    threeD_rotY.notesMod = false;
    threeD_rotY.holdsMod = false;
    threeD_rotY.pathMod = false;
    threeD_rotY.specialMod = true;
	threeD_rotY.unknown = false;
    threeD_rotY.speedMod = false;
	eh.addCustomMod("1", threeD_rotY);
	threeD_rotY.specialMathFunc = function() {
		threeD.setFloat('yrot', threeD_rotY.currentValue);
	};
	var threeD_rotZ:CustomModifier = createCustomMod("3d_rotatez", 0.0);
	threeD_rotZ.modPriority = -9990;
	threeD_rotZ.strumsMod = false;
    threeD_rotZ.notesMod = false;
    threeD_rotZ.holdsMod = false;
    threeD_rotZ.pathMod = false;
    threeD_rotZ.specialMod = true;
	threeD_rotZ.unknown = false;
    threeD_rotZ.speedMod = false;
	eh.addCustomMod("1", threeD_rotZ);
	threeD_rotZ.specialMathFunc = function() {
		threeD.setFloat('zrot', threeD_rotZ.currentValue);
	};
	

	
	]])
	

	
	local function squareSizePulse(when, timeMod)
		add(when,0.1*timeMod, "outExpo", -0.18, "squareSize", "1")
		add(when+0.05,4*timeMod, "outQuint", 0.18, "squareSize", "1")
	end
	
	squareSizePulse(143.5, 0.5)
	squareSizePulse(145, 0.5)
	
	squareSizePulse(175.5, 0.5)
	squareSizePulse(177, 0.5)
	--Kicks!
	for i=68, 196-8, 8  do
		squareSizePulse(i, 1)
		squareSizePulse(i+1.5, 1)
		squareSizePulse(i+3, 1)
		squareSizePulse(i+4, 1)
		--add(i   ,1, "pop", -0.2, "squareSize", "1")
		--add(i+1.5   ,1, "pop", -0.2, "squareSize", "1")
		--add(i+3   ,1, "pop", -0.2, "squareSize", "1")
		--add(i+4   ,1, "pop", -0.2, "squareSize", "1")
		
		add(i   ,1, "pop", -0.2, "tiny", "1")
		add(i+1.5   ,1, "pop", -0.2, "tiny", "1")
		add(i+3   ,1, "pop", -0.2, "tiny", "1")
		add(i+4   ,1, "pop", -0.2, "tiny", "1")
    end
	
	
	
	
	
	--Beats where the particles pulse to the rotate
	local particlePulseBeats = {}
	table.insert(particlePulseBeats,{when=74})
	table.insert(particlePulseBeats,{when=82})
	table.insert(particlePulseBeats,{when=90})
	table.insert(particlePulseBeats,{when=98})
	table.insert(particlePulseBeats,{when=99})
	table.insert(particlePulseBeats,{when=106})
	table.insert(particlePulseBeats,{when=114})
	table.insert(particlePulseBeats,{when=122})
	table.insert(particlePulseBeats,{when=130})
	table.insert(particlePulseBeats,{when=131})
	
	table.insert(particlePulseBeats,{when=138})
	table.insert(particlePulseBeats,{when=82+64})
	table.insert(particlePulseBeats,{when=90+64})
	table.insert(particlePulseBeats,{when=98+64})
	table.insert(particlePulseBeats,{when=99+64})
	table.insert(particlePulseBeats,{when=106+64})
	table.insert(particlePulseBeats,{when=114+64})
	table.insert(particlePulseBeats,{when=122+64})
	table.insert(particlePulseBeats,{when=130+64})
	table.insert(particlePulseBeats,{when=131+64})

	
	
	
	for i, v in pairs(particlePulseBeats) do
		add(v.when - 0.1,0.75, "pop", 0.8, "bgParticlesScale", "1")
		add(v.when - 0.18,1.75, "pop", 0.45, "bgParticlesScale", "1")
		
		add(v.when,1, "outCubic", math.pi, "3d_rotx", "1")
		
		add(v.when,1.2, "pop", 0.3, "3d_rotx", "1") --make it overshoot a little bit
		
		add(v.when,1, "outCubic", 180, "angle--1", "1")
		add(v.when,1, "outCubic", -180, "angle--2", "1")
		--add(v.when, 1, "pop", lazyAlternator and 1 or -1, "tipsy")
		--flipAroo = not flipAroo
    end
	
	
	
	--i think it just spins every 8 beats lol
	local flipAroo = false 
	for i = 68, 196-8, 8 do
		if i == 100 or i ==180 then
			flipAroo = not flipAroo
		end
		add(i,8, "outExpo", flipAroo and 45 or -45, "squareRotation", "1")
		
		flipAroo = not flipAroo
		
		set(i,0.75,"stealth","1")
		ease(i,8, "outExpo", 0, "stealth", "1")
		
		set(i,0.75,"strumstealth","1")
		ease(i,8, "outExpo", 0, "strumstealth", "1")
	end
	
	for i = 196, 257 do
		add(i,1, "linear", 45/4, "squareRotation", "1")
	end
	
	--[[
	add(76,8, "outExpo", -45, "squareRotation", "1")
	add(84,8, "outExpo", 45, "squareRotation", "1")
	add(92,8, "outExpo", -45, "squareRotation", "1")
	add(100,8, "outExpo", 45, "squareRotation", "1")
	add(108,8, "outExpo", -45, "squareRotation", "1")
	]]--
	
	
	
	ease(65,4, "outSine", 0.7, "squareSize", "1")
	ease(257,2, "backIn", -0.5, "squareSize", "1")
	
	
	
	
	--Glitch thing
	add(85,1, "pop", 0.05, "glitch", "1")
	add(95,1, "pop", 0.05, "glitch", "1")
	add(149,1, "pop", 0.05, "glitch", "1")
	add(159,1, "pop", 0.05, "glitch", "1")
	add(187,1, "pop", 0.05, "glitch", "1")
	
	
	
	--roty thing?
	add(75-0.1,1, "pop", 0.4, "3d_roty", "1")
	add(101-0.1,1, "pop", -0.15, "3d_roty", "1")
	add(103-0.1,1, "pop", -0.15, "3d_roty", "1")
	add(104-0.1,1, "pop", -0.15, "3d_roty", "1")
	
	add(64+75-0.1,1, "pop", 0.4, "3d_roty", "1")
	add(64+101-0.1,1, "pop", -0.15, "3d_roty", "1")
	add(64+103-0.1,1, "pop", -0.15, "3d_roty", "1")
	add(64+104-0.1,1, "pop", -0.15, "3d_roty", "1")
end


