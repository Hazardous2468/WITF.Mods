
function modsTimeline()	
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
	
	
		game.zSortMod_SustainOffset = -19;
		game.zSortMod_CoverBehindOffset = -14;
		game.zSortMod_CoverOffset = -14;
		
	
		var bg = createSpr("sky_background", 'stroll/sky_background');
		bg.setGraphicSize(Std.int(FlxG.width*1.3), Std.int(FlxG.height*1.3));
		bg.screenCenter();
		bg.y -= 100;
		
		var stars = createSpr("stars", 'It-Go/end_pile_sky');
		stars.alpha=0.6;
		
		eh.funcTweenModEvent(target1, 12, 126-12, FlxEase.sineInOut, -45,-100, function(v) {
			stars.y = v;
		}, "starScrollY");
		
		
		
		var foreground = createSpr("foreground", 'stroll/foreground');
		foreground.setGraphicSize(FlxG.width+8, FlxG.height+8);
		foreground.screenCenter();
		foreground.y += 22;
		
		
		
		var blackPart:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackPart.scrollFactor.set();
		PlayState.instance.add(blackPart);
		game.customLuaSprites.set("blackPart", blackPart);
		blackPart.y += FlxG.height*2;
		
		
		addResetEvent(function(){
			PlayState.instance.cancelCameraFollowTween();
			PlayState.instance.cameraFollowPoint.setPosition(FlxG.width/2, FlxG.height*2);
			PlayState.instance.resetCamera(false, false, false);
		});	
	
		
		bg.scrollFactor.set(1,0.8);
		foreground.scrollFactor.set(1,1);
		stars.scrollFactor.set(1, 0.3);
		
		blackPart.scrollFactor.set(1, foreground.scrollFactor.y);
		
		
		
		
		eh.funcTweenModEvent(target1, -5, 12, FlxEase.sineInOut, FlxG.height*2.5,FlxG.height/2, function(v) {
			game.cameraFollowPoint.y = v;
		}, "camScroll");
		
		eh.funcTweenModEvent(target1, 124, 32, FlxEase.sineInOut, FlxG.height/2,FlxG.height*0.25, function(v) {
			game.cameraFollowPoint.y = v;
		}, "camScroll");
		

		
		var blackOutBG:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOutBG.scrollFactor.set();
		PlayState.instance.add(blackOutBG);
		game.customLuaSprites.set("blackOutBG", blackOutBG);
		blackOutBG.alpha=0.0;
		
		
		eh.funcTweenModEvent(target1, 130, 153.75-130, FlxEase.quadInOut, 0,1, function(v) {
			blackOutBG.alpha = v;
		}, "blackOutFade");
		
		eh.funcTweenModEvent(target1, 0, 9.9, FlxEase.cubeOut, 1,0, function(v) {
			blackOutBG.alpha = v;
		}, "blackOutFade");

		
	]])


	
end


