function modsTimeline()
	runHaxeCode(
	[[
		if(game.scoreText!=null){
			game.scoreText.useTextColor = true;
			game.scoreText.textColor = 0xFF000000;
			game.scoreText.borderColor= 0xFFFF0000;
		}
		if(game.iconP2!=null) game.iconP1.visible = false;
		if(game.iconP2!=null) game.iconP2.visible = false;
	]])
end


