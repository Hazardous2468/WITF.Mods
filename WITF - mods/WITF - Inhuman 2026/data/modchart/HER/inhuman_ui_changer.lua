function modsTimeline()
	runHaxeCode(
	[[	
		var hideIcons:Bool = true;

		game.healthBar.createFilledBar(0xFF000000, 0xFFFF0000);
		
		if(game.scoreText!=null){
			game.scoreText.useTextColor = true;
			game.scoreText.textColor =0xFF000000;
			game.scoreText.borderColor=0xFFFF0000;
		}
		
		if(hideIcons){
			if(game.iconP2!=null) game.iconP1.visible = false;
			if(game.iconP2!=null) game.iconP2.visible = false;
		}


		var upscrollComboPos:Float = -232;
		var downscrollComboPos:Float = 350;


		addResetEvent(function(){
			game.comboPopUps.offsets[0] = 30;
			game.comboPopUps.offsets[1] = Preferences.downscroll ? downscrollComboPos : upscrollComboPos;
		});


		eh.funcModEvent(PlayState.instance.playerStrumline.mods, 383.75, function() {
			game.comboPopUps.offsets[1] = Preferences.downscroll ? upscrollComboPos : downscrollComboPos;
		});
		eh.funcModEvent(PlayState.instance.playerStrumline.mods, 446, function() {
			game.comboPopUps.offsets[1] = Preferences.downscroll ? downscrollComboPos : upscrollComboPos;
		});


	]])

end


