function setUp()
	centerStrum("1")
	createNewPlayer(true)
	runHaxeCode(
	[[

		var target1 = PlayState.instance.playerStrumline.mods;
		
		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.arrowPathFileName = "matoi/arrowPath";
		}

	]])
end


function modsTimeline()	
	runHaxeCode(
	[[

		var target1 = PlayState.instance.playerStrumline.mods;
		
		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.arrowPathFileName = "matoi/arrowPath";
		}

	]])
	




	setdefault(-24, "movex", "dad")
	setasleep(-20, "dad", true)
	targetExclude("dad")


	setasleep(-20, "3", true)


	for i=4, 36-4, 4 do
		add(i-0.05, 1.25 , "tri", {-1.2, "drunk", -1.2, "tipsy"})
	end
	set(35, 3, "waveyy__speed")
	ease(35.5, 1, "inOutQuart", {2, "drunk", 1, "waveyy"},"1")
	--ease(37.5, 1, "inOutQuart", {0, "drunk", 0, "waveyy"},"1")
	


	local lazyAlternator = -1
	local b = getNoteBeats(3.95, 35.9, "dad")
	for i, v in ipairs(b) do
		if not (v[4] == "hurt") then
			if lazyAlternator == 1 then
				lazyAlternator = -1
			else
				lazyAlternator = 1
			end

			local duration = 0.25
			if v[2] == 1 then
				duration = 0.5
			elseif v[2] == 2 then
				duration = 0.75
			elseif v[2] == 3 then
				duration = 1
			end

			add(v[1], duration,"impulse",0.35,"scale")

			add(v[1], duration,"pop", 0.5*lazyAlternator, "drunk")

		end
	end


	--ease(36, 2, "inOutQuart", 1, "alpha", "1")
	





	local b = getNoteBeats(37.95, 83.99, "dad")
	for i, v in ipairs(b) do
		if not (v[4] == "hurt") then
			if lazyAlternator == 1 then
				lazyAlternator = -1
			else
				lazyAlternator = 1
			end

			local duration = 0.25
			if v[2] == 1 then
				duration = 0.5
			elseif v[2] == 2 then
				duration = 0.75
			elseif v[2] == 3 then
				duration = 1
			end

			add(v[1], duration,"impulse",0.35,"scale", 3)
			add(v[1], duration,"impulse",0.1875,"arrowpathwidth", 3)

			add(v[1], duration,"impulse",lazyAlternator*1,"drunkangle", 3)

			add(v[1], 	duration, "pop",0.35*lazyAlternator, "drunkx", 3)
			add(v[1], duration, "pop",0.35*lazyAlternator, "drunky", 3)
			add(v[1], duration, "pop",0.35*lazyAlternator, "drunkz", 3)
		end
	end







	local b = getNoteBeats(37.95, 83.99, "bf")
	for i, v in ipairs(b) do
		if not (v[4] == "hurt") then
			add(v[1], 1,"flip(outQuad)",1,"z--"..v[2], 3)
		end
	end


	setasleep(36, 3, false)

	setdefault(1, "alpha", 3)
	set(36, 1, "alpha", 3)
	ease(36, 2, "linear",0, "alpha", 3)
	set(36, 112*3, "debugx", 3)

	set(36,1, "custompath","3")
	set(36,0.5, "flip","3")
	
	set(36, 0.5, "speedmod", 3)

	set(36, 0,"drunk__desync",3)
	set(36, 0,"drunky__desync",3)
	set(36, 0,"drunkz__desync",3)

	set(36, 1, "drunk__speed",3)
	set(36, 1.33, "drunky__speed",3)
	set(36, 0.85777, "drunkz__speed",3)

	set(36, 1, "drunk__mult",3)
	set(36, 1.1, "drunky__mult",3)
	set(36, 0.85777, "drunkz__mult",3)

	add(62, 80-62, "inOutSmoothStep",0.5, "drunkx", 3)
	add(62, 80-62, "inOutSmoothStep",0.5, "drunky", 3)
	add(62, 80-62, "inOutSmoothStep",0.5, "drunkz", 3)

	for i=38, 86 do
		add(i, 1, "linear", 195, "drive2", 3)
	end
	add(83, 3, "outCubic", 360*2, "angle", 3)

	set(82, 13/2, "tipsy__speed",3)
	set(82, 16/2, "tipsyX__speed",3)
	add(83, 2, "outCubic", 0.5, "tipsy", 3)
	add(83, 2, "outCubic", 0.5, "tipsyX", 3)

	set(36,0.5, "drawsize","3")
	set(36,1, "sudden","3")
	set(36,2500, "sudden__offset","3")

	set(36,1, "hidden","3")
	set(36,-50, "hidden__start","3")
	set(36,-300, "hidden__end","3")
	set(36,1, "hidden__stealthpastreceptors","3")

	if difficulty ~= "easy" then
		ease(57, 10, "inOutSmootherStep", {1000, "hidden__start", 500,"hidden__end"}, 3 )
	end
	
	
	set(36,1, "spiralholds","3")
	set(36,1, "spiralpaths","3")
	set(36,1, "arrowpath--0","3")
	set(36,0.05, "arrowpathwidth","3")
	set(36,35, "pathgrain","3")
	set(36,2555, "arrowpathlength","3")
	set(36,0, "arrowpathbacklength","3")

	set(36,0.25, "scale","3")
	set(36,112*-2, "z","3")
	set(36,sw*-0.455, "x","3")





	set(85,-0.1, "drawsize","1")



	add(60, 84-60, "inOutSmootherStep", {360*2, "rotatex"}, 3 )

	ease(83, 3, "inOutSmootherStep", {1, "alpha",0,"arrowpath--0"}, 3 )




	ease(87, 1, "inSine", {0.7, "drunk", 0.25, "waveyy"},"1")



	for c=0, 3 do
		ease(91, 1, "outQuart", 0, "reverse--"..c,"1")
		ease(95.25, 1, "outQuart", 1, "reverse--"..c,"1")
		ease(98.5, 1, "inOutQuart", 0, "reverse--"..c,"1")
		ease(102.75, 1, "outElastic", 1, "reverse--"..c,"1")
		ease(107, 1, "outQuart", 0, "reverse--"..c,"1")
		ease(111.25, 1, "outQuart", 1, "reverse--"..c,"1")
		ease(114.5, 1, "inOutQuart", 0, "reverse--"..c,"1")
	end
	add(118.75, 1, "outCubic", 360, "angle", "1")


	ease(81, 2, "linear", 0, "sudden__offset","3")
	set(82, 0, "drawsize","3")

	local b = getNoteBeats(120.5, 151.89, "dad")
	for i, v in ipairs(b) do
		if (v[4] == "hurt") then
			if lazyAlternator == 1 then
				lazyAlternator = -1
			else
				lazyAlternator = 1
			end

			local duration = 0.25
			if v[2] == 1 then
				duration = 0.5
			elseif v[2] == 2 then
				duration = 0.75
			elseif v[2] == 3 then
				duration = 1
			end

			add(v[1], duration,"bounce",0.2,"scale", 1)
			add(v[1], duration,"impulse",0.2,"scale", 1)


			add(v[1], duration,"bounce",0.1,"zoom", 1)
			add(v[1], duration,"bounce",{-7*lazyAlternator,"anglez",2*lazyAlternator,"rotatez"}, 1)
		else
			add(v[1], 2,"flip(outExpo)", 1,"arrowpathwidth--"..v[2], 1)
			add(v[1], 3,"flip(inOutSine)", 1,"arrowpath--"..v[2], 1)
		end
	end
	for c=0, 3 do
		set(120, 0.05, "arrowpathwidth--"..c, 1)
	end


	local b = getNoteBeats(151.95, 188, "dad")
	for i, v in ipairs(b) do
		if (v[4] == "hurt") then
			if lazyAlternator == 1 then
				lazyAlternator = -1
			else
				lazyAlternator = 1
			end

			local duration = 0.25
			if v[2] == 1 then
				duration = 0.5
			elseif v[2] == 2 then
				duration = 0.75
			elseif v[2] == 3 then
				duration = 1
			end

			add(v[1], duration,"bounce",0.25,"scale", 1)
			add(v[1], duration,"impulse",0.25,"scale", 1)

			

			if v[1] < 181.67 then
				add(v[1], duration,"bounce",0.25,"zoom", 1)
				add(v[1], duration,"bounce",{13*lazyAlternator,"anglez",13*lazyAlternator,"rotatez"}, 1)
			else
				add(v[1], duration,"bounce",0.1,"zoom", 1)

				add(v[1], duration,"flip(inOutExpo)",1,"stealth", 1)


				value(v[1], duration, "outExpo", 0, 1 , "dark", 1)
			end
		else
			add(v[1], 2,"flip(outExpo)", 1,"arrowpathwidth--"..v[2], 1)
			add(v[1], 3,"flip(inOutSine)", 0.25,"arrowpath--"..v[2], 1)
		end
	end
	--ease(181, 2, "outSine", 1 , "dark", 1)
	ease(181, 2, "outSine", -1 , "alphasplash", 1)
	ease(187.75, 0.5, "inOutExpo", 0 , "dark", 1)
	ease(187.75, 0.5, "inOutExpo", 0 , "alphasplash", 1)




	for i=88, 118, 4 do
		add(i, 2, "outSine",8,"drunk__timeoffset", 1)
		add(i, 2, "linear",2,"drunk__timeoffset", 1)

		add(i, 2, "pop",1,"scale", 1)
	end

	add(90, 1, "bounce",-0.25, "scale", 1)
	add(91, 1, "impulse",1, "scale", 1)
	add(95.25, 1, "impulse",1, "scale", 1)
	add(90+8, 1, "bounce",-0.25, "scale", 1)
	add(91+8, 1, "impulse",1, "scale", 1)

	add(102.75, 1, "impulse",1, "scale", 1)
	add(102.75, 1, "outCubic",360, "rotatey", 1)

	add(106, 1, "bounce",-0.1, "scale", 1)
	add(107, 1, "impulse",1, "scale", 1)
	add(111.25, 1, "impulse",1, "scale", 1)


	add(98.25, 1.5, "inOutCubic",180, "noteskewy", 1)

	add(93.9, 0.7, "inverse",2, "zoomx", 1)
	set(93.9 + (0.7/2), 1, "flip", 1)
	ease(95.25, 1, "outBack", 0, "flip", 1)

	add(16+93.9, 0.7, "inverse",2, "zoomx", 1)
	set(16+93.9 + (0.7/2), 1, "invert", 1)
	ease(16+95.25, 1, "outBack", 0, "invert", 1)

	add(114, 1, "bounce",-0.25, "scale", 1)
	add(115, 1, "impulse",1, "scale", 1)


	for i=98, 99-(1/3), 1/3 do
		add(i, 1/3, "outExpo", -360 / 3, "angle", 1)
		add(i, 1/3, "impulse", 0.25, "scale", 1)
	end

	for i=114, 115-0.25, 0.25 do
		add(i, 0.25, "outExpo", 360 / 4, "angle", 1)
		add(i, 0.25, "impulse", 0.25, "scale", 1)
	end

	ease(107.5, 0.5, "pop",0.3, "stealth", 1)
	ease(107.5, 0.5, "flip(inQuart)",-0.5, "flip", 1)
	ease(107.5, 0.5, "flip(inQuart)",-25, "noteskewx", 1)
	ease(107.5, 0.5, "flip(inQuart)",3.25, "attenuate", 1)


	for i=106, 107-0.25, 0.25 do
		--add(i, 0.25, "outExpo", 360 / 4, "angle", 1)
		add(i, 0.25, "flip(inOutCubic)", {1, "stealth",1, "dark"}, 1)
	end
	ease(106, 0.125, "outExpo", 1, "flip", 1)
	ease(106.25, 0.125, "outExpo", {1, "invert", 0, "flip"}, 1)
	ease(106.5, 0.125, "outExpo", {-1, "invert", 1, "flip"}, 1)
	ease(106.75, 0.125, "outExpo", {-0.75, "invert", 0.25, "flip"}, 1)
	ease(107, 0.125, "outExpo", {0, "invert", 0, "flip"}, 1)





	ease(118, 2, "inQuad",0.5,"speedmod", 1)

	set(-16, 2, "rotatey--0__priority", "1")
	set(-16, 2, "rotatey--1__priority", "1")
	set(-16, 2, "rotatey--2__priority", "1")
	set(-16, 2, "rotatey--3__priority", "1")
	resort(-16,"1")

	if difficulty ~= "easy" then

		ease(150, 4, "inOutSine",1,"tornadoz", 1)
		ease(181, 2, "inOutSine",0,"tornadoz", 1)

		add(152, 182-152, "inOutSmootherStep",360*6,"rotatey--0", 1)
		add(152, 182-152, "linear",360*3,"rotatey--0", 1)

		add(152, 182-152, "inOutSmootherStep",360*6,"rotatey--3", 1)
		add(152, 182-152, "linear",360*3,"rotatey--3", 1)

		add(152, 182-152, "inOutSmootherStep",360*-6,"rotatey--2", 1)
		add(152, 182-152, "linear",360*-3,"rotatey--2", 1)
		add(152, 182-152, "inOutSmootherStep",360*-6,"rotatey--1", 1)
		add(152, 182-152, "linear",360*-3,"rotatey--1", 1)

	end
	


	set(120, {0,"noteskewy",0, "rotatey"}, "1")





	set(119, 1, "3d", "1")

	for i=128, 182-0.5, 0.25 do
		for c=0, 3 do
			set(i, math.random(-45, 45), "anglex--"..c, "1")
			set(i, math.random(-45, 45), "angley--"..c, "1")
		end
	end
	for c=0, 3 do
		set(182-0.25, 0, "anglex--"..c, "1")
		set(182-0.25, 0, "angley--"..c, "1")
	end

	ease(188, 1, "inOutSine", {0, "drunk", 0, "waveyy"}, "1")

	set(188.75, 1, "spiralholds")

	local offset = 204 - 197
	offset = offset *-1



	ease(188, 0.25, "outQuad", 0.6, "speedmod", "1")
	ease(188.5, 0.25, "outQuad", 0.7, "speedmod", "1")

	if difficulty ~= "easy" then
		add(189, 196-189, "linear", 360, "rotatez", "1")
		
		add(192, 4, "inOutSine", -360, "rotatey", "1")
	end
	ease(192, 3.67, "inOutSine", -112*4, "z", "1")


	ease(188, 1, "outQuart", 1.2,"wave", "1")
	ease(192, 4.5, "inSine", 0, "wave", "1")


	ease(188, 0.5, "outQuart", {0.25, "flip", -0.75, "invert"}, "1")
	ease(188.5, 0.5, "outQuart", {12.5/100, "flip", -37.5/100, "invert"}, "1")
	ease(192, 4, "inSine", {0, "flip", 0, "invert"}, "1")


	set(201+offset, 0.85777, "drunkz__mult",1)
	ease(201.5+offset, 2.5, "inOutSine", {0.3, "drunk", 0.1, "waveyy" ,0.25, "drunkz"}, "1")

	ease(196, 1, "inOutSine", 0.25, "speedmod", "1")

	add(196-0.125, 1.25, "inOutSine", -90, "rotatez", "1")
	ease(196, 1, "outSine", 0, "z", "1")

	set(196, 0, "blacksphere__speedaffect")
	ease(197, 2, "linear", 180, "blacksphere", "1")
	ease(199, 2, "outQuart", 360, "blacksphere", "1")
	--ease(199, 2, "outQuart", -1, "invert", "1")
	set(201, {0,"blacksphere"}, "1")


	add(196, 0.25, "pop", 1, "scalex", "1")
	add(196.25, 0.25, "pop", 1, "scaley", "1")
	add(196.5, 0.25, "pop", 1, "scalex", "1")
	add(196.75, 0.25, "pop", 1, "scaley", "1")

	ease(196, 0.25, "outQuart", 1, "invert", "1")
	ease(196.25, 0.25, "outQuart", 0, "invert", "1")
	ease(196.5, 0.25, "outQuart", 1, "invert", "1")
	ease(196.75, 0.25, "outQuart", 0, "invert", "1")

	for i=204+offset, 232-4+offset, 8 do
		--add(i+2, 2, "outCubic", -360, "angle", "1")
		add(i+2, 2, "impulse", 1, "scale", "1")
		add(i+2+4, 1, "pop", 0.25, "scale", "1")
		add(i+4+2, 2, "outCubic", 360, "angle", "1")
	end
	

	offset = offset - 0.05

	-- for debugging:
	--set(201, {0, "drunk", 0, "waveyy", 1, "arrowpath", 0.1, "arrowpathwidth", 1, "spiralpaths"},"1")


	ease(196, 1, "linear", 1, "hidden",1)
	set(195, -14, "hidden__start")
	set(195, -355, "hidden__end")
	set(195, 0, "hidden__offset")

	set(offset+204, 0, "drive2")
	add(offset+204, 4, "linear", 805, "drive2", "1")

	set(offset+208, 0, "yd")
	set(offset+208, 180, "anglez")
	set(offset+208, 0, "rotatez")
	set(offset+208, 200, "z")
	set(offset+208, -888, "x")
	--set(offset+208, -666, "z")
	set(offset+208, 0.06, "speedmod")
	set(offset+208, 1, "centered")
	set(offset+208, {-0.06, "lineary", 1, "spiralholds"})
	set(offset+208, {4, "circular", 3.8, "circular__speed"})
	set(offset+208, 1600, "drive2")
	add(offset+208, 4, "linear", 800, "drive2", "1")

	set(offset+212, 0, "x")
	set(offset+212, 0, "yd")
	set(offset+212, {0, "lineary", 1, "spiralholds"})
	set(offset+212, {0, "circular",0,"centered"})
	set(offset+212, {-260, "drive2"})
	set(offset+212, {200, "z"})
	set(offset+212, {.256, "speedmod"})
	set(offset+212, {233, "rotatez",0, "anglez"})
	add(offset+212, 4, "linear", 835, "drive2", "1")
	if difficulty ~= "easy" then
		set(offset+212, 0, "flip")
		ease(offset+213, 2, "inOutBack", 1, "flip", "1")
	else
		set(offset+212, 1, "flip")
		ease(offset+213, 2, "inOutBack", 0, "flip", "1")
	end


	set(offset+216, 2, "bumpyz")
	set(offset+216, 0, "rotatez")
	set(offset+216, 0.1, "reverse--0","1")
	set(offset+216, 0.9, "reverse--1","1")
	set(offset+216, 0.1, "reverse--2","1")
	set(offset+216, 0.9, "reverse--3","1")
	set(offset+216, -260, "drive2")
	add(offset+216, 4, "linear", 855, "drive2", "1")

	set(offset+220, 0.0, "reverse--0","1")
	set(offset+220, 0.0, "reverse--1","1")
	set(offset+220, 0.0, "reverse--2","1")
	set(offset+220, 0.0, "reverse--3","1")
	set(offset+220, 0, "flip")
	set(offset+220, -260, "drive2")
	add(offset+220, 4, "linear", 915, "drive2", "1")
	set(offset+220, 0, "bumpyz")
	set(offset+220, 0.129, "bumpyy")
	set(offset+220,45, "rotatez","1")
	set(offset+220,1, "hourglass","1")
	set(offset+220,600, "hourglass__start","1")
	set(offset+220,100, "hourglass__end","1")

	set(offset+224, 0, "bumpyy")
	set(offset+224, -1.1, "bumpyx--0")
	set(offset+224, 1.25, "bumpyx--1")
	set(offset+224, -1.25, "bumpyx--2")
	set(offset+224, 1.1, "bumpyx--3")
	set(offset+224,-90, "rotatez","1")
	set(offset+224,0, "reverse--0","1")
	set(offset+224,1, "reverse--1","1")
	set(offset+224,0, "reverse--2","1")
	set(offset+224,1, "reverse--3","1")
	set(offset+224,0, "hourglass","1")
	set(offset+224, -133, "drive")
	set(offset+224, 0, "drive2")
	add(offset+224, 4, "linear", 935, "drive2", "1")

	set(offset+228, 0, "bumpyx--0")
	set(offset+228, 0, "bumpyx--1")
	set(offset+228, 0, "bumpyx--2")
	set(offset+228, 0, "bumpyx--3")
	set(offset+228, 0, "bumpyx")
	set(offset+228,1, "reverse--0","1")
	set(offset+228,1, "reverse--1","1")
	set(offset+228,1, "reverse--2","1")
	set(offset+228,1, "reverse--3","1")
	set(offset+228, .5, "flip","1")
	set(offset+228, 0, "rotatez","1")
	set(offset+228, 90, "rotatez--1","1")
	set(offset+228, 180, "rotatez--2","1")
	set(offset+228, 270, "rotatez--3","1")
	set(offset+228, 0, "rotatez--0","1")
	set(offset+228, 90, "rotatez","1")
	--set(offset+228, 3, "cubicx","1")
	--set(offset+228, -2, "circx","1")
	--set(offset+228, 0, "circx__altcurpos","1")
	set(offset+228, 0.15, "speedmod","1")

	set(offset+228, 111, "drive2")
	add(offset+228, 4, "linear", 1056, "drive2", "1")

	ease(offset+230, 1, "outSine", 1, "cubicx", "1")
	ease(offset+230, 1, "outSine", 0.14, "speedmod", "1")

	set(offset+232,0, "reverse--0","1")
	set(offset+232,0, "reverse--1","1")
	set(offset+232,0, "reverse--2","1")
	set(offset+232,0, "reverse--3","1")

	set(offset+232, 0.2, "speedmod","1")
	set(offset+232, -0.2, "lineary","1")
	--set(offset+232, 2, "bumpyx","1")
	set(offset+232, 1, "attenuate","1")
	set(offset+232, -0.1, "circz","1")
	set(offset+232, 1.5, "centered","1")
	set(offset+232, 0, "flip","1")
	set(offset+232, 0, "cubicx","1")
	set(offset+232, 0, "rotatez","1")
	set(offset+232, 0, "rotatey","1")
	set(offset+232, 0, "rotatez--1","1")
	set(offset+232, 0, "rotatez--2","1")
	set(offset+232, 0, "rotatez--3","1")
	set(offset+232, -2.5, "circularZ")
	set(offset+232, 3, "circularZ__speed")
	set(offset+232, 112*-10, "z")	
	set(offset+228+4, 455, "drive2")
	set(offset+228+4, -0.7, "tipsy")
	add(offset+228+4, 4, "linear", 1058, "drive2", "1")
	add(offset+228+4, 4, "inSine", {45, "rotatez",45, "anglez"}, "1")
	add(offset+228+4, 4, "instant", {-45/3, "rotatez",-45/3, "anglez"}, "1")


	runHaxeCode(
	[[
		for (strumLine in PlayState.instance.allStrumLines)
		{	
			var spinAroundMod:CustomModifier = createCustomMod("circularZ", 0.0);
			spinAroundMod.modPriority = 100;
			spinAroundMod.notesMod = true;
			spinAroundMod.holdsMod = true;
			spinAroundMod.pathMod = true;
			strumLine.mods.addCustomMod(spinAroundMod);	
			
			spinAroundMod.createSubMod("speed", 1.0);
						
			spinAroundMod.noteMathFunc = function(data){
				if(spinAroundMod.currentValue==0) return;
				var p:Float = data.curPos / (ModConstants.strumSize * spinAroundMod.getSubVal("speed"));
			
				var _movey:Float = FlxMath.fastCos(p * Math.PI);
				var _movez:Float = FlxMath.fastSin(p * Math.PI);
				
				data.y += _movez * spinAroundMod.currentValue * ModConstants.strumSize;
				data.z -= _movey * spinAroundMod.currentValue* ModConstants.strumSize;
				data.z += ModConstants.strumSize*spinAroundMod.currentValue;
			}

			var spinAroundMod:CustomModifier = createCustomMod("circular", 0.0);
			spinAroundMod.modPriority = 100;
			spinAroundMod.notesMod = true;
			spinAroundMod.holdsMod = true;
			spinAroundMod.pathMod = true;
			strumLine.mods.addCustomMod(spinAroundMod);	
			
			spinAroundMod.createSubMod("speed", 1.0);
			spinAroundMod.createSubMod("angular", 45.0);
						
			spinAroundMod.noteMathFunc = function(data){
				if(spinAroundMod.currentValue==0) return;
				var p:Float = data.curPos / (ModConstants.strumSize * spinAroundMod.getSubVal("speed"));
			
				var _movey:Float = FlxMath.fastCos(p * Math.PI);
				var _movez:Float = FlxMath.fastSin(p * Math.PI);
				
				data.y += _movez * spinAroundMod.currentValue * ModConstants.strumSize;
				data.x -= _movey * spinAroundMod.currentValue* ModConstants.strumSize;
				data.x += ModConstants.strumSize*spinAroundMod.currentValue;

				var angleMultThing = spinAroundMod.getSubVal("angular");
				data.angleZ -= spinAroundMod.currentValue * angleMultThing * p;
				if(data.noteType == "note"){
					p = data.curPos;
					if(data.whichStrumNote != null) p=data.whichStrumNote.noteModData.curPos;
					var p:Float = p / (ModConstants.strumSize * spinAroundMod.getSubVal("speed"));
					data.angleZ += spinAroundMod.currentValue * angleMultThing * p;
				}	
			}
		}
	]])



	reset(228.95)
	set(228.95, 1, "centered", 1)
	set(228.95, 0.5, "flip", 1)

	set(231.95, 0, "centered", 1)
	set(231.95, 0.0, "flip", 1)
	set(231.95, 1, "hidden", 1)
	set(231.95, -20, "hidden__start", 1)
	set(231.95, -64, "hidden__end", 1)
	set(231.95, 1, "hidden__noglow", 1)
	reset(236)


end


