function modsTimeline()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;	
				
		addResetEvent(function(){		
			game.camNotes.x = 0;
			game.camNotes.y = 0;
			game.camAFT.x = 0;
			game.camAFT.y = 0;
			game.camGame.x = 0;
			game.camGame.y = 0;
			game.camAFT.visible = true;
		});
		
		var aftSprites:Array<FlxSprite> = [];
		var aftCaptures:Array<HazardAFT> = [];
		
		// How many beats in 1 drop
		var counter = 0;
		for (i in 100...132){
			
			var aft:HazardAFT = new HazardAFT(game.camNotes);
			aft.recursive=false;
			aft.updateAFT();	
			setVar("aftCapture-"+counter, aft);
			aftCaptures.push(aft);
		
			//var s = createSpr("aftSprite-"+counter);
			var s = new ZSprite(0,0);
			s.scrollFactor.set();
			PlayState.instance.customLuaSprites.set("aftSprite-"+counter, s);
			PlayState.instance.add(s);
			s.loadGraphic(aft.bitmap);
			s.screenCenter();	
			s.camera = game.camGame;
			aftSprites.push(s);
			
			counter++;
		}
		
		addResetEvent(function(){	
			for(s in aftSprites){
				s.visible = false;
				s.alpha = 1;
				s.x2 = 0;
			}
		});
		
		eh.funcModEvent(target1, 96, function() {
			for(a in aftCaptures){
				a.clearAFT();
			}
		}, "clear", false);
		
		eh.funcModEvent(target1, 224, function() {
			for(a in aftCaptures){
				a.clearAFT();
			}
		}, "clear", false);
		
		eh.funcModEvent(target1, 224, function() {
			for(s in aftSprites){
				s.x2 = 0;
				s.visible = false;
			}
		});
		
		for (repeat in 0...2){
			//print(repeat);

			for (i in 100...132){
				var aftTarget = i - 100;
				if (repeat == 1){
					i += 228-100;
				}
				
				//print(aftTarget);
				eh.funcModEvent(target1, i, function() {
					aftCaptures[aftTarget].updateAFT();	
					aftSprites[aftTarget].visible=true;	
					//for(a in aftCaptures){
					//	a.updateAFT();	
					//}
				});
				
				eh.funcTweenModEvent(target1, i, 1, ModConstants.getEaseFromString("pop"), 1, 1.1, function(v) {
					for(s in aftSprites){
						s.scale.set(v,v);
					}
				}, "spriteScale");
				
				eh.funcTweenModEvent(target1, i, 1, ModConstants.getEaseFromString("outSine"), aftTarget, aftTarget+1, function(v) {	
					var counter = 0;
					for(s in aftSprites){
						var xPos = v-counter;
						xPos *= 112*3.8;
						if (counter < 16){
							xPos *= -1;
						}
						
						s.x = xPos;
						counter++;
					}
				}, "spriteShift");
				
			}
		}
		
		var arraySizeHalf = aftSprites.length/2;
		
		var daEase = ModConstants.getEaseFromString("smoothStepInOut");
		eh.funcTweenModEvent(target1, 116-2, 2, daEase, 0, 112*-3*1.5, function(v) {
			for (i in 0...arraySizeHalf)
			{
				//print(i);
				aftSprites[i].x2 = v;
				if (i == arraySizeHalf-1){ // well aren't you special?
				
					var halfPoint = daEase(0.5) * 112*-3*1.5;
					
					aftSprites[i].x2 = (halfPoint-v)*-2;
					//print(aftSprites[i].x2);
				}
			}
			
	
		}, "camShift");
		
		
		eh.funcTweenModEvent(target1, 116-2+16, 2, ModConstants.getEaseFromString("smoothStepInOut"), 0, (112*3*2.25), function(v) {
			var counter = 0;
			for(s in aftSprites){
				if (!(counter < 16)){
					s.x2 = v;
					
					if (counter == 31){ 
						var halfPoint = daEase(0.5) * 112*3*2.25;
						s.x2 = (halfPoint-v)*-2;
					}
				}
				counter++;
			}
		}, "camShift");
		



		eh.funcTweenModEvent(target1, 228+16-2, 2, daEase, 0, 112*-3*1.5, function(v) {
			for (i in 0...arraySizeHalf)
			{
				aftSprites[i].x2 = v;
				if (i == arraySizeHalf-1){ // well aren't you special?
					var halfPoint = daEase(0.5) * 112*-3*1.5;
					aftSprites[i].x2 = (halfPoint-v)*-2;
				}
			}
		}, "camShift");
		
		eh.funcTweenModEvent(target1, 228+16-2+16, 2, ModConstants.getEaseFromString("smoothStepInOut"), 0, (112*3*2.25), function(v) {
			var counter = 0;
			for(s in aftSprites){
				if (!(counter < 16)){
					s.x2 = v;
					if (counter == 31){ 
						var halfPoint = daEase(0.5) * 112*3*2.25;
						s.x2 = (halfPoint-v)*-2;
					}
				}
				counter++;
			}
		}, "camShift");

		
		eh.funcModEvent(target1, 258, function() {
			for(s in aftSprites){
				s.x2 = 0;
				s.visible = false;
				s.alpha = 0;
			}
		});
		
		
		
		
		//Create AFT to capture notesCameras
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
		notesAFT.recursive=false;
		notesAFT.updateAFT();	
		setVar("notesAFT",notesAFT);
		
		var aftScrollingShader = new FlxRuntimeShader(Assets.getText(Paths.frag("looping_rooms/aft_scroll")), null);
		addResetEvent(function(){
			aftScrollingShader.setFloat('scale', 1);
			aftScrollingShader.setFloat('scrollingX', 0);
			aftScrollingShader.setFloat('scrollingY', 0);
			aftScrollingShader.setFloat('transition', 0);
		});	
		
		eh.funcTweenModEvent(target1, 260, 4,  ModConstants.getEaseFromString("outQuint"), 1, 3, function(v) {
			aftScrollingShader.setFloat('scale', v);
		});
		eh.funcTweenModEvent(target1, 260, 1,  ModConstants.getEaseFromString("outQuint"), 0, 1, function(v) {
			aftScrollingShader.setFloat('transition', v);
		});
		
		eh.funcTweenModEvent(target1, 284, 4,  ModConstants.getEaseFromString("inSine"), 3, 3.5, function(v) {
			aftScrollingShader.setFloat('scale', v);
		});
		
		eh.funcTweenModEvent(target1, 260, 288-260,  ModConstants.getEaseFromString("linear"), 0, 6, function(v) {
			aftScrollingShader.setFloat('scrollingX', v/2);
			aftScrollingShader.setFloat('scrollingY', v);
		}, "shader-scrolling");
	
	
	
		var aftSprite = createSpr("aftSprite");
		aftSprite.loadGraphic(notesAFT.bitmap);
		aftSprite.screenCenter();	
		aftSprite.camera = game.camGame;
		aftSprite.shader = aftScrollingShader;
		
		addUpdate(function(elapsed){
			if(aftSprite.alpha > 0)
				notesAFT.updateAFT();	
		});	
		
		addResetEvent(function(){
			aftSprite.alpha=0;
		});	
		
		
		
		
		
		var camOffscreen:Float = FlxG.height * -6;
		
		eh.funcModEvent(target1, 164, function() {
			aftSprite.alpha=1;
			game.camNotes.y = camOffscreen;
		});
		
		for (i in 0...4)
		{
			eh.funcModEvent(target1, 194 + (i/2), function() {
				game.camNotes.y = 0;
				aftSprite.alpha=0;
			});
			if (i < 3){
				eh.funcModEvent(target1, 194 + (i/2) + 0.125, function() {
					game.camNotes.y = camOffscreen;
					aftSprite.alpha=1;
				});
			}
		}

		
		eh.funcModEvent(target1, 196, function() {
			game.camNotes.y = 0;
			aftSprite.alpha=0;
		});
		eh.funcModEvent(target1, 200, function() {
			game.camNotes.y = 0;
			aftSprite.alpha=0;
		});
		
		
		
		eh.funcModEvent(target1, 260, function() {
			aftSprite.alpha=1;
			game.camNotes.y = camOffscreen;
		});
		
		eh.funcTweenModEvent(target1, 288, 4,  ModConstants.getEaseFromString("outCubic"), camOffscreen, 0, function(v) {
			game.camNotes.y = v;
		});
		
		eh.funcTweenModEvent(target1, 288, 4,  ModConstants.getEaseFromString("inExpo"), 1, 0, function(v) {
			aftSprite.alpha=v;
		});
		
		
		eh.funcModEvent(target1, 324, function() {
			aftSprite.alpha=1;
			game.camNotes.y = camOffscreen;
			
			aftScrollingShader.setFloat('scale', 1);
			aftScrollingShader.setFloat('transition', 0);
		});
		
		
		
		//eh.funcTweenModEvent(target1, 324, 352-324,  ModConstants.getEaseFromString("smootherStepIn"), 1, 3.5, function(v) {
		//	aftScrollingShader.setFloat('scale', v);
		//});
		//eh.funcTweenModEvent(target1, 324+2, 8,  ModConstants.getEaseFromString("smootherStepInOut"), 0, 1, function(v) {
		//	aftScrollingShader.setFloat('transition', v);
		//});
		
		
		
	]])
	set(258, 275, "sudden__offset")
	ease(258,1,"outExpo", 1, "sudden")
	--ease(291.2,1.5,"inOutExpo", 0, "sudden")
	ease(258,1,"outExpo", 0.78, "speedmod")
	
	set(352, 1, "alpha--2")
	set(353, 1, "alpha--0")
	set(354, 1, "alpha--3")
	set(355, 1, "alpha--1")
	
	
	local offscreenY = screenHeight * -6
	--ease(194, 2, "linear", -offscreenY, "y", "1")
	--set(194, -offscreenY, "y", "1")
	--set(194.5, 0, "y", "1")
	--set(195, -offscreenY, "y", "1")
	--set(195.5, 0, "y", "1")
end
