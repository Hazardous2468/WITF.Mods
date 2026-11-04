function modsTimeline()	
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;

		var bg = createSpr("bg", 'yararara/back1', false);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.screenCenter();	
		PlayState.instance.customLuaSprites.set("bg", bg);
		game.currentStage.add(bg);
		bg.zIndex = 5;

		var bg2 = createSpr("bg2", 'yararara/back2', false);
		bg2.setGraphicSize(FlxG.width, FlxG.height);
		bg2.screenCenter();	
		PlayState.instance.customLuaSprites.set("bg2", bg2);
		game.currentStage.add(bg2);
		bg2.zIndex = 6;

		var alarmGradient = createSpr("alarmGradient", 'yararara/alarm_gradient', false);
		alarmGradient.setGraphicSize(FlxG.width, FlxG.height);
		alarmGradient.screenCenter();	
		PlayState.instance.customLuaSprites.set("alarmGradient", alarmGradient);
		game.currentStage.add(alarmGradient);
		alarmGradient.zIndex = 6;
		alarmGradient.zIndex = 55;

		var bg_blackOut:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		bg_blackOut.scrollFactor.set();
		game.customLuaSprites.set("bg_blackOut", bg_blackOut);
		bg_blackOut.screenCenter();
		game.currentStage.add(bg_blackOut);
		bg_blackOut.zIndex = 51;
		bg_blackOut.alpha=1;



		addResetEvent(function(){
			bg_blackOut.alpha=1;
			alarmGradient.alpha=0;
		});


		eh.funcTweenModEvent(target1, 0, 10, ModConstants.getEaseFromString("inOutQuad"), 0, 0.5, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");
		eh.funcTweenModEvent(target1, 11, 5, ModConstants.getEaseFromString("inOutQuad"), 0.5, 0, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");


		eh.funcTweenModEvent(target1, 142, 8, ModConstants.getEaseFromString("inOutQuad"), 0, 0.5, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");

		eh.funcTweenModEvent(target1, 153.5, 2, ModConstants.getEaseFromString("inOutQuad"), 0.5, 0, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");

		eh.funcTweenModEvent(target1, 255, 8, ModConstants.getEaseFromString("inOutQuad"), 0, 0.5, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");

		eh.funcTweenModEvent(target1, 265.5, 2, ModConstants.getEaseFromString("inOutQuad"), 0.5, 0, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");


		eh.funcTweenModEvent(target1, 0, 8, ModConstants.getEaseFromString("inOutQuad"), 1, 0.35, function(v) {
			
			bg_blackOut.alpha=v;
		
		}, "bgDim");

		eh.funcTweenModEvent(target1, 299, 3, ModConstants.getEaseFromString("inOutQuad"), 0.35, 1, function(v) {
			
			bg_blackOut.alpha=v;
		
		}, "bgDim");


		eh.funcTweenModEvent(target1, 86, 4, ModConstants.getEaseFromString("inOutQuad"), 0.35, 0.75, function(v) {
			bg_blackOut.alpha=v;
		}, "bgDim");
		eh.funcTweenModEvent(target1, 92, 1, ModConstants.getEaseFromString("outExpo"), 0.75, 0.35, function(v) {
			bg_blackOut.alpha=v;
		}, "bgDim");

		eh.funcTweenModEvent(target1, 230, 4, ModConstants.getEaseFromString("inOutQuad"), 0.35, 0.75, function(v) {
			bg_blackOut.alpha=v;
		}, "bgDim");
		eh.funcTweenModEvent(target1, 236, 4, ModConstants.getEaseFromString("inOutQuad"), 0.75, 0.35, function(v) {
			bg_blackOut.alpha=v;
		}, "bgDim");


		eh.funcTweenModEvent(target1, 301, 7, ModConstants.getEaseFromString("outQuad"), 0, 0.25, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");

		eh.funcTweenModEvent(target1, 308, 8, ModConstants.getEaseFromString("outQuad"), 0.5, 0.2, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");

		eh.funcTweenModEvent(target1, 314, 2, ModConstants.getEaseFromString("linear"), 0.2, 0.0, function(v) {
			alarmGradient.alpha=v;
		}, "alarmGradientAlpha");


		game.refresh();
		game.currentStage.refresh();






		// screen shakes from the shots
		var shakeDuration:Float = 60 / 125 * 0.5;
		var shakeIntensity:Float = 0.005;
		for (i in 92...122){

			if (i%2==1){
				eh.funcModEvent(target1, i, function() {

					game.camGame.shake(shakeIntensity, shakeDuration);
					game.camHUD.shake(shakeIntensity, shakeDuration);
					game.camNotes.shake(shakeIntensity, shakeDuration);

				}, "ScreenShake", false);

				eh.funcModEvent(target1, i+268-92, function() {

					game.camGame.shake(shakeIntensity, shakeDuration);
					game.camHUD.shake(shakeIntensity, shakeDuration);
					game.camNotes.shake(shakeIntensity, shakeDuration);

				}, "ScreenShake", false);

			}		
		}
		for (i in 124...154){

			if (i%2==1){
				eh.funcModEvent(target1, i, function() {

					game.camGame.shake(shakeIntensity, shakeDuration);
					game.camHUD.shake(shakeIntensity, shakeDuration);
					game.camNotes.shake(shakeIntensity, shakeDuration);

				}, "ScreenShake", false);
			}		
		}

		for (i in 240...266){

			if (i%2==1){
				eh.funcModEvent(target1, i, function() {

					game.camGame.shake(shakeIntensity, shakeDuration);
					game.camHUD.shake(shakeIntensity, shakeDuration);
					game.camNotes.shake(shakeIntensity, shakeDuration);

				}, "ScreenShake", false);
			}		
		}


		for (i in 56...83){
			if (i%4==0){
				eh.funcModEvent(target1, i, function() {

					game.camGame.shake(shakeIntensity, shakeDuration);
					game.camHUD.shake(shakeIntensity, shakeDuration);
					game.camNotes.shake(shakeIntensity, shakeDuration);

				}, "ScreenShake", false);
			}		
		}
		for (i in 196...223){
			if (i%4==0){
				eh.funcModEvent(target1, i, function() {

					game.camGame.shake(shakeIntensity, shakeDuration);
					game.camHUD.shake(shakeIntensity, shakeDuration);
					game.camNotes.shake(shakeIntensity, shakeDuration);

				}, "ScreenShake", false);
			}		
		}




	]])

end



