function modsTimeline()	

	-- SHADERS
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;

		var glitch2Shader = new FlxRuntimeShader(Assets.getText(Paths.frag("IBLEED/glitch2")), null);
		var glitchLineShader = new FlxRuntimeShader(Assets.getText(Paths.frag("IBLEED/glitch-lines")), null);
		addUpdate(function(elapsed){
			glitch2Shader.setFloat('uTime', Conductor.instance.songPosition/1000);
			glitchLineShader.setFloat('uTime', Conductor.instance.songPosition/1000);
		});	

		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(glitch2Shader));
		newCamEffects.push(new ShaderFilter(glitchLineShader));
		//game.camNotes.filters = newCamEffects;
		game.camAFT.filters = newCamEffects;
		game.camHUD.filters = newCamEffects;
		game.camGame.filters = newCamEffects;
		
		
		var glitch2Mod:CustomModifier = createCustomMod("glitch2", 0.0);
		glitch2Mod.modPriority = -9990;
		glitch2Mod.unknown = false;
		glitch2Mod.strumsMod = false;
		glitch2Mod.notesMod = false;
		glitch2Mod.holdsMod = false;
		glitch2Mod.pathMod = false;
		glitch2Mod.specialMod = true;
		glitch2Mod.speedMod = false;
		eh.addCustomMod("bf", glitch2Mod);
		glitch2Mod.specialMathFunc = function() {
			glitch2Shader.setFloat('amount', glitch2Mod.currentValue/1000/2);
		};
		
		var glitchLineMod:CustomModifier = createCustomMod("glitch_line", 0.0);
		glitchLineMod.modPriority = -9990;
		glitchLineMod.unknown = false;
		glitchLineMod.strumsMod = false;
		glitchLineMod.notesMod = false;
		glitchLineMod.holdsMod = false;
		glitchLineMod.pathMod = false;
		glitchLineMod.specialMod = true;
		glitchLineMod.speedMod = false;
		eh.addCustomMod("bf", glitchLineMod);
		glitchLineMod.specialMathFunc = function() {
			glitchLineShader.setFloat('amount', glitchLineMod.currentValue/1000/2);
		};
	
	]])
	
	set (-16, 4, 'glitch_line',"1")
	add(93, 3, "pop", 25, "glitch_line","1")
	ease(95, 2, "inOutQuad", 2.5, "glitch_line","1")
	
	
	
	
	-- STAGE VISUALS

	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		
		var howManyBG:int = 9;
		var bgSprites:Array<FlxSprite> = [];
		for (i in 0...howManyBG)
		{
			i += 1;
			//print(i);

			var bg = createSpr("bg"+i, "ibleed/bg"+i, false);
			game.customLuaSprites.set("bg"+i, bg);
			game.currentStage.add(bg);
			bg.screenCenter();
			bg.setGraphicSize(FlxG.width, FlxG.height);
			bgSprites.push(bg);
			addResetEvent(function(){
				bg.alpha = 0.0;
			});
		}
		
		var bgspeed:float = 0.25;

		var start:float = 256 - 96;
		var end:float   = 320 - 96;
		var step:float  = bgspeed * 10;

		var i:float = start;
		while (i <= end) {
			
			eh.funcModEvent(target1, i, function() {
				var whichOne:int = 1;
				for (s in bgSprites)
				{
					s.alpha = 0.0;
				}
				bgSprites[whichOne-1].alpha = 1.0;
			});
			
			eh.funcModEvent(target1, i+bgspeed, function() {
				bgSprites[0].alpha = 0.1;
				bgSprites[1].alpha = 0.1;
				bgSprites[2].alpha = 0.1;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 0.05;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 0.0;
			});
			
			eh.funcModEvent(target1, i+(bgspeed*2), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 1.0;
				bgSprites[2].alpha = 0.0;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 0.0;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 0.0;
			});
			
			eh.funcModEvent(target1, i+(bgspeed*3), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 0.0;
				bgSprites[2].alpha = 1.0;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 0.0;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 0.0;
			});
			eh.funcModEvent(target1, i+(bgspeed*4), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 0.0;
				bgSprites[2].alpha = 0.0;
				bgSprites[3].alpha = 1.0;
				bgSprites[4].alpha = 0.0;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 0.0;
			});
			eh.funcModEvent(target1, i+(bgspeed*5), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 0.0;
				bgSprites[2].alpha = 0.0;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 1.0;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 0.0;
			});
			eh.funcModEvent(target1, i+(bgspeed*6), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 0.0;
				bgSprites[2].alpha = 0.0;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 0.0;
				bgSprites[5].alpha = 1.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 0.0;
			});
			eh.funcModEvent(target1, i+(bgspeed*7), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 0.0;
				bgSprites[2].alpha = 0.0;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 0.0;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 1.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 0.0;
			});
			eh.funcModEvent(target1, i+(bgspeed*8), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 0.0;
				bgSprites[2].alpha = 0.0;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 0.0;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 1.0;
				bgSprites[8].alpha = 0.0;
			});
			eh.funcModEvent(target1, i+(bgspeed*9), function() {
				bgSprites[0].alpha = 0.0;
				bgSprites[1].alpha = 0.0;
				bgSprites[2].alpha = 0.0;
				bgSprites[3].alpha = 0.0;
				bgSprites[4].alpha = 0.0;
				bgSprites[5].alpha = 0.0;
				bgSprites[6].alpha = 0.0;
				bgSprites[7].alpha = 0.0;
				bgSprites[8].alpha = 1.0;
			});

			i += step;
		}
		

		var bgDim:FunkinSprite = new FunkinSprite(0,0).makeSolidColor(FlxG.width+100, FlxG.height+100, 0xFF000000);
		bgDim.screenCenter();
		bgDim.scrollFactor.set();
		game.customLuaSprites.set("bgDim", bgDim);
		game.currentStage.add(bgDim);
		bgDim.alpha = 0.75;
		
		
		
		var bg_0 = createSpr("bg_0", "ibleed/arg_shit", false);
		game.customLuaSprites.set("bg_0", bg_0);
		game.currentStage.add(bg_0);
		bg_0.screenCenter();
		bg_0.setGraphicSize(FlxG.width, FlxG.height);
		addResetEvent(function(){
			bg_0.alpha = 0.0;
		});
		
		eh.funcModEvent(target1, 224, function() {
			bg_0.alpha=1.0;
		});
		
		eh.funcModEvent(target1, 286, function() {
			bg_0.alpha=0.0;
			eh.funcModEvent(target1, 286, function() {
				for (s in bgSprites)
				{
					s.alpha = 0.0;
				}
			});
		});
	
		
		game.currentStage.refresh();
	]])
	
end


