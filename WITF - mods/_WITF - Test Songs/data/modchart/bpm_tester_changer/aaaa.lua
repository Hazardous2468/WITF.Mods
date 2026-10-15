function setUp()
	--createNewPlayer(true)
	--centerPlayer("")
	--centerOpponent("")
end

function modsTimeline()
	set(-16,1, "showallmods")
	set(-16,1, "3d")
	set(-16,0.75, "alpha", "dad")
	--set(-16,1, "beat")
	
	
	for i = 4, 67 do
		add(i, 1, "bounce", 0.13, "centered")
	end
	
	
	local lazyAlt = false
	
	for i = 36, 67 do

		add(i, 1, "pop", 4, "bumpy")
	
		lazyAlternator = not lazyAlternator
		add(i, 1, "bounce", lazyAlternator and 10 or -10, "rotatey")
		add(i, 1, "bounce", lazyAlternator and 10 or -10, "angley")
		
		
		add(i, 2, "spike", lazyAlternator and 20 or -20, "noteskewx")
		
	end
end


