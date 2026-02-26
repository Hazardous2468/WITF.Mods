function onCreate()
	notesBehindHUD(true)
end
local tinyMultFix = 2 --WITF 1.0.0a fix

function setUp()
	invertForDad(false)	
	centerPlayer("")
	
	createNewPlayer(true)
	hideNotifs(true)
end


function funnyBeat(when)
	for i = when, when+4.5, 1.5 do
		add(i, 1.5 , "pop", -1.55*tinyMultFix, "tiny")
		
		add(i, 1.5 , "pop", -0.4, "flip")
	end
	
	add(when, 1.5 , "pop", -0.2, "speedmod")
	add(when+1.5, 1.5 , "pop", -0.2, "speedmod")
	add(when+3, 1.5 , "pop", -0.2, "speedmod")
	add(when+4.5, 1.5 , "pop",-0.2, "speedmod")
	
	add(when, 1.5 , "bounce", -20, "rotatez")
	add(when+1.5, 1.5 , "bounce", 20, "rotatez")
	add(when+3, 1.5 , "bounce", -20, "rotatez")
	add(when+4.5, 1.5 , "bounce",20, "rotatez")
	
	add(when, 1.5/2 , "pop",45, "rotatey")
	add(when+1.5, 1.5/2 , "pop", -45, "rotatey")
	add(when+3, 1.5/2 , "pop", 45, "rotatey")
	add(when+4.5, 1.5/2 , "pop",-45, "rotatey")
	
	add(when, 1.5/2 , "pop",1.75, "tipsy")
	add(when+1.5, 1.5/2 , "pop", -1.75, "tipsy")
	add(when+3, 1.5/2 , "pop", 1.7, "tipsy")
	add(when+4.5, 1.5/2 , "pop",-1.7, "tipsy")
	
end



function buildup_PulsePlayer(when,who)
	ease(when, 1, "sineInOut", 0, "alpha", who)
	ease(when+2, 3, "sineInOut", 1, "alpha", who)	
end


local buildupkickalt = 1
function buildup_Kick(when, length, mult)
	add(when, length, "pop", 1 * buildupkickalt*mult, "tipsy")
	add(when, length, "pop", 0.3 * buildupkickalt*mult, "drunk")
	
	if buildupkickalt == 1 then
		buildupkickalt = -1
	else 
		buildupkickalt = 1
	end
end

buildupKicksTest = {}
function buildupKickTableInsert(i, length, intense)
	table.insert(buildupKicksTest,
	{
		when=i, 
		beatLength=length ,
		intensityMult=intense 
	})
end
	



local third = 1/3

function modsTimeline()	
	
	setdefault(1, "oldstealthholds")
	
	setdefault(1,"drawdistance")
	
	setdefault(-222,"movex",2)
	setdefault(-222*112,"debugx",2)
	setdefault(1,"alpha",2)
	setdefault(-10,"centered",2)
	
	setasleep(0, "dad", true) --dad doesn't do anything lmao
	targetExclude("dad")
	
	setdefault(1, 'showlanemods')
	--setdefault(1, 'showzerovalue')
	
	
	--setdefault(0, 'spiralholds')
	
	setdefault(1,"stealthglowred")
	setdefault(1,"stealthglowgreen")
	setdefault(1,"stealthglowblue")
	
	setdefault(1, "orient2__alt")
	
	
	setdefault(-200, 'movex',3)
	setdefault(-200*112,"debugx",3)

	
	set(-8, 0.35, "speedmod",1)
	ease(0, 4, "sineInOut", 1 , "speedmod",1)
	set(-8, 0.5, "dizzy",1)
	ease(0, 4, "sineInOut", 0 , "dizzy",1)
	
	for i = 0, 3 do
		--set(-16, -1, "centered--"..i, 1)
		set(-16, -1, "reverse--"..i, 1)
	end
	--[[
	ease(0, 1 , "backOut", 0, "centered--0",1)
	ease(1, 1 , "backOut", 0, "centered--1",1)
	ease(2, 1 , "backOut", 0, "centered--2",1)
	ease(3, 1 , "backOut", 0, "centered--3",1)
	]]--
	ease(0, 1 , "backOut", 0, "reverse--0",1)
	ease(1, 1 , "backOut", 0, "reverse--1",1)
	ease(2, 1 , "backOut", 0, "reverse--2",1)
	ease(3, 1 , "backOut", 0, "reverse--3",1)
	
	
	set(-16, 1,"stealth",1)
	ease(0, 0.5 , "sineOut", 0.5, "stealth",1)
	
	set(0.9, 0,"stealth",1)
	set(1.35, 0.5,"stealth",1)
	set(1.8, 0.0,"stealth",1)
	set(2.3, 0.5,"stealth",1)
	set(3, 0.0,"stealth",1)
	set(3.51, 0.5,"stealth",1)
	set(4, 0.0,"stealth",1)
	
	add(9.5, 0.5 , "sineOut", -0.12, "speedmod",1)
	if downscroll then
		ease(9.5, 0.5 , "sineOut", -0.5, "lineary",1)
		--ease(9.5, 0.5 , "sineOut", 1, "circy",1)
		ease(9.5, 0.5 , "sineOut",-0.07, "circy",1)
	else
		ease(9.5, 0.5 , "sineOut", -0.5, "lineary",1)
		ease(9.5, 0.5 , "sineOut",-0.07, "circy",1)
	end
	
	add(11.97, 0.5 , "expoOut", 0.12, "speedmod",1)
	ease(11.97, 0.5 , "expoOut", 0, "lineary",1)
	ease(11.97, 0.5 , "expoOut", 0, "circy",1)
	
	set(9.5, 0.5,"stealth--0",1)
	set(10, 0.0,"stealth--0",1)
	set(10, 0.5,"stealth",1)
	
	set(10.35, 0.0,"stealth",1)
	
	set(11.25, 0.5,"stealth",1)
	set(11.5, 0.0,"stealth",1)
	
	
	
	funnyBeat(4)
	funnyBeat(12)
	
	funnyBeat(196)
	funnyBeat(204)
	
	funnyBeat(356)
	funnyBeat(356+8)
	
	local funnyDifference = 370 - 18
	
	set(0+funnyDifference, 2, "drunk__speed")
	set(0+funnyDifference, 0.5, "drunk__mult")
	add(18+funnyDifference, 2 , "backInOut", -360, "angle")
	
	ease(18+funnyDifference, 2, "linear", 0.75, "orient2")
	
	ease(18+funnyDifference, 2 , "backInOut", 1.3, "drunk")
	--ease(1+funnyDifference8, 2 , "sineInOut", 0.5, "tipsy")
	
	
	add(20+funnyDifference, 1 , "pop", 30, "noteskewy")
	add(22+funnyDifference, 1 , "pop", -1*tinyMultFix, "tiny")
	add(23.5+funnyDifference, 1 , "pop", -29, "noteskewy")
	add(25+funnyDifference, 1 , "pop", 30, "noteskewy")
	add(26+funnyDifference, 1 , "pop", -1*tinyMultFix, "tiny")
	
	add(376.5, 1 , "pop", -25, "noteskewx")
	add(379, 1 , "pop", 25, "noteskewx")
	add(380, 1 , "pop",-25, "noteskewx")
	
	add(20+8+funnyDifference, 1 , "pop", -30, "noteskewy")
	add(22+8+funnyDifference, 1 , "pop", -1*tinyMultFix, "tiny")
	add(23.5+8+funnyDifference, 1 , "pop", 29, "noteskewy")
	add(25+8+funnyDifference, 1 , "pop", -30, "noteskewy")
	add(26+8+funnyDifference, 1 , "pop", -1*tinyMultFix, "tiny")
	
	
	
	set(0, 2, "drunk__speed")
	add(18, 2 , "backInOut", 360, "angle",1)
	
	ease(18, 2, "linear", 0.75, "orient2")
	
	
	
	add(20, 1 , "pop", 30, "noteskewy",1)
	add(22, 1 , "pop", -1*tinyMultFix, "tiny",1)
	add(23.5, 1 , "pop", -29, "noteskewy",1)
	add(25, 1 , "pop", 30, "noteskewy",1)
	add(26, 1 , "pop", -1*tinyMultFix, "tiny",1)
	
	add(20+8, 1 , "pop", -30, "noteskewy",1)
	add(22+8, 1 , "pop", -1*tinyMultFix, "tiny",1)
	add(23.5+8, 1 , "pop", 29, "noteskewy",1)
	add(25+8, 1 , "pop", -30, "noteskewy",1)
	add(26+8, 1 , "pop", -1*tinyMultFix, "tiny",1)
	
	
	ease(18, 2 , "backInOut", 1.3, "drunk",1)
	ease(34, 2 , "sineInOut", -0.22, "drunk")
	ease(18, 2 , "sineInOut", 0.5, "tipsy",1)
	ease(34, 2 , "sineInOut", -0.1, "tipsy")
	
	ease(34, 2 , "sineInOut", 112, "x",1)
	
	ease(34, 2 , "sineInOut", 300, "debugx",1)
	ease(34, 2 , "sineInOut", -300, "debugx",3)
	
	set(32, 1, "alpha", 3)
	ease(32, 4 , "sineInOut", 0, "x",3)
	
	ease(210, 2 , "sineInOut", 300, "debugx",1)
	ease(210, 2 , "sineInOut", -300, "debugx",3)
	
	
	
	--set positions lol
	set(39.5, -2*112,"x",3)
	set(39.5, 0,"movex",3)
	
	
	set(43, 2*112,"x",1)
	set(43, -1*112,"z",1)
	set(43, -11,"rotatez",1)
	set(43, -11,"rotatey",1)
	
	set(47, -2.4*112,"x",3)
	set(47, -0.5*112,"z",3)
	if downscroll then
		set(47, -0.5,"centered",3)
	else
		set(47, 0.1,"centered",3)
	end
	set(47, 20,"rotatez",3)
	
	set(51, 20,"rotatey",1)
	set(51, 1,"reverse",1)
	set(51, 2.2*112,"x",1)
	set(51, -9,"rotatez",1)
	
	set(55, -2*112,"z",3)
	set(55, 0,"centered",3)
	set(55, -20,"rotatez",3)
	
	set(59, 0,"rotatey",1)
	set(59, 0.90,"reverse",1)
	set(59, 2.0*112,"x",1)
	set(59, -0.5,"centered",1)
	set(59, 10,"rotatez",1)
	
	set(63, -30,"rotatey",3)
	set(63, 0.90,"reverse",3)
	set(63, -2.0*112,"x",3)
	set(63, -0.5,"centered",3)
	set(63, 0,"rotatez",3)
	
	set(67, 0.00,"reverse",1)
	set(67, -0.0*112,"x",1)
	set(67, -0.0,"centered",1)
	set(67, 0,"rotatez",1)
	
	ease(67, 1 , "linear", 1, "beat")
	
	set(71,-0.05,"centered",3)
	set(71, -2.5*112,"x",3)
	set(71, -40,"rotatey",3)
	
	
	set(75,0,"centered",1)
	set(75, 1.9*112,"x",1)
	set(75, -40,"rotatey",1)
	
	set(79,0,"reverse",3)
	set(79, -1.9*112,"x",3)
	set(79, 40,"rotatey",3)
	
	add(91, 5, "cubeIn", -20*112, "z", 1)
	ease(91, 5, "cubeIn", 0.5, "flip", 1)
	
	ease(92, 1, "sineInOut", 0, "alpha", 1)
	ease(92+2, 2, "sineInOut", 1, "alpha", 1)
	
	reset(96)
	
	set(96, -20*112, "z", 1)
	ease(96, 4, "cubeOut", 0, "z", 1)
	
	set(96, 0.75, "speedmod")
	ease(98, 6, "cubeInOut", 1, "speedmod", 1)
	
	set(96, 1, "alpha")
	ease(96, 4, "sineInOut", 0, "alpha", 1)
	set(96, 70, "holdgrain")
	
	set(164, 1, "zsort")
	set(196, 0, "zsort")
	set(196, 0, "spiralholds")
	
	set(210, 1, "zsort")
	set(210,1, "spiralholds")
	set(292, 0, "zsort")
	set(292,0, "spiralholds")
	set(308, 1, "zsort")
	set(308,1, "spiralholds")
	set(324, 0, "spiralholds")
	set(324, 0, "zsort")
	set(340, 1, "zsort")
	
	

	for i = 68, 96-8, 8 do
		buildupKickTableInsert(0 + i, 1, 1)
		buildupKickTableInsert(1 + i, 1, 1)
		buildupKickTableInsert(2 + i, 0.5, 1)
		buildupKickTableInsert(2.5 + i, 0.5, 1)
		buildupKickTableInsert(3 + i, 1, 1)
		buildupKickTableInsert(4 + i, 1, 1)
		buildupKickTableInsert(5 + i, 0.5, 1)
		buildupKickTableInsert(5.5 + i, 0.5, 1)
		buildupKickTableInsert(6 + i, 1, 1)
		buildupKickTableInsert(7 + i, 1, 1)
		--buildupKickTableInsert(8 + i, 1, 1)	
	end
	
	for i = 92, 96-0.5, 0.5 do
		local multAmount = (i-92) / (96 - 92)
	
		buildupKickTableInsert(i, 0.5, 1-multAmount)
	end
	
	--trace(buildupKicksTest)

	for i, v in pairs(buildupKicksTest) do
		buildup_Kick(v.when, v.beatLength, v.intensityMult)
    end
	
	
	
	
	for i = 36, 96-8, 8 do
		buildup_PulsePlayer(i, 1)
		buildup_PulsePlayer(i+4, 3)
	end
	
	set(98,1, "drunk__mult", 1)
	add(96, 4, "sineIn", 360*5, "strumrotatey", 1)
	
	if downscroll then
		set(100,0.5, "bumpy__mult", 1)
	else
		set(100,-0.5, "bumpy__mult", 1)
	end
	ease(100, 4, "pop", -10, "bumpy", 1)
	add(100, 2, "cubeOut", 360, "strumrotatey", 1)
	
	set(100,6, "drunk__speed", 1)
	ease(100, 4, "pop", 2, "drunk", 1)
	ease(100, 4, "pop", 2, "tipsyz", 1)
	
	local lazyAlternate = 1
	
	for i = 102, 105-third , third do
		if lazyAlternate == 1 then
			lazyAlternate = -1
		else
			lazyAlternate = 1	
		end
		add(i, third, "pop", 1.9*lazyAlternate, "tipsy", 1)
		add(i, third, "pop", 1.1*lazyAlternate, "waveyx", 1)
		add(i, third, "pop", -0.5*tinyMultFix, "tiny", 1)
	end
	
	for i = 118, 121-third , third do
		if lazyAlternate == 1 then
			lazyAlternate = -1
		else
			lazyAlternate = 1	
		end
		add(i, third, "pop", 1.9*lazyAlternate, "tipsy", 1)
		add(i, third, "pop", 1.1*lazyAlternate, "waveyx", 1)
		add(i, third, "pop", -0.5*tinyMultFix, "tiny", 1)
	end
	
	for i = 143, 146-third , third do
		if lazyAlternate == 1 then
			lazyAlternate = -1
		else
			lazyAlternate = 1	
		end
		add(i, third, "pop", 1.9*lazyAlternate, "tipsy", 1)
		add(i, third, "pop", 1.1*lazyAlternate, "waveyx", 1)
		add(i, third, "pop", -0.5*tinyMultFix, "tiny", 1)
	end
	
	add(114, third, "quadOut", 10, "rotatez", 1)
	add(114+third+third, third, "quadOut", 10, "rotatez", 1)
	add(114+third+third+third+third, third, "quadOut", 10, "rotatez", 1)
	
	ease(114, third, "quadOut", 1, "invert", 1)
	ease(114+third+third, third, "quadOut", 0, "invert", 1)
	ease(114+third+third+third+third, third, "quadOut", 1, "invert", 1)
	ease(116, 1.0, "backOut", 0, "invert", 1)
	
	add(114, third, "quadOut", 10, "rotatez", 1)
	add(114+third+third, third, "quadOut", 10, "rotatez", 1)
	ease(116, 1.5, "backOut", 0, "rotatez", 1)
	ease(116, 1.5, "bounce", 45, "rotatey", 1)
	
	add(145.9, 1, "pop", -40, "noteskewy", 1)
	add(145.9, 1, "pop", -2*tinyMultFix, "tiny", 1)
	add(147, 3, "bounce", 20, "noteskewx", 1)
	
	add(105, 1, "bounce", -30, "noteskewy", 1)
	add(106, 1, "bounce", -50, "noteskewx", 1)
	add(106, 2, "backOut", 360, "notesangle", 1)
	
	add(105, 0.5, "pop", -0.9*tinyMultFix, "tiny")
	add(106, 0.75, "pop", -1.4*tinyMultFix, "tiny")
	
	add(105+16, 1, "bounce", -30, "noteskewy", 1)
	add(106+16, 1, "bounce", -50, "noteskewx", 1)
	add(106+16, 2, "backOut", 360, "notesangle", 1)
	
	add(105+16, 0.5, "pop", -0.9*tinyMultFix, "tiny")
	add(106+16, 0.75, "pop", -1.4*tinyMultFix, "tiny")
	
	add(130, 2, "pop", -20, "noteskewx")
	add(130, 2, "cubeOut", -360, "angle")
	
	add(105, 1.5, "pop", -8, "rotatez")
	add(106, 2, "pop", 25, "rotatez")
	add(105.9, 2, "bell", 1, "invert")
	add(105+16, 1.5, "pop", -8, "rotatez")
	add(106+16, 2, "pop", 25, "rotatez")
	add(106+16, 2, "bell", 1, "invert")
	
	add(108, 2, "quadOut", 360, "strumrotatey", 1)
	ease(108, 2, "cubeOut", 0.5, "speedmod", 1)
	
	ease(116, 2, "cubeIn", 0.9, "speedmod", 1)
	
	for l = 0, 3 do
		add(108, 2, "cubeOut", 1, "reverse--"..l, 1)
	end
	
	add(110, 2, "bell", -1, "reverse--0", 1)
	add(110, 2, "bell", -1, "reverse--2", 1)
	add(112, 2, "bell", -1, "reverse--1", 1)
	add(112, 2, "bell", -1, "reverse--3", 1)
	
	--ease(108, 2, "linear", 1 , "longholds",1)
	add(108, 2, "sineInOut", 1 , "longholds--0",1)
	add(108, 2, "sineInOut", 1 , "longholds--1",1)
	add(108, 2, "sineInOut", 1 , "longholds--2",1)
	add(108, 2, "sineInOut", 1 , "longholds--3",1)
	
	
	--add(112, 2, "sineInOut", 10 , "longholds--0",1)
	
	
	add(131, 1, "pop", -33, "noteskewy")
	add(131, 1, "pop", 0.22, "tipsyx")
	
	ease(116, 2, "sineInOut", 0 , "longholds--0",1)
	ease(116, 2, "sineInOut", 0 , "longholds--1",1)
	ease(116, 2, "sineInOut", 0 , "longholds--2",1)
	ease(116, 2, "sineInOut", 0 , "longholds--3",1)
	
	
	--ease(108, 2, "linear", 0.01 , "linearx--3",1)
	--ease(108, 2, "linear", 0.05 , "drunk--3",1)
	--ease(108, 2, "linear", -20 , "straightholds--3",1)
	
	--ease(114, 0.3, "sineOut", 0 , "straightholds--3",1)
	--set(114+(third*2),-8, "straightholds--3",1)
	--ease(114+(third*2), 0.3, "sineOut", 0 , "straightholds--3",1)
	--set(114+(third*4),-5, "straightholds--3",1)
	--ease(114+(third*4), 0.3, "sineOut", 0 , "straightholds--3",1)
	
	--ease(116, 0.3, "sineOut", 0 , "straightholds--3",1)
	--ease(116, 0.3, "sineOut", 0 , "drunk--3",1)
	--ease(116, 0.3, "sineOut", 0 , "linearx--3",1)
	
	
	for i = 126, 130-0.5, 0.5 do
		add(i, 0.5, "outQuint", -0.3*tinyMultFix, "tiny", 1)
	end
	ease(130, 1, "backInOut", 0.0, "tiny", 1)
	
	ease(146, 2, "linear", 0.75, "orient2", 1)
	ease(160, 1, "outExpo", 0.0, "orient2", 1)
	
	add(160, 2, "outCubic", 360, "angle", 1)
	add(160, 5, "pop", 0.2, "flip", 1)
	add(160, 5, "pop", 0.4*tinyMultFix, "tiny", 1)
	
	for l = 0, 3 do
		ease(124, 2, "expoIn", 0, "reverse--"..l, 1)
		
		
		set(143, 0, "strumrotatey--"..l)
	end
	set(143, 0, "strumrotatey")
	
	ease(132, 6, "cubeInOut", 1, "flip", 1)
	add(132, 6, "cubeInOut", 360*3, "strumrotatey--0", 1)
	add(132, 6, "cubeInOut", -360*3, "strumrotatey--1", 1)
	add(132, 6, "cubeInOut", 360*3, "strumrotatey--2", 1)
	add(132, 6, "cubeInOut", -360*3, "strumrotatey--3", 1)
	
	add(132, 4, "pop", 4, "drunkz", 1)
	add(132, 4, "pop", 4, "drunk", 1)
	
	
	ease(138, 1, "expoOut", 0.75, "flip", 1)
	ease(138, 1, "expoOut", 0.75, "invert", 1)
	
	ease(138, 2, "bell", -0.25, "dizzy", 1)
	
	ease(138, 2, "pop", 20, "rotatez", 1)
	
	
	set(140, 16 , "drunkz__speed",1)
	set(140, 0.5 , "drunkz__desync",1)
	ease(140, 2.75, "pop", 6.5, "drunkz", 1)
	
	ease(140, 2, "cubeInOut", 0, "flip", 1)
	ease(140, 2, "cubeInOut", 0, "invert", 1)
	
	ease(141.75, 5, "bounce", -1, "circz", 1)
	

	set(147, 1, "drunk__speed")
	ease(146.75, 0.5, "outExpo", -0.3, "drunk", 1)
	ease(147.5, 0.5, "outExpo", 0.4, "drunk", 1)
	ease(148, 0.5, "sineInOut", -0.8, "drunk", 1)
	
	ease(160, 0.5, "expoOut", 0.0, "drunk", 1)
	
	set(146,0.5,"zigzag__mult")
	ease(146, 2.5, "sineInOut", 0.5, "zigzag")
	ease(146, 2.5, "sineInOut", 0.05, "bumpyspeed", 1)
	ease(158, 2, "expoIn", 0.00, "bumpyspeed", 1)
	
	ease(158, 2, "expoIn", 0.00, "beat", 1)
	set(146,2, "beat__speed",1)
	ease(146, 2, "expoIn", 0.5, "beat", 1)
	
	add(160, 0.5, "pop", 0.1, "centered", 1)

	--main drop / gimick
	
	set(160, 1, "zsort")
	set(160, 90, "holdgrain")
	
	
	--aftRecursive(-64, false)
	--aftUpdateRate(-64, 0)
	--aftAlpha(-64,0.0)
	--aftTweenSize(0, 8, "linear", 1.1)
	--aftRecursive(160, true)
	--aftUpdateRate(150, 60)
	--aftAlpha(160,0.5)
	
	
		
		
		
		
	set(160, 100, "sudden__noglow")
	setdefault(200, "arrowpathgrain",2)
	set(160, 100, "arrowpathgrain")
	set(160, 1, "spiralholds")
	set(160, 0.25, "arrowpathwidth")
	set(160, 100, "sudden__offset")
	ease(160, 4, "linear", 1 , "sudden")
	for i  = 164, 195 do
		for l = 0, 3 do
			if l % 2 == 0 then
				add(i, 1, "linear", 180, "rotatex--"..l)
			else
				add(i, 1, "linear", -180, "rotatex--"..l)
			end
		end		
		
		--add(i,1, "pop", 0.2, "arrowpath",1)
		--add(i,1, "pop", 0.2, "arrowpath",3)
		add(i, 0.5, "pop", -2*tinyMultFix, "tiny")
	end
	
	
	
	
	for i  = 212, 292-1 do
		for l = 0, 3 do
			if l % 2 == 0 then
				add(i, 1, "linear", 180, "rotatex--"..l)
			else
				add(i, 1, "linear", -180, "rotatex--"..l)
			end
		end		
		--add(i,1, "pop", 0.2, "arrowpath",1)
		--add(i,1, "pop", 0.2, "arrowpath",3)
		add(i, 0.5, "pop", -2*tinyMultFix, "tiny")
	end
	
	set(292.5,0, "rotatex--0")
	set(292.5,0, "rotatex--1")
	set(292.5,0, "rotatex--2")
	set(292.5,0, "rotatex--3")
	
	set(308,0, "angle--2")
	set(308,0, "notesangle")
	set(308,0, "angle")

	for i  = 228, 292-1 do
		--add(i, 1, "linear", 45, "rotatez",1)
		--add(i, 1, "linear", 45, "rotatez",3)
		for l = 0, 3 do
			if l % 2 == 0 then
				add(i, 1, "linear", 45, "rotatez--"..l,3)
			else
				add(i, 1, "linear", 45, "rotatez--"..l,3)
			end
			
			
		end	
	end
	--set(228, 90, "rotatez")
	
	ease(160, 1, "sineInOut", 1 , "speedmod")
	
	ease(195, 3, "sineInOut", 0 , "sudden")
	
	--add(202, 2, "bounce", 0.2 , "lineary--1")
	--add(202, 2, "bounce",0.2 , "lineary--0")
	--add(202, 2, "bounce",0.2 , "lineary--2")
	add(202, 2, "bounce",0.27 , "lineary--3")
	add(202, 2, "bounce",-0.27 , "lineary")
	
	set(202, 0.5, "drunk__desync")
	set(202, 24, "drunk__speed")
	ease(202, 2, "pop", 2 , "drunk")
	ease(202, 2, "quadOut", 1 , "speedmod")
	
	set(210, 0.2, "drunk__desync")
	set(210, 2, "drunk__speed")
	set(210, 0, "movex", 3)
	ease(210, 2, "cubeOut", -2 , "movex",1)
	ease(210, 2, "cubeOut", 2 , "movex",3)
	ease(210, 2, "cubeOut", 0 , "alpha",3)
	ease(210, 2, "sineOut", 0.5 , "alphastrum")
	ease(210, 2, "cubeOut", 1 , "sudden")
	
	ease(224, 4, "sineInOut", 0 , "movex",1)
	ease(224, 4, "sineInOut", 0 , "movex",3)
	--ease(224, 4, "sineInOut", 180 , "rotatey",3)
	
	ease(224, 4, "sineInOut", 0.1 , "stealth",1)
	ease(224, 4, "sineInOut", 0.6 , "stealth",3)
	
	ease(289, 3, "sineInOut", 0.0 , "stealth",1)
	ease(289, 3, "sineInOut", 0.0 , "stealth",3)
	
	
	add(292, 2, "pop", -10, "bumpy")
	add(292, 2, "pop", 2 , "drunk")
	
	local b = getNoteBeats(291.9, 292.25, "bf")
	for i, v in ipairs(b) do
		add(v[1], 2, "pop", -1*tinyMultFix, "tinystrum--"..v[2])
	end
	
	add(292, 2, "sineInOut", 2 , "longholds--2")
	add(297, 1, "linear", -2 , "longholds--2")
	
	ease(292, 2, "linear", 0 , "zigzag")
	
	add(297, 1, "outExpo", 360, "angle--2")
	
	local whichNote = 3
	
	for i, v in ipairs(getNoteBeats(299.95, 301.75, "bf")) do
		add(v[1], third*2, "pop", -2, "tinyx--"..v[2])
	end
	
	for i, v in ipairs(getNoteBeats(299.9, 300.2, "bf")) do
		whichNote = v[2]
	end
	
	
	
	for i = 300 , 302-third, third do
		add(i, third, "linear", beatLength*third, "drive--"..whichNote)
	end
	ease(302, 1.5, "bounceOut", 0 , "drive--"..whichNote)
	
	
	for i, v in ipairs(getNoteBeats(301.9, 302.15, "bf")) do
		whichNote = v[2]
	end
	
	ease(302, third*2, "linear", beatLength*(third*2), "drive--"..whichNote)
	ease(302+(third*2), third*2, "linear", 0 , "drive--"..whichNote)
	--ease(302, third*2, "linear", beatLength*(third*2), "drive--1")
	--ease(302+(third*2), third*2, "backInOut", 0 , "drive--1")
	
	ease(294, 0.5, "outExpo", -1 , "movex--0")
	ease(294.75, 0.5, "outExpo", -1 , "movex--1")
	ease(295.5, 0.5, "outExpo", -1 , "movex--2")
	ease(297, 0.5, "outBack", 0 , "movex--2")
	
	ease(302, 0.5, "outExpo", 0 , "movex--1")
	--ease(302.75, 0.5, "outExpo", 0 , "movex--0")
	ease(302.75, 0.5, "linear", 0 , "movex--0")
	
	add(298, 2, "outQuint", -360*2 , "angle")
	add(298, 3, "pop", 5 , "bumpy")
	add(298, 4, "pop", 3 , "drunkz")
	
	add(303, 4, "sineInOut", 360*2 , "angle",3)
	add(303, 4, "sineInOut", -360*2 , "angle",1)
	
	add(303, 4, "sineInOut", -360*2 , "notesangle",3)
	add(303, 4, "sineInOut", 360*2 , "notesangle",1)
	--I needed to add 'notesangle' modifier for this lmfao XD
	
	set(303,1,"spiralholds")
	set(306,0,"spiralholds")
	
	local whichSusNoteRolls
	for i, v in ipairs(getNoteBeats(302.9, 303.15, "bf")) do
		whichSusNoteRolls = v[2]
	end
	
	add(303, 4, "sineInOut", 360*-2 , "rotatez--"..whichSusNoteRolls,1)
	add(303, 4, "sineInOut", 360*2 , "strumrotatez--"..whichSusNoteRolls,1)
	
	add(303, 4, "sineInOut", 360*2 , "rotatez--"..whichSusNoteRolls,3)
	add(303, 4, "sineInOut", 360*-2 , "strumrotatez--"..whichSusNoteRolls,3)
	
	
	
	
	
	add(298, 2.5, "pop", 2 , "drunk")
	add(330, 2.5, "pop", 2 , "drunk")
		
	ease(303, 4, "sineInOut", -2 , "movex",1)
	ease(303, 4, "sineInOut", 2 , "movex",3)
	
	
	ease(308, 2, "linear", 0.25, "stealth")
	ease(340, 2, "linear", 0.25, "stealth")
	ease(324, 2, "outQuad", 0.0, "stealth")
	ease(349, 356-349, "inOutQuad", 0.0, "stealth")
	
	for i  = 308, 324-1 do
		for l = 0, 3 do
			if l % 2 == 0 then
				--add(i, 1, "linear", 180, "rotatex--"..l)
				add(i, 1, "linear", 90, "rotatey--"..l)
			else
				--add(i, 1, "linear", -180, "rotatex--"..l)
				add(i, 1, "linear", -90, "rotatey--"..l)
			end
		end		
		--add(i,1, "pop", 0.2, "arrowpath",1)
		--add(i,1, "pop", 0.2, "arrowpath",3)
		add(i, 0.5, "pop", -2*tinyMultFix, "tiny")
	end
	
	

	add(324,2, "cubeOut", 180, "rotatex")
	
	
	add(324, 2, "pop", -3, "bumpy")
	add(324, 2, "pop", -2 , "drunk")
	ease(326, 0.5, "outBack", -1.5 , "movex--0")
	ease(326.666, 0.5, "outBack", -0.75 , "movex--1")
	
	ease(327.333, 0.5, "outBack", 0.5 , "movex--3")
	
	add(330, 2, "pop", 60 , "noteskewy")
	add(330, 2, "outExpo", 360 , "angle")
	
	
	ease(330, 1, "outBack", 0 , "movex--3")
	ease(330, 1, "outBack", 0 , "movex--0")
	ease(330, 1, "outBack", 0 , "movex--1")
	
	
	ease(334, 0.5, "outBack", -1 , "movex--1")
	ease(334.6666, 0.5, "outBack", 1 , "movex--0")
	ease(335.333, 0.5, "outBack", 0 , "movex--0")
	ease(335.333, 0.5, "outBack", 0 , "movex--1")
	
	add(336, 1, "bounce", -14 , "rotatez")
	add(337, 1, "bounce", 14 , "rotatez")
	add(338, 2, "bounce", -11 , "rotatez",3)
	add(338, 2, "bounce", 9 , "rotatez",1)
	
	
	for i, v in ipairs(getNoteBeats(335.9, 336.1, "bf")) do
		whichNote = v[2]
	end
	
	add(336, 1, "bounce", -3*tinyMultFix , "tinyy--"..whichNote)
	
	for i, v in ipairs(getNoteBeats(336.9, 337.1, "bf")) do
		whichNote = v[2]
	end
	add(337, 1, "bounce", -3*tinyMultFix , "tinyy--"..whichNote)
	
	
	
	local note1 = 1
	local note2 = 2
	for i, v in ipairs(getNoteBeats(327.85, 328.56, "bf")) do
		if v[1] < 328.1135 then
			note1 = v[2]
		else
			note2 = v[2]
		end
	end
	
	lazyAlternate = -1
	for i = 328, 330-third, third do
		if lazyAlternate == 1 then
			lazyAlternate = -1
		else
			lazyAlternate = 1	
		end
		
		if note1 < 2 then
			add(i, third/3, "outExpo", 1.3*lazyAlternate , "movex--"..note1)
		else
			add(i, third/3, "outExpo", -1.3*lazyAlternate , "movex--"..note1)
		end
		
		if note2 < 2 then
			add(i, third/3, "outExpo", 1.3*lazyAlternate , "movex--"..note2)
		else
			add(i, third/3, "outExpo", -1.3*lazyAlternate , "movex--"..note2)
		end
		
		add(i, third/3, "outExpo", 1*lazyAlternate*0.5 , "stealth--"..note1)
		add(i, third/3, "outExpo", 1*lazyAlternate*0.5 , "stealth--"..note2)
	end
	
	add(306-0.1, 1, "pop", -1.2*tinyMultFix , "tiny")
	add(306-0.1, 1, "pop", -0.5*tinyMultFix , "tinyx")
	
	for i, v in ipairs(getNoteBeats(331.9, 332.1, "bf")) do
		whichNote = v[2]
	end
	add(332, 2, "tap", 180 , "angle--"..whichNote)
	
	for i = 332 , 334-third, third do
		add(i, third, "linear", beatLength*third, "drive--"..whichNote)
	end
	ease(334, 1.5, "bounceOut", 0 , "drive--"..whichNote)
	
	
	for i, v in ipairs(getNoteBeats(337.9, 338.1, "bf")) do
		whichNote = v[2]
	end
	--add(338, 2.5, "pop", 2 , "drunk--"..whichNote)
	add(338, 2.5, "pop", 5 , "bumpy--"..whichNote)
	add(338, 2, "pop", -1 , "zigzag--"..whichNote)
	add(338, 2, "bounce", -2*tinyMultFix , "tiny--"..whichNote)
	add(338, 2, "bounce", -0.5*tinyMultFix , "tinyx--"..whichNote)
	
	ease(332,1, "linear", 0.5 , "longholds--3")
	ease(339,2, "linear", 0 , "longholds--3")
	
	ease(332,1, "linear", 0.5 , "longholds--0")
	ease(339,2, "linear", 0 , "longholds--0")
	
	ease(334,2, "linear", 0.5 , "longholds--2")
	ease(339,2, "linear", 0 , "longholds--2")
	
	for i  = 340, 340+16-1 do
		for l = 0, 3 do
			if l % 2 == 0 then
				--add(i, 1, "linear", 180, "rotatex--"..l)
				add(i, 1, "linear", 90, "rotatey--"..l)
			else
				--add(i, 1, "linear", -180, "rotatex--"..l)
				add(i, 1, "linear", -90, "rotatey--"..l)
			end
		end		
		--add(i,1, "pop", 0.2, "arrowpath",1)
		--add(i,1, "pop", 0.2, "arrowpath",3)
		if i <= 352 then
			add(i, 0.5, "pop", -2*tinyMultFix, "tiny")
		end
	end
	
	
	
	set(354, 0, "spiralholds")
	set(354, 950, "mathcutoff")
	
	ease(352, 4, "sineInOut", 0.0 , "alphastrum")
ease(352, 4, "sineInOut", 0.0 , "zigzag")
ease(352, 4, "sineInOut", 0.0 , "sudden")
	
	set(356, 0, "zsort")
	
	--set(388, 0.5, "arrowpath")
	ease(388, 15, "cubeOut", 10, "movez")
	
	if downscroll then
		ease(388, 15, "cubeOut", 11, "holdoffsety")
	end
	
	ease(388, 24, "quintOut", -2, "scalelinear")
	
	add(388, 16, "pop", 2 , "drunk",3)
	add(388, 16, "pop", 2 , "drunk",1)
	add(388, 24, "pop", 1 , "tipsy",3)
		add(388, 24, "pop", -1 , "tipsy",1)
		set(380,-2.333, "tipsy__speed")
	
	add(388, 24, "outExpo", -360*4 , "angle")
	
	ease(386, 2, "linear", 8, "drunkz__speed")
	ease(386, 2, "linear", -0.5, "drunkz__mult")
	add(388, 16, "pop", -1 , "drunkz")
	
	--ease(388, 4, "cubeOut", 2 , "circy")
	ease(388, 8, "cubeOut",2 , "circz")
	
	--ease(388, 4, "expoOut", 0.1*100 , "spiralz")
	--ease(388, 4, "expoOut", 0.05*100 , "spiralx")
	
		ease(398, 8, "sineIn",1 , "alpha")
		
		
		
	ease(361.5, 0.5, "expoOut", 1 , "alphastrum")
	ease(363.8, 0.5, "expoOut", 0 , "alphastrum")
	



	set(350,1.0, "showextra")
	
	set(360,1.0, "stealthglowred")
	set(360,1.0, "stealthglowgreen")
	set(360,1.0, "stealthglowblue")
	
	set(361.89,0.5, "stealth")
	
	set(362.21,0.0, "stealth")
	set(362,-4.33, "tipsy__speed")
	lazyAlternate = 1
	for i = 362.4, 363, 0.125 do
		if lazyAlternate == 1 then
			lazyAlternate = -1
			set(i,0.5, "stealth")
			set(i,-0.5, "tipsy")
		else
			lazyAlternate = 1
			set(i,0.0, "stealth")
			set(i,0.5, "tipsy")
		end
	end
	set(363.6 , 0.0, "tipsy")
	set(363.6 , 0.0, "stealth")
end
