function setUp()
	--centerPlayer("")
	--centerOpponent("")
	--createNewPlayer(true)
end


function modsTimeline()
	--spiralholds mod to fix holds not being shrunk on y axis lol
	setdefault(1, "spiralholds")

	--rotate on z
	ease(0, 8, "sineInOut", 180+360, "rotatez", "bf")
	ease(0, 8, "sineInOut", (180+360)*-1, "rotatez", "dad")	
	
	
	ease(0, 3, "sineInOut", 1, "centerx")
	
	--ease(4, 2, "pop", 0.5, "speedmod", "dad")
	ease(0, 4, "linear", 1, "strumstealth")
	ease(6, 2, "linear", 0, "strumstealth")
	
	--ease(0, 0.1, "linear", 0.4, "alpha", 3)
	
	
	
	--correct strums
	ease(8, 1, "backOut", 1, "flip")
	
	--using a for loop for some offbeat stuff?
	for i = 12, 14, 1 do
		add(i+0.5, 1, "pop", 1, "tiny")
		add(i+0.5, 1, "outSine", 360/3, "anglez")
	end
	
	--funny spin
	ease(16, 4, "quadOut", 360*3, "rotatey")
	
	--don't worry if you get lost from below here
	ease(24+(2/3*0), 2/3, "bounce", 1, "drunk")
	ease(24+(2/3*1), 2/3, "bounce", -1, "drunk")
	ease(24+(2/3*2), 2/3, "bounce", 1, "drunk")
	ease(24+(2/3*3), 2/3, "bounce", -1, "drunk")
	
	ease(27, 1, "bounce", -1, "tipsy")
	
	ease(28, 1, "bounce", -0.5, "linearX")
	ease(29, 1, "bounce", 0.5, "linearX")
	
	ease(29.5, 1, "quadOut", 1, "circZ")
	
	add(29.5, 4, "quadOut", 360*2 + 180, "rotateZ")
	ease(29.5, 4, "quadOut", -4, "moveZ")
	
	ease(29.5, 4, "linear", -1, "tipsy")
	
	
	--move notes offscreen
	--we use negative centered mod so it moves the same way for upscroll and downscroll.
	ease(32, 4, "quadIn", -2.1, "centered")

end


