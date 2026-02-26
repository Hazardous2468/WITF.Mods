function setUp()
	--createNewPlayer(true)
	centerPlayer("")
	--centerOpponent("")
end

function modsTimeline()
	set(-16,1, "showallmods","bf")
	set(-16,1, "alpha","dad")	
	
	set(-16,1, "sudden","bf")
	set(-16,0, "sudden__noglow","bf")
	
	--set(-16,0.5, "stealth","bf")
	
	set(-16,0, "hidden","bf")
	set(-16,0.0, "hidden__noglow","bf")



	set(-16,0.0, "vanish","bf")
	set(-16,0, "hidden__noglow","bf")
	
	
	set(-16,0, "spiralholds","bf")
	set(-4,50, "grain","bf")
	
	
	setdefault(0, "oldstealthholds")
	
	
	--set(-4,6, "drunk","bf")
	set(-4,6, "bumpy","bf")
	
	
	set(-4,1, "stealthglowred","bf")
	set(-4,1, "stealthglowgreen","bf")
	set(-4,0.0, "stealthglowblue","bf")
	--set(-4,0.5, "stealth","bf")
	
	--ease(0, 6, "linear", 360, "rotatez")
	
	
end


