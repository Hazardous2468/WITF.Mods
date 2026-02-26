function modsTimeline()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("ZProjectSprite", "funkin.graphics")
	
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		
		//Create AFT to capture notesCameras
		var aftCapture:HazardAFT = new HazardAFT(game.camNotes);
		aftCapture.recursive=false;
		aftCapture.updateAFT();	
		setVar("aftCapture",aftCapture);
		addUpdate(function(elapsed){
		
			//Only update the AFT when needed.
			if(
			(Conductor.instance.currentBeatTime >= 133.5 && Conductor.instance.currentBeatTime < 201) ||
			(Conductor.instance.currentBeatTime >= 294 && Conductor.instance.currentBeatTime < 359) ||
			(Conductor.instance.currentBeatTime >= 359.1 && Conductor.instance.currentBeatTime < 424.5) ||
			(Conductor.instance.currentBeatTime >= 518.0 && Conductor.instance.currentBeatTime < 592)
			){
				aftCapture.updateAFT();	
			}
		});	
		
		//Intro sprites
		var spacingZ:Float = 112*8*2;
		var howMany:Int = 10;
		var introSprites:Array<ZProjectSprite> = [];
		
		var id:Int = 0;
		for (y in 0...howMany) // y
		{
			var newSpr:ZProjectSprite = new ZProjectSprite(0, 0, aftCapture.bitmap);			
			newSpr.camera = PlayState.instance.camAFT;
			
			newSpr.setUp();
			newSpr.moveZ = (spacingZ*id) - (spacingZ*(howMany-1));
			newSpr.updateTris();
			
			introSprites.push(newSpr);
			
			id += 1;
			var tag:String = "aftHall3DSprite - " + id;
			PlayState.instance.customLuaSprites.set(tag, newSpr);
			PlayState.instance.add(newSpr);
			
			for (when in 136...200){
				eh.funcTweenModEvent(target1, when, 1, ModConstants.getEaseFromString("pop"), 1, 1.1, function(v) {
					newSpr.scaleY = v;
				}, "spriteScaleY-" + id);
				
				eh.funcTweenModEvent(target1, when, 1, ModConstants.getEaseFromString("bounce"), 1, 1.1, function(v) {
					newSpr.scaleX = v;
				}, "spriteScaleX-" + id);
			}
			
		}
		
		
		addResetEvent(function(){
			setVar("aftHallTransition1", 0.0); // Move Z
			setVar("aftHallTransition2", 0.0); // Move X Sine Blend
			setVar("aftHallTransition3", 1.0); // Alpha
		});
		
		eh.funcTweenModEvent(target1, 135.5, 4, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			setVar("aftHallTransition2", v);
		}, "aftHallTransition2");
		
		eh.funcTweenModEvent(target1, 198.5, 1.5, ModConstants.getEaseFromString("inOutSine"), 1, 0, function(v) {
			setVar("aftHallTransition2", v);
		}, "aftHallTransition2");
		
		eh.funcTweenModEvent(target1, 198.5, 1.5, ModConstants.getEaseFromString("inOutSine"), 1, 0, function(v) {
			setVar("aftHallTransition3", v);
		}, "aftHallTransition3");
				
		eh.funcTweenModEvent(target1, 359, 2.5, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			setVar("aftHallTransition2", v);
		}, "aftHallTransition2");
		eh.funcTweenModEvent(target1, 222, 1, ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			setVar("aftHallTransition3", v);
		}, "aftHallTransition3");
		
		eh.funcTweenModEvent(target1, 134, 3, ModConstants.getEaseFromString("outBack"), 0, 1, function(v) {
			setVar("aftHallTransition1", v);
		}, "aftHallTransition1");
		
		eh.funcTweenModEvent(target1, 359, 3, ModConstants.getEaseFromString("outBack"), 0, 1, function(v) {
			setVar("aftHallTransition1", v);
		}, "aftHallTransition1");
		
		
		eh.funcTweenModEvent(target1, 422, 2, ModConstants.getEaseFromString("outQuad"), 1, 0, function(v) {
			setVar("aftHallTransition3", v);
		}, "aftHallTransition3");
		
		eh.funcTweenModEvent(target1, 420, 3.95, ModConstants.getEaseFromString("inSine"), 1, 0, function(v) {
			setVar("aftHallTransition2", v);
		}, "aftHallTransition2");
		
		
		eh.funcTweenModEvent(target1, 518, 2, ModConstants.getEaseFromString("inOutCubic"), 0, 1, function(v) {
			setVar("aftHallTransition3", v);
		}, "aftHallTransition3");
		
		
		
		eh.funcTweenModEvent(target1, 515, 1, ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			setVar("aftHallTransition1", v);
		}, "aftHallTransition1");

		
		eh.funcTweenModEvent(target1, 520, 2, ModConstants.getEaseFromString("outCubic"), 0, 1, function(v) {
			setVar("aftHallTransition1", v);
		}, "aftHallTransition1");
		eh.funcTweenModEvent(target1, 520, 4, ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			setVar("aftHallTransition2", v);
		}, "aftHallTransition2");
		eh.funcTweenModEvent(target1, 581, 3, ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			setVar("aftHallTransition3", v);
		}, "aftHallTransition3");
		eh.funcTweenModEvent(target1, 581, 3, ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			setVar("aftHallTransition2", v);
		}, "aftHallTransition2");
		
		
		
		
		var xShiftingMult = 112*1.125;
		var xShiftingSpeedMult = 0.5;
		
		
		//To avoid this expensive function call every update call
		var beat136inMS:Float = Conductor.instance.getBeatTimeInMs(136);
		var beat360inMS:Float = Conductor.instance.getBeatTimeInMs(360);
		var beat520inMS:Float = Conductor.instance.getBeatTimeInMs(520);
		var beatLength:Float = Conductor.instance.getBeatTimeInMs(1);
		
		
		addUpdate(function(elapsed){
			if(
			(Conductor.instance.currentBeatTime >= 133.9 && Conductor.instance.currentBeatTime < 201) ||
			(Conductor.instance.currentBeatTime >= 357.5 && Conductor.instance.currentBeatTime < 424.5) ||
			(Conductor.instance.currentBeatTime >= 518.0 && Conductor.instance.currentBeatTime < 592)
			){
			
			
			var songPosition = Conductor.instance.songPosition;
			
			//make it so the starting point is at the start beat
			if(Conductor.instance.currentBeatTime < 136.0 || (Conductor.instance.currentBeatTime < 360.0 && Conductor.instance.currentBeatTime > 300.0) ){
				songPosition -= songPosition;
			}else{
				songPosition -=  Conductor.instance.currentBeatTime > 300.0 ? beat360inMS : beat136inMS;
			}
			
			if(Conductor.instance.currentBeatTime >= 518.0){
				songPosition = beat520inMS  - (Conductor.instance.songPosition-beat520inMS);
				songPosition += 720; //fuck it lol
			}
			
			//Tried to get a value that will make it look as close as possible to the "start" / "end" / "loopRepeat" position.
			songPosition *= 1.01;
			
			for (s in 0...introSprites.length)
			{
				var transitionBlend = getVar("aftHallTransition1");
			
				var newSpr = introSprites[s];

				newSpr.moveZ = (spacingZ*s) - (spacingZ*(howMany-1));
				
				newSpr.moveZ += songPosition % spacingZ*2;
				newSpr.moveZ *= transitionBlend;
				

				
				
				var sinny:Float = FlxMath.fastSin((songPosition/1000)*Math.PI*xShiftingSpeedMult) * getVar("aftHallTransition2");
				newSpr.moveX = sinny * xShiftingMult * (s % 2 == 0 ? 1 : -1);
				newSpr.angleZ = sinny * -2 * (s % 2 == 0 ? 1 : -1);
				newSpr.angleY = sinny *5 * (s % 2 == 0 ? 1 : -1);

				
				var closeCutOffAlpha = FlxMath.bound((newSpr.moveZ/(spacingZ*0.5)), 0, 1);
				var farCutOffAlpha = FlxMath.bound((((newSpr.moveZ+(spacingZ*4))*-1)/(spacingZ*3)), 0, 1);
				
				newSpr.alpha = 1 - closeCutOffAlpha - farCutOffAlpha;
	
				if(s!=8){
					newSpr.alpha *= getVar("aftHallTransition3");
				}
				newSpr.updateTris();
			}
			}

		});	

		
		eh.funcModEvent(target1, -16, function() {
			game.camNotes.x = 0;
			for (s in 0...introSprites.length)
			{
				var newSpr = introSprites[s];
				newSpr.visible = false;
				newSpr.moveY = 0;
				newSpr.angleZ = 0;
			}
		});
		
		
		
		
		eh.funcModEvent(target1, 134, function() {
			game.camNotes.x = 5000;
			for (s in 0...introSprites.length)
			{
				var newSpr = introSprites[s];
				newSpr.visible = true;
			}
		});
		
		
		eh.funcModEvent(target1, 200, function() {
			game.camNotes.x = 0;
			for (s in 0...introSprites.length)
			{
				var newSpr = introSprites[s];
				newSpr.visible = false;
			}
		});
		
		eh.funcModEvent(target1, 359, function() {
			game.camNotes.x = 5000;
			for (s in 0...introSprites.length)
			{
				var newSpr = introSprites[s];
				newSpr.visible = true;
				newSpr.moveY = 0;
				newSpr.angleZ = 0;
			}
		});
		
		
		eh.funcModEvent(target1, 424, function() {
			game.camNotes.x = 0;
			for (s in 0...introSprites.length)
			{
				var newSpr = introSprites[s];
				newSpr.visible = false;
			}
		});
		
		eh.funcModEvent(target1, 520, function() {
			game.camNotes.x = 5000;
			for (s in 0...introSprites.length)
			{
				var newSpr = introSprites[s];
				newSpr.visible = true;
			}
		});
		
		
		eh.funcModEvent(target1, 584, function() {
			game.camNotes.x = 0;
			for (s in 0...introSprites.length)
			{
				var newSpr = introSprites[s];
				newSpr.visible = false;
			}
		});
		
		
		
		
		
		
		
		
		//Might as well reuse these AFT sprites for also the drop at 296 too to save on resources
		
		
		eh.funcTweenModEvent(target1, 294, 3, ModConstants.getEaseFromString("inSine"), 0, FlxG.height, function(v) {
			var newSpr = introSprites[0];
			newSpr.moveY = v;
			newSpr.updateTris();	
		}, "fall");
		
		eh.funcTweenModEvent(target1, 328, 1, ModConstants.getEaseFromString("outBack"), -FlxG.height, 0, function(v) {
			var newSpr = introSprites[0];
			newSpr.moveY = v;
			newSpr.updateTris();	
		}, "fall");
		
		eh.funcModEvent(target1, 294, function() {
			game.camNotes.x = 5000;
			for (s in 0...introSprites.length)
			{
				setVar("aftHallTransition1", 0);
				var newSpr = introSprites[s];
				newSpr.moveZ = 0;
				newSpr.moveX = 0;
				newSpr.angleX = 0;
				newSpr.angleY = 0;	
				newSpr.angleZ = 0;
				newSpr.alpha = 1;	
				newSpr.visible = true;	
				if(s>0){
					//-1 to 1
					var weee:Float = (s / introSprites.length)-0.5;
					//print(weee);
					
					if(s%2 == 0){
						newSpr.moveY = -FlxG.height;
						newSpr.moveX = FlxG.width*weee/2;
					}
					else{
						newSpr.moveY = FlxG.height;
						newSpr.moveX = FlxG.width*weee/2*-1;
						
						//newSpr.angleX = 180; //this is too mean imo
					}
	
				}
				
				newSpr.updateTris();	
			}
			
			//var newSpr = introSprites[0].moveZ = 0;
		});
		
		
		var whichOneToPick:Int = 1;
		for (when in 296...328){
		
			if(when == 309){
				var newSpr = introSprites[whichOneToPick];
				eh.funcTweenModEvent(target1, when-0.2, 1.5*2.5, ModConstants.getEaseFromString("bounce"), whichOneToPick%2 == 0 ? FlxG.height : -FlxG.height , whichOneToPick%2 == 0 ? -FlxG.height*0.15 : FlxG.height*0.15, function(v) {
					newSpr.moveY = v*1.2;
					newSpr.updateTris();	
				}, "spriteMoveY-" + whichOneToPick);
				
				eh.funcModEvent(target1, when, function() {
					newSpr.angleZ=0;	
				});
				
				whichOneToPick+=1;
			}
			else if(when == 310 || when == 311 ||  when == 327){
				
			}
			else if(when == 303){
			
				var newSpr = introSprites[whichOneToPick];
				eh.funcTweenModEvent(target1, when, 1.5, ModConstants.getEaseFromString("bounce"), whichOneToPick%2 == 0 ? FlxG.height : -FlxG.height , 0, function(v) {
					newSpr.moveY = v*1.2;
					newSpr.updateTris();	
				}, "spriteMoveY-" + whichOneToPick);
				
				eh.funcModEvent(target1, when, function() {
					newSpr.angleZ=0;	
				});
				
				whichOneToPick+=1;
				
			
			}else{
				var newSpr = introSprites[whichOneToPick];
				eh.funcTweenModEvent(target1, when, 1.5*1.5, ModConstants.getEaseFromString("bounce"), whichOneToPick%2 == 0 ? FlxG.height : -FlxG.height , 0, function(v) {
					newSpr.moveY = v*1.2;
					newSpr.updateTris();	
				}, "spriteMoveY-" + whichOneToPick);
				
				var randomStartAngle = FlxG.random.float(-9,-7);
				var randomAngleAdd = FlxG.random.float(4,8);
				var shouldFlip = FlxG.random.bool() ? 1 : -1;
				
				
				
				eh.funcTweenModEvent(target1, when, 1, ModConstants.getEaseFromString("linear"), 
				randomStartAngle*shouldFlip, (randomStartAngle + randomAngleAdd) * shouldFlip, 
				function(v) {
					newSpr.angleZ = v;
				}, "spriteAngleZ-" + whichOneToPick);

				
				whichOneToPick+=1;
	
			}
			if(whichOneToPick>introSprites.length-1){
				whichOneToPick = 1;
			}
		}
		
		/*
		addUpdate(function(elapsed){
		
			//Only update the AFT when needed.
			if(
			(Conductor.instance.currentBeatTime >= 294 && Conductor.instance.currentBeatTime < 359)
			){
				//do thing
				
				//for (s in 0...introSprites.length)
				//{
					//var newSpr = introSprites[s];
					
				//}
				
			}
		});	
		*/
		
	]])
	
	add(303, 1, "tri", 45, "anglex", "bf")
	
	--slight timing adjustments
	for i = 309, 311  do
		add(i, 0.5, "tri", 1, "drunk", "bf")
		add(i+0.5, 0.5, "tri", -1, "drunk", "bf")
	end
	
	add(309, 3, "bell", -0.25, "speedmod", "bf")
	add(309.11, 3, "bell", 160, "sudden__offset", "bf")
	
end







