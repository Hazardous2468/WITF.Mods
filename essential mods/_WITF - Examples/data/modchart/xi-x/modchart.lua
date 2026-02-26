function setUp()
	centerPlayer("")
	centerOpponent("")
	createNewPlayer(true)
	
	runHaxeCode(
	[[
	for (strumLine in PlayState.instance.allStrumLines)
	{
		strumLine.arrowPathFileName = "19ZZ/arrowPath";
	}
	]])
	
	
end

local tinyMultFix = 2 --WITF 1.0.0a fix


local suddenOffsetChorus = 111

function chorus(when)
	--in case
	set(when,1, "sudden")
	set(when,suddenOffsetChorus, "sudden__offset")
	
	
	set(when,-5, "hidden__start")
	set(when,1, "hidden__noglow")
	set(when,-77, "hidden__end")
	ease(when,1, "outExpo", 1, "hidden" )
	
	ease(when+(199.66-136),1, "outQuad", 0, "hidden" )
	
	ease(when,1, "outExpo", 0.5, "beat" )
	
	for i = when, when+64-1,1 do
		value(i, 1, "outQuad", 0.2, 0, "scale")
		add(i, 1, "bounce", 0.2, "brake")
		add(i, 1, "bounce", 100, "sudden__offset")
	end
	
	
	add(when+(136-136), 2, "bounce", 0.4, "drunk" )
	add(when+(137-136), 2, "bounce", -0.6, "drunk" )
	add(when+(138-136), 2, "bounce", 0.5, "drunk" )
	add(when+(136-136)+16, 2, "bounce", 0.4, "drunk" )
	add(when+(137-136)+16, 2, "bounce", -0.6, "drunk" )
	add(when+(138-136)+16, 2, "bounce", 0.5, "drunk" )
	add(when+(136-136)+16+16, 2, "bounce", 0.4, "drunk" )
	add(when+(137-136)+16+16, 2, "bounce", -0.6, "drunk" )
	add(when+(138-136)+16+16, 2, "bounce", 0.5, "drunk" )
	add(when+(136-136)+16+16+16, 2, "bounce", 0.4, "drunk" )
	add(when+(137-136)+16+16+16, 2, "bounce", -0.6, "drunk" )
	add(when+(138-136)+16+16+16, 2, "bounce", 0.5, "drunk" )
	
	
	
	
	
	add(when+(148-136)-0.2-0.2, 2, "inOutCubic", 20, "skewx" )
	add(when+(148-136)+2-0.2, 2, "inOutCubic", -40, "skewx" )
	add(when+(148-136)+2+1-0.2, 2, "inOutCubic", 20, "skewx" )
	
	add(when+(148-136), 1, "inQuint", 1, "movex" )
	add(when+(149-136), 1, "inOutCubic", -1, "movex" )
	add(when+(150-136), 1, "inOutCubic", -1, "movex" )
	add(when+(151-136), 1, "inOutCubic", 1, "movex" )
	
	
	local daLane = 2
	local b = getNoteBeats(when+(161.385-136),when+(161.75-136),"bf")
	for i, v in ipairs(b) do
		daLane = v[2]
	end
	
	set(when+(161.45-136), 3, "drunk--"..daLane.."__speed")
	set(when+(161.45-136), 1.2, "drunk--"..daLane.."__mult")
	add(when+(161.5-136), 6, "outCubic", 20, "drunk--"..daLane.."__time_add" )
	add(when+(161.5-136), 1, "outCubic", 0.5, "drunk--"..daLane )
	add(when+(162-136), 4, "smoothStepInOut", -0.5, "drunk--"..daLane )
	
	
	local daLane = 0
	local b = getNoteBeats(when+(193.385-136),when+(194.5-136),"bf")
	for i, v in ipairs(b) do
		daLane = v[2]
	end
	
	set(when+(192.45-136), 3, "drunkz--"..daLane.."__speed")
	set(when+(192.45-136), 1.25, "drunkz--"..daLane.."__mult")
	add(when+(193.5-136), 6, "outCubic", 20, "drunkz--"..daLane.."__time_add" )
	add(when+(193.5-136), 1, "outCubic", 3, "drunkz--"..daLane )
	add(when+(193.5-136), 4, "smoothStepInOut", -3, "drunkz--"..daLane )
	
	add(when+(193.5-136), 1, "outCubic", -0.8, "tipsy" )
	add(when+(193.5-136), 4, "smoothStepInOut", 0.8, "tipsy" )
	
	
	
	add(when+48-4, 4, "smoothStepIn", (360*3), "anglez" )
end

function modsTimeline()

	local upScrollFix = -1
	if downScroll then
		upScrollFix = 1
	end

	runHaxeCode(
	[[
	for (strumLine in PlayState.instance.allStrumLines)
	{
		strumLine.arrowPathFileName = "19ZZ/arrowPath";
	}
	]])
	
	targetExclude("dad")
	setasleep(447, "3", false)
	setasleep(456, "3", true)
	setasleep(-16, "dad", true)
	setasleep(-16, "3", true)
	
	setasleep(230, "3", false)
	setasleep(264, "3", true)
	
	--setdefault(1, "showlanemods")
	setdefault(62, "grain")
	setdefault(66, "pathgrain")
	setdefault(0.1, "arrowpathwidth")
	setdefault(0.5, "drawdistance")

	setdefault(1.0, "stealthglowred")
	setdefault(1.0, "stealthglowgreen")
	setdefault(1.0, "stealthglowblue")
	
	ease(24,32-24, "inOutQuad", 1, "beat" )
	ease(24,32-24, "inOutQuad",1.6, "bumpy" )
	ease(59,1, "outQuad", 0, "beat" )
	ease(59,1, "outQuad",0, "bumpy" )
	
	for i = 32, 59-2, 4 do
		add(i+1-0.15, 1, "pop", 5, "rotz")
		add(i+1+2-0.15, 1, "pop", -5, "rotz")
		add(i+1-0.15, 1, "pop", 5, "anglez")
		add(i+1+2-0.15, 1, "pop", -5, "anglez")
		
		
		add(i, 2, "spike", -1*tinyMultFix, "tinyx")
		add(i+2, 2, "spike", -1*tinyMultFix, "tinyx")
		add(i, 2, "spike", -1, "tipsy")
		add(i+2, 2, "spike", -1, "tipsy")
		
		for k = 0, 3, 1 do
			add(i+k, 1, "bounce", 0.1, "scale")

		end
	end
	
	
	local b = getNoteBeats(30,60.5,"dad")
	for c=0, 3 do
		set(0,0.1, "arrowpathwidth--"..c)
	end
	for i, v in ipairs(b) do
		-- v[1] == the beats that the charted notes are on
		-- v[2] == the column that the charted notes are on, starting from 0
		-- v[3] == the hold length (0 means no hold) in ms
		-- v[4] == the type of note (such as "default", "hurt", "invisible", "dodge",etc)

		--add(v[1]-0.1,0.66, "pop", 1, "arrowpath--"..v[2])
		
		value(v[1], 0.75, "linear", 0.5, 0, "arrowpath--"..v[2])
		add(v[1], 0.35, "pop",1, "arrowpathwidth--"..v[2])
	end
	
	local b = getNoteBeats(199.8,231.99,"dad")
	for i, v in ipairs(b) do
		add(v[1], 0.75, flip("linear"), 0.15, "arrowpath--"..v[2])
		add(v[1], 0.35, "pop",0.7, "arrowpathwidth--"..v[2])
	end
	
	
	
	
	local weee = getNoteBeats(58.9, 59.1, "bf")
	for i, v in ipairs(weee) do
	
		set(59,1,"spiralholds--"..v[2],"bf")
		set(60.4,0,"spiralholds--"..v[2],"bf")
	
		add(59, 1.3, "outCubic", 360, "notesrotatez--"..v[2],"bf")
	end
	
	
	
	add(59, 1.3, "outCubic", 360, "anglez")
	add(59, 1.3, "pop", -1, "movez")
	
	for i = 0, 4 do
		add(60.5 + (0.75 * i), 1.1, "outElastic", 360/5, "angleZ")
		add(60.5 + (0.75 * i), 1.1, "pop", 0.8, "scale")
		
		add(452.5 + (0.75 * i), 1.1, "outElastic", 360/5, "angleZ")
		add(452.5 + (0.75 * i), 1.1, "pop", 0.8, "scale")
	end

	
	set(60, 1, "3d")
	set(135.75, 0, "3d")
	
	add(63.5, 4.5, "smoothStepOut", -112*1.5, "z")
	
	add(63.5, 4.5, "smoothStepInOut", 360, "anglex")
	add(63.5, 4.5, "smoothStepInOut", 360, "rotx")
	
	ease(66, 3.75, "linear", 720, "anglez") --fix the tiny overshoot caused by outElastic from earlier.
	
	set(70.5, {0, "anglex", 0, "anglez", 0, "angley", 0, "rotatez", 0, "rotatey", 0, "rotatex"})

	
	
	
	
	
	ease(70, 1, "outExpo", 1, "videogames")
	ease(70.75, 1, "outExpo", 0, "videogames")
	ease(70.75, 1, "outExpo", 1, "invert")
	ease(70.75+0.75, 1, "outExpo", 0, "invert")
	
	add(70, 0.75, "pop", 0.4*tinyMultFix, "tiny")
	add(70.75, 0.75, "pop", 0.4*tinyMultFix, "tiny")
	add(71.5, 0.75, "pop", 0.4*tinyMultFix, "tiny")
	
	for i = 72, 134-2, 2 do
		add(i, 1, "pop", 0.2, "scale")
		add(i+1, 1, "pop",0.2, "scale")
		
		add(i, 1, "pop", 0.4, "drunk")
		add(i+1, 1, "pop", -0.4, "drunk")
		
		if i % 4 == 0 then
			add(i, 2, "spike", -10, "skewx")
			add(i+1, 1, "pop", -10, "skewx")
		else
			add(i+1, 1, "pop", 10, "skewx")
			add(i, 2, "spike", 10, "skewx")
		end
	end
	
	
	add(72, 1, "smoothStepInOut", 10, "rotatez")
	add(72.5, 1, "smoothStepInOut", -25, "rotatez")
	add(73.5, 1, "cubeInOut", 35, "rotatez")
	add(73.5, 1, "cubeInOut", -25, "rotatey")
	add(73.5, 1, "cubeInOut", -25, "angley")
	
	add(74.5, 1, "smoothStepInOut", -20, "rotatez")
	add(74.5, 1.5, "smoothStepInOut", 25, "rotatey")
	add(74.5, 1.5, "smoothStepInOut", 25, "angley")
	
	
	add(73.9, 1.5, "pop", -0.34, "circx")
	add(73.9, 1.5, "pop", 22, "noteskewx")
	
	
	add(76, 3, "smoothStepInOut", 360*2, "anglez")
	
	add(79, 0.7, "expoOut", 1, "videogames")
	add(79.5, 0.7, "expoOut", -1, "videogames")
	
	
	add(80, 0.7, "expoOut", 112*0.5 , "x")
	add(80.5, 0.7, "expoOut", 112*0.5 , "x")
	
	add(81.4, 2, "pop", 5, "bumpy")
	add(81.4, 2, "pop", 2, "tipsyz")
	
	
	add(82, 2, "inOutCubic", 360, "angley")
	
	add(83.75, 1.5, "bell", -180, "blacksphere")
	
	ease(86, 1, "outBack", 1, "videogames")
	ease(87, 1, "outBack", 0, "videogames")
	
	ease(94, 0.75, "outBack", 1, "videogames")
	ease(94.75, 0.75, "outBack", 0, "videogames")
	
	add(84, 0.75, "bounce", 20, "rotatex")
	add(84.75, 0.75, "bounce", -20, "rotatex")
	add(84, 0.75, "bounce", 20, "anglex")
	add(84.75, 0.75, "bounce", -20, "anglex")
	
	add(85.5, 0.75, "outQuad", 20, "angley")
	add(85.5, 0.75, "outQuad", 20, "rotatey")
	
	add(87, 1, "outBack", -40, "angley")
	add(87, 1, "outBack", -40, "rotatey")
	add(87, 1, "outBack",112*-2, "x")
	
	add(88, 1.1, "inOutSine", -360, "angley")
	add(89, 3, "inOutCubic", 360, "angley")
	add(89, 3, "inOutCubic", 360, "anglez")
	
	add(89, 3, "inOutCubic", 20, "rotatey")
	add(89, 3, "inOutCubic", 20, "angley")
	
	ease(89, 3, "inOutCubic", 0, "x")
	
	add(92, 1, "bounce", 1, "bumpyx")
	
	add(94, 0.8, "outQuad", 0.2, "reverse")
	add(94.75, 0.8, "outQuad", -0.2, "reverse")
	
	
	add(99.5, 0.8, "outQuad", -45, "anglex")
	add(99.5, 0.8, "outQuad", -45, "rotatex")
	
	add(100.75, 0.8, "outBack", 45, "anglex")
	add(100.75, 0.8, "outBack", 45, "rotatex")
	
	add(101.25, 1.0, "outQuad", 1, "bumpyx")
	add(104, 1.0, "linear", -1, "bumpyx")
	
	add(101.25, 1.0, "tri", 1, "waveyy")
	add(101.25+1, 1.0, "tri", -0.71, "waveyy")
	add(101.25+2, 1.0, "tri", 0.3, "waveyy")
	
	
	
	
	
	
	local b = getNoteBeats(95.3, 97.19, "bf")
	for i, v in ipairs(b) do
		if(v[5] ~= "hurt")then
			add(v[1]-0.08, 0.4, "pop",-0.2, "centered--"..v[2])
		end
	end
	
	local b = getNoteBeats(107.85, 109.62, "bf")
	for i, v in ipairs(b) do
		if(v[5] ~= "hurt")then
			add(v[1]-0.08, 0.4, "pop",-0.2, "centered--"..v[2])
		end
	end
	
	
	local daLane = 2
	local b = getNoteBeats(97.425, 97.575, "bf")
	for i, v in ipairs(b) do
		daLane = v[2]
	end
	
	add(97.5, 1, "bounce",1, "movez--"..daLane)
	add(97.5, 0.9, "bounce",1, "scale--"..daLane)
	
	add(97.5, 1, "bounce",-1, "tipsy")
	add(97.5+1, 1, "bounce",0.4, "tipsy")
	
	
	local b = getNoteBeats(104.9, 105.15, "bf")
	for i, v in ipairs(b) do
		daLane = v[2]
	end
	
	if daLane >= 2 then
		add(105, 1, "sineOut",-0.5*upScrollFix, "bumpyx--"..daLane)
	else
		add(105, 1, "sineOut",0.5*upScrollFix, "bumpyx--"..daLane)
	end
	add(105, 1, "expoOut",-4, "straightholds--"..daLane)
	add(105, 1.0, "pop", 0.6*tinyMultFix, "tinyx--"..daLane)
	
	ease(106, 1, "expoOut",0, "straightholds--"..daLane)
	ease(106, 1, "expoOut",0, "bumpyx--"..daLane)
	
	add(105, 1, "sineOut",-0.2, "speedmod")
	
	add(106, 0.75, "outCubic",0.2, "speedmod")
	add(106, 1.1, "pop",0.21, "speedmod")
	
	add(106, 1, "outCubic",-180, "skewy")
	
	add(106, 2, "inOutCubic",360, "anglez")
	
	add(110, 1, "outSine",1, "tornado")
	add(110.5, 1, "inOutCubic",-2, "tornado")
	add(111.32, 1.3, "inOutSine",1, "tornado")
	
	
	add(112, 2, "bell",4.2, "bumpy")
	add(112, 1.5, "bell",2.2, "tipsyz")
	
	add(114-0.3, 1, "inOutSine",-0.61, "linearx")
	add(115-0.3, 1, "inOutSine",0.61*2, "linearx")
	add(115-0.3+0.7, 1, "inOutSine",-0.61, "linearx")
	
	local b = getNoteBeats(131.4, 131.6, "bf")
	for i, v in ipairs(b) do
		daLane = v[2]
	end
	if daLane >= 2 then
		add(131.5-0.1, 2, "pop",2, "drunk--"..daLane)
	else
		add(131.5-0.1, 2, "pop",-2, "drunk--"..daLane)
	end
	
	set(115.99,0, "anglez")
	ease(116, 0.65, "outExpo", -16, "rotatez")
	ease(116, 0.65, "outExpo", -16, "anglez")
	ease(117, 0.6, "outExpo", 16, "rotatez")
	ease(117, 0.6, "outExpo", 16, "anglez")
	
	add(116, 0.6, "outExpo", 112, "z")
	add(117, 0.6, "outExpo", 112, "z")
	
	local b = getNoteBeats(115.9, 117.89, "bf")
	for i, v in ipairs(b) do
		add(v[1]-0.06, 0.25, "pop",-1*tinyMultFix, "tiny--"..v[2])
		
		add(v[1]-0.06, 0.25, "pop",-0.5, "brake--"..v[2])
	end
	
	ease(118, 2, "smoothStepInOut", 0, "rotatez")
	ease(118, 2, "smoothStepInOut", 0, "anglez")
	ease(118, 2, "smoothStepInOut", -112, "x")
	add(118, 2, "smoothStepInOut", -112*2, "z")
	
	add(119.8, 1.5, "inOutQuad", -360*1.5, "angley")
	add(121.5, 1, "outQuint", 180, "angley")
	
	
	add(122, 1, "bounce",1, "tipsy")
	add(122+0.75, 1, "bounce",-0.4, "tipsy")
	
	
	ease(123, 3, "inOutSine",112, "x")
	add(123, 3, "inOutSine",360, "anglez")
	
	ease(126.5, 1.8, "inOutCubic",0, "x")
	add(126.5, 1.8, "inOutCubic",-180, "anglez")
	
	
	add(127.9, 4, "inOutCubic",-360*1.5, "anglez--0")
	add(127.9, 4, "inOutCubic",360*1.5, "anglez--1")
	add(127.9, 4, "inOutCubic",-360*1.5, "anglez--2")
	add(127.9, 4, "inOutCubic",360*1.5, "anglez--3")
	
	
	add(131.5-0.15, 1.5, "pop", -30, "rotatex--3")
	add(131.5-0.15, 1.5, "pop", -30, "anglex--3")
	
	
	add(131-0.1, 0.7, "pop", 1, "bumpyx")
	add(131.5-0.1, 0.7, "pop", -1, "bumpyx")
	
	
	set(129, suddenOffsetChorus, "sudden__offset")
	ease(130, 4, "linear", 1, "sudden")
	
	--sets("136, [0, anglez--0,0, anglez--1,0, anglez--2,0, anglez--3,0, anglez, 0, angley, 0, anglex, 0 ,skewy]")
	set(136, {0, "anglez--0", 0, "anglez--1", 0, "anglez--2", 0, "anglez--3", 0, "anglez", 0, "angley", 0, "anglex",0, "skewy"})

	
	chorus(136)
	
	set(200, 1, "3d")
	set(200, 0, "angle")
	set(200, 0, "sudden")
	
	
	ease(206, 1, "outBack", 1, "flip")
	ease(207, 1, "outBack", 0, "flip")
	ease(214, 1, "outBack", 1, "flip")
	ease(215, 1, "outBack", 0, "flip")
	
	
	ease(200, 1, "linear", 1, "vanish")
	ease(224, 1, "outQuint", 0, "vanish")
	
	
	
	ease(197.5, 2.5, "linear", 0.84, "speedmod")
	ease(264, 1, "outQuad", 1, "speedmod")
	
	add(264, 1.2, "pop", {7, "rotatez",7, "anglez",22, "rotatey",22, "angley"})
	add(264.9, 0.722, "bell", {2, "drunk",-45, "angley"})
	
	add(266, 2.5, "bounce", {2, "waveyy"})
	add(267.75, 2, "bounce", {-0.5, "waveyy"})
	add(266, 2.85, "bounce", {1, "waveyx"})
	add(268.5, 2.85, "bounce", {-1, "waveyx"})
	add(270, 2.85, "bounce", {-1, "waveyx"})
	
	for i = 275, 278-(1/3), 1/3 do
		local silly = (i-275)/2
		add(i, (1/3)*1.25, "impulse", {7*silly, "rotatez",7*silly, "anglez"})
	end
	add(278, 1, "pop", {10, "rotatez",10, "anglez"})
	ease(278, 0.25, "linear", {0.5, "circx"})
	ease(278.75, 0.4, "outBack", {0, "circx"})
	
	add(278, 1, "bounce", {45, "anglez",-33, "blacksphere"})
	

	add(279, 1, "impulse", {20, "noteskewx"})
	add(281, 1, "impulse", {20, "noteskewy"})
	add(281+2, 1, "impulse", {-20, "noteskewy"})
	add(281+4, 1, "impulse", {20, "noteskewy"})
	add(281+2+4, 1, "impulse", {-20, "noteskewy"})
	
	add(288, 1, "impulse", {20, "noteskewy"})
	add(289, 1, "impulse", {-20, "noteskewy"})
	add(288+2, 1, "impulse", {20, "noteskewy"})
	add(289+2, 1, "impulse", {-20, "noteskewy"})
	add(291.5, 1, "impulse", {20, "noteskewy"})
	
	
	add(294, 2, "linear", {0.4, "reverse"})
	add(295.5, 0.5, "inCubic", {-0.4, "reverse"})
	
	
	ease(223.5, 0.5, "linear", 0, "beat")
	
	add(224, 0.7, "outCubic", -22, "skewy")
	add(224, 0.7, "outCubic", -20, "skewx")
	
	add(225.5, 0.6, "outExpo", 20, "skewy")
	add(225.5+0.25, 0.6, "outExpo", -20, "skewy")
	add(225.5+0.5, 0.6, "outExpo", 20, "skewy")
	
	add(226.5, 0.6, "outExpo", -20, "skewy")
	
	add(227, 1.2, "outExpo", 40, "noteskewy")
	add(227, 1.2, "outExpo", 55, "skewx")
	add(228, 1.2, "outExpo", -15, "skewx")
	add(228, 1.2, "outExpo", -15, "skewy")
	
	add(229, 1.2, "inOutCubic",40, "skewy")
	ease(229, 1.2, "inOutCubic",0, "noteskewy")
	
	ease(230, 1.2, "outBack",0, "skewx")
	ease(232, 1, "outExpo",0, "skewy")
	
	add(230, 1, "bounce",20, "skewy")
	add(231, 1, "bounce",-20, "skewy")
	
	
	
	
	--add(286,1.3, "outCube", -180, "rotatey")
	--add(287,1.3, "outBack", -180, "rotatey")
	add(286,1.3, "outCube", 180, "blacksphereflip")
	add(287,1.3, "outBack", 180, "blacksphereflip")
	
	--add(291,5, "inOutSine", 360, "rotatey")
	add(291,5, "inOutSine", -360, "blacksphere")
	
	
	ease(263.5, 0.55, "linear", -0.2, "zigzag")
	ease(292.5, 1, "linear", 0, "zigzag")
	
	
	local b = getNoteBeats(263.9, 295.3, "bf")
	local bb = getNoteBeats(263.9, 278.25, "bf")
	for i, v in ipairs(b) do
	
		if(v[5] ~= "hurt") then
			add(v[1]-0.08, 0.4, "pop", -0.2, "centered--"..v[2])
		end

		--if(v[5] ~= hurt) then
			--add(v[1]-0.08, 0.4, "pop", -0.2, "centered--"..v[2])
		--end
	end
	
	
	for i = 296, 358-2, 2 do
		add(i+1, 2, flip("outSine"),0.5, "scale")
	end
	

	add(279, 2, "bounce",-0.13, "speedmod")
	for i = 281, 286,2 do
		add(i, 2, "bounce",-0.20, "speedmod")
	end
	for i = 287, 290.5,1 do
		add(i, 1, "bounce",-0.20, "speedmod")
	end
	add(291, 0.5, "bounce",-0.2, "speedmod")
	add(291.5, 0.5, "bounce",-0.25, "speedmod")
	
	add(292.5, 3, "bell",-0.20, "speedmod")
	--add(292.5, 2.9, "bell",300, "sudden__offset")
	
	add(292.5, 2.9, "outExpo", 300, "sudden__offset")
	add(294, 1.5, "inExpo", -300, "sudden__offset")
	
	
	
	
	set(291.9, suddenOffsetChorus, "sudden__offset")
	ease(292.5, 1, "linear",1, "sudden")
	ease(328.5, 1, "inOutSine",0, "sudden")
	
	
	ease(328, 0.5, "outBack", 112*-2.5, "z")
	ease(328, 1, "bounce",0.25, "brake")
	
	set(328, 1, "3d")
	
	add(329, 29, "linear",4, "bumpy")
	add(330+13, 29-12, "linear",-4, "bumpy")
	
	
	add(329, 29, "linear",360*8, "rotatey")
	add(329, 29, "linear",360*8, "angley")
	
	add(329, 29, "smoothStepInOut",360*6, "rotatey")
	add(329, 29, "smoothStepInOut",360*6, "angley")
	
	add(329, 29, "smoothStepInOut",360*-5, "rotatez")
	add(329, 29, "smoothStepInOut",360*-5, "anglez")
	
	set(359.2, {0, "3d", 0, "anglex", 0 ,"anglez", 0 ,"angley", 0, "rotatez", 0 ,"rotatey", 0 ,"rotatex"})
	
	
	ease(358, 1, "outSine",1, "sudden")
	ease(358, 0.5, "outExpo",0.5, "stealth")
	ease(359, 0.5, "outExpo",0.0, "stealth")
	
	chorus(360)
	
	ease(423, 1, "smoothStepInOut",0, "sudden")
	ease(423, 1, "smoothStepInOut",-112, "z")
	
	
	ease(422, 3, "smoothStepInOut",3, "bumpy")
	ease(451, 2, "smoothStepOut",0, "bumpy")
	
	
	add(419, 1, "pop",{-9, "skewx", 0.09, "tornado"})
	add(419+2, 1, "pop",{11, "skewx", 0.14, "tornado"})
	add(419+4, 1, "pop",{-13.9, "skewx", 0.23, "tornado"})
	
	
	ease(424, 1, "smoothStepOut",1, "stealthglowred")
	ease(424, 1, "smoothStepOut",0, "stealthglowblue")
	ease(424, 1, "smoothStepOut",0, "stealthglowgreen")
	
	ease(451, 1, "expoOut",1, "stealthglowred")
	ease(451, 1, "expoOut",1, "stealthglowblue")
	ease(451, 1, "expoOut",1, "stealthglowgreen")
	
	
	
	
	for i = 424, 452-4, 4 do
	
		add(i, 1, "inExpo", 24, "skewx")
		add(i+1, 1, "outCube", -24, "skewx")
		
		add(i+2, 1, "inExpo", -24, "skewx")
		add(i+1+2, 1, "outCube", 24, "skewx")
		
		add(i+1, 1, "impulse", 1, "scale")
		add(i+3, 1, "impulse", 1, "scale")
		
		add(i+0, 1, "impulse", 0.7, "scale")
		add(i+2, 1, "impulse", 0.7, "scale")
	
		
		add(i+1, 1, "pop",1, "stealth")
		add(i+3, 1, "pop",1, "stealth")
		add(i+1, 1, "pop",0.5, "tornado")
		add(i+3, 1, "pop",0.5, "tornado")
		
		add(i+1-0.05, 1, "pop",0.22, "flip")
		add(i+3-0.05, 1, "pop",0.22, "flip")
	end
	

	local weee = getNoteBeats(450.9, 451.2, "bf")
	for i, v in ipairs(weee) do
	
		set(450, 1,"spiralholds--"..v[2],"bf")
		set(452.4, 0,"spiralholds--"..v[2],"bf")
	
		add(451, 1.3, "outCubic", -360, "notesrotatez--"..v[2], "bf")
	end
	
	add(451, 1.3, "outCubic", -360, "anglez")
	
	
	
	
	
	for i = 456, 518-1 do
		add(i, 1, "pop", 0.4, "scale")
		if i % 2 == 1 then
			add(i, 1, flip("outSine"), 1, "tipsy")
		end
		
	end
	
	
	set(456, 1, "3d")
	add(457.85, 1.5, "bounce", 0.5, "speedmod")
	add(457.85-1, 1, "bounce", -0.3, "speedmod")
	
	
	add(456, 1, "bounce", -8, "rotatez")
	add(457.85-1, 1, "bounce", 15, "rotatez")
	add(457.85, 1.5, "bounce", 15-7, "rotatez")
	add(457.85, 1.5, "outSine", 7, "rotatez")
	
	add(458, 1.5, "outSmoothStep", 112*-1.5, "x")
	
	add(460, 2, "inOutSmoothStep", 360*2, "angley")
	add(460, 2.5, "bell", 0.72, "zigzag")
	add(460+1, 2, "inOutSmoothStep", 360, "angley")
	
	add(458, 2, "impulse", -1*tinyMultFix, "tinyy")
	
	
	add(457, 1, "outCube", 180, "rotatey")
	add(458, 1, "outCube", -180, "rotatey")
	
	
	add(465.5, 1, "outCube", -360, "anglez")
	
	set(465.5, 12, "drunk--3__speed")
	add(465.5, 1.5, "impulse", -2, "drunk--3")
	ease(463, 1, "linear", 0.5, "longholds")
	ease(466, 1, "linear", 0, "longholds")
	
	
	add(463, 0.8, "outQuint", 1, "videogames")
	add(463.5, 0.8, "outQuint", -1, "videogames")
	
	add(464, 0.8, "outQuint", 1, "invert")
	add(464.5, 0.8, "outQuint", -1, "invert")
	add(464.5, 0.8, "outQuint", 1, "flip")
	add(465.5, 0.8, "outQuint", -1, "flip")
	
	add(465.5, 1, "pop", 3, "waveyz")
	local b = getNoteBeats(466.45, 467.9, "bf")
	for i, v in ipairs(b) do
		if(v[5] ~= "hurt")then
			add(v[1]-0.08, 0.4, "pop",-0.2, "centered--"..v[2])
		end
	end
	
	local b = getNoteBeats(471.5, 472.9, "bf")
	for i, v in ipairs(b) do
		if(v[5] ~= "hurt")then
			add(v[1]-0.08, 0.7, "pop",-0.2, "centered--"..v[2])
		end
	end
	
	add(468, 1, "bounce", 0.1, "reverse")
	add(469, 1, "bounce", -0.1, "reverse")
	
	add(483.125, 1.5, "inOutSine", -360, "blacksphere")
	
	add(486, 1, "bounce", -0.15, "reverse")
	add(487, 1, "bounce", -0.15, "reverse")
	add(486, 1, "bounce", 1, "scaley")
	add(487, 1, "bounce", 1, "scaley")
	
	add(490.35, 1.57, "inOutCubic",-360, "anglez")
	add(490.5, 1, "inOutCubic",100, "x")
	add(496, 3, "inOutSmootherStep",-100, "x")
	
	add(506, 0.83, "outSmootherStep",180, "blacksphere")
	add(506.75, 0.75, "inOutSmootherStep",-180, "blacksphere")
	add(506.75, 0.75, "inOutSmootherStep",180, "blacksphereflip")
	add(507.5, 0.75, "inOutSmootherStep",-180, "blacksphereflip")
	
	add(508,3, "inOutSmootherStep",-360, "blacksphere")
	add(510.7,1.7, "inOutSmootherStep",-360, "anglez")
	ease(510.7,1.7, "inOutSmootherStep",112*2, "x")
	add(510.7,1.7, "inOutSmootherStep",-45, "rotatey")
	add(510.7,1.7, "inOutSmootherStep",45, "angley")
	
	add(512,1.5, "inOutCubic",360, "anglex")
	
	
	add(512.9, 3, "inOutCubic",-360*2, "anglez--0")
	add(512.9, 3, "inOutCubic",360*2, "anglez--1")
	add(512.9, 3, "inOutCubic",-360*2, "anglez--2")
	add(512.9, 3, "inOutCubic",360*2, "anglez--3")
	
	ease(511.5, 3, "inOutSmootherStep",-1.2, "bumpy")
	ease(515, 1, "inOutSmootherStep",-0.6, "bumpyx")
	ease(515.5, 1, "inOutSmootherStep",0, "bumpy")
	ease(517.9, 3, "inOutSmootherStep",0, "bumpyx")
	

	
	ease(513.7,1.7, "inOutSmootherStep",-64, "x")
	ease(513.7+1.7,1.7, "inOutSmootherStep",0, "x")
	add(513.7,1.7, "inOutSmootherStep",45, "rotatey")
	add(513.7,1.7, "inOutSmootherStep",-45, "angley")
	
	ease(458, 1, "linear", 0.7, "drawdistance")
	ease(516.4, 0.5, "linear", 1.1, "drawdistance")
	ease(519.5, 0.5, "linear", 0.5, "drawdistance")
	
	ease(470, 1, "outBack", 0, "rotatez")
	ease(470, 1, "outBack", 0, "x")
	ease(470, 1, "outBack", -33, "rotatex")
	ease(471, 1, "outBack", 180, "rotatex")
	
	add(473.37, 3, "inOutCubic", -360, "anglez")
	
	ease(473.5, 2, "inOutSine", 112*1.5, "x")
	
	add(475.4, 1, "inOutSine", -0.22, "speedmod")
	add(483, 5, "inOutSine", 0.22, "speedmod")
	
	
	add(477.5, 1, "bounce", 0.5*tinyMultFix, "tinyx")
	
	
	ease(481.39, 1.52, "bell", 1, "tornado")
	add(481.39, 1.52, "bell", -0.28*tinyMultFix, "tinyx")
	add(482.48, 1.3, "pop", 0.25*tinyMultFix, "tinyx")
	
	add(478, 1.3, "outQuint", -180, "rotatey")
	add(478.9, 1.2, "outQuint", -180, "rotatey")
	
	add(475.8, 1.2, "bell", 70, "rotatey--0")
	add(475.8, 1.2, "bell", 70, "angley--0")
	add(475.8, 1.2, "bell", -70, "rotatey--3")
	add(475.8, 1.2, "bell", -70, "angley--3")
	
	
	add(479, 2, "smootherStepInOut", -22, "angley")
	add(479, 2, "smootherStepInOut", 22, "rotatey")
	ease(479, 2, "smootherStepInOut", 112*-1.5, "x")
	
	add(488, 1, "bounce", 23, "anglex")
	add(489, 1, "bounce", -23, "anglex")
	add(488, 1, "bounce", 23, "rotatex")
	add(489, 1, "bounce", -23, "rotatex")
	
	add(490, 1, "outBack", 22, "angley")
	add(490, 1, "outBack", -22, "rotatey")
	
	
	add(490-0.5, 1, "inverse", 90, "skewy")
	
	
	
	add(493.9, 1, "bounce", 1, "drunk")
	add(494.5, 1.4, "bounce", -2, "drunk")
	
	
	set(492, 360, "anglez")
	ease(499.5, 1, "inOutExpo", 0, "x")
	add(500, 0.5, "outBack", -30, "rotatez")
	add(500, 0.5, "outBack", 30, "anglez")
	add(500, 0.5, "outBack", -25, "anglex")
	add(500, 0.5, "outBack", -25, "rotatex")
	
	add(501, 0.5, "outBack", 45, "rotatez")
	add(501, 0.5, "outBack", -45, "anglez")
	add(501, 0.5, "outBack", -30, "anglex")
	add(501, 0.5, "outBack", -30, "rotatex")
	
	add(501.5, 0.5, "linear", 1*upScrollFix, "bumpy")
	ease(503.8, 1, "inOutSmoothStep", 0, "bumpy")
	
	ease(504, 1, "inOutSmoothStep", 180, "rotatex")
	ease(504, 1, "inOutSmoothStep", 0, "anglex")
	ease(504, 1.2, "inOutSmoothStep", 0, "anglez")
	ease(504, 1, "inOutSmoothStep", 0, "rotatez")
	
	add(506, 0.8, "bounce", 13, "rotatez")
	add(506.75, 0.85, "bounce", -13, "rotatez")
	
	add(508, 2.5, "inOutSmoothStep", 45*upScrollFix, "rotatex")
	add(511, 1.5, "inOutCubic", -45*upScrollFix, "rotatex")
	
	
	
	
	
	
	
	
	local b = getNoteBeats(499.8, 501.8, "bf")
	for i, v in ipairs(b) do
		if(v[5] ~= "hurt")then
			add(v[1]-0.08, 0.25, "pop",0.5, "scale--"..v[2])
		end
	end
	
	
	
	for i = 518, 519.8, 1/3 do
		add(i, 1/3, flip("outCube"), 1, "scale")
		add(i, 1/3, "outExpo", 1/6, "reverse")
	end
	add(518, 2, "inQuint", -2, "bumpy")

	
	set(520, {0, "anglex", 0 ,"anglez", 0 ,"angley", 0, "rotatez", 0 ,"rotatey", 0 ,"rotatex",0,"reverse"})

	
	add(527.37, 2, "inOutCubic", 360, "anglez")
	add(527.37+32, 2, "inOutCubic", -360, "anglez")
	
	add(532, 4, "smootherStepInOut", 360, "rotatey")
	
	
	
	
	set(517,15.785+12,"waveyx__speed")
	set(517,14.333+12,"waveyy__speed")
	set(517,12+12,"waveyz__speed")
	
	add(520, 2.5, "impulse", -0.475, "waveyx")
	add(520, 2.5, "impulse", 0.22, "waveyy")
	
	add(524, 3.5, "impulse", -1, "waveyx")
	add(524, 3.5, "impulse", 0.6, "waveyy")
	
	add(528, 3.5, "impulse", 1.1, "waveyx")
	add(528, 3.5, "impulse", 0.7, "waveyy")
	
	add(536, 3.5, "impulse", 1, "waveyx")
	add(536, 3.5, "impulse", 1, "waveyy")
	
	add(540, 3.5, "impulse", -0.75, "waveyx")
	add(540, 3.5, "impulse", 0.3, "waveyy")
	
	add(544, 4, "impulse", 0.4, "waveyx")
	add(544, 4, "impulse", 0.2, "waveyy")
	
	add(552, 4, "impulse", 0.9, "waveyx")
	add(552, 4, "impulse", 0.7, "waveyy")
	
	add(556, 4, "impulse", 0.5, "waveyx")
	add(556, 4, "impulse", -0.4, "waveyy")

	add(564, 4.2, "tri", 2, "waveyz")
		
	add(567.9, 4, "impulse", -0.55, "waveyx")
	add(567.9, 4, "impulse", -0.2, "waveyy")
	
	add(571.9, 4, "impulse", 0.7, "waveyx")
	add(571.9, 4, "impulse", -0.2, "waveyy")
	
	add(575.9, 4, "impulse", 0.7, "waveyx")
	add(575.9, 4, "impulse", -0.8, "tipsy")
	
	
	chorus(520)
	add(548.5, 3.5, "inOutSine", 360, "blacksphere")
	
	set(518,suddenOffsetChorus, "sudden__offset")
	add(518, 2, "inOutQuad", 1, "sudden")
	
	
	local b = getNoteBeats(519.8,585,"dad")
	
	local daKickLane = 0 --Done like this to account for shuffle modifiers
	for i, v in ipairs(b) do
	
		if v[1] <= 520.275 and v[1] > 519.8 then
			daKickLane = v[2]
		end
	
		if v[2] == daKickLane then
			add(v[1], 0.5, flip("outSine"), 0.6, "scalex")
		else 
			add(v[1], 1, flip("outSine"), 0.8, "scalex")
			add(v[1], 1, flip("outSine"), 1.2, "scaley")
		end
	end
	
	
	add(583, 2, "inOutSine", 100, "sudden__offset")
	
	for i = 584, 591 do
		add(i, 1, "bounce", 0.08, "reverse")
		add(i, 1, "bounce", 0.2*tinyMultFix, "tiny")
	end	
	
	for i = 584, 592-1,4 do
		add(i, 1, "inExpo", 24, "skewx")
		add(i+1, 1, "outCube", -24, "skewx")
		
		add(i+2, 1, "inExpo", -24, "skewx")
		add(i+1+2, 1, "outCube", 24, "skewx")
	end	
	
	
	add(591, 1, "inExpo", 0.5, "flip")
	add(592, 1.5, "inOutSmoothStep", -1.5, "centered")
	
end







