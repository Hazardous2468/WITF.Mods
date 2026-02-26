function onCreate()
	notesBehindHUD(true)
end

function setUp()
	centerPlayer("")
	centerOpponent("")
	
	runHaxeCode(
	[[
		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.arrowPathFileName = "19ZZ/arrowPath";
		}
	
		eh.funcModEvent(game.playerStrumline.mods, -8, function() {
			PlayState.instance.comboPopUps.offsets = [480, -50];
		});
	]])
	
end

function haxeShit()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("Constants", "funkin.util")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode([[
	
		var t = game.playerStrumline.mods;
		
		var timeBetweenBeats = Conductor.instance.beatLengthMs / Constants.MS_PER_SEC;
		
		//For making every other cycle reverse
		eh.funcModEvent(t, 131, function() {
			var modValue = 1;
			if(getVar("cycles") % 2 == 1){
				modValue = 0;
			}
			eh.tweenMod(game.playerStrumline.mods, "reverse", modValue, timeBetweenBeats, ModConstants.getEaseFromString("outSine"), "tween");
			game.playerStrumline.mods.setDefaultModVal("reverse", modValue);
			
			eh.tweenMod(game.playerStrumline.mods, "hudreverse", modValue, timeBetweenBeats, ModConstants.getEaseFromString("outSine"), "tween");
			game.playerStrumline.mods.setDefaultModVal("hudreverse", modValue);
		
		});
		
		//Correct itself if we restart!
		eh.funcModEvent(t, -4, function() {
			print("Current Repeat: " + getVar("cycles"));
			
			if(getVar("cycles") == 0){
				eh.tweenMod(game.playerStrumline.mods, "hudreverse", 0, timeBetweenBeats*3, ModConstants.getEaseFromString("inOutSine"), "tween");
				eh.tweenMod(game.playerStrumline.mods, "reverse", 0, timeBetweenBeats*3, ModConstants.getEaseFromString("inOutSine"), "tween");
			}
		});
		
		//starting cycle 2 and onwards, apply alpha mod for the beats lol
		for (i in 4...68){
			eh.funcModEvent(t, i, function() {
				if(getVar("cycles") >= 2){
					eh.tweenMod(game.playerStrumline.mods, "alpha", 1, timeBetweenBeats*0.75, ModConstants.getEaseFromString("pop"), "tween");
				}
			});
		}
		
	
		//Create AFT to capture notesCameras
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
		notesAFT.recursive=true;
		notesAFT.updateAFT();	
		setVar("notesAFT",notesAFT);
		
		var aftSprite = createSpr("aftSprite");
		aftSprite.loadGraphic(getVar("notesAFT").bitmap);
		aftSprite.screenCenter();	
		aftSprite.camera = game.camNotes;
		aftSprite.alpha = 1.0;
		game.remove(game.playerStrumline);
		game.add(game.playerStrumline);
		
		addUpdate(function(elapsed){
			if(aftSprite.alpha > 0 && notesAFT!=null)
				notesAFT.updateAFT();	
		});	
		
		
		var aftControl_Width:CustomModifier = createCustomMod("aftscale", 1.0);
		aftControl_Width.createSubMod("width", 0.005);
		aftControl_Width.createSubMod("height", 0.005);
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
			var width:Float = aftControl_Width.currentValue + aftControl_Width.getSubVal("width");
			var height:Float = aftControl_Width.currentValue + aftControl_Width.getSubVal("height");
			aftSprite.setGraphicSize(Std.int(notesAFT.w * width),  Std.int(notesAFT.h* height));
		};
		
		
		var glitchLines = new FlxRuntimeShader(Assets.getText(Paths.frag("never-ends-never-ends/glitch-lines")), null);
		var glitch2 = new FlxRuntimeShader(Assets.getText(Paths.frag("never-ends-never-ends/glitch2")), null);
		
		
		
		var glitchLines_base = 0.005/2;
		var glitch2_base = 0.03;
				
		glitchLines.setFloat('amount', glitchLines_base);
		glitch2.setFloat('amount', glitch2_base);
		
		addUpdate(function(elapsed){
			var totalTime = getVar("totalTimeElapsed");
			if(totalTime == null || Conductor.instance.songPosition < 0){
				glitch2.setFloat('uTime', Conductor.instance.songPosition);
				glitchLines.setFloat('uTime', Conductor.instance.songPosition);
				
				glitchLines.setFloat('amount',glitchLines_base);
				glitch2.setFloat('amount', glitch2_base);
				
			}else{
			
				glitch2.setFloat('uTime', totalTime);
				glitchLines.setFloat('uTime', totalTime);
				
				glitchLines.setFloat('amount',glitchLines_base + FlxMath.bound(totalTime/8000, 0, 0.0235) );
				glitch2.setFloat('amount', glitch2_base  + FlxMath.bound(totalTime/8000, 0, 0.1));
				
			}
		});	
		
		var cameffects:Array<BitmapFilter>=[];
		if(true){
			cameffects.push(new ShaderFilter(glitch2));
			cameffects.push(new ShaderFilter(glitchLines));
		}
		game.camHUD.filters=(cameffects);
		game.camNotes.filters=(cameffects);
		game.camGame.filters=(cameffects);
			
		
	]])

end


function rBeat(i)
	add(i,1.1, "impulse", 0.8, "arrowpath","bf")
	add(i,1, "impulse", 0.5, "arrowpathwidth","bf")
	add(i,0.25, "impulse", 0.2, "arrowpathwidth","bf")
	
	if i % 2 == 0 then
		add(i,1, "pop", 0.01, "aftscale__width","bf")
	else	
		add(i,1, "pop", 0.01, "aftscale__height","bf")
	end
	
	
	add(i,1, "pop", 1, "scale")
	add(i,1, "bounce", 1, "scale")
	
	add(i,1, "bounce", -0.25, "flip")
	
	add(i,1, "pop", 0.35, "brake")
	
	for l = 0, 3 do
		add(i,1, "bounce", math.random(-180,180)*0.75, "anglex--"..l)
		add(i,1, "bounce", math.random(-180,180)*0.75, "angley--"..l)
		add(i,1, "bounce", math.random(-180,180)*0.75, "anglez--"..l)
	end
	
	if i % 2 == 0 then
		add(i,1, "bounce", 1, "drunk")
		add(i,1, "bounce", 5, "rotz")
	else
		add(i,1, "bounce", -1, "drunk")
		add(i,1, "bounce", -5, "rotz")
	end
end

function modsTimeline()
	haxeShit()
	
	setdefault(0.5, "drawdistance","bf")
	setdefault(1, "3d", "bf")
	setdefault(-112, "z", "bf")
	
	setdefault(0.2, "arrowpathwidth", "bf")
	setdefault(55, "arrowpathgrain", "bf")
	
	setdefault(0, "reverse", "bf")
	setdefault(0, "alpha", "bf")
	
	setdefault(1, "showlanemods", "bf")
	setdefault(400, "debugx", "bf")
	setdefault(-120, "debugy", "bf")

	
	--go away dad
	setdefault(1, "alpha", "dad")
	setdefault(-222, "x", "dad")
	setdefault(1, "debugalpha", "dad")
	setasleep(0, "dad", true)
	setasleep(-8, "dad", true)
	targetExclude("dad")
	
	set(-4, 1, "drunk__timertype")
	set(-4,0.5, "drunk__speed")
	
	
	add(0, 4, "impulse", 3, "waveyz")
	
	add(0, 2, "outCubic", 360, "angley--2")
	add(2, 1, "impulse", 1, "movez--0")
	add(2.5, 1, "impulse", 1, "movez--3")
	add(3, 1, "impulse", 1, "movez--1")

	
	
	
	for i = 4, 4+64-1,1 do
		rBeat(i)
	end
	
	ease(67, 1, "inOutSine", 0.75, "speedmod")
	ease(67, 1, "inOutSine", 0.82, "wave")
	
	ease(120, 4, "inOutSine", 1.0, "speedmod")
	ease(120, 4, "inOutSine", 0.0, "wave")
	
	add(131, 1, "outCubic", -360, "anglex")
	add(128, 2, "outCubic", -360, "anglez")
	
	
	ease(66,2, "linear", 2, "waveyz")
	ease(96,4, "smootherStepInOut", 0, "waveyz")
	
	add(66,2, "linear", 0.82, "drunk")
	ease(66,2, "linear", 0.5, "orient")
	
	ease(128,4, "inOutSmoothStep", 0.0, "orient")
	ease(129,3, "inOutSmoothStep", 0.0, "drunk")
	
	ease(98,1.5, "inOutSmoothStep", 0.9, "drawdistance")
	
	
	for i = 100, 129,1 do
		if i % 8 >= 4 then
			rBeat(i)
		end
	end
end
