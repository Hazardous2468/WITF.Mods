function modsTimeline()	
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("ZSpriteProjected", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("ZProjectSpriteGroup", "funkin.graphics")
	addHaxeLibrary("Constants", "funkin.util")
	
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("Assets", "openfl.utils")

	--setdefault(256/-2, "rotatez__offsetx")
	--setdefault(256/-2, "rotatez__offsety")
	--ease(93, 2, "outQuad", 256/1.5, "yd")
	--setdefault(256/1.5, "yd")
	
	
	addHaxeLibrary("FlxRect", "flixel.math")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		
	
		// Since we need extra space to render everything properly, we make the camNotes width and height bigger and offset everything accordingly.
		// Alternatively, we could've used the zoom mod and the zoom back in with the sprites similar to the original NotITG modfile but this method means there is no quality loss when scaling back up.
		
		var paddingX:int = 0;
		var paddingY:int = FlxG.width - FlxG.height; // Make the camera canvas a square shape for the dpad
	
		game.camNotes.width = FlxG.width + paddingX;
		game.camNotes.height = FlxG.height + paddingY;
		game.camNotes.x = paddingX*-0.5;
		game.camNotes.y = paddingY*-0.5;
		game.camNotes.x += FlxG.width * 10;
		
		var playerStrumline:Strumline = PlayState.instance.playerStrumline;
		playerStrumline.x = (game.camNotes.width / 2) - (playerStrumline.width / 2);

		playerStrumline.y = playerStrumline.noteStyle.getInitialStrumlineOffsets()[1];
		playerStrumline.y += (Preferences.downscroll ? FlxG.height - playerStrumline.heightWas - Constants.STRUMLINE_Y_OFFSET - playerStrumline.noteStyle.getStrumlineOffsets()[1] : Constants.STRUMLINE_Y_OFFSET);
	
		playerStrumline.y += paddingY*0.5;

		target1.setDefaultModVal("rotatez__offset_x", 0);
		target1.setDefaultModVal("rotatez__offset_y", paddingY*0.5);
		
		target1.setDefaultModVal("perspectiveoffsetx", paddingX*0.5);
		target1.setDefaultModVal("perspectiveoffsety", paddingY*0.5);
		
		target1.setDefaultModVal("zoom__offset_x", paddingX*0.0);
		target1.setDefaultModVal("zoom__offset_y", paddingY*0.5);
		
		
		
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes, game.camNotes.width, game.camNotes.height);
		notesAFT.recursive=false;
		notesAFT.updateAFT();	
		notesAFT.targetFps(0);
		addUpdate(function(elapsed){
			notesAFT.update(elapsed);	
		});	
		
		
		var loopAFT:HazardAFT = new HazardAFT(game.camNotes, game.camNotes.width, game.camNotes.height);
		loopAFT.recursive=true;
		loopAFT.updateAFT();	
		loopAFT.targetFps(60);
		addUpdate(function(elapsed){
			loopAFT.update(elapsed);
		});	
		
		
		var aftRecursiveSprite = createZSpr("aftRecursiveSprite");
		aftRecursiveSprite.loadGraphic(loopAFT.bitmap);
		aftRecursiveSprite.screenCenter();	
		aftRecursiveSprite.camera = game.camNotes;

		aftRecursiveSprite.alpha = 0.25;
		aftRecursiveSprite.scale.set(1.1,1.1);
		aftRecursiveSprite.y = 0;
		
		
		var fadeAwayShader = new FlxRuntimeShader(Assets.getText(Paths.frag("ibleed/fade_away")), null);
		aftRecursiveSprite.shader = fadeAwayShader;
		addResetEvent(function(){
			loopAFT.clearAFT();
			fadeAwayShader.setFloat('_FADE', 0.5);
			aftRecursiveSprite.alpha = 0.25;
			aftRecursiveSprite.scale.set(1.1,1.1);
		});
		
		eh.funcTweenModEvent(target1, 96, 4, ModConstants.getEaseFromString("outQuint"),0.5,0, function(v) {
			fadeAwayShader.setFloat('_FADE', v);
		});
		
		eh.funcTweenModEvent(target1, 93, 6, ModConstants.getEaseFromString("linear"),1.1 ,1.1, function(v) {
			aftRecursiveSprite.scale.set(v,v);
		});
		
		
		eh.funcTweenModEvent(target1, 93, 4, ModConstants.getEaseFromString("outQuint"),aftRecursiveSprite.alpha ,0, function(v) {
			aftRecursiveSprite.alpha = v;
		});
		
		eh.funcTweenModEvent(target1, 96, 4, ModConstants.getEaseFromString("outQuint"),0,0.1, function(v) {
			aftRecursiveSprite.alpha = v;
		});
		
		eh.funcTweenModEvent(target1, 159, 1, ModConstants.getEaseFromString("linear"),0.1,0.75, function(v) {
			aftRecursiveSprite.alpha = v;
		});
		
		eh.funcTweenModEvent(target1, 286.0, 1, ModConstants.getEaseFromString("instant"),0.0,0.0, function(v) {
			aftRecursiveSprite.alpha = v;
		});


	
	
		// test spr
		var testSpr:FunkinSprite = new FunkinSprite(0,0).makeSolidColor(game.camNotes.width, game.camNotes.height, 0xFF21A86B);
		testSpr.camera = game.camNotes;
		game.customLuaSprites.set("testSpr", testSpr);
		game.add(testSpr);
		testSpr.visible = false;
		
		var testCenterSpr:FunkinSprite = new FunkinSprite(0,0);
		testCenterSpr.loadGraphic(Paths.image("hazard_debugPoint"));
		testCenterSpr.camera = game.camNotes;
		game.customLuaSprites.set("testCenterSpr", testCenterSpr);
		game.add(testCenterSpr);
		testCenterSpr.x = (game.camNotes.width/2) - (testCenterSpr.width/2);
		testCenterSpr.y = (game.camNotes.height/2) - (testCenterSpr.height/2);
		testCenterSpr.visible = testSpr.visible;
	
		var testCenterSpr2:FunkinSprite = new FunkinSprite(0,0);
		testCenterSpr2.loadGraphic(Paths.image("hazard_debugPoint"));
		testCenterSpr2.camera = game.camNotes;
		game.customLuaSprites.set("testCenterSpr2", testCenterSpr2);
		game.add(testCenterSpr2);
		testCenterSpr2.x = (FlxG.width/2) - (testCenterSpr2.width/2);
		testCenterSpr2.y = (FlxG.height/2) - (testCenterSpr2.height/2);
		testCenterSpr2.visible = testSpr.visible;
	
		
		
		var projectStage:ZProjectSpriteGroup = new ZProjectSpriteGroup();
		game.customLuaSprites.set("projectStage", projectStage);
		game.add(projectStage);
		projectStage.scrollFactor.set();
		projectStage.screenCenter();
		projectStage.autoRefresh = false; // shouldn't be needed.

		var howManyREAL:int = 32;
		var howMany:int = 28;
		
		for (i in 0...howManyREAL)
		{		
			var aftSprite:ZSpriteProjected = new ZSpriteProjected(0, 0);
			aftSprite.loadGraphic(notesAFT.bitmap);
			aftSprite.scrollFactor.set();
			//aftSprite.x -= aftSprite.width/2;
			//aftSprite.y -= aftSprite.height/2;
			aftSprite.tag = "aft_sprite";
			aftSprite.camera = game.camAFT;
			
			PlayState.instance.customLuaSprites.set("aftSprite-"+i, aftSprite);
			//PlayState.instance.add(aftSprite);
			
			projectStage.add(aftSprite);
			aftSprite.x = 0;
			aftSprite.y = 0;
			aftSprite.z += 5*i;
			aftSprite.z -= 5*howMany;
			aftSprite.alpha = i / howManyREAL;
		}
		
		var alphaMult:float = 0;
		var xSpinMult:float = 0;
		var ySpinMult:float = 0;
		addUpdate(function(elapsed){
			if (projectStage!=null){
				var t:float = Conductor.instance.songPosition/1000*-4;
				var i:int = 0;
				for (spr in projectStage)
				{	
					if (spr.tag != "aft_sprite") continue;
					var ir:int = howManyREAL - i - 1;
					spr.x = -paddingX/2;
					spr.y = -paddingY/2;

					var m:float = ir / howManyREAL;
					spr.x -= FlxMath.fastSin(ir * Math.PI/2.0 + t)*m*xSpinMult;
					spr.y -= FlxMath.fastCos(ir * Math.PI/2.0 + t)*m*ySpinMult;		
					
					if (ir==0){
						spr.alpha = 1;
					}else{
						spr.alpha = (i / howManyREAL) * alphaMult;
					}	
					
					i++;
				}
			}
		});	
		
		eh.funcTweenModEvent(target1, 96, 2, ModConstants.getEaseFromString("linear"),0,1, function(v) {
			alphaMult = v;
		}, "spinMult");
		
		
		addResetEvent(function(){
			alphaMult = 0;
			xSpinMult = 0;
			ySpinMult = 0;
		});

		eh.funcModEvent(target1, 286, function() {
			alphaMult=0;
		});
		
		eh.funcTweenModEvent(target1, 192, 4, ModConstants.getEaseFromString("outQuint"),0,112, function(v) {
			xSpinMult = v;
			ySpinMult = v;
		}, "spinMult");
		
		eh.funcTweenModEvent(target1, 199, 1, ModConstants.getEaseFromString("outCubic"),112,0, function(v) {
			xSpinMult = v;
			ySpinMult = v;
		}, "spinMult");
		


		
		
		
		
		
		
		var ring1:ZSpriteProjected = new ZSpriteProjected(0, 0);
		ring1.loadGraphic(Paths.image("ibleed/circle-thing_witf"));
		ring1.camera = game.camNotes;
		ring1.scrollFactor.set();
		PlayState.instance.customLuaSprites.set("ring1", ring1);
		projectStage.add(ring1);
		ring1.tag = "ring1";
		ring1.x -= (ring1.width/2);
		ring1.y -= (ring1.height/2);

		var ring2:ZSpriteProjected = new ZSpriteProjected(0, 0);
		ring2.loadGraphic(Paths.image("ibleed/circle-thing_witf"));
		ring2.camera = game.camNotes;
		ring2.scrollFactor.set();
		PlayState.instance.customLuaSprites.set("ring2", ring2);
		projectStage.add(ring2);
		ring2.tag = "ring2";
		ring2.x -= (ring2.width/2);
		ring2.y -= (ring2.height/2);

		
		addResetEvent(function(){
			ring1.alpha=0.0;
			ring2.alpha=0.0;
		});
		
		
		eh.funcTweenModEvent(target1, 160, 400, FlxEase.linear, 0,360*11, function(a) {
			ring1.angle = a;
			ring2.angle = (a*-1)+22;
		});
		
		function rings(i:int){
			eh.funcTweenModEvent(target1, i+1, 6.0, FlxEase.linear,0, 2, function(z) {
				ring1.scale.set(z,z);
			});
			
			eh.funcTweenModEvent(target1, i+1, 1.0, FlxEase.linear,0, 0.6, function(a) {
				ring1.alpha=a;
			});
			eh.funcTweenModEvent(target1, i+2, 4.5, FlxEase.linear,0.6, 0, function(a) {
				ring1.alpha=a;
			});
			
			
			eh.funcTweenModEvent(target1, i+1+4, 6.0, FlxEase.linear,0, 2, function(z) {
				ring2.scale.set(z,z);
			});
			
			eh.funcTweenModEvent(target1, i+1+4, 1.0, FlxEase.linear,0, 0.6, function(a) {
				ring2.alpha=a;
			});
			eh.funcTweenModEvent(target1, i+2+4, 4.5, FlxEase.linear,0.6, 0, function(a) {
				ring2.alpha=a;
			});

		}
		
		var e:int = 0;
		for (i in 160...192)
		{
			if (e == 0)
				rings(i);
			e++;
			if(e > 7)
				e=0;
		}
		e = 0;
		for (i in 200...224)
		{
			if (e == 0)
				rings(i);
			e++;
			if(e > 7)
				e=0;
		}
		
		
		
		//game.comboPopUps.cameras = [game.camHUD];
		game.comboPopUps.cameras = [game.camNotes];
		
		game.comboPopUps.offsets[0] = -195;
		game.comboPopUps.offsets[1] = 360;
		
		
		var spriteSpacing:CustomModifier = createCustomMod("spacing", 0.0);
		spriteSpacing.modPriority = -9990;
		spriteSpacing.unknown = false;
		spriteSpacing.strumsMod = false;
		spriteSpacing.notesMod = false;
		spriteSpacing.holdsMod = false;
		spriteSpacing.pathMod = false;
		spriteSpacing.specialMod = true;
		spriteSpacing.speedMod = false;
		eh.addCustomMod("bf", spriteSpacing);
		spriteSpacing.specialMathFunc = function() {
			if (projectStage!=null){
				var s:float = spriteSpacing.currentValue;
				var i:int = 0;
				for (spr in projectStage)
				{	
					spr.z = 0;
					spr.z += s*i;
					spr.z -= s*28;
					i++;
				}
			}
		};
		
		
		var projectStageRotateX:CustomModifier = createCustomMod("sprites_rx", 0.0);
		projectStageRotateX.modPriority = -9990;
		projectStageRotateX.unknown = false;
		projectStageRotateX.strumsMod = false;
		projectStageRotateX.notesMod = false;
		projectStageRotateX.holdsMod = false;
		projectStageRotateX.pathMod = false;
		projectStageRotateX.specialMod = true;
		projectStageRotateX.speedMod = false;
		eh.addCustomMod("bf", projectStageRotateX);
		projectStageRotateX.specialMathFunc = function() {
			if (projectStage!=null){
				var targetRotationValue:float = projectStageRotateX.currentValue;
				var currentRotationValue:float = projectStage.curRotX;
				//print(targetRotationValue);	
				projectStage.rotateX(targetRotationValue-currentRotationValue);
			}
		};
		
		var projectStageRotateY:CustomModifier = createCustomMod("sprites_ry", 0.0);
		projectStageRotateY.modPriority = -9990;
		projectStageRotateY.unknown = false;
		projectStageRotateY.strumsMod = false;
		projectStageRotateY.notesMod = false;
		projectStageRotateY.holdsMod = false;
		projectStageRotateY.pathMod = false;
		projectStageRotateY.specialMod = true;
		projectStageRotateY.speedMod = false;
		eh.addCustomMod("bf", projectStageRotateY);
		projectStageRotateY.specialMathFunc = function() {
			if (projectStage!=null){
				var targetRotationValue:float = projectStageRotateY.currentValue;
				var currentRotationValue:float = projectStage.curRotY;
				//print(targetRotationValue);	
				projectStage.rotateY(targetRotationValue-currentRotationValue);
			}
		};
		

		
	
	]])
	
	ease(93, 3, "outQuad", 4, "spacing","1")
	
	for i = 192-96, 250-96+4, 4 do
		ease (i, 2, "inQuad", -80, 'sprites_rx',"1")
		ease (i+2, 2, "outQuad", -49, 'sprites_rx',"1")
	end
	
	for i = 160, 192-4, 4 do
		ease (i, 2, "inQuad", -80, 'sprites_rx',"1")
		ease (i+2, 2, "outQuad", -49, 'sprites_rx',"1")
	end
	for i = 200, 224-4, 4 do
		ease (i, 2, "inQuad", -80, 'sprites_rx',"1")
		ease (i+2, 2, "outQuad", -49, 'sprites_rx',"1")
	end
	
	
	local lazyalternator = false
	for i = 160, 192-1, 1 do
		if lazyalternator then
			ease (i, 1, "bell", 5, 'sprites_ry',"1")
		else
			ease (i, 1, "bell", -5, 'sprites_ry',"1")
		end
		lazyalternator = not lazyalternator
	end
	for i = 200, 224-1, 1 do
		if lazyalternator then
			ease (i, 1, "bell", 5, 'sprites_ry',"1")
		else
			ease (i, 1, "bell", -5, 'sprites_ry',"1")
		end
		lazyalternator = not lazyalternator
	end
	
end


