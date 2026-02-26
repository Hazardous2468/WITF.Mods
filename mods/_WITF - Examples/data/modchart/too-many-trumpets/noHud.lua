function modsTimeline()	
	runHaxeCode(
	[[
		//PlayState.instance.camHUD.visible = false;
		PlayState.instance.camHUD.alpha = 0.5;		
		game.healthBar.createFilledBar(0xFF000000, 0xFFFFFFFF);
	]])
end