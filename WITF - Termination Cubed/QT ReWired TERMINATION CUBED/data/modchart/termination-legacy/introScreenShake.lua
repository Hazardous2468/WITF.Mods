
function modsTimeline()
	runHaxeCode(
	[[

	var t = game.playerStrumline.mods;


	var shakeDuration:Float = 60 / 222 * 4;
	var shakeIntensity:Float = 0.00125;

	for (i in 0...3){

		eh.funcModEvent(t, i*8, function() {

			game.camGame.shake(shakeIntensity, shakeDuration);
			game.camHUD.shake(shakeIntensity, shakeDuration);
			game.camNotes.shake(shakeIntensity, shakeDuration);

		}, "introScreenShake", false);

	}

	eh.funcModEvent(t, 3*8, function() {

		game.camGame.shake(shakeIntensity, shakeDuration);
		game.camHUD.shake(shakeIntensity, shakeDuration);
		game.camNotes.shake(shakeIntensity, shakeDuration);

	}, "introScreenShake", false);

	eh.funcModEvent(t, (3*8)+4, function() {

		game.camGame.shake(shakeIntensity*0.8, shakeDuration);
		game.camHUD.shake(shakeIntensity*0.8, shakeDuration);
		game.camNotes.shake(shakeIntensity*0.8, shakeDuration);

	}, "introScreenShake", false);



	
	]])
end

