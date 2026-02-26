function setUp()
	createNewPlayer(true)
	centerPlayer("")
	centerOpponent("")
end

function modsTimeline()

	setdefault(0.5,"alpha","dad")
	setdefault(1,"reverse","dad")
	setdefault(1,"sudden","dad")
	setdefault(444,"sudden__offset","dad")
	setdefault(2,"circz","dad")
	
	setdefault(112*3,"x","1")
	setdefault(112*-3,"x","3")
	
	
	for i = 0, 31 do
		add(i, 1, "bounce", 0.6, "scale")
		
		add(i, 1, "outCubic", 180, "rotatey","1")
		add(i, 1, "outCubic", -180, "rotatey","3")
	end
	
	
	
end


