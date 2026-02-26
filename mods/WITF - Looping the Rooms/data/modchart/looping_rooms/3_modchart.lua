
-- Silly modchart made by Hazard24 for WITF v1.0.2

-- Original song: https://youtu.be/icBDYkfxpMs


function setUp()
	centerOpponent("")
	centerPlayer("")
	createNewPlayer(true)
	copyZoom(false)
end

function modsTimeline()
	--Set defaults
	setdefault(1 , "alpha","dad") --Dad playfield stays invisible
	setdefault(1 , "debugalpha","dad")	
	setdefault(1 , "3D")
	setdefault(-112 , "z")
	setdefault(-64 , "debugy")
	setdefault(112*-2 , "debugx","1")
	setdefault(112*2 , "debugx","3")
	setdefault(1 , "alpha","3")
	
	setdefault(1 , "showLaneMods")
	
	targetExclude("dad")
	--setasleep(0, "dad", true) --needed for opponent notes to register properly
	
	setdefault(45 , "grain")
	setdefault(50 , "pathgrain","1")
	
	setdefault(1 , "stealthglowgreen")
	setdefault(1 , "stealthglowblue")

	
	
	function gunshots(when)
		value(when,  0.9, "inCubic", 0,1, "stealthglowgreen")
		value(when,  0.9, "inCubic", 0,1, "stealthglowblue")
		value(when+1,0.9, "inCubic", 0,1, "stealthglowgreen")
		value(when+1,0.9, "inCubic", 0,1, "stealthglowblue")
		
		ease(when,0.1, "outQuint", 0.5, "stealth")
		ease(when+2,0.1, "outQuint", 0, "stealth")
		
		add(when,0.25, "outQuint", strumSize*-1.5, "x")
		add(when+1,0.25, "outQuint", strumSize*-1.5*-2, "x")
		add(when+2,0.25, "outQuint", strumSize*-1.5, "x")
		
		add(when,1, "impulse", 22, "noteskewx")
		add(when+1,1, "impulse", -22, "noteskewx")
		add(when,1, "impulse", -3, "tiny")
		add(when+1,1, "impulse", -3, "tiny")
		add(when,1, "bounce", -12, "rotatez")
		add(when+1,1, "bounce", 12, "rotatez")
		set(when, 444, "rotatez__offset_y")
		set(when+2, 0, "rotatez__offset_y")
	end
	gunshots(18)
	gunshots(146)
	
	
	function doSillyRotate(when)
		set(when, 2, "tiny","1")
		ease(when+0.25, 4-0.25 ,"quadInOut", 0, "tiny","1")
		
		set(when, 0, "zoom","1")
		ease(when,4,"linear", 1, "zoom","1")
		
		set(when, -0.75, "flip","1")
		ease(when,4,"quadOut", 0, "flip","1")
		
		set(when, -360*1.5, "rotatey","1")
		add(when,4,"outSmootherStep", 360, "rotatey","1")
		add(when,4,"linear", 360/2, "rotatey","1")
	end
	doSillyRotate(0)
	set(-16, 2, "tiny","1")
	set(-16, 0, "zoom","1")
	set(-16, -0.75, "flip","1")
	set(-16, -360*1.5, "rotatey","1")
	
	
	function sillySchmovement(i, variant)
		set(i, 2, "drunkx__speed")
		set(i+1.95, 3, "drunkx__speed")
		add(i,1, "pop", -1, "drunkx")
		add(i,1, "bounce", -1, "tipsy")
		
		add(i,1, "bounce", -15, "skewx")
		add(i+8,1, "bounce", -15, "skewx")
		
		set(i+8, 2, "drunkx__speed")
		set(i+1.95+8, 3, "drunkx__speed")
		add(i+8,1, "pop", -1, "drunkx")
		add(i+8,1, "bounce", -1, "tipsy")
		
		add(i+1+8,0.5, "bounce", -0.4, "waveyy")
		add(i+1.5+8,0.5, "bounce", 0.4, "waveyy")
		
		add(i+1,0.5, "bounce", -0.4, "waveyy")
		add(i+1.5,0.5, "bounce", 0.4, "waveyy")
		
		for k = i+2, i+7 do
			add(k,1, "bounce", -0.1, "flip")
			add(k,1, "bounce", 1.25, "drunkx")
			if k % 2 == 0 then
				add(k,1, "bounce", -12, "skewy")
			else
				add(k,1, "bounce", 12, "skewy")
			end
		end
		
		local e = i+7-2+8
		if variant then
			e = i+7-1+8
		end
		for k = i+2+8, e do
			add(k,1, "bounce", -0.1, "flip")
			add(k,1, "bounce", 1.25, "drunkx")
			if k % 2 == 0 then
				add(k,1, "bounce", -12, "skewy")
			else
				add(k,1, "bounce", 12, "skewy")
			end
		end
	end
	sillySchmovement(4, false)
	sillySchmovement(20, true)
	sillySchmovement(132, false)
	sillySchmovement(132+16, true)
	sillySchmovement(324, true)
	sillySchmovement(324+16, true)
	
	add(34.5, 1.3, "inOutCubic", -360, "anglez","1")
	add(162.5, 1, "inOutCubic", -330, "anglez","1")
	add(163.7, 0.45, "inOutCubic", -30, "anglez","1")
	
	set(36, 496, "cubicx__offset","1")
	set(36, -496, "cubicx__offset","3")
	set(36, 100, "bumpyangle__offset")
	for i = 36, 68-2,2 do
		add(i, 1, "pop", -0.5, "tiny")
		add(i+1, 1, "pop", -0.5, "tiny")
		add(i, 1, "pop", -0.06, "flip")
		add(i+1, 1, "pop", -0.06, "flip")
		add(i, 1, "bounce", 0.25, "cubicx")
		add(i+1, 1, "bounce", -0.25, "cubicx")
		
		add(i, 1, "pop", 0.25, "bumpyangle")
		add(i+1, 1, "pop", -0.25, "bumpyangle")
	end
	
	add(64.5, 2, "bell", -0.5, "zoomx","3")
	add(64.5, 2, "bell", 0.2, "zoomy","3")
	
	set(36, 1, "alpha", "3")
	set(36, 1, "reverse", "3")
	set(36, 180, "angley", "3")
	set(36, 1, "cull")
	
	--fix for the culled sustain?
	set(60, 0, "cull","3")
	
	
	
	set(36, 0.64, "bumpy","3")
	set(36, strumSize*-2.46, "x","3")
	set(36, strumSize*0.75, "yd","3")
	set(36, -15, "rotatez","3")
	set(36, -45, "rotatex","3")
	set(36, -45, "anglex","3")
	set(36, -15, "anglez","3")
	
	set(48, 0.5, "circx","1")
	set(48, strumSize*2.5, "x","1")
	set(48, strumSize*-1, "yd","1")
	set(48, 45, "anglex","1")
	set(48, 45, "rotatex","1")
	
	set(57, 0, "bumpy","3")
	set(57, 0, "x","3")
	set(57, 0, "yd","3")
	set(57, 0, "rotatez","3")
	set(57, 0, "rotatex","3")
	set(57, 0, "anglex","3")
	set(57, 0, "anglez","3")
	
	set(57, 1, "sudden","3")
	set(57, 400, "sudden__offset","3")
	ease(57, 1.5, "linear", 0.8, "cubicz","3")
	set(57, 1, "orientx","3")
	--set(57, 0.8, "cubicz","3")
	
	set(66, 0, "cull","3")
	
	ease(66, 2,"inOutSmoothStep",0, "orientx","3")
	ease(66, 2,"inOutSmoothStep",0, "cubicz","3")
	add(66, 2,"inOutSmoothStep",360, "anglex","3")

	
	add(41, 3, "inOutSine", 180, "angley")
	set(41, 0, "alpha","1")
	set(41, 0, "alpha","3")
	set(41+3, 1, "alpha","1")
	
	add(49, 3, "inOutSine", 180, "angley")
	set(49, 0, "alpha","1")
	set(49, 0, "alpha","3")
	set(49+3, 1, "alpha","3")
	
	add(41+16, 3, "inOutSine", 180, "angley")
	set(41+16, 0, "alpha","1")
	set(41+16, 0, "alpha","3")
	set(41+16+3, 1, "alpha","1")
	
	
	for i = 84, 96-2, 2 do
		ease(i, 1, "outBack", 1, "invert")
		ease(i+1, 1, "outBack",0, "invert")
	end
	
	
	set(67, 0.5, "beat__mult")
	ease(67, 1, "inOutExpo", 1, "beat")
	ease(83, 1, "inOutExpo", 3, "beat")
	ease(96, 1, "inOutExpo", 0, "beat")
	
	ease(96, 4, "inCubic", 4, "centered","3")
	ease(96, 4, "outCubic", 2, "tipsy","3")
	

	
	set(96, 0, "cull","3")
	for c = 0, 3 do
		ease(96, 4, "outElastic", math.random(-77,77), "anglex--"..c)
		ease(96, 4, "outElastic", math.random(-33,33), "angley--"..c)
		ease(96, 4, "outSine", math.random(-360,360)*2, "anglez--"..c)
		ease(96, 4, "outElastic", math.random(-45,45), "noteskewx--"..c)
	end
	reset(100, "3")
	
	
	reset(96,"1")
	doSillyRotate(96)
	reset(224)
	doSillyRotate(224)
	set(96, strumSize*3, "x","1")
	ease(116-2, 2, "smoothStepInOut", strumSize*-3, "x","1")
	ease(116+16-2, 2, "smoothStepInOut", 0, "x","1")
	
	set(224, strumSize*3, "x","1")
	ease(228+16-2, 2, "smoothStepInOut", strumSize*-3, "x","1")
	ease(228+16+16-2, 2, "smoothStepInOut", 0, "x","1")
	
	for i = 100, 132-1 do
		if i % 2 == 0 then
			add(i, 1, "pop", 0.5, "bumpyx")
		else
			add(i, 1, "pop", -0.5, "bumpyx")
		end
		
		
		add(i, 1, "pop", -0.5, "tiny")
		add(i, 1, "impulse", -0.3, "tiny")
		add(i, 1, "bounce", -0.1, "centered")
	end
	

	
	function Kurikaesu(when, angleMult)
		angleMult = angleMult *-1
		for i = when, when+3 do
			add(i, 1, "outSine", 90 * angleMult, "angle")
		end
	
		add(when+4, 1, "bounce", -6 * angleMult, "rotatez")
		add(when+5, 1, "bounce", 11 * angleMult, "rotatez")
		add(when+6, 0.5, "outSine", -15 * angleMult, "rotatez")
		add(when+5, 2, "inOutQuint", -90 * angleMult, "angle")
		
		add(when+7, 1, "bounce", 6 * angleMult, "rotatez")
		add(when+8, 1, "bounce", -11 * angleMult, "rotatez")
		add(when+9, .5, "outSine", 30 * angleMult, "rotatez")
		add(when+8, 2, "inOutQuint", -90 * angleMult, "angle")
		
		add(when+10, 1, "bounce", -6 * angleMult, "rotatez")
		add(when+11, 1, "bounce", 11 * angleMult, "rotatez")
		add(when+12, 0.5, "outSine", -30 * angleMult, "rotatez")
		add(when+11, 2, "inOutQuint", -90 * angleMult, "angle")
		
		add(when+13, 1, "bounce", 6 * angleMult, "rotatez")
		add(when+14, 1, "bounce", -11 * angleMult, "rotatez")
		ease(when+15, .5, "outSine", 0, "rotatez")
		add(when+14, 2, "inOutQuint", -90 * angleMult, "angle")
	end
	
	Kurikaesu(100, 1)
	Kurikaesu(116, -1)
	Kurikaesu(228, 1)
	Kurikaesu(228+16, -1)
	
	for i = 228, 228+32-1-2 do
		if i % 2 == 0 then
			add(i, 1, "pop", 0.5, "bumpyx")
		else
			add(i, 1, "pop", -0.5, "bumpyx")
		end
		
		
		add(i, 1, "pop", -0.5, "tiny")
		add(i, 1, "impulse", -0.3, "tiny")
		add(i, 1, "bounce", -0.1, "centered")
	end
	
	for i = 260, 287 do
		if i % 2 == 0 then
			add(i, 1, "pop", 0.5, "bumpyx")
		else
			add(i, 1, "pop", -0.5, "bumpyx")
		end
		
		
		add(i, 1, "pop", -0.5, "tiny")
		add(i, 1, "impulse", -0.3, "tiny")
		add(i, 1, "bounce", -0.1, "centered")
	end
	
	for i = 292, 292+32-2, 2 do
		add(i, 1, "pop", 0.5, "stealth")
		add(i, 1, "impulse", -1, "tipsy")
		add(i+1, 1, "impulse", 1, "tipsy")
		ease(i, 1, "outCubic", 1, "invert")
		ease(i+1, 1, "outCubic", 0, "invert")
	end
	for i = 324, 324+32-4-2, 2 do
		add(i, 1, "pop", 0.5, "stealth")
	end

	
	
	
	set(163.75,1, "drunk__speed")
	ease(163.5, 2.75, "inOutSmootherStep", 1 , "drunk")
	set(193.75,0, "drunk", "1")
	
	
	
	set(165, 1, "alpha", "3")
	set(165, 1, "reverse", "3")
	set(165, 180, "angley", "3")
	set(165, 180, "holdangley", "3") -- fix for sustain culling for this version as it's bugged.
	set(165, 1, "cull")
	set(170, 0, "alpha", "3")
	add(169, 3, "inOutSine", 180, "angley")
	add(169+8+8, 3, "inOutSine", 180, "angley")
	add(169+8, 3, "inOutSine", 180, "angley")
	
	ease(194, 1.95, "linear", 1, "alpha", "3")
	ease(193, 3, "outCubic", 1.2, "zoomy", "3")
	ease(193, 3, "outCubic", 0.85, "zoomx", "3")
	
	
	
	set(169, strumSize*3, "x", "3")
	add(169, 0.1, "instant", 20, "angley", "3")
	add(169, 0.1, "instant", 20, "rotatey", "3")
	
	add(180, 0.1, "instant", -20, "angley", "3")
	add(180, 0.1, "instant", -20, "rotatey", "3")
	
	set(177, strumSize*-3, "x", "1")
	set(177, -37, "rotatex", "1")
	set(177, -37, "anglex", "1")
	--set(177, 1, "orientx", "1")
	--set(177, -1, "cubicz", "1")
	set(177, 0.5, "cubicz", "1")
	set(177,-0.25, "roll", "1")
	
	set(192,0, "rotatex", "1")
	set(192,0, "anglex", "1")
	set(192,0, "x", "1")
	set(192,0, "cubicz", "1")
	set(192,0, "roll", "1")
	set(192,{-1.5, "movex--0", -1.5, "movex--1"}, "1")
	set(192,{1.5, "movex--2", 1.5, "movex--3"}, "1")
	
	set(192,-2, "attenuatex", "1")
	set(192,0.5, "beat__mult", "1")
	ease(195.75,0.25, "outExpo", -3, "beat", "1")
	
	set(192, 0.0, "beatScale__alternate", "1")
	set(192, 0.0, "beatScale__mult", "1")
	ease(195.75,0.25, "outExpo", 3, "beatScale", "1")
	
	ease(223.75,0.2, "outExpo", 0, "beat", "1")
	ease(223.75,0.2, "outExpo", 0, "beatScale", "1")
	for i = 196, 224-2, 2 do
		ease(i,1, "outBack", 1, "invert", "1")
		ease(i+1,1, "outBack", 0, "invert", "1")
	end
	
	add(210.5,1,"inOutQuint", 360,"angley", "1")
	add(290.25,1.5,"inOutQuint", -360,"anglex", "1")
	
	add(306.25,1.5,"inOutQuint", -360,"anglex", "1")
	add(322.25,1.5,"inOutQuint", -360,"anglex", "1")
	add(338.25,1.5,"inOutQuint", -360,"anglex", "1")
	
	add(82.25,1.5,"inOutQuint", -360,"anglex", "3")
	
	set(172, 1, "alpha", "1")
	set(177, 0, "alpha", "1")
	set(180, 1, "alpha", "3")
	set(185, 0, "alpha", "3")
	set(188, 1, "alpha", "1")
	
	set(194, 0, "alpha", "1")
	set(194, 0, "angley", "1")
	
	set(196, 0, "cull")
	set(196, 1, "alpha", "3")
	
	
	-- magic number to try and sync the top and bottom of the screen for seamless loop
	set(259.7, 1.1, "bumpyx__mult", "1")
	
	
	ease(260,1,"outExpo", 0.75,"arrowpath", "1")
	ease(291,1,"outExpo", 0.0,"arrowpath", "1")
	set(260, 2.25, "arrowpathwidth", "1")
	set(260, 0, "arrowpathred", "1")
	set(260, 0, "arrowpathgreen", "1")
	set(260, 0, "arrowpathblue", "1")
	
	
	
	set(96, 1, "alphasplash", "1")
	set(98, 0, "alphasplash", "1")
	
end
