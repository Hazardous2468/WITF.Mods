function setUp()
	centerPlayer("")
end

function modsTimeline()
	setasleep(0, "dad", true) --dad doesn't do anything lmao
	set(-16, 1, "stealth", "dad")
	setdefault(-16, "movex", "dad")
	setdefault(-16*112, "debugx", "dad")
	setdefault(1, "alpha", "dad")
	

	setdefault(60, "grain","bf")
	
	
	ease(66, 2, "inOutSine", -200, "z")
	
	setdefault(0.25, "bumpyx--0")
	setdefault(-0.25, "bumpyx--1")
	setdefault(0.25, "bumpyx--2")
	setdefault(-0.25, "bumpyx--3")
	
	
	--set(-16, 2, "waveyy__time_add")
	set(-16, 2, "waveyy__speed")
	ease(67, 2, "inOutSine", 0.3, "waveyx")
	ease(67, 2, "inOutSine", 0.3, "waveyy")
	ease(132, 2, "inOutSine", 0.4, "waveyx")
	ease(132, 2, "inOutSine", 0.4, "waveyy")
	
	
	
	add(93.5, 1, "bell", -30, "noteskewx")
	add(112.5, 1, "bell", -30, "noteskewy")
	
	ease(77-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(78-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(89-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(90, 0.3, "inOutQuad", 0, "flip")
	ease(100-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(105-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(110-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(111-0.1, 0.3, "inOutQuad", 0, "flip")
	
	ease(116-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(117.5-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(119-0.1, 0.3, "inOutQuad", 1, "flip")
	
	ease(124-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(125.5-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(127-0.1, 0.3, "inOutQuad", 0, "flip")
	
	
	add(110.5-0.1, 0.5, "pop", 0.3, "invert")
	
	
	
	
	
	
	add(78-0.1, 1, "pop",-1, "tipsy")
	add(79.5-0.1, 1, "pop",1, "tipsy")
	add(80.5-0.1, 1, "pop",-1, "tipsy")
	
	
	add(78-0.1, 1, "pop",-1, "tinyx")
	add(79.5-0.1, 1, "pop",-1, "tinyy")
	add(80.5-0.1, 1, "pop",-1, "tinyx")
	
	
	
	add(72, 1, "bounce",-45, "anglez")
	add(73, 1, "bounce",45, "anglez")
	
	
	add(92, 1, "bounce",-45, "anglez")
	add(93, 1, "bounce",45, "anglez")
	add(96, 1, "bounce",45, "anglez")
	add(97, 1, "bounce",-45, "anglez")
	
	
	
	
	
	add(86.3, 1.1, "spike",-0.5, "tinyx")
	add(64+86.3, 1.1, "spike",-0.5, "tinyx")
	
	
	add(94-0.5, 2.5, "bell",10, "rotatez")
	add(94-0.5, 2.5, "bell",10, "anglez")
	
	add(64+94-0.5, 2.5, "bell",10, "rotatez")
	add(64+94-0.5, 2.5, "bell",10, "anglez")
	
	
	
	
	
	add(120, 1, "bounce",24, "anglez")
	add(121, 1, "bounce",-24, "anglez")
	add(128, 1, "bounce",24, "anglez")
	add(129, 1, "bounce",-24, "anglez")
	
	add(184, 1, "bounce",24, "anglez")
	add(185, 1, "bounce",-24, "anglez")
	add(192, 1, "bounce",24, "anglez")
	add(193, 1, "bounce",-24, "anglez")
	
	
	--this is stupid 
	
	add(64+93.5, 1, "bell", -30, "noteskewx")
	add(64+112.5, 1, "bell", -30, "noteskewy")
	
	ease(64+77-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(64+78-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(64+89-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(64+90, 0.3, "inOutQuad", 0, "flip")
	ease(64+100-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(64+105-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(64+110-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(64+111-0.1, 0.3, "inOutQuad", 0, "flip")
	
	ease(64+116-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(64+117.5-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(64+119-0.1, 0.3, "inOutQuad", 1, "flip")
	
	ease(64+124-0.1, 0.3, "inOutQuad", 0, "flip")
	ease(64+125.5-0.1, 0.3, "inOutQuad", 1, "flip")
	ease(64+127-0.1, 0.3, "inOutQuad", 0, "flip")
	
	
	add(64+110.5-0.1, 0.5, "pop", 0.3, "invert")
	
	
	
	
	


	add(64+72, 1, "bounce",-45, "anglez")
	add(64+73, 1, "bounce",45, "anglez")
	
	
	add(64+92, 1, "bounce",-45, "anglez")
	add(64+93, 1, "bounce",45, "anglez")
	add(64+96, 1, "bounce",45, "anglez")
	add(64+97, 1, "bounce",-45, "anglez")
	
	
	
	
	
	
end
