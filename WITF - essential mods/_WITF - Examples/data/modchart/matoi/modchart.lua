function onCreate()
	notesBehindHUD(true)
end
local tinyMultFix = 2 --WITF 1.0.0a fix


function setUp()
	invertForDad(false)
	createNewPlayer(true)
	centerPlayer("")
	centerOpponent("")	
	
	createNewPlayer(true)
	createNewPlayer(true)
	createNewPlayer(true)
end



function modsTimeline()

	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode(
	[[

		var target1 = PlayState.instance.playerStrumline.mods;
		
		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.doUpdateClipsInDraw = false;
			strumLine.arrowPathFileName = "matoi/arrowPath";
		
		
			var spinAroundMod:CustomModifier = createCustomMod("spinaround", 0.0);
			spinAroundMod.modPriority = 100;
			spinAroundMod.unknown = false;
			spinAroundMod.strumsMod = true;
			spinAroundMod.notesMod = false;
			spinAroundMod.holdsMod = false;
			spinAroundMod.pathMod = false;
			spinAroundMod.specialMod = false;
			spinAroundMod.speedMod = false;
			strumLine.mods.addCustomMod(spinAroundMod);	
			
			spinAroundMod.createSubMod("offset", 0.0);
			spinAroundMod.createSubMod("timeOffset", 0.25);
			spinAroundMod.createSubMod("speed", 1);
			
			spinAroundMod.strumMathFunc = function(data){
			
				var timmy:Float = Conductor.instance.currentBeatTime / 4 * spinAroundMod.getSubVal("speed");
				var timeoffset:Float = spinAroundMod.getSubVal("timeOffset");

				timmy += timeoffset * (data.direction + spinAroundMod.getSubVal("offset"));

				var _movex:Float = FlxMath.fastCos(timmy * Math.PI);
				var _movez:Float = FlxMath.fastSin(timmy * Math.PI);
				
				data.x += _movex * spinAroundMod.currentValue;
				data.z += _movez * spinAroundMod.currentValue;
				
				
				//data.angleY += 90 + (timmy*90*2);
			}
			
			spinAroundMod.noteMathFunc = function(data){
			
				var timmy:Float = Conductor.instance.currentBeatTime / 4 * spinAroundMod.getSubVal("speed");
				var timeoffset:Float = spinAroundMod.getSubVal("timeOffset");
				timmy += timeoffset * (data.direction + spinAroundMod.getSubVal("offset"));
				//data.angleY += 90 + (timmy*90*2);
			}
		}
		
		
		
		//Create AFT to capture notesCameras
		var aftCapture:HazardAFT = new HazardAFT(game.camNotes);
		aftCapture.recursive=false;
		aftCapture.updateAFT();	
		setVar("aftCapture",aftCapture);
		
		addUpdate(function(elapsed){
		
			//Only update the AFT when needed.
			if(
			(Conductor.instance.currentBeatTime >= 46.0 && Conductor.instance.currentBeatTime < 228) ||
			(Conductor.instance.currentBeatTime >= 290.9 && Conductor.instance.currentBeatTime < 357) ||
			(Conductor.instance.currentBeatTime >= 675.0)
			){
				aftCapture.updateAFT();	
			}
		});	
		
		//Intro sprites
		var spacingX:Float = 112*6;
		var spacingY:Float = 720;
		var howManyX:Int = 9;
		var howManyY:Int = 3;
		var howManyTotal:Int = howManyY*howManyX;
		var introSprites:Array<ZProjectSprite> = [];
		
		eh.funcModEvent(target1, -16, function() {
			game.camNotes.x = 0;
			
		});
		
		eh.funcModEvent(target1, 63.5, function() {
			game.camNotes.x = 5000;
		});
		
		eh.funcModEvent(target1, 63.75, function() {
			game.camNotes.x = 0;
		});
		
		eh.funcModEvent(target1, 64, function() {
			game.camNotes.x = 5000;
		});
		
		
		eh.funcModEvent(target1, 226.5, function() {
			for (s in 0...howManyTotal)
			{
				var newSpr = introSprites[s];
				newSpr.visible = false;

			}
		});
		
		eh.funcModEvent(target1, 227.25, function() {
			game.camNotes.x = 0;
		});
		
		
		var id:Int = 0;
		for (x in 0...howManyX) // x
		{
		  for (y in 0...howManyY) // y
		  {
			var newSpr:ZProjectSprite = new ZProjectSprite(0, 0, aftCapture.bitmap);
			newSpr.moveX = x*spacingX;
			newSpr.moveY =  y*spacingY;
			
			newSpr.moveX -= spacingX * Math.floor(howManyX/2);
			newSpr.moveY -=  spacingY * Math.floor(howManyY/2);
			
			newSpr.camera = PlayState.instance.camAFT;
			
			newSpr.setUp();
			newSpr.moveZ = -112*16;
			newSpr.updateTris();
			
			introSprites.push(newSpr);
			
			id += 1;
			var tag:String = "intro3DSprite - " + id;
			PlayState.instance.customLuaSprites.set(tag, newSpr);
			PlayState.instance.add(newSpr);
			
			eh.funcModEvent(target1, 59+(id*0.25), function() {
				newSpr.visible = true;
			});
			
			
			addResetEvent(function(){		
				newSpr.moveX = x*spacingX;
				newSpr.moveY =  y*spacingY;
				newSpr.angleX = 0;
				newSpr.angleY = 0;
				newSpr.angleZ = 0;
				newSpr.visible = false;
				
				newSpr.moveX -= spacingX * Math.floor(howManyX/2);
				newSpr.moveY -=  spacingY * Math.floor(howManyY/2);
				newSpr.updateTris();
			});
			
			
			eh.funcTweenModEvent(target1, 66+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinX-" + id);
			
			eh.funcTweenModEvent(target1, 66+8+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinX-" + id);
			
			eh.funcTweenModEvent(target1, 66+8+8+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinX-" + id);
			
			eh.funcTweenModEvent(target1, 8+66+8+8+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinX-" + id);
			eh.funcTweenModEvent(target1, 8+8+66+8+8+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinX-" + id);
			
			
			
			eh.funcTweenModEvent(target1, 84+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleY = v;
				newSpr.updateTris(false);
			}, "spriteSpinY-" + id);
			eh.funcTweenModEvent(target1, 9+84+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleY = v;
				newSpr.updateTris(false);
			}, "spriteSpinY-" + id);
			
			
			eh.funcTweenModEvent(target1, 194+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleY = v;
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinY-" + id);
			
			eh.funcTweenModEvent(target1, 8+194+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleY = v;
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinY-" + id);
			
			eh.funcTweenModEvent(target1, 8+8+194+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleY = v;
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinY-" + id);
			
			eh.funcTweenModEvent(target1, 16+8+194+(id*0.75), 6, FlxEase.sineInOut, 0, 360, function(v) {
				newSpr.angleY = v;
				newSpr.angleX = v;
				newSpr.updateTris(false);
			}, "spriteSpinY-" + id);
			
		  }
		}
		
		
		
		
		
		eh.funcTweenModEvent(target1, 164, 228-164, FlxEase.linear, 0, 112*64*1.5, function(v) {
			for (s in 0...howManyTotal)
			{
				var newSpr = introSprites[s];
				
				var x:Int = Math.floor(s / howManyY);
				var y:Int = s % howManyY;
				
				
				newSpr.moveX = x*spacingX;
				newSpr.moveY =  y*spacingY;
				newSpr.moveY -=  spacingY * Math.floor(howManyY/2);
				
				
				newSpr.moveX += v;

				newSpr.moveX = newSpr.moveX % (howManyX*spacingX);
				newSpr.moveX -= spacingX * (Math.floor(howManyX/2)+1);
				
				//newSpr.moveY -=  spacingY * (Math.floor(howManyY/2)+1);

				
				newSpr.updateTris();
			}
		}, "introWallMoveX");
		
		
		
		//Ending panels
		var spacingX:Float = 112*6;
		var spacingY:Float = 466;
		var howManyX:Int = 2;
		var howManyY:Int = 7;
		var howManyTotal:Int = howManyY*howManyX;
		var endSprites:Array<ZProjectSprite> = [];
		
		eh.funcModEvent(target1, 676, function() {
			game.camNotes.x = 5550;
		});
		
		var endingAngleTransitionBlend = 0;
		eh.funcTweenModEvent(target1, 804, 16, FlxEase.linear, 0, 1, function(v) {
			endingAngleTransitionBlend=v;
		}, "endingAngleTransitionBlend");
		
		id = 0;
		for (x in 0...howManyX) // x
		{
		  for (y in 0...howManyY) // y
		  {
			id += 1;
			var idRemember:Float = id;
			var newSpr:ZProjectSprite = new ZProjectSprite(0, 0, aftCapture.bitmap);
			newSpr.moveX = x*spacingX;
			newSpr.moveY =  y*spacingY;
			
			newSpr.moveX += spacingX * -0.5;newSpr.moveX += spacingX * -0.5;
			newSpr.moveY -=  spacingY * Math.floor(howManyY/2);
			
			newSpr.camera = PlayState.instance.camAFT;
			
			newSpr.subdivisions=3;
			newSpr.setUp();
			newSpr.moveZ = -112*4;
			newSpr.updateTris();
			
			endSprites.push(newSpr);
			
			
			var tag:String = "end3DSprite - " + id;
			PlayState.instance.customLuaSprites.set(tag, newSpr);
			PlayState.instance.add(newSpr);
			
			eh.funcModEvent(target1, 676, function() {
				newSpr.visible = true;
			});
			
			
			addResetEvent(function(){		
				newSpr.moveX = x*spacingX;
				newSpr.moveY =  y*spacingY;
				newSpr.angleX = 0;
				newSpr.angleY = 0;
				newSpr.angleZ = 0;
				newSpr.scaleX = 1;
				newSpr.scaleY = 1;
				
				newSpr.alpha = 1;
				
				newSpr.visible = false;
				newSpr.moveX += spacingX * -0.5;
				newSpr.moveY -=  spacingY * Math.floor(howManyY/2);
				newSpr.updateTris();
			});
			
			
			
			eh.funcTweenModEvent(target1, 676, 996-676, FlxEase.sineInOut, 0, 996-676, function(v) {
			
				var t = v+(idRemember*33.3333);
				var t = v+(idRemember*33.3333);
				newSpr.angleZ = FlxMath.fastSin(t *Math.PI * 0.25) * 10;
				
			}, "endWallAngleZ-"+id);
			
			eh.funcTweenModEvent(target1, 676, 996-676, FlxEase.linear, 0, 112*256, function(v) {
			
				newSpr.moveY =  y*spacingY;
				
				newSpr.moveY += v;
				
				
				
				newSpr.moveY = newSpr.moveY % (howManyY*spacingY);
				
				newSpr.moveY -=  spacingY * Math.floor(howManyY/2);
				
				if(x % 2 == 0){
					newSpr.moveY += spacingY/2;
				}
				
				newSpr.updateTris();
				
			}, "endWallMoveY-"+id);
			
			
			
			for (b in 740...804){
				if(b % 2 == 0){
					if(id % 2 == 0){
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 0, 180, function(v) {
							newSpr.angleY = v;
						}, "endWallAngleY-"+id);
						
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 1, 0.25, function(v) {
							newSpr.scaleX = v;
							newSpr.scaleY = v;
						}, "endWallScale-"+id);
						
					}else{
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 180, 360, function(v) {
							newSpr.angleY = v;
						}, "endWallAngleY-"+id);
						
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 0.25,1, function(v) {
							newSpr.scaleX = v;
							newSpr.scaleY = v;
						}, "endWallScale-"+id);
					}
				}else{
				
					if(id % 2 == 0){
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 180, 360, function(v) {
							newSpr.angleY = v;
						}, "endWallAngleY-"+id);
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 0.25, 1, function(v) {
							newSpr.scaleX = v;
							newSpr.scaleY = v;
						}, "endWallScale-"+id);
					}else{
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 0, 180, function(v) {
							newSpr.angleY = v;
						}, "endWallAngleY-"+id);
						eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 1, 0.25, function(v) {
							newSpr.scaleX = v;
							newSpr.scaleY = v;
						}, "endWallScale-"+id);
					}
				}
			}
			
			if(id % 2 == 1){
				eh.funcTweenModEvent(target1, 804+0.5, 1,  FlxEase.expoOut, 180, 360, function(v) {
					newSpr.angleY = v;
				}, "endWallAngleY-"+id);
			}
			
			
			
			eh.funcTweenModEvent(target1, 964-4, 8,  ModConstants.getEaseFromString("cubeInOut"), 1, 0, function(v) {
				newSpr.alpha = v;
			}, "endWallFadeAway-"+id);
			
			
			
			for (b in 804...804+64)
			{

				if(b % 2 == 0){
						if(id % 2 == 0){							
							eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 1, 0.5, function(v) {
								newSpr.scaleX = v;
								newSpr.scaleY = v;
							}, "endWallScale-"+id);
							
						}else{						
							eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 0.5,1, function(v) {
								newSpr.scaleX = v;
								newSpr.scaleY = v;
							}, "endWallScale-"+id);
						}
					}else{
						if(id % 2 == 0){
							eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 0.5, 1, function(v) {
								newSpr.scaleX = v;
								newSpr.scaleY = v;
							}, "endWallScale-"+id);
						}else{
							eh.funcTweenModEvent(target1, b+0.5, 1,  FlxEase.expoOut, 1, 0.5, function(v) {
								newSpr.scaleX = v;
								newSpr.scaleY = v;
							}, "endWallScale-"+id);
						}
					}
			}
			
			
			

			if(!(PlayState.instance.currentDifficulty.toLowerCase() == "easy" || PlayState.instance.currentDifficulty.toLowerCase() == "normal")){
				for (b in 804...1000)
				{
				
					var tim:Float = 5;
					if(b>=868-4){
						tim = 8;
					}
				
					if(b % 8 == 0){
						eh.funcTweenModEvent(target1, b+(id*2) - 3, tim, FlxEase.sineInOut, 0, 360, function(v) {
							newSpr.angleY = v;
						}, "endWallAngleY-"+id);
					}
				}
			}

		  }
		}
		
		
		
		
		eh.funcModEvent(target1, 420, function() {
			game.zSortMod_SustainOffset = -111111; //KEEP THEM AT THE FAR BACK
		});
		
		
		addResetEvent(function(){		
			game.zSortMod_SustainOffset = -1;
		});
		
		
		var finalBlackFadeOut:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		finalBlackFadeOut.alpha=0.0;
		finalBlackFadeOut.camera = game.camAFT;
		game.customLuaSprites.set("finalBlackFadeOut", finalBlackFadeOut);
		PlayState.instance.add(finalBlackFadeOut);
		
		eh.funcTweenModEvent(target1, 972, 16, FlxEase.expoIn, 0, 1, function(v) {
			finalBlackFadeOut.alpha=v;
		}, "finalBlackFadeOut");
		
		addResetEvent(function(){		
			finalBlackFadeOut.alpha=0.0;
		});
		

	]])
	

	--fix for the change in 1.0
	setdefault(1/2, "drunk__mult")
	
	
	local debugspacing = 112*2

	tween(-4, 5,"sineInOut", debugspacing*2*-1, "debugx", "4")
	tween(-4, 5,"sineInOut", debugspacing*-1, "debugx", "3")
	tween(-4, 5,"sineInOut", debugspacing, "debugx", "5")
	tween(-4, 5,"sineInOut", debugspacing*2, "debugx", "6")

	set(0, 1, "reverse","4")
	set(0, 1, "reverse","6")
	
	set(0, -6, "drunk","3")
	set(0, -6, "drunk","4")
	set(0, 6, "drunk","5")
	set(0, 6, "drunk","6")
	
	set(0, 0.7, "tantipsy__speed","3")
	set(0, 0.8, "tantipsy__speed","4")
	set(0, 0.9, "tantipsy__speed","5")
	set(0, 0.678, "tantipsy__speed","6")
	
	for plr = 3, 3+3 do
	
		tween(16, 6,"sineOut", 0, "alpha", plr)
	

		setasleep(46, plr, true)
		set(0, 1, "alpha",plr)
		set(0, plr*9469, "tantipsy__desync",plr)
		set(0, 2, "tantipsy",plr)
		
		set(0, 4, "waveyZ",plr)
		
		
		set(0, -112*8, "z",plr)
		
		set(0, 0.47*tinyMultFix, "tiny",plr)
		tween(16, 4,"linear", 0, "tiny", plr)
		
		
		
		set(0, plr, "drunk__desync",plr)
		
		set(0, -2, "flip",plr)
		
		
		
		for l = 0, 3 do
		
			set(0, -112*5 + (math.random(-112*3,112)), "z--"..l,plr)
		
			set(0, math.random(-20,10)/10, "moveyd--"..l,plr)
			
			local otherWay = 1
			if math.random(0,50) > 25 then
				otherWay = -1
			end
			
			set(0, math.random(35,50)*otherWay, "confusion--"..l,plr)
			set(0, math.random(-180,180), "angle--"..l,plr)
		end
		
		reset(46,plr)
	end
	
	
	
	for c = 0, 3 do
		for i = 5, 59.25, 0.25 do
			--Flicker Chance
			if math.random(0,100) < 11 then
				set(i, -1, "alpha--"..c, "bf")
				set(i+0.1, 0, "alpha--"..c, "bf")
				
				set(i, math.random(0,100)/100, "reverse--"..c, "bf")
				set(i+0.1, 0, "reverse--"..c, "bf")
				
				set(i, math.random(-50,150)/100, "flip--"..c, "bf")
				set(i+0.1, 0, "reverse--"..c, "bf")
			end
		end
	end
	
	set(0.1,0, "alpha--3","bf")
	set(0.025,-1, "alpha--3","bf")
	
	set(0.08, -1, "alpha--2","bf")
	set(0.11, 0, "alpha--2","bf")
	
	set(0.08, 1, "reverse--2","bf")
	set(0.11, 0, "reverse--2","bf")
	
	set(0.24, -1, "alpha--0","bf")
	set(0.4, 0, "alpha--0","bf")
	
	set(0.08, 0.5, "reverse--1","bf")
	set(0.11, 0, "reverse--1","bf")
	
	set(0.5, 0.5, "reverse--1","bf")
	set(0.6, 0, "reverse--1","bf")
	set(0.5, -1, "alpha--1","bf")
	set(0.6, 0, "alpha--1","bf")
	
	set(1.24, -0.5, "alpha--1","bf")
	set(1.3, 0, "alpha--1","bf")
	
	
	
	set(1.5, 0.4, "reverse--3","bf")
	set(1.6, 0, "reverse--3","bf")
	set(1.5, -1, "alpha--3","bf")
	set(1.6, 0, "alpha--3","bf")
	set(1.5, -1*tinyMultFix, "tiny--3","bf")
	set(1.6, 0, "tiny--3","bf")
	
	set(2.0, -1, "alpha--0","bf")
	set(2.15, 0, "alpha--0","bf")
	tween(2.0, 0.16,"pop", -14, "angle--0", "bf")
	
	
	set(2.6, -0.3, "alpha--3","bf")
	set(2.7, 0, "alpha--3","bf")
	
	set(2.9, -1, "alpha--1","bf")
	set(3.1, 0, "alpha--1","bf")
	set(2.82, -1, "alpha--0","bf")
	set(3.08, 0, "alpha--0","bf")
	
	set(3.24, -1, "alpha--2","bf")
	set(3.258, 0.5, "reverse--2","bf")
	set(3.42, 0, "alpha--2","bf")
	set(3.4, 0.0, "reverse--2","bf")
	
	set(3.74, -1, "alpha--1","bf")
	set(3.74+0.19, 0, "alpha--1","bf")
	set(3.74, 1, "reverse--1","bf")
	set(3.74+0.19, 0, "reverse--1","bf")
	
	set(4, -1, "alpha--3","bf")
	set(4+0.19, 0, "alpha--3","bf")
	set(4, -1, "alpha--0","bf")
	set(4+0.19, 0, "alpha--0","bf")
	
	
	set(14, 0, "alpha","dad")
	set(14, 0, "x","dad")
	set(15.9, 1, "alpha","dad")
	set(0, 360*3, "confusion","dad")
	
	
	
	reset(59.5)
	set(59.5, -4, "tipsy","bf")
	tween(59.6, 1.5,"outCubic", 0, "tipsy", "bf")
	
	set(59.5, 1, "alpha","bf")
	tween(59.6, 1,"linear", 0, "alpha", "bf")
	
	set(59.5, 1, "3d","bf")
	set(64, 0, "3d","bf")
	set(59.5, 90, "rotatex","bf")
	set(59.5, 90, "anglex","bf")
	tween(59.55, 2.5,"outCubic", 0, "anglex", "bf")
	tween(59.55, 2.5,"outCubic", 0, "rotatex", "bf")
	
	
	set(-8, 1, "alpha","bf")
	set(0, 1, "alpha","bf")

	setdefault( -4000, "debugoffsetx","dad")
	setdefault( 1, "alpha","dad")
	setdefault( -400, "x","dad")
	
	tween(67, 1,"expoOut", 1, "beat")
	
	setasleep(60, "2", true)
	setasleep(114, "3", false)
	setasleep(227.12, "3", true)

	
	set(-1, 1, "alpha","3") 
	set(116, 0, "alpha","3") 

	setdefault( 0, "noteskewx")
	--tween(1.5, 4,"sineInOut",45, "noteskewx")
	

	
	set(60, 1, "sudden")
	set(60, 100, "sudden__offset")
	
	
	setdefault(1, 'arrowpathgreen')
	setdefault(1, 'arrowpathred')
	setdefault(1, 'arrowpathblue')
	
	setdefault(1, 'stealthglowgreen')
	setdefault(1, 'stealthglowblue')
	setdefault(1, 'stealthglowred')
	
	setdefault(0, 'movex--0')
	setdefault(0, 'movex--1')
	setdefault(0, 'movex--2')
	setdefault(0, 'movex--3')
	setdefault(0, 'movez--0')
	setdefault(0, 'movez--1')
	setdefault(0, 'movez--2')
	setdefault(0, 'movez--3')
	setdefault(0, 'zsort')
	
	tween(116, 16,"sineInOut",0.125, "centered") --stop clipping at the bottom :(
	tween(116, 16,"sineInOut",0.5, "flip")
	set(132, 1, "zsort")
	
	tween(116, 16,"sineInOut", 0, "sudden__offset")
	
	tween(227, 1,"outBack",0, "flip")
	tween(226, 3,"sineInOut",0.0, "centered") 
	
	set(96, 950,  "mathcutoff")
	
	set(116, 12,  "drunk__speed")
	tween(116, 1,"cubeOut",2.0, "drunk") 
	
	tween(131, 2,"sineInOut",0.0, "drunk") 
	set(131+3, 1,  "drunk__speed")
	
	
	tween(116, 16, "sineInOut", 112.0*2, "spinaround","1") 
	set(114, 4, "spinaround__offset","3")
	tween(116, 16, "sineInOut", 112.0*2, "spinaround","3") 
	
	
	add(178-0.5, 2, "sineInOut", 360, "angle") 
	add(194-0.5, 2, "sineInOut", 360, "angle") 
	add(195.1, 2.5, "sineInOut", 0.5, "bumpyangle") 
	add(224, 2.5, "sineInOut", -0.5, "bumpyangle") 
	
	
	
	tween(226.5, 0.5, "sineInOut", 0, "spinaround","1") 
	tween(226.5, 0.5, "sineInOut", 0, "spinaround","3") 
	
	
	for i =164, 223, 1 do
		add(i, 1,"bounce",-0.23*tinyMultFix, "tiny") 
		add(i, 1,"bounce",-0.2, "lineary") 
	end
	
	
	
	set(228, 1, "spiralholds")
	
	
	setdefault({1,"spiralx__altcurpos",1,"spiraly__altcurpos",1,"spiralz__altcurpos"})
	
	set(227, 0.0091*1.5, "spiralx__mult")
	set(227, 0.01, "spiraly__mult")
	set(227, 0.0115, "spiralz__mult")
	
	tween(227, 2,"expoOut", 2.5*1.7, "drawdistance")
	
	--set(228,3350, "sudden__offset")
	tween(227.5, 4,"linear", 3350, "sudden__offset")
	tween(228, 1,"expoOut", 1, "sudden")
	
	tween(227, 2,"sineInOut", 0.015*100, "spiralx")
	tween(227, 2,"sineInOut", 0.019*100, "spiraly")
	tween(227, 2,"sineInOut", 0.007*100, "spiralz")
	
	set(226.9, 1, "alpha","3")
	set(226.9, 999, "movex","3")
	
	
	set(227.2, 0, 'movex--0')
	set(227.2, 0, 'movex--1')
	set(227.2, 0, 'movex--2')
	set(227.2, 0, 'movex--3')
	set(227.2, 0, 'movez--0')
	set(227.2, 0, 'movez--1')
	set(227.2, 0, 'movez--2')
	set(227.2, 0, 'movez--3')
	
	set(228, 0, "zsort") --Don't enable it so note direction is always above sustains!
	
	
	--tween(228, 1,"expoOut",-0.1, "lineary")
	
	tween(226, 2,"sineInOut", 0.48, "speedmod")
	
	tween(226, 4,"sineInOut", 0.48, "drunk")
	
	--set(226, 1, "spiralpaths")
	--tween(226, 2,"sineInOut", 5500, "arrowpathlength")
	--tween(226, 2,"sineInOut", 0.2, "arrowpath")
	--tween(226, 2,"sineInOut", 0, "arrowpathbacklength")
	
	

	
	add(224, 4, "bounce", 0.57, "brake")
	add(224, 4, "bounce", 200, "sudden__offset")
	
	
	--set(226,1, "arrowpath_notitg","bf") --DO NOT ENABLE THIS WITH ROTATION Y ENABLED! WORST MISTAKE OF MY LIFE!
	
	for i = 228, 228+64-4, 4 do
		add(i, 2,"bounce", -0.05, "dizzy")
		add(i+2, 2,"bounce", 0.05, "dizzy")
	end
	
	
	tween(228, 8,"smoothStepInOut",-7, "movez")
	tween(228, 8,"smoothStepInOut",-7*112, "rotatey__offset_z")
	tween(228, 8,"smoothStepInOut",-7*112, "rotatey--1__offset_z")
	tween(228, 8,"smoothStepInOut",-7*112, "rotatey--2__offset_z")
	tween(228, 8,"smoothStepInOut",-7*112, "rotatey--3__offset_z")
	tween(228, 8,"smoothStepInOut",-7*112, "rotatey--0__offset_z")
	
	--tween(228, 1,"smoothStepInOut", -7*112, "rotatey--0__offset_z")
	--tween(228, 1,"smoothStepInOut", -7*112, "rotatey--1__offset_z")
	--tween(228, 1,"smoothStepInOut", -7*112, "rotatey--2__offset_z")
	--tween(228, 1,"smoothStepInOut", -7*112, "rotatey--3__offset_z")
	
	tween(228, 64,"smoothStepInOut", 360*11, "rotatey--0")
	tween(228, 64,"smoothStepInOut", 360*11*-1, "rotatey--1")
	tween(228, 64,"smoothStepInOut", 360*11*-1, "rotatey--2")
	tween(228, 64,"smoothStepInOut", 360*11, "rotatey--3")

	
	for i = 228, 228+64-1 do
		add(i, 0.5,"pop", 0.01, "speedmod")
		add(i, 0.5,"pop", 0.1, "drunk")
		add(i, 0.5,"pop", 0.1, "tipsy")
		
		add(i, 0.5,"pop", -0.1*tinyMultFix, "tiny")
		
		--add(i, 0.5,"pop", 0.5, "arrowpath", "bf")
	end
	
	
	
	reset(291)
	set(291.01,0.61, "drawsize")
	
	for plr = 3, 3+3 do
		set(292,160, "grain",plr)
		setasleep(291, plr, false)
		reset(356,plr)
		setasleep(356.5, plr, true)
		set(291, 0.75, "alpha", plr)
		
		
		set(291, -1.5, "flip", plr)
		
		for i = 292, 292+64-1, 1 do
			add(i, 1,"bounce", 0.25, "flip",plr)
		end
		
		if plr % 2 == 0 then
			set(291, -2, "lineary", plr)
		end
		set(291, 1.5, "tornado", plr)
		set(291, 1.5, "dizzy", plr)
		
		
		
		local z = (plr*-2) +4
		
		set(291, z, "movez", plr)
		set(291,z*112, "rotatex__offset_z", plr)
		
		tween(354, 1, "quadInOut", 1, "alpha", plr)
		
		for i = 292, 292+64-4, 4 do
			local offset = (plr-3)*0.5
			add(i -0.5 + offset, 4,"bounce", 1.5, "centered", plr)
			
			add(i-1, 1,"bounce", 2, "dark",plr)
		end
		
	end
	set(291.01, 1, "zsort", "bf")
	set(300, 1, "zsort", "bf")
	set(320, 1, "zsort", "bf")
	set(356, 0, "zsort", "bf")
	
	
	
	tween(291, 1,"smoothStepInOut", 1, "tornado","bf")
	tween(291, 48,"smoothStepInOut", 0.5, "bumpyangle","bf")
	tween(291, 1,"quadInOut", -0.25, "lineary","bf")
	if downScroll then
		tween(291, 1,"quadInOut", 0.5, "bouncey","bf")
	else
		tween(291, 1,"quadInOut", -0.5, "bouncey","bf")
	end
	
	set(291,1.5, "bumpy__mult","bf")
	tween(291, 1,"quadInOut", 2, "bumpy","bf")

	
	tween(355, 2,"quadInOut",-2, "beat")
	tween(355, 2,"quadInOut",0.5, "invert","bf")
	
	for i = 292, 292+64-2, 2 do
		tween(i, 1,"bounce", 1, "invert","bf")
		tween(i+1, 1,"bounce", 1, "flip","bf")
	end
	
	for i = 292, 292+64-1, 1 do
		add(i, 1,"bounce", -0.2, "centered","bf")
	end
	for i = 292, 292+64-4, 4 do
		add(i-1, 1,"smoothStepInOut", 180, "rotatex")
		
		add(i-1, 1,"bounce", 2, "stealth")
	end
	
	
	
	
	--err idk
	ease(355,3, "sineInOut", 0, "bumpyangle")
	
	
	for i = 356, 356+64-1, 1 do
		add(i, 1, "bounce", -0.4*tinyMultFix, "tiny")
		if i % 2 == 0 then
			add(i, 1, "pop", 0.4, "tipsy")
			add(i, 1, "pop", 12, "anglez")
		else
			add(i, 1, "pop", -0.4, "tipsy")
			add(i, 1, "pop", -12, "anglez")
		end
		
	end
	
	for i = 356, 356+64-4, 4 do
		add(i, 2,"bounce", 1.5, "movex")
		add(i+2, 2,"bounce", -1.5, "movex")
	end
	
	for i = 388, 356+64-2, 2 do
		add(i, 1,"smoothStepOut", 180, "blacksphere")
		add(i+1, 1,"smoothStepOut", 180, "blacksphere")
	end
	
	ease(354,2, "sineInOut", 1, "oldWave")
	ease(420,4, "sineInOut", 0, "oldWave")
	
	ease(354,2, "sineInOut", -2, "movez")
	
	ease(354,2, "sineInOut", -2*112, "rotatey__offset_z")

	
	
	

	--420 funny
	--ease(420,1, "linear", 0, "blacksphere")
	ease(420,1, "linear", 0, "invert")
	ease(420,1, "linear", 0, "lineary")
	ease(420,1, "linear", 0, "bumpy")
	ease(420,1, "linear", 0, "bumpyangle")
	ease(420,1, "linear", 0, "bouncey")
	ease(420,1, "linear", 0, "tornado")
	
	ease(420,1, "linear", 1, "drawdistance")
	
	
	
	runHaxeCode(
	[[

	var target1 = PlayState.instance.playerStrumline.mods;

	
	
	
	for (strumLine in PlayState.instance.allStrumLines)
	{
		var separateMod:CustomModifier = createCustomMod("separate", 0.0);
		separateMod.modPriority = -100;
		separateMod.unknown = false;
		separateMod.strumsMod = true;
		separateMod.notesMod = false;
		separateMod.holdsMod = false;
		separateMod.pathMod = false;
		separateMod.specialMod = false;
		separateMod.speedMod = false;
		strumLine.mods.addCustomMod(separateMod);	
		
		separateMod.strumMathFunc = function(data){
			var _movex:Float = -2;
			if(data.direction > 1){_movex*=-1;}
			data.x += _movex * separateMod.currentValue * 112;
		}
	}

	
	]])
	
	
	
	
	
	ease(420,2, "backInOut", 1, "separate", "3")
	ease(423,2, "backInOut", 1, "separate", "4")
	add(423,2, "backInOut", 1, "separate", "3")
	
	add(426,2, "sineInOut", 360, "rotatey")
	add(426,2, "backInOut", -1, "separate", "4")
	add(426,2, "backInOut", -1, "separate", "3")
	
	add(428,2, "backInOut", 1, "separate", "4")
	add(428,2, "backInOut", 1, "separate", "3")
	
	add(431,2, "backInOut", 1, "separate", "5")
	add(431,2, "backInOut", 1, "separate", "4")
	add(431,2, "backInOut", 1, "separate", "3")
	
	add(434,2, "sineInOut", 360, "rotatey")
	add(434,2, "backInOut", -1, "separate", "5")
	add(434,2, "backInOut", -2, "separate", "4")
	add(434,2, "backInOut", -2, "separate", "3")
	
	add(436,2, "backInOut", 1, "separate", "5")
	add(436,2, "backInOut", 1, "separate", "4")
	add(436,2, "backInOut", 1, "separate", "3")
	
	add(439,2, "backInOut", 1, "separate", "6")
	add(439,2, "backInOut", 1, "separate", "4")
	add(439,2, "backInOut", 1, "separate", "5")
	add(439,2, "backInOut", 1, "separate", "3")
	
	add(442,2, "sineInOut", 360, "rotatey")
	add(442,2, "backInOut", -2, "separate", "5")
	add(442,2, "backInOut", -2, "separate", "4")
	add(442,2, "backInOut", -1, "separate", "6")
	add(442,2, "backInOut", -2, "separate", "3")
	
	
	
	add(444,2, "backInOut", 1, "separate", "4")
	add(444,2, "backInOut", 1, "separate", "5")
	add(444,2, "backInOut", 1, "separate", "3")
	
	add(447,2, "backInOut", 1, "separate", "6")
	add(447,2, "backInOut", 1, "separate", "4")
	add(447,2, "backInOut", 1, "separate", "5")
	add(447,2, "backInOut", 1, "separate", "3")
	
	add(450,2, "sineInOut", 360, "rotatey")
	add(450,2, "backInOut", -2, "separate", "5")
	add(450,2, "backInOut", -2, "separate", "4")
	add(450,2, "backInOut", -1, "separate", "6")
	add(450,2, "backInOut", -2, "separate", "3")
	
	
	
	ease(451,2, "backInOut", 1, "reverse", "3")
	ease(451,2, "backInOut", 1.25, "moveyd", "3")
	ease(451,2, "backInOut", 1, "reverse", "6")
	ease(451,2, "backInOut", 1.25, "moveyd", "6")
	
	ease(482.5,0.6, "backInOut", -1.25, "moveyd", "6")
	ease(482.5,0.6, "backInOut", -1.25, "moveyd", "3")
	ease(482.5,0.6, "backInOut", 0, "reverse", "6")
	ease(482.5,0.6, "backInOut", 0, "reverse", "3")
	
	
	for i = 451.5, 478,8 do
	
		
			add(i,2, "backInOut", 1, "separate", "4")
			add(i,2, "backInOut", 1, "separate", "5")
			add(i,2, "backInOut", 1, "separate", "3")
			
			add(i+3,2, "backInOut", 1, "separate", "6")
			add(i+3,2, "backInOut", 1, "separate", "4")
			add(i+3,2, "backInOut", 1, "separate", "5")
			add(i+3,2, "backInOut", 1, "separate", "3")
			
			
		if i+6 > 478 then
		
		else
			add(i+6,2, "sineInOut", 360, "rotatey")
			add(i+6,2, "backInOut", -2, "separate", "5")
			add(i+6,2, "backInOut", -2, "separate", "4")
			add(i+6,2, "backInOut", -1, "separate", "6")
			add(i+6,2, "backInOut", -2, "separate", "3")
		end
	end
	
	
	
	--Active all the other players!
	for plr = 3, 3+3 do
		set(419,0, "centered",plr)
		set(419.25,0, "centered",plr)
		setdefault(1, "alpha", plr)
		setasleep(419, plr, false)
		setasleep(548, plr, true)
		
		set(419,-2, "beat",plr)
		set(419,-2, "movez",plr)
		set(419,-2*112, "rotatey__offset_z",plr)
		
		
		ease(420,1, "linear", 0, "alpha",plr)
		ease(547,1, "linear", 1, "alpha",plr)

		ease(480,4, "sineInOut", 6-plr, "separate", plr)
		
		
		
		ease(483,1, "sineInOut", 0.4, "spiralz", plr)
		
		if plr % 2 == 1 then
			ease(483,4, "sineInOut", 1, "reverse--0", plr)
			ease(483,4, "sineInOut", 1.25*2, "moveyd--0", plr)
			ease(483,4, "sineInOut", 1, "reverse--1", plr)
			ease(483,4, "sineInOut", 1.25*2, "moveyd--1", plr)
			ease(483,4, "sineInOut", 0, "reverse--2", plr)
			ease(483,4, "sineInOut", 0, "moveyd--2", plr)
			ease(483,4, "sineInOut", 0, "reverse--3", plr)
			ease(483,4, "sineInOut", 0, "moveyd--3", plr)
			
			add(482,64, "sineInOut", 360*8*-1, "rotatey", plr)
		else
			ease(483,4, "sineInOut", 0, "reverse--0", plr)
			ease(483,4, "sineInOut", 0, "moveyd--0", plr)
			ease(483,4, "sineInOut", 0, "reverse--1", plr)
			ease(483,4, "sineInOut", 0, "moveyd--1", plr)
			ease(483,4, "sineInOut", 1, "reverse--2", plr)
			ease(483,4, "sineInOut", 1.25*2, "moveyd--2", plr)
			ease(483,4, "sineInOut", 1, "reverse--3", plr)
			ease(483,4, "sineInOut", 1.25*2, "moveyd--3", plr)
			
			add(482,64, "sineInOut", 360*8, "rotatey", plr)
		end
		
		add(547,1, "sineInOut", 360*2, "angle", plr)
	end
	
	--set(420,1, "3d")
	set(420,1, "zsort")
	set(484,1, "zsort")
	set(483.98,0, "zsort")
	
	
	for i = 484, 546 do
		add(i, 1, "bounce", -1*tinyMultFix, "tiny")
		
		if i % 2 == 0 then
			add(i, 0.5, "pop",22, "anglez")
		else
			add(i, 0.5, "pop", -22, "anglez")
		end
	end
	
	local function revealMe(when, plr)
		ease(when, 1, "quadOut", 0, "stealth", plr)
		ease(when, 1, "quadOut", 0, "strumstealth", plr)
	end
	local function hideMe(when, plr)
		ease(when, 3.5, "sineIn", 1, "stealth", plr)
		ease(when, 3.5, "sineIn", 1, "strumstealth", plr)
	end
	hideMe(483, 5)
	revealMe(491,5)
	
	hideMe(491, 6)
	revealMe(495,6)
	
	hideMe(495, 3)
	revealMe(499,3)
	
	hideMe(499, 4)
	revealMe(499+8,4)
	
	hideMe(499+8, 6)
	revealMe(499+8+4,6)
	
	hideMe(511, 5)
	revealMe(515,5)
	
	hideMe(515,6)
	revealMe(515+8,6)
	
	hideMe(523,3)
	revealMe(527,3)
	
	hideMe(527,4)
	revealMe(531,4)
	
	hideMe(531,5)
	revealMe(531+8,5)
	
	hideMe(531+8,6)
	revealMe(531+4+8,6)
	
	hideMe(543,3)
	hideMe(543,5)
	hideMe(543,4)
	
	
	ease(483-16,16, "sineInOut", 1, "stealth", 1)
	ease(483-16,16, "sineInOut", 1, "strumstealth", 1)
	
	ease(547,1, "sineInOut", 0, "stealth", 1)
	ease(547,1, "sineInOut", 0, "strumstealth", 1)
	
	
	
	ease(420,32, "linear", -6, "movez")
	ease(420,32, "linear", -6*112, "rotatey__offset_z")

	ease(420,16, "linear", -1.25, "moveyd")
	ease(547,1, "linear", 0, "moveyd")
	
	ease(420,4, "sineInOut", 0.6, "orient")
	ease(420,4, "sineInOut", -2, "drunk")
	
	set(227, 1050*4, "mathcutoff")
	set(420, 1000, "mathcutoff")
	set(483.45, 1300, "mathcutoff")
	

	
	ease(420,4, "sineInOut", -0.1*100, "spiralz")
	
	
	set(547, 0, "rotatex")
	ease(547,1, "sineInOut", 0.0, "spiralz")
	set(547, 0, "mathcutoff")
	set(547, 2500, "sudden__offset")
	set(547, -125, "hidden__offset")


	ease(572,7, "sineInOut", 1, "hidden")
	ease(547,1, "sineInOut", 1, "sudden")
	
	ease(643.5,1.6, "sineInOut", 1, "dark")
	ease(672,2, "sineInOut", 0, "dark")
	
	
	ease(547,1, "sineInOut", 400, "debugx")
	
	ease(643.5,1.6, "sineInOut", -1, "alphasplash")
	ease(672,2, "sineInOut", 0, "alphasplash")
	ease(643.5,1.6, "sineInOut", -1, "alphaholdcover")
	ease(672,2, "sineInOut", 0, "alphaholdcover")
	
	
	ease(547,1, "sineInOut", -0.9, "tipsy")
	
	ease(547,1, "sineInOut", -1, "drawdistanceback")
	ease(547,1, "sineInOut", 1.9+1.4, "drawdistance")
	
	ease(547,1, "sineInOut", -3, "movez")
	ease(547,1, "sineInOut", -3*112, "rotatey__offset_z")
	ease(547,1, "sineInOut", 0.05, "circz")
	ease(547,1, "sineInOut", 0.34, "circy")
	ease(547,1, "sineInOut", 0.0, "orient")
	
	ease(547,1, "sineInOut",1.0, "beatangle--0")
	ease(547,1, "sineInOut",-1.0, "beatangle--1")
	ease(547,1, "sineInOut",1.0, "beatangle--2")
	ease(547,1, "sineInOut",-1.0, "beatangle--3")
	
	
	ease(612,1, "sineInOut",0.4, "stealth")
	ease(672,2, "sineInOut",0.0, "stealth")
	
	for i = 548, 548 + 128-1, 1 do
		ease(i,1, "bounce",-1.0*tinyMultFix, "tiny")
	end
	
	for i = 548, 548 + 128-4, 4 do
		ease(i,0.5, "inOutCubic",1, "invert")
		ease(i+2,0.5, "inOutCubic",0, "invert")
	end
	
	
	
	set(547, 0.01,"spiraly__mult")
	ease(547,1, "sineInOut", 0.004*100, "spiraly")
	
	
	ease(586,4, "sineInOut", 1.0, "tornado")
	
	set(547, 1,"zsort")
	set(547, 0.01,"spiralx__mult")
	ease(547,1, "sineInOut", -0.0023*100, "spiralx")
	
	ease(547,1, "sineInOut", 2/2, "drunk__mult")
	ease(547,1, "sineInOut", -1, "drunk")
	
	
	ease(547,1, "sineInOut", 0.75, "alphahold")
	
	for i = 675, 676-0.5, 0.5 do
		ease(i,0.1, "outExpo", 1.0, "drunk")
		ease(i+0.25,0.1, "outExpo", -1.0, "drunk")
		
		add(i,0.1, "outExpo", 90, "angle")
		add(i+0.25,0.1, "outExpo", 90, "angle")
	end
	
	
	
	
	reset(676)
	setasleep(676, "3", false)
	set(676, 0, "alpha", "3")
	set(676, 1, "stealth", "3")
	set(676, 1, "dark", "3")
	set(676, 1, "reverse", "3")
	
	set(676.01, 0.0, "arrowpath","3")
	set(676.01, 0.2, "arrowpath","bf")
	set(676.01, 0.2, "arrowpathwidth")
	set(676.01, 825, "arrowpathlength")
	set(676.01, 0, "arrowpathbacklength")
	
	ease(739, 1, "quadInOut", 0.0, "arrowpath")
	
	local lazyAlternator = false
	for i = 699, 704+32+8,8 do

		local lol = (i ~= 739)

	
		
		lazyAlternator = not lazyAlternator
		if lazyAlternator then
			ease(i, 1, "linear", 1, "stealth","1")
			ease(i, 1, "linear", 0, "stealth","3")
			ease(i, 1, "linear", 1, "dark","1")
			ease(i, 1, "linear", 0, "dark","3")
			if lol then
				ease(i, 1, "linear", 0, "arrowpath","1")
				ease(i, 1, "linear", 0.2, "arrowpath","3")
			end
		else
			ease(i, 1, "linear", 0, "stealth","1")
			ease(i, 1, "linear", 1, "stealth","3")
			ease(i, 1, "linear", 0, "dark","1")
			ease(i, 1, "linear", 1, "dark","3")
			if lol then
				ease(i, 1, "linear", 0, "arrowpath","3")
				ease(i, 1, "linear", 0.2, "arrowpath","1")
			end
		end
	end
	
	
	set(676, 0.5, "waveyy__speed")
	set(676, -0.2, "waveyy")
	
	set(676, -0.6, "beatscale--0")
	set(676, 0.6, "beatscale--1")
	set(676, -0.6, "beatscale--2")
	set(676, 0.6, "beatscale--3")
	ease(739, 1 ,"linear", 0, "beatscale--0")
	ease(739, 1 ,"linear", 0, "beatscale--1")
	ease(739, 1 ,"linear", 0, "beatscale--2")
	ease(739, 1 ,"linear", 0, "beatscale--3")
	
	
	set(676, 1, "sudden")
	set(676, 150, "sudden__offset")
	
	set(676, -4, "movez")
	set(676, -4, "rotatey__offset_z")
	set(676, -0.8, "moveyd")
	
	set(676, 56, "grain")
	set(750, 65, "grain")
	setdefault(82, "grain")
	
	ease(676, 8 ,"inOutCubic",1, "drunk")
	ease(739, 1 ,"inOutCubic",0, "drunk")
	
	
	set(676, 450, "hourglassx__start")
	set(676, 450, "hourglassangley__start")
	set(676, 140, "hourglassx__end")
	set(676, 140, "hourglassangley__end")
	ease(707, 2 ,"inOutCubic",1, "hourglassx")
	ease(707, 2 ,"inOutCubic",180, "hourglassangley")
	
	ease(737.9, 2 ,"inOutCubic",0, "hourglassx")
	ease(737.9, 2 ,"inOutCubic",0, "hourglassangley")
	

	ease(739.5, 0.5 ,"inOutCubic", 1.5, "beat")
	for i = 740, 804+64-2,1 do
		add(i+1, 1 ,"pop", -1*tinyMultFix, "tiny")
		add(i+1, 1 ,"pop", -0.25, "flip")
	end
	set(740, 3, "drunk__desync")
	for i = 740, 804+64-2,2 do
		add(i, 1 ,"bell", 1.5, "tipsy")
		add(i+1, 1 ,"bell", -1.5, "tipsy")
		
		add(i, 1 ,"bell", 1.5, "drunk")
		add(i+1, 1 ,"bell", -1.5, "drunk")
	end	
	
	
	set(804, 0, "alpha", "3")
	set(804, 1, "stealth", "3")
	set(804, 1, "dark", "3")
	set(804, 1, "reverse", "3")
	setasleep(803.8, "3", false)
	
	for i = 804, 804+64-8-8,8 do
		
		lazyAlternator = not lazyAlternator
		if lazyAlternator then
			ease(i+7, 1, "linear", 1, "stealth","1")
			ease(i+7, 1, "linear", 0, "stealth","3")
			ease(i+7, 1, "linear", 1, "dark","1")
			ease(i+7, 1, "linear", 0, "dark","3")
		else
			ease(i+7, 1, "linear", 0, "stealth","1")
			ease(i+7, 1, "linear", 1, "stealth","3")
			ease(i+7, 1, "linear", 0, "dark","1")
			ease(i+7, 1, "linear", 1, "dark","3")
		end
	end
	
	
	ease(867.5, 0.5 ,"inOutCubic", 0, "beat")
	
	add(867, 4 ,"inOutCubic",700, "sudden__offset")
	ease(867, 4 ,"inOutCubic",2, "drawsize")
	ease(867, 4 ,"inOutCubic", 0.25, "drunkscale")
	ease(867, 4 ,"inOutCubic", 0.9, "oldWave")
	ease(867, 4 ,"inOutCubic", 0.15, "brake")
	ease(867, 4 ,"inOutCubic", 0.51, "speedmod")
	
	ease(867, 4 ,"inOutCubic", 0.26, "orient")
	add(867, 4 ,"inOutCubic", 2.25, "drunk")
	
	
end
