function setUp()
	centerStrum("1")
end


function modsTimeline()	
	runHaxeCode(
	[[
		addResetEvent(function(){
			game.comboPopUps.offsets[0] = 470;
			game.comboPopUps.offsets[1] = -22;
		});
	]])

	setasleep(-20, "dad", true)
	targetExclude("dad")
	
	
end


