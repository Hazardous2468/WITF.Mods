

function modsTimeline()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "funkin")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxTypeText", "flixel.addons.text")
	addHaxeLibrary("FunkinSound", "funkin.audio")
	runHaxeCode(
	[[
		var target1 = game.playerStrumline.mods;

		var do_SMPTE_shader:Bool = false;

		var smpte_color_bars = new FlxRuntimeShader(Assets.getText(Paths.frag("kb_2026/smpte_color_bars")), null);
		smpte_color_bars.setBool('enabled', true);
		smpte_color_bars.setFloat('fadeBoost', 0.2);
		smpte_color_bars.setFloat('fadeAmount', 1.0);

		addResetEvent(function(){
			smpte_color_bars.setBool('enabled', true);
			smpte_color_bars.setFloat('fadeBoost', 0.2);
			smpte_color_bars.setFloat('fadeAmount', 1.0);
		});

		var errorFilter:Array<BitmapFilter>=[];
		errorFilter.push(new ShaderFilter(smpte_color_bars));
		eh.funcModEvent(target1, 759, function() {
			game.camHUD.filters=errorFilter;
			game.camNotes.filters=errorFilter;
			game.camAFT.filters=errorFilter;
			smpte_color_bars.setBool('enabled', true);
		});

		

		if(!do_SMPTE_shader){
			eh.funcModEvent(target1, 760, function() {
				game.camHUD.filters=[];
				game.camNotes.filters=[];
				game.camAFT.filters=[];
				smpte_color_bars.setFloat('fadeBoost', 0.02);
				smpte_color_bars.setBool('enabled', false);
			});
		}
		else{


			eh.funcModEvent(target1, 760, function() {
				//game.camHUD.filters=[];
				//game.camNotes.filters=[];
				//game.camGame.filters=[];
				//game.camAFT.filters=[];
				smpte_color_bars.setFloat('fadeBoost', 0.02);
				smpte_color_bars.setBool('enabled', false);
			});

			for (beat in 765...821){
				if(beat % 2 == 0){
					eh.funcModEvent(target1, beat, function() {
						//game.camHUD.filters=[];
						//game.camNotes.filters=[];
						//game.camGame.filters=[];
						//game.camAFT.filters=[];
						smpte_color_bars.setBool('enabled', false);
					});
				}else{
					eh.funcModEvent(target1, beat, function() {
						//game.camHUD.filters=errorFilter;
						//game.camNotes.filters=errorFilter;
						//game.camAFT.filters=errorFilter;
						smpte_color_bars.setBool('enabled', true);
					});
				}
			}

			eh.funcModEvent(target1, 821, function() {
				//game.camHUD.filters=errorFilter;
				//game.camNotes.filters=errorFilter;
				//game.camAFT.filters=errorFilter;
				smpte_color_bars.setBool('enabled', true);
			});

			eh.funcTweenModEvent(target1, 822, 2,  ModConstants.getEaseFromString("inQuad"), 1.0, 0.0, function(v) {
				smpte_color_bars.setFloat('fadeAmount', v);
			}, "smpte_color_bars_fade");

			eh.funcModEvent(target1, 824, function() {
				game.camHUD.filters=[];
				game.camNotes.filters=[];
				game.camGame.filters=[];
				game.camAFT.filters=[];
				smpte_color_bars.setBool('enabled', false);
			});
		}



		var glitch2 = new FlxRuntimeShader(Assets.getText(Paths.frag("kb_2026/glitch2")), null);
		glitch2.setFloat('amount', 0.021);
		glitch2.setInt('NUM_SAMPLES', 16);
		addUpdate(function(elapsed){
			glitch2.setFloat('uTime', Conductor.instance.songPosition/1000*2);
			game.camAFT.zoom = 1;
		});	

		
		
		addResetEvent(function(){
			glitch2.setFloat('amount', 0.0);
			game.camHUD.filters=[];
			game.camNotes.filters=[];
			game.camGame.filters=[];
			game.camAFT.filters=[];
		});


		var endBeat:Float = 1110;


		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(glitch2));

		eh.funcModEvent(target1, endBeat, function() {
			game.camHUD.filters=newCamEffects;
			game.camNotes.filters=newCamEffects;
			game.camGame.filters=newCamEffects;
			game.camAFT.filters=newCamEffects;
		});

		eh.funcModEvent(target1, endBeat+2+4, function() {
			game.camHUD.filters=[];
			game.camNotes.filters=[];
			game.camGame.filters=[];
		});


		eh.funcTweenModEvent(target1, endBeat, 8,  ModConstants.getEaseFromString("inCubic"), 0, 2, function(v) {
			glitch2.setFloat('amount', v);
		}, "glitchShaderAmount");

		eh.funcTweenModEvent(target1, endBeat+2+4, 0.1,  ModConstants.getEaseFromString("linear"), 2, 0.5, function(v) {
			glitch2.setFloat('amount', v);
		}, "glitchShaderAmount");



		var endingTargetCamera = game.camAFT;

		var endingBlackOut:FunkinSprite = new FunkinSprite(0,0);
		endingBlackOut.makeSolidColor(FlxG.width*2, FlxG.height*2, 0xFF000000);
		endingBlackOut.scrollFactor.set();
		endingBlackOut.screenCenter();
		PlayState.instance.customLuaSprites.set("endingBlackOut", endingBlackOut);
      	PlayState.instance.add(endingBlackOut);
      	endingBlackOut.alpha=0;
      	endingBlackOut.camera = endingTargetCamera;


      	

		var ending_kb_eyes = createSpr("ending_kb_eyes", "kb_2026/kb_eyes");
      	ending_kb_eyes.screenCenter();
      	ending_kb_eyes.scale.set(0.5,0.5);
      	ending_kb_eyes.y-= 164;
      	ending_kb_eyes.camera = endingTargetCamera;


      	var txtSound_kb = FunkinSound.load(Paths.sound('dialogue/kb'), 0.65, false);
        txtSound_kb.volume = 0.6;
		//var kbCol = 0xFF808080;
		var kbCol = 0xFFFF0000;


		typedText = new FlxTypeText(12,24,FlxG.width,"hi :)", 64);
		typedText.setFormat(Paths.font("vcr.ttf"), 36, 0xFFFFFFFF, "center", textBorderStyle("outline"), 0xFF000000);
		typedText.useDefaultSound = false;
		typedText.sounds = [txtSound_kb];
		typedText.delay = 0.02;
		typedText.camera = endingTargetCamera;
		game.add(typedText);
		typedText.scrollFactor.set();
		typedText.screenCenter();
		game.customLuaSprites.set("typedText", typedText);

		typedText_2 = new FlxTypeText(12,24,FlxG.width,"hi :)", 64);
		typedText_2.setFormat(Paths.font("vcr.ttf"), 36, 0xFFFFFFFF, "center", textBorderStyle("outline"), 0xFF000000);
		typedText_2.useDefaultSound = false;
		typedText_2.sounds = [txtSound_kb];
		typedText_2.delay = 0.02;
		typedText_2.camera = endingTargetCamera;
		game.add(typedText_2);
		typedText_2.scrollFactor.set();
		typedText_2.screenCenter();
		game.customLuaSprites.set("typedText_2", typedText_2);
		typedText_2.y += 64;
	
		
		addResetEvent(function(){
			typedText.resetText("");
			typedText.color = kbCol;
			typedText.sounds = [txtSound_kb];
			typedText_2.resetText("");
			typedText_2.color = kbCol;
			typedText_2.sounds = [txtSound_kb];
		});	





      	addResetEvent(function(){
			endingBlackOut.alpha=0;
			ending_kb_eyes.alpha=0;
		});


		eh.funcTweenModEvent(target1, endBeat+2, 4,  ModConstants.getEaseFromString("inQuad"), 0, 1, function(v) {
			endingBlackOut.alpha=v;
		}, "endingBlackOutFade");


		eh.funcTweenModEvent(target1, endBeat+9.33, 0.1,  ModConstants.getEaseFromString("instant"), 0, 1, function(v) {
			ending_kb_eyes.alpha=v;
		}, "kbEyesFade");

		eh.funcTweenModEvent(target1, endBeat+9.4, 0.1,  ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			ending_kb_eyes.alpha=v;
		}, "kbEyesFade");

		eh.funcTweenModEvent(target1, endBeat+9.55, 0.1,  ModConstants.getEaseFromString("instant"), 0, 1, function(v) {
			ending_kb_eyes.alpha=v;
		}, "kbEyesFade");

		eh.funcTweenModEvent(target1, endBeat+9.7, 0.1,  ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			ending_kb_eyes.alpha=v;
		}, "kbEyesFade");

		eh.funcTweenModEvent(target1, endBeat+9.9, 0.1,  ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
			ending_kb_eyes.alpha=v;
		}, "kbEyesFade");



		eh.funcModEvent(target1, endBeat+10+7, function() {
			typedText.delay = 0.075;

			typedText.resetText("YOU ARE NOT READY");
			typedText.start();
		});

		eh.funcModEvent(target1, endBeat+10+8+5.5, function() {
			typedText_2.delay = 0.075;

			typedText_2.resetText("FOR THE NIGHTMARE THAT APPROACHES");
			typedText_2.start();
		});



		eh.funcModEvent(target1, endBeat+34, function() {
			typedText_2.resetText("");
			typedText.resetText("");
		});


		eh.funcTweenModEvent(target1, endBeat+34, 0.1,  ModConstants.getEaseFromString("instant"), 1,0, function(v) {
			ending_kb_eyes.alpha=v;
		}, "kbEyesFade");


	]])



end

