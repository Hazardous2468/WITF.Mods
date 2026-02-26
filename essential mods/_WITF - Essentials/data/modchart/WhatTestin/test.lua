function setUp()
	--centerStrum("bf")
	--centerStrum("dad")
	--createNewPlayer(true) --True means it's player controlled. False means it's bot (opponent) controlled
end

function modsTimeline()
	set(-4, 1, "spiralholds")
	set(-4, 1, "alphastrums")
	set(-4, -1, "alphaholdcover")
	
	ease(0, 2, "inOutQuad", 90, "rotatez")
end


