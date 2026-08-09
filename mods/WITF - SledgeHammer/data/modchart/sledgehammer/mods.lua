function setUp()
	centerStrum("1") -- Making the playfield be in the middle of the screen.
end

function modsTimeline()
	-- getting rid of the dad playfield as it isn't used for anything.
	setasleep(-20, "dad", true)
	setdefault(1, "alpha", "dad")
	setdefault(112*10, "debugx", "dad")
	setdefault(1, "debugalpha", "dad")
	targetExclude("dad")

	
	setdefault(52, "grain")
	setdefault(1, "3d") -- needed for 3d effects to work properly (anglex for example)
	
	-- Better to have the notes flash in instead of popping in when appearing in the render area.
	setdefault(960, "sudden__offset")
	ease(30, 2, "linear", 1, "sudden")

	-- Loops through the entire drop.
	for i=32, 63 do
		add(i, 0.675, "impulse", {1, "scale"})	
		add(i, 1, "bounce", {-0.2, "centered"})
	end

	
	-- rotations
	
	-- important! -> angle the playfield so that we can read ahead better.
	if downScroll then
		ease(32, 1, "outCubic", {-42, "rotationx", -42, "anglex"}) 
	else
		ease(32, 1, "outCubic", {42, "rotationx", 42, "anglex"}) -- important! -> angle the playfield so that we can read ahead better.
	end
	
	
	
	-- cant be bothered to finish this lol
	--[[
	ease(32, 1, "outCubic", {-20, "rotationx", -20, "anglex"})
	ease(32, 1, "outCubic", {-45, "rotationy", -45, "angley"})
	ease(32, 1, "outCubic", {-20, "rotationz", -20, "anglez"})
	ease(32, 1, "outCubic", {-1, "movex",0, "moveyd"})
	
	ease(33, 1, "outCubic", {42, "rotationx", 42, "anglex"})
	ease(33, 1, "outCubic", {12, "rotationy", 12, "angley"})
	ease(33, 1, "outCubic", {19, "rotationz", 19, "anglez"})
	ease(33, 1, "bounce", {1.2, "zoomy",0.9, "zoomx"})
	ease(33, 1, "outBack", {1, "movex",-1, "moveyd", 112, "zoomx__offset_x",112, "zoomy__offset_x"})
	]]--
	
	

	setdefault(9, "drunk__speed")
	
	add(32, 1, "pop", 2, "drunk")
	add(33, 1, "pop", 2, "drunk")
	add(32+4, 1, "pop", 2, "drunk")
	add(33+4, 1, "pop", 2, "drunk")
	
	set(40, 60, "drunk__speed")
	add(40-0.4, 1.5, "bell", 1, "drunk")
	add(40-0.4+1, 1.5, "bell", 1, "drunk")
	
	
	set(44, 2, "drunk__speed")
	add(44, 1, "bounce", -3, "drunkz")
	add(44, 1, "bounce", 4, "drunk")
	add(45, 1, "bounce", -1, "drunk")
	
	set(60, 2, "drunk__speed")
	add(60, 1, "bounce", 3, "drunkz")
	add(60, 1, "bounce", -4, "drunk")
	add(61, 1, "bounce", 1, "drunk")
	
	
	ease(48, 1, "outExpo", 0.9, "stealth")
	ease(49, 1, "outExpo", 0.0, "stealth")
	ease(48, 1, "tap", {0.7, "speedmod",1, "brake"})
	--ease(49, 1, "outExpo", {1.0, "speedmod",0, "brake"})
	
	set(48, 9, "drunk__speed")
	add(49, 1, "pop", 2, "drunk")
	
	add(52, 1, "bell", -2, "drunkz")
	add(52, 1, "pop", 2, "drunk")
	add(53, 1, "pop", 2, "drunk")
	
	add(56, 1, "pop", 2, "drunk")
	add(56, 1.1, "tap", -0.5, "speedmod")
	
	
	
	ease(56, 1, "tap", 0, "zoomx")
	add(56, 1, "tap", 0.5, "flip")
	ease(57, 1, "impulse", 2, "zoomx")
	
	
	
	add(46-0.2, 1, "bell", 45, "skewx")
	add(46-0.2+1, 1, "bell", -45, "skewx")
	
	
	add(62-0.2, 1, "bell", {45, "skewy",13, "skewx"})
	add(62-0.2+1, 1, "bell", {-45, "skewy",-13, "skewx"})
	
	
	ease(46, 0.5, "outCubic", 1, "invert")
	ease(46.5, 0.5, "outCubic", 0, "invert")
	ease(47, 0.5, "outCubic", 1, "videogames")
	ease(47.5, 0.5, "outCubic", 0, "videogames")
	
	ease(62, 0.5, "outCubic", 1, "videogames")
	ease(62.5, 0.5, "outCubic", 0, "videogames")
	ease(63, 0.5, "outCubic", 1, "invert")
	ease(63.5, 0.5, "outCubic", 0, "invert")
	
	 -- Using the brake modifier to allow the player to chunk ahead before the 'wah' effect
	local brakeAmount = 0.55
	ease(32, 1, "bounce", brakeAmount, "brake")
	ease(33, 1, "bounce", brakeAmount, "brake")
	
	ease(32+4, 1, "bounce", brakeAmount, "brake")
	ease(33+4, 1, "bounce", brakeAmount, "brake")
	
	ease(32+8, 1, "bounce", brakeAmount, "brake")
	ease(33+8, 1, "bounce", brakeAmount, "brake")
	
	ease(32+12, 1, "bounce", brakeAmount, "brake")
	ease(33+12, 1, "bounce", brakeAmount, "brake")
	
	ease(33+16, 1, "bounce", brakeAmount, "brake")
	
	ease(52, 1, "bounce", brakeAmount, "brake")
	ease(53, 1, "bounce", brakeAmount, "brake")
	
	ease(57, 1, "bounce", brakeAmount, "brake")
	
	
	-- the 'wahwahwahwahwahwah' effect, responsible for the rapid column swaps.
	local function wah(when)
		for i=0, 1.75, 0.25 do
			add(when+i, 0.3, "pop", {0.7, "tinyy", -0.2, "tinyx"})
			ease(when+i, 0.25, "pop", .5, "stealth")
		end
	
		ease(when, 0.25, "outCubic", {1, "invert",0, "flip"})
		ease(when+0.25, 0.25, "outCubic", {0, "invert",1, "flip"})
		ease(when+0.5, 0.25, "outCubic", {0.0, "invert",0.0, "flip"})
		ease(when+0.75, 0.25, "outCubic", {0.75, "invert",0.75, "flip"})
		ease(when+1, 0.25, "outCubic", {0, "invert",1, "flip"})
		ease(when+1.25, 0.25, "outCubic", {-0.75, "invert",0.25, "flip"})
		ease(when+1.5, 0.25, "outCubic", {1, "invert",0, "flip"})
		ease(when+1.75, 0.25, "outCubic", {0, "invert",0, "flip"})
	end
	
	local function wah_shorter(when)
		for i=0, 0.75, 0.25 do
			add(when+i, 0.3, "pop", {0.7, "tinyy", -0.2, "tinyx"})
			ease(when+i, 0.25, "pop", .5, "stealth")
		end
	
		ease(when, 0.25, "outCubic", {1, "invert",0, "flip"})
		ease(when+0.25, 0.25, "outCubic", {0, "invert",1, "flip"})
		ease(when+0.5, 0.25, "outCubic", {0.0, "invert",0.0, "flip"})
		ease(when+0.75, 0.25, "outCubic", {-0.75, "invert",0.25, "flip"})
		ease(when+1, 0.25, "outCubic", {0, "invert",0, "flip"})
	end
	
	wah(34)
	wah(38)
	wah(42)
	wah(50)
	wah(54)
	wah(58)
	
	wah(66)
	wah(70)
	wah(74)
	wah(76)
	
		
	ease(72,6, "inQuad",1, "bumpy")
	ease(78,1, "outExpo", 0, "bumpy")
	
	ease(63.5, 0.5, "inOutQuad", 2, "beat")
	set(72, 2, "beat__speed")
	ease(77.5, 0.5, "inOutQuad", 0, "beat")
	
	
	-- WAH  part 2
	
	wah_shorter(83)
	wah_shorter(87)
	wah_shorter(91)
	wah_shorter(99)
	wah_shorter(103)
	wah(106)
	
	ease(104, 0.25, "outCubic", {.75, "invert",.75, "flip"})
	ease(104.25, 0.75, "inCubic", {0, "invert",1, "flip"})
	set(105, {0, "invert",0, "flip"})
	value(105, 1, "outCubic", 180, 0, "rotatey")
	
	ease(104, 0.5, "outCubic", {0.9, "stealth", 0.9, "dark"})
	ease(104.5, 0.5, "inQuad", {0.75, "stealth", 0.75, "dark"})
	ease(105, 1, "outExpo", {0.0, "stealth", 0.0, "dark"})
		
	-- same loop as before.
	for i=80, 111 do
		-- skip beat 94 and 95.
		if not (i == 95 or i == 94) then
			add(i, 0.675, "impulse", {1.2, "scale"})
			add(i, 1, "bounce", {-0.2, "centered"})
		end
	end
	
	
	ease(81, 1, "bounce", brakeAmount, "brake")
	ease(82, 1, "bounce", brakeAmount, "brake")
	ease(81+4, 1, "bounce", brakeAmount, "brake")
	ease(82+4, 1, "bounce", brakeAmount, "brake")
	ease(89, 1, "bounce", brakeAmount, "brake")
	ease(90, 1, "bounce", brakeAmount, "brake")
	ease(93, 1, "bounce", brakeAmount, "brake")
	ease(97, 1, "bounce", brakeAmount, "brake")
	ease(98, 1, "bounce", brakeAmount, "brake")
	ease(101, 1, "bounce", brakeAmount, "brake")
	ease(102, 1, "bounce", brakeAmount, "brake")
	ease(105, 1, "bounce", brakeAmount, "brake")
	
	
	add(81, 1, "bounce", 1.2, "zoomx")
	add(82, 1, "bounce", 1.2, "zoomx")
	add(85, 1, "bounce", 1.2, "zoomx")
	add(86, 1, "bounce", 1.2, "zoomx")
	add(89, 1, "bounce", 1.2, "zoomx")
	add(90, 1, "bounce", 1.2, "zoomx")
	add(93, 1, "bounce", 1.2, "zoomx")
	add(98, 1, "bounce", 1.2, "zoomx")
	add(97, 1, "bounce", 1.2, "zoomx")
	add(101, 1, "bounce", 1.2, "zoomx")
	add(102, 1, "bounce", 1.2, "zoomx")
	add(105, 1, "bounce", 1.17, "zoomx")
	add(109, 1, "bounce", 1.18, "zoomx")
	
	-- more drunk and random nonsense.
	set(80,2, "drunk__speed")
	add(80, 1, "pop", 2, "drunk")
	add(80, 1, "bell", 2, "drunkz")
	
	set(84,2, "drunk__speed")
	add(84, 1, "pop", 2, "drunk")
	add(84, 1, "bell", -2, "drunkz")
	
	set(92,3, "drunk__speed")
	add(92, 1, "pop", 2, "drunk")
	add(92, 1, "bell", -2, "drunkz")
	
	
	set(81, 9, "drunk__speed")
	add(81, 1, "pop", 2, "drunk")
	add(82, 1, "pop", 2, "drunk")
	
	
	add(88, 1, "bounce", -22, "skewy")
	add(88, 1, "bounce", -2, "bumpyx")
	
	set(85, 9, "drunk__speed")
	add(85, 1, "pop", 2, "drunk")
	add(86, 1, "pop", 2, "drunk")
	
	set(89, 9, "drunk__speed")
	add(89, 1, "pop", 2, "drunk")
	add(90, 1, "pop", 2, "drunk")
	set(93, 9, "drunk__speed")
	add(93, 1, "pop", 2, "drunk")
	
	
	set(94, 60, "drunk__speed")
	add(93.93, 0.5, "impulse", 1.5, "drunk")
	
	ease(94.5, 1, "outSine", {1.5, "tipsy",-0.2, "flip"})
	ease(95.4, 0.6, "inSine", {0, "tipsy",0, "flip"})
	
	set(97, 9, "drunk__speed")
	set(101, 9, "drunk__speed")
	add(97, 1, "pop", -2, "drunk")
	add(98, 1, "pop", 2, "drunk")
	add(101, 1, "pop", -2, "drunk")
	add(102, 1, "pop", 2, "drunk")
	
	add(96, 1, "pop", 2, "bumpyx")
	
	
	
	set(105, 9, "drunk__speed")
	add(105, 1, "pop", 1.5, "drunk")
	add(105, 1, "pop", -0.2, "drunkz")
	
	
	set(109, 9, "drunk__speed")
	add(109, 1.3, "pop", -2, "drunk")
	
	
	set(108,2, "drunk__speed")
	add(108, 1, "pop", 2, "drunk")
	add(108, 1, "bell", 2, "drunkz")
	set(100,2, "drunk__speed")
	add(100, 1, "pop", 2, "drunk")
	add(100, 1, "bell", 2, "drunkz")
	
	ease(93.85, 1.25, "inOutCubic", 1, "brake")
	ease(95.4, 0.6, "inSine", 0, "brake")
	
	
	
	
	-- end of wah wah to end transition
	
	ease(110, 0.5, "outCubic", 1, "videogames")
	ease(110.5, 0.5, "outCubic", 0, "videogames")
	ease(111, 0.5, "outCubic", 1, "invert")
	ease(111.5, 0.5, "outCubic", 0, "invert")
	
	
	ease(110,4, "inOutSine", {0, "rotatex",0, "anglex"})
	
	
	ease(120,6, "inQuad", 4, "bumpy")
	ease(126,1, "outExpo", 0, "bumpy")
	
	
	-- ease into the effect a bit.
	add(110,1, "bounce", {17/3, "rotatez",17/3, "anglez"})
	add(111,1, "bounce", {-17/1.7, "rotatez",-17/1.7, "anglez"})
	
	for i=110, 112-0.25,0.25 do
		add(i,0.3, "impulse", {0.785/2, "tinyy",-0.65/2, "tinyx"})
	end
	for i=112, 126-0.25,0.25 do
		add(i,0.3, "impulse", {0.785, "tinyy",-0.65, "tinyx"})
	end
	for i=112, 124,2 do
		add(i,1, "bounce", {17, "rotatez",17, "anglez"})
		add(i+1,1, "bounce", {-17, "rotatez",-17, "anglez"})
	end
	
	set(110, 1, "beat__speed")
	ease(111.5, 0.5, "inOutQuad", 3, "beat")
	set(120, 2, "beat__speed")
	set(124, 4, "beat__speed")
	ease(124, 2, "inOutQuad", 2, "beat")
	ease(126, 1, "outExpo", 0, "beat")
	

	
	--end chaos.
	-- Although the motions look complex, it's actually just a few for loops working together to create overlapping, repeating effects
	ease(128, 1, "linear", 0.5, "zigzag")
	ease(162, 4, "linear", 0.0, "zigzag")
	ease(128, 1, "linear", 1, "wave")
	

	for i=128, 160-1, 1 do
		add(i, 1, "pop", 1, "scale")
	end
	
	for i=128, 160-2, 2 do
		add(i+1-0.125, 0.5, "pop", -1, "cosbumpyx")
		add(i+1, 0.5, "pop", 1, "cosbumpyx")
		
		add(i+1-0.125+0.5, 0.5, "pop", 1, "cosbumpyx")
		add(i+1+0.5, 0.5, "pop", -1, "cosbumpyx")
		
		add(i+1-0.125, 0.5, "impulse", 1, "tinyx")
		add(i+1, 0.5, "impulse", 1, "tinyy")
		
		add(i+1-0.125+0.5, 0.5, "impulse", 1, "tinyx")
		add(i+1+0.5, 0.5, "impulse", 1, "tinyy")
	end
	
	for i=128, 160-4, 4 do
		add(i+2.2, 0.75, "bell", 1, "invert")
		
		add(i+3, 0.75, "bell", -0.6, "flip")
		
		add(i, 1, "tap", 1, "tipsy")
		add(i, 1, "tap", 1, "drunk")
		add(i, 1, "impulse", 1, "tipsy")
		add(i, 1, "impulse", 1, "drunk")
		add(i, 1, "tri", 0.3, "zoomx")
		add(i, 1, "pop", -0.3, "flip")
	end
	
	
	for i=160, 166-0.5, 0.5 do
		add(i, 0.5, "impulse", 0.5, "drunkz")
		
		add(i, 0.5, "bounce", 0.45, "zoomx")
		add(i, 0.5, "pop", -0.1, "flip")
		
		add(i, 0.5, "pop", 1.2, "invert")
	end
	
	add(165.5, 0.5, "outCubic", 1, "speedmod")
	add(166, 0.5, "outCubic", -1, "speedmod")
	
	add(166, 2, "popElastic", 15, "rotatez")
	add(166, 2, "popElastic", 16, "skewy")
	
	add(166, 1, "impulse", 0.75, "zoom")
	add(166, 1, "impulse", 0.5, "scale")
	set(166,1.5,"drunk__mult")
	set(166,9.5,"drunk__speed")
	add(166, 3, "impulse", -2, "drunk")


	-- some extra additions
	add(128, 1, "bounce", -45, "rotatey")
	add(128, 1, "pop", 3.2, "drunkz")
	add(144, 1, "bounce", 45, "rotatey")
	add(144, 1, "pop", 3.2, "drunkz")

	add(136-0.12, 1.05, "bell", {0.8, "stealth", 1, "dark"})

	add(140, 1, "outQuad", -112*2, "z")
	add(144, 1, "outCubic", -112*2*-1, "z")


	add(156, 1, "outQuad", -112*2, "z")
	if downScroll then
		add(159, 166-159, "linear", {66, "rotatex", 66, "anglex", -1, "centered"})
	else
		add(159, 166-159, "linear", {-66, "rotatex", -66, "anglex", -1, "centered"})
	end

	ease(166, 1, "outQuad", 2, "mini")

end



