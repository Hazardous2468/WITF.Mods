function onCreate()
end
local tinyMultFix = 2 --WITF 1.0.0a fix

function setUp()
	centerPlayer("")
	
	createNewPlayer(true)
	createNewPlayer(true)
	createNewPlayer(true)
end

function modsTimeline()
	setasleep(0, "dad", true) --dad doesn't do anything lmao

	setdefault(-16, "movex", "dad")
	setdefault(-16*112, "debugx", "dad")
	setdefault(1, "alpha", "dad")
	
	ease(0.5, 2.4, "elasticOut", 3, "speedmod")
	
	ease(0, 2.6, "elasticOut", -7, "rotatez",1)
	ease(0, 2.6, "elasticOut", -10, "rotatez",3)
	ease(0, 2.6, "elasticOut", -11, "rotatez",4)
	ease(7, 1, "expoIn", -90, "rotatez",3)
	ease(7, 1, "expoIn", -270, "rotatez",4)
	ease(0, 2.4, "elasticOut", -0.2*tinyMultFix, "tinyx")
	ease(0, 2.4, "elasticOut", 0.23*tinyMultFix, "tinyy")
	
	ease(8.0, 0.2, "elasticIn", 0.1*100, "spiralz")
	ease(8.0, 0.2, "elasticIn", 2, "speedmod")
	ease(8.0, 0.2, "elasticIn", -1, "reverse")
	
		
	
	for i = 8.1, 25.8 , 0.1 do
		add(i, 0.5, "pop", math.random(-360,360), "confusionoffset--0")
		add(i, 0.5, "pop", math.random(-360,360), "confusionoffset--1")
		add(i, 0.5, "pop", math.random(-360,360), "confusionoffset--2")
		add(i, 0.5, "pop", math.random(-360,360), "confusionoffset--3")
		
		add(i, 1, "pop", math.random(-360,360), "rotatez--0")
		add(i, 1, "pop", math.random(-360,360), "rotatez--1")
		add(i, 1, "pop", math.random(-360,360), "rotatez--2")
		add(i, 1, "pop", math.random(-360,360), "rotatez--3")
	
		ease(i, 0.1, "pop", 0.1*100, "spiralx")
		ease(i, 0.1, "pop", 1, "tandrunky")
		add(i, 0.5, "pop", 222, "rotatex")
		add(i, 2, "elasticInOut", math.random(-50,111), "rotatex")
		
		ease(i, 0.05, "pop", 1, "flip")
	end
end
