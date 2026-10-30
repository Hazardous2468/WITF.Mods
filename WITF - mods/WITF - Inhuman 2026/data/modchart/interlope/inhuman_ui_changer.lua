function modsTimeline()
	runHaxeCode(
	[[
		
		var hideIcons:Bool = false;

		
		// game.healthBar.createFilledBar(0xFFFF0000, 0xFF648CC3); // og inhuman col
		game.healthBar.createFilledBar(0xFF000000, 0xFF3D6A97); //health icon col

		game.comboPopUps.offsets[0] = 30;
		game.comboPopUps.offsets[1] = 0;
		
		if(game.scoreText!=null){
			game.scoreText.useTextColor = true;
			game.scoreText.textColor =0xFF000000;
			game.scoreText.borderColor=0xFFFF0000;
		}

		
		if(hideIcons){
			if(game.iconP2!=null) game.iconP1.visible = false;
			if(game.iconP2!=null) game.iconP2.visible = false;
		}

		addResetEvent(function(){
			game.comboPopUps.offsets[0] = 30;
			game.comboPopUps.offsets[1] = 0;
			
			
		});


	]])

end


