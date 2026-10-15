function onCreate()
	notesBehindHUD(true)
end

function modsTimeline()

	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("Assets", "funkin")
	runHaxeCode(
	[[
		var target1 = game.playerStrumline.mods;


		//Create AFT to capture notesCameras
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes, game.camNotes.width, game.camNotes.height);
		notesAFT.targetFps(120);
		notesAFT.recursive=false;
		notesAFT.updateAFT();	
		setVar("notesAFT",notesAFT);

		var targetAlphaAmount:Float = 0.5;
		var aftSprite = createSpr("aftSprite");
		aftSprite.loadGraphic(getVar("notesAFT").bitmap);
		aftSprite.camera = game.camNotes;
		aftSprite.screenCenter();	
		aftSprite.scale.set(1.01, 1.01);
		aftSprite.alpha=0.0;

		//aftSprite.blend = ModConstants.blendModeFromString("overlay");
		aftSprite.zIndex = PlayState.instance.playerStrumline.zIndex - 4;
		PlayState.instance.refresh();


		var waveyShader = new FlxRuntimeShader(Assets.getText(Paths.frag("WaveyX")), null);
		addUpdate(function(elapsed){
			waveyShader.setFloat('iTime', Conductor.instance.songPosition/1000);
		});	
		addResetEvent(function(){
			waveyShader.setFloat('speed', 4.0);
			waveyShader.setFloat('frequency', 8.0);
			waveyShader.setFloat('power', 0.0);
		});
		aftSprite.shader = waveyShader;
		eh.funcTweenModEvent(target1, 120, 1,  ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			waveyShader.setFloat('power', v * 0.005 / 2);
		}, "waveyShaderPower");
		eh.funcTweenModEvent(target1, 152, 1,  ModConstants.getEaseFromString("outSine"), 1, 1.65, function(v) {
			waveyShader.setFloat('power', v * 0.005 / 2);
		}, "waveyShaderPower");


		addUpdate(function(elapsed){
			if(Conductor.instance.songPosition < 2180){
				notesAFT.updateAFT();	
			}
			else if(Conductor.instance.songPosition > 125895){
				notesAFT.updateAFT();	
			}

			else if(Conductor.instance.currentBeatTime >= 182.5 && Conductor.instance.currentBeatTime < 182.75){
				return;
			}
			else if(Conductor.instance.currentBeatTime >= 183.25 && Conductor.instance.currentBeatTime < 183.5){
				return;
			}
			else if(Conductor.instance.currentBeatTime >= 184 && Conductor.instance.currentBeatTime < 184.25){
				return;
			}
			else if(Conductor.instance.currentBeatTime >= 184.75 && Conductor.instance.currentBeatTime < 185){
				return;
			}
			else if(Conductor.instance.currentBeatTime >= 185.5 && Conductor.instance.currentBeatTime < 185.75){
				return;
			}
			else if(Conductor.instance.currentBeatTime >= 186.25 && Conductor.instance.currentBeatTime < 186.5){
				return;
			}
			else if(Conductor.instance.currentBeatTime >= 186.75 && Conductor.instance.currentBeatTime < 187){
				return;
			}
			else if(Conductor.instance.currentBeatTime >= 187.25 && Conductor.instance.currentBeatTime < 187.5){
				return;
			}

			else if(Conductor.instance.currentBeatTime >= 120 && Conductor.instance.currentBeatTime < 188){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 88 && Conductor.instance.currentBeatTime < 90){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 92 && Conductor.instance.currentBeatTime < 94.5){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 96 && Conductor.instance.currentBeatTime < 98){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 100 && Conductor.instance.currentBeatTime < 101.5){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 104 && Conductor.instance.currentBeatTime < 106){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 108 && Conductor.instance.currentBeatTime < 110.5){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 112 && Conductor.instance.currentBeatTime < 114){
				notesAFT.update(elapsed);
			}
			else if(Conductor.instance.currentBeatTime >= 116 && Conductor.instance.currentBeatTime < 117.5){
				notesAFT.update(elapsed);
			}
		});		

		var howMany:Int = 16;
		var aftIntroSprites:Array<FunkinSprite> = [];
		for (i in 0...howMany){
			var spriteName:String = "aftSprite_" + i;
			var aftSprite:FunkinSprite = new FunkinSprite(0,0);
			aftSprite.loadGraphic(notesAFT.bitmap);
			aftSprite.scrollFactor.set();
			PlayState.instance.add(aftSprite);
			PlayState.instance.customLuaSprites.set(spriteName, aftSprite);
			aftSprite.camera = game.camAFT;
			aftSprite.screenCenter();
		}
		
		addResetEvent(function(){
			notesAFT.recursive=false;
			game.camNotes.x=0;	
			for (i in 0...howMany){
				var spriteName:String = "aftSprite_" + i;
				var s = getSpr(spriteName);
				if(s==null) continue;
				s.alpha = 0.0;
			}
		});

		eh.funcModEvent(target1, 0.0, function() {
			notesAFT.recursive=false;
			for (i in 0...howMany){
				var spriteName:String = "aftSprite_" + i;
				var s = getSpr(spriteName);
				if(s==null) continue;
				s.alpha = 1.0;
			}
		});

		eh.funcModEvent(target1, 4, function() {
			for (i in 0...howMany){
				var spriteName:String = "aftSprite_" + i;
				var s = getSpr(spriteName);
				if(s==null) continue;
				s.alpha = 0.0;
			}
		});

		eh.funcTweenModEvent(target1, 0, 1.5,  ModConstants.getEaseFromString("outCirc"), 0.0, 1, function(v) {
			for (i in 0...howMany){
				var angle:Float = 360.0 / howMany * i ;
				var spriteName:String = "aftSprite_" + i;
				var s = getSpr(spriteName);
				if(s==null) continue;
				s.angle = v*angle;
			}
		}, "aftSpritesIntro");

		eh.funcTweenModEvent(target1, 1.5, 4-1.5,  ModConstants.getEaseFromString("inCubic"), 1, 0, function(v) {
			for (i in 0...howMany){
				var angle:Float = 360.0 / howMany * i ;
				var spriteName:String = "aftSprite_" + i;
				var s = getSpr(spriteName);
				if(s==null) continue;
				s.angle = v*angle;
			}
		}, "aftSpritesIntro");


		addResetEvent(function(){
			aftSprite.alpha=0;
			aftSprite.angle=0;
			aftSprite.scale.set(1.01, 1.01);
		});

		eh.funcTweenModEvent(target1, 86, 2,  ModConstants.getEaseFromString("inQuad"), 0, 1, function(v) {
			aftSprite.alpha=v;
		}, "recursiveSpriteAlpha");

		eh.funcTweenModEvent(target1, 119, 2,  ModConstants.getEaseFromString("inOutQuad"), 1, 0.5, function(v) {
			aftSprite.alpha=v;
		}, "recursiveSpriteAlpha");


		eh.funcTweenModEvent(target1, 94, 0.6,  ModConstants.getEaseFromString("tap"), 1.01, 1.09, function(v) {
			aftSprite.scale.x = v;
		}, "recursiveSpriteScale");

		eh.funcTweenModEvent(target1, 110, 0.6,  ModConstants.getEaseFromString("tap"), 1.01, 1.09, function(v) {
			aftSprite.scale.x = v;
		}, "recursiveSpriteScale");

		eh.funcTweenModEvent(target1, 119, 1,  ModConstants.getEaseFromString("inOutQuad"), 1.01, 0.99, function(v) {
			aftSprite.scale.set(v, v);
		}, "recursiveSpriteScale");

		eh.funcTweenModEvent(target1, 99, 1,  ModConstants.getEaseFromString("inOutQuad"), 0, 0.5, function(v) {
			aftSprite.angle=v;
		}, "recursiveSpriteAngle");



		eh.funcTweenModEvent(target1, 103, 1,  ModConstants.getEaseFromString("inOutQuad"), 0.5, -0.75, function(v) {
			aftSprite.angle=v;
		}, "recursiveSpriteAngle");

		eh.funcTweenModEvent(target1, 107, 1,  ModConstants.getEaseFromString("inOutQuad"), -0.75, 0, function(v) {
			aftSprite.angle=v;
		}, "recursiveSpriteAngle");

		eh.funcTweenModEvent(target1, 116, 1,  ModConstants.getEaseFromString("inOutQuad"), 1.01, 0.99, function(v) {
			aftSprite.scale.y = v;
		}, "recursiveSpriteScale");

		eh.funcTweenModEvent(target1, 187.75, 0.5,  ModConstants.getEaseFromString("inOutQuad"), 0.5, 0, function(v) {
			aftSprite.alpha=v;
		}, "recursiveSpriteAlpha");



		eh.funcModEvent(target1, 88, function() {
			notesAFT.recursive=true;
		});
		eh.funcModEvent(target1, 86, function() {
			notesAFT.clearAFT();
		},"",false);
		eh.funcModEvent(target1, 88, function() {
			notesAFT.clearAFT();
		},"",false);





		var blackOutBG:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOutBG.scrollFactor.set();
		PlayState.instance.add(blackOutBG);
		game.customLuaSprites.set("blackOutBG", blackOutBG);
		blackOutBG.alpha=0.0;
		blackOutBG.camera=game.camAFT;
		addResetEvent(function(){
			blackOutBG.alpha=1.0;
		});	


		eh.funcTweenModEvent(target1,-4, 4, ModConstants.getEaseFromString("inOutQuad"), 1, 0, function(v) {
			blackOutBG.alpha = v;
		}, "blackOutFade");
		
		var offset:Float = 204 - 197;
		for (b in 204...236){
			if (b % 4 == 0){
				//print(b);
				eh.funcTweenModEvent(target1, b-offset+0.01,4, ModConstants.getEaseFromString("outQuad"), 0, 1, function(v) {
					blackOutBG.alpha = v;
				}, "blackOutFade");

				eh.funcTweenModEvent(target1, b+2-offset,1.95, ModConstants.getEaseFromString("outQuad"), 0.25, 1, function(v) {
					blackOutBG.alpha = v;
				}, "blackOutFade");
			}
		}



		for (b in 229...232){

			eh.funcTweenModEvent(target1,b, 0.25, ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
				blackOutBG.alpha = v;
			}, "blackOutFade");

			eh.funcTweenModEvent(target1,b+0.125, 0.125, ModConstants.getEaseFromString("inExpo"), 0, 1, function(v) {
				blackOutBG.alpha = v;
			}, "blackOutFade");

		}

		eh.funcTweenModEvent(target1,232, 0.25, ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			blackOutBG.alpha = v;
		}, "blackOutFade");


		eh.funcTweenModEvent(target1, 232, 0.125,  ModConstants.getEaseFromString("instant"), 0, 1, function(v) {
			for (i in 0...howMany){
				var angle:Float = 360.0 / howMany * i ;
				var spriteName:String = "aftSprite_" + i;
				var s = getSpr(spriteName);
				if(s==null) continue;
				s.angle = v*angle;
			}
		}, "aftSpritesIntro");

		eh.funcModEvent(target1, 232, function() {
			notesAFT.recursive=false;
			for (i in 0...howMany){
				var spriteName:String = "aftSprite_" + i;
				var s = getSpr(spriteName);
				if(s==null) continue;
				s.alpha = 1.0;
			}
		});




	]])

	--for c = 0, 3 do
	--	set(-16, 1, "alpha--"..c)
	--	set(4, 0, "alpha--"..c)
	--	set(4, 0, "alpha--"..c)
	--end
	set(-16, 1, "alpha","1")
	ease(-0.5, 1, "inOutExpo", 0, "alpha","1")


	set(-16, 1, "sudden","1")
	set(-16, 912, "sudden__offset","1")
	set(-16, 600, "sudden__start","1")
	set(-16, 300, "sudden__end","1")
	set(-16, 1, "sudden__noglow","1")

	set(-16, 0.2, "drawsize","1")
	set(-16, 0.375, "speedmod","1")
	add(0, 4 , "bounce", {-360, "rotatez", -360, "angle"})


end

