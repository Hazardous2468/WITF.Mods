function modsTimeline()
	
	runHaxeCode(
	[[
		//PlayState.instance.camHUD.visible = false;
		//PlayState.instance.camHUD.alpha = 0;
		//PlayState.instance.camHUD.x = 9999;
		//PlayState.instance.comboPopUps.offsets = [480, -50];
		
		addResetEvent(function(){		
			PlayState.instance.comboPopUps.offsets = [480, -50];
		});
		
		
	]])

end
