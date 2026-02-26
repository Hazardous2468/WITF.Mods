function intro(whichType)
	if whichType == "hitmans" then
		add(-8,0.01, "instant", -200, "yd")
		add(-8,0.01, "instant", 0.5, "flip")
		add(-8,0.01, "instant", 720, "anglez--0")
		add(-8,0.01, "instant", -720, "anglez--1")
		add(-8,0.01, "instant", 720, "anglez--2")
		add(-8,0.01, "instant", -720, "anglez--3")
		
		add(-4,4, "outQuad", 270, "yd")
		
		add(-2,2, "inOutSine", -70, "yd")
		
		add(-4,4, "outQuad", -720, "anglez--0")
		add(-4,4, "outQuad", 720, "anglez--1")
		add(-4,4, "outQuad", -720, "anglez--2")
		add(-4,4, "outQuad", 720, "anglez--3")
		
		add(-3,3, "outQuad",-0.5, "flip")
		
	elseif whichType == "inhuman" then
		add(-8,0.01, "instant", 0.25, "tiny")
	
		add(-8,0.01, "instant", -0.35, "movey--0")
		add(-8,0.01, "instant", -0.35, "movey--3")
		
		add(-8,0.01, "instant", 0.35, "movey--1")
		add(-8,0.01, "instant", 0.35, "movey--2")
		
		add(-8,0.01, "instant", 1, "alpha--0")
		add(-8,0.01, "instant", 1, "alpha--1")
		add(-8,0.01, "instant", 1, "alpha--2")
		add(-8,0.01, "instant", 1, "alpha--3")
		
		add(-8,0.01, "instant", 180, "anglez")
		
		
		add(-4,1, "outCirc", -1, "alpha--3")
		add(-4,1, "outCirc", -1, "alpha--0")
		add(-4,1, "outCirc", 0.35, "movey--3")
		add(-4,1, "outCirc", 0.35, "movey--0")
		
		add(-3,1, "outCirc", -1, "alpha--2")
		add(-3,1, "outCirc", -1, "alpha--1")
		add(-3,1, "outCirc", -0.35, "movey--2")
		add(-3,1, "outCirc", -0.35, "movey--1")
		
		
		add(-2, 1, "outCirc", -180, "anglez")
		add(-2, 1, "outCirc", -0.45, "tiny")
		
		add(-1, 1, "outCirc", 0.2, "tiny")
	else
		local moveAmount = -0.25
		local delayBetween = 0.12
		add(-8,0.01, "instant", moveAmount, "movey--0")
		add(-8,0.01, "instant", moveAmount, "movey--1")
		add(-8,0.01, "instant", moveAmount, "movey--2")
		add(-8,0.01, "instant", moveAmount, "movey--3")
	
		add(-8,0.01, "instant", 1, "alpha--1")
		add(-8,0.01, "instant", 1, "alpha--0")
		add(-8,0.01, "instant", 1, "alpha--2")
		add(-8,0.01, "instant", 1, "alpha--3")
		
		
		add(-4,1, "outCirc", -1, "alpha--0")
		add(-4+delayBetween,1, "outCirc", -1, "alpha--1")
		add(-4+delayBetween+delayBetween,1, "outCirc", -1, "alpha--2")
		add(-4+delayBetween+delayBetween+delayBetween,1, "outCirc", -1, "alpha--3")
		
		add(-4,1, "outCirc", moveAmount*-1, "movey--0")
		add(-4+delayBetween,1, "outCirc", moveAmount*-1, "movey--1")
		add(-4+delayBetween+delayBetween,1, "outCirc", moveAmount*-1, "movey--2")
		add(-4+delayBetween+delayBetween+delayBetween,1, "outCirc", moveAmount*-1, "movey--3")
	end
end


function modsTimeline()
	intro("inhuman")
end
