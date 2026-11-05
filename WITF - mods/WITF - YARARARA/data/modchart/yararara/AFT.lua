function setUp()
	addHaxeLibrary("FunkinCamera", "funkin.graphics")
	runHaxeCode(
	[[

		var customCamera:FunkinCamera = new FunkinCamera('player3_camera');
		customCamera.bgColor = 0;
		PlayState.instance.variables.set("customCamera", customCamera);
		FlxG.cameras.add(customCamera, false);

		print("Created custom camera!");
	]])
end



function modsTimeline()	
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("ZSpriteProjected", "funkin.graphics")
	addHaxeLibrary("FunkinCamera", "funkin.graphics")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;

		var customCamera:FunkinCamera;
		if( PlayState.instance.variables.exists("customCamera") ){
			customCamera = PlayState.instance.variables.get("customCamera");
			customCamera.x = FlxG.width * 4;
		}else{
			print("Custom camera undefined?");


			customCamera = new FunkinCamera('player3_camera');
			customCamera.bgColor = 0;
			PlayState.instance.variables.set("customCamera", customCamera);
			FlxG.cameras.add(customCamera, false);
			customCamera.x = FlxG.width * 4;
			print("Created custom camera!");

		}



		var main_aft_active:Bool = true;
		
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
		notesAFT.recursive=false;
		notesAFT.updateAFT();	
		notesAFT.targetFps(0);

		var customCamAFT:HazardAFT = new HazardAFT(customCamera);
		customCamAFT.recursive=false;
		customCamAFT.updateAFT();	
		customCamAFT.targetFps(0);
		
		addUpdate(function(elapsed){
			if (main_aft_active == true){
				notesAFT.updateAFT();	
				customCamAFT.updateAFT();	
			}
		});	
		
		var howMany:Int = 6;
		var hallSpacing:Int = 500;
		for (i in 0...howMany)
		{
			var spriteLeft:ZSpriteProjected = new ZSpriteProjected(0, 0, notesAFT.bitmap);
			spriteLeft.scrollFactor.set();
			spriteLeft.camera = game.camAFT;
			PlayState.instance.customLuaSprites.set("aftSprite_left-"+i, spriteLeft);
			PlayState.instance.add(spriteLeft);
			spriteLeft.screenCenter();	
			var spriteRight:ZSpriteProjected = new ZSpriteProjected(0, 0, notesAFT.bitmap);
			spriteRight.scrollFactor.set();
			spriteRight.camera = game.camAFT;
			PlayState.instance.customLuaSprites.set("aftSprite_right-"+i, spriteRight);
			PlayState.instance.add(spriteRight);
			spriteRight.screenCenter();	

			//spriteLeft.cropRight = 0.5;
			//spriteRight.cropLeft = 0.5;

			spriteRight.x += FlxG.width*0.25;
			spriteLeft.x -= FlxG.width*0.25;

			addResetEvent(function(){
				spriteLeft.visible=false;
				spriteLeft.z=0;
				spriteRight.visible=false;
				spriteRight.z=0;

				spriteLeft.screenCenter();	
				spriteRight.screenCenter();	
				spriteRight.x += FlxG.width*0.25;
				spriteLeft.x -= FlxG.width*0.25;
			});
			eh.funcModEvent(target1, 236, function() {
				spriteLeft.visible=true;
				spriteRight.visible=true;
			});
			eh.funcModEvent(target1, 156, function() {
				spriteLeft.visible=false;
				spriteRight.visible=false;
			});
			eh.funcModEvent(target1, 122, function() {
				spriteLeft.visible=true;
				//spriteRight.visible=true;
				spriteLeft.screenCenter();	
			});
			eh.funcModEvent(target1, 124, function() {
				spriteLeft.visible=true;
				spriteRight.visible=true;
				spriteLeft.screenCenter();	
				spriteLeft.x -= FlxG.width*0.25;
			});
			eh.funcModEvent(target1, 268, function() {
				spriteLeft.visible=false;
				spriteRight.visible=false;
			});
		}


		
		if(customCamera != null && customCamAFT!=null){
			var spriteShatter:ZSpriteProjected = new ZSpriteProjected(0, 0, customCamAFT.bitmap);
			spriteShatter.scrollFactor.set();
			spriteShatter.camera = game.camAFT;
			PlayState.instance.customLuaSprites.set("aftSprite_shatter", spriteShatter);
			PlayState.instance.add(spriteShatter);
			spriteShatter.screenCenter();	
			spriteShatter.camera = game.camAFT;
			//spriteShatter.camera = customCamera;

			addResetEvent(function(){
				spriteShatter.visible=false;
			});
			eh.funcModEvent(target1, 236, function() {
				spriteShatter.visible=true;
			});
			eh.funcModEvent(target1, 122, function() {
				spriteShatter.visible=true;
			});
			eh.funcModEvent(target1, 154, function() {
				spriteShatter.visible=false;
			});
			eh.funcModEvent(target1, 267, function() {
				spriteShatter.visible=false;
			});

		}else{
			print("failed to create shatterAFT sprite");
		}


		function hallMarch(spacing:Float, offset:Float, rightSide:Bool){
			var target:String = rightSide ? "aftSprite_right-" : "aftSprite_left-";
			for (i in 0...howMany)
			{
				var s = PlayState.instance.customLuaSprites.get(target+i);
				s.z = spacing*(i+1);
				s.z -= spacing*(howMany);
				s.z += offset*spacing;

				var a:Float =  FlxMath.remapToRange(s.z*-1, spacing*(howMany*0.25), spacing*(howMany-1), 1, 0);
    			a = FlxMath.bound(a, 0, 1);
				s.alpha = a;
			}
		}	

		eh.funcTweenModEvent(target1, 122, 2, ModConstants.getEaseFromString("inOutQuad"), 0, hallSpacing, function(v) {
			
			hallMarch(v, -1, false);
			hallMarch(v, -1, true);
		
		}, "aftHallMove");


		eh.funcTweenModEvent(target1, 154, 2, ModConstants.getEaseFromString("inOutQuad"), hallSpacing, 0, function(v) {
			
			hallMarch(v, -1, false);
			hallMarch(v, -1, true);
		
		}, "aftHallMove");

		eh.funcTweenModEvent(target1, 266, 2, ModConstants.getEaseFromString("outQuad"), hallSpacing, 0, function(v) {
			
			hallMarch(v, -1, false);
			hallMarch(v, -1, true);
		
		}, "aftHallMove");

		eh.funcTweenModEvent(target1, 236, 4, ModConstants.getEaseFromString("inOutQuad"), 0, hallSpacing, function(v) {
			
			hallMarch(v, -1, false);
			hallMarch(v, -1, true);
		
		}, "aftHallMove");

		for (beat in 124...154){
			var rightSide:Bool = true;
			if(beat % 4 >= 2){
				rightSide = false;
			}
			if(beat % 2 == 0){
				eh.funcTweenModEvent(target1, beat, 1, ModConstants.getEaseFromString("outCubic"), -1, 0, function(v) {
					
					hallMarch(hallSpacing, v, rightSide);
					
				}, "aftHallMove");
				eh.funcTweenModEvent(target1, beat+1, 0.1, ModConstants.getEaseFromString("instant"), 0, -1, function(v) {
					
					hallMarch(hallSpacing, v, rightSide);
					
				}, "aftHallMove");

				if (beat % 4 >= 2){
					eh.funcModEvent(target1, beat+1, function() {
						var s = PlayState.instance.customLuaSprites.get("aftSprite_shatter");
						s.x = FlxG.width * -0.25;
					});
				}else{
					eh.funcModEvent(target1, beat+1, function() {
						var s = PlayState.instance.customLuaSprites.get("aftSprite_shatter");
						s.x = FlxG.width * 0.25;
					});
				}
			}
		}

		for (beat in 240...266){
			var rightSide:Bool = false;
			if(beat % 4 >= 2){
				rightSide = true;
			}
			if(beat % 2 == 0){
				eh.funcTweenModEvent(target1, beat, 1, ModConstants.getEaseFromString("outCubic"), -1, 0, function(v) {
					
					hallMarch(hallSpacing, v, rightSide);
					
				}, "aftHallMove");
				eh.funcTweenModEvent(target1, beat+1, 0.1, ModConstants.getEaseFromString("instant"), 0, -1, function(v) {
					
					hallMarch(hallSpacing, v, rightSide);
					
				}, "aftHallMove");

				if (beat % 4 >= 2){
					eh.funcModEvent(target1, beat+1, function() {
						var s = PlayState.instance.customLuaSprites.get("aftSprite_shatter");
						s.x = FlxG.width * 0.25;
					});
				}else{
					eh.funcModEvent(target1, beat+1, function() {
						var s = PlayState.instance.customLuaSprites.get("aftSprite_shatter");
						s.x = FlxG.width * -0.25;
					});
				}
			}
		}

		eh.funcTweenModEvent(target1, 236, 4, ModConstants.getEaseFromString("inOutSine"), 1, 1/0.8, function(v) {
			for (i in 0...howMany)
			{
				var s = PlayState.instance.customLuaSprites.get("aftSprite_right-"+i);
				if(s!=null){
					s.scale.set(v,v);
				}
				s = PlayState.instance.customLuaSprites.get("aftSprite_left-"+i);
				if(s!=null){
					s.scale.set(v,v);
				}
			}
		}, "aftHallScale");



		eh.funcTweenModEvent(target1, 122, 2, ModConstants.getEaseFromString("inOutSine"), 1, 1/0.8, function(v) {
			for (i in 0...howMany)
			{
				var s = PlayState.instance.customLuaSprites.get("aftSprite_right-"+i);
				if(s!=null){
					s.scale.set(v,v);
				}
				s = PlayState.instance.customLuaSprites.get("aftSprite_left-"+i);
				if(s!=null){
					s.scale.set(v,v);
				}
			}
		}, "aftHallScale");




		


		eh.funcModEvent(target1, 368, function() {
			main_aft_active = false;
			game.camNotes.x=0;
		});
		eh.funcModEvent(target1, 236, function() {
			game.camNotes.x=FlxG.width*8;
		});
		eh.funcModEvent(target1, 236-0.1, function() {
			main_aft_active = true;
		});

		eh.funcModEvent(target1, 122, function() {
			game.camNotes.x=FlxG.width*8;
		});
		eh.funcModEvent(target1, 122-0.1, function() {
			main_aft_active = true;
		});

		eh.funcModEvent(target1, 156, function() {
			main_aft_active = false;
			game.camNotes.x=0;
		});
		eh.funcModEvent(target1, 268, function() {
			main_aft_active = false;
			game.camNotes.x=0;
		});
		
		
		addResetEvent(function(){
			notesAFT.clearAFT();
			main_aft_active = false;
			game.camNotes.x=0;
		});
		

		
		// Now this is going to be a fun experiment:
		addResetEvent(function(){
			var cam = game.camNotes;
			var strummer = ModConstants.grabStrumModTarget("3").strum;
			strummer.cameras = [cam];

			strummer = ModConstants.grabStrumModTarget("1").strum;
			strummer.cameras = [cam];

			//print("Swapped player 3 camera to camNotes");
		});

		eh.funcModEvent(target1, 124, function() {
			var cam = customCamera;
			var strummer = ModConstants.grabStrumModTarget("3").strum;
			strummer.cameras = [cam];

			strummer = ModConstants.grabStrumModTarget("1").strum;
			strummer.cameras = [game.camNotes];

			//print("Swapped player 3 camera to Custom");
		});	

		eh.funcModEvent(target1, 156, function() {
			var strummer = ModConstants.grabStrumModTarget("3").strum;
			strummer.cameras = [game.camNotes];
			strummer = ModConstants.grabStrumModTarget("1").strum;
			strummer.cameras = [game.camNotes];
			//print("Swapped player 3 camera to camNotes");
		});	
		eh.funcModEvent(target1, 268, function() {
			var strummer = ModConstants.grabStrumModTarget("3").strum;
			strummer.cameras = [game.camNotes];
			strummer = ModConstants.grabStrumModTarget("1").strum;
			strummer.cameras = [game.camNotes];
			//print("Swapped player 3 camera to camNotes");
		});	

		eh.funcModEvent(target1, 236, function() {
			var cam = customCamera;
			var strummer = ModConstants.grabStrumModTarget("3").strum;
			strummer.cameras = [cam];

			strummer = ModConstants.grabStrumModTarget("1").strum;
			strummer.cameras = [game.camNotes];

			//print("Swapped player 3 camera to Custom");
		});	

	]])
	
	ease(122,2,"inOutSine", 0.8, "zoom")

	set(124, 0, "x")
	set(124, 0.5, "stealth","3")

	set(124, 1, "alpha", "3")

	set(156, sw*0.25, "x", "3")
	set(156, sw*-0.25, "x", "1")
	set(156, 1, "zoom")

	set(156, {0, "alpha",0, "tipsy", 0, "tornado", 0, "stealth", 0, "flip"}, "3")

	for i = 124, 154-1,1 do
		add(i, 1, "impulse", 1, "scale")
		add(i, 1, "bounce", -0.125, "centered")
	end

	for i = 124, 154-2,2 do

		add(i, 1, "impulse", -1, "drunk")
		add(i+1, 1, "impulse", 1, "drunk")

		set(i,1, "alpha", "3")
		value(i+1 , 1, "linear", 0, 1, "alpha", "3")


		value(i+1 , 1, "outExpo", 0, 1.125, "flip", "3")
		value(i+1 , 1, "outExpo", 0, -1, "tornado", "3")
		value(i+1 , 1, "outExpo", 0, 2, "tipsy", "3")
		add(i+1 , 1, "impulse", 2, "scale", "3")

		if i%4>=2 then
			add(i+1, 1.5, "outCubic", 360, "angle", "3")
		else
			add(i+1, 1.5, "outCubic", -360, "angle", "3")
		end


		add(i+1, 2, "pop", -0.66, "brake", "3")

	end


	set(268, {0, "alpha",0, "tipsy", 0, "tornado", 0, "stealth", 0, "flip"}, "3")
	set(268, 1, "zoom")
	set(268, sw*0.25, "x", "3")
	set(268, sw*-0.25, "x", "1")



	ease(236,4,"inOutSine", 0.8, "zoom")

	set(236, 0, "x")
	set(236, 0.5, "stealth","3")

	set(236, 1, "alpha", "3")

	for i = 240, 266-1,1 do
		add(i, 1, "impulse", 1, "scale")
		add(i, 1, "bounce", -0.125, "centered")
	end

	for i = 240, 266-2,2 do

		add(i, 1, "impulse", -1, "drunk")
		add(i+1, 1, "impulse", 1, "drunk")

		set(i,1, "alpha", "3")
		value(i+1 , 1, "linear", 0, 1, "alpha", "3")


		value(i+1 , 1, "outExpo", 0, 1.125, "flip", "3")
		value(i+1 , 1, "outExpo", 0, -1, "tornado", "3")
		value(i+1 , 1, "outExpo", 0, 2, "tipsy", "3")
		add(i+1 , 1, "impulse", 2, "scale", "3")

		if i%4>=2 then
			add(i+1, 1.5, "outCubic", 360, "angle", "3")
		else
			add(i+1, 1.5, "outCubic", -360, "angle", "3")
		end

		add(i+1, 2, "pop", -0.66, "brake", "3")
	end


end


