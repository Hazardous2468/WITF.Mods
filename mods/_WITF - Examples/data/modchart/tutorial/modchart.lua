function onCreate()
end

local tinyMultFix = 2 --WITF 1.0.0a fix

function setUp()
	centerPlayer("")
	centerOpponent("")
end

function modsTimeline()
	--setasleep(0, "dad", true) --dad doesn't do anything lmao

	set(-16, -1.23, "flip", 2)
	
	set(-16, 0.75, "stealth", 2)
	set(-16, 0.75, "dark", 2)
	
	set(-16, 0.5, "beat", 2)
	
	set(-16, -1, "movez", 2)
	
	set(-16, -1.88, "movex--1", 2)
	set(-16, 1.88, "movex--2", 2)
	
	
	
	set(-16, 400, "debugx", 1)
	set(-16, -400, "debugx", 2)
	
	
	
	setdefault(1, "showallmods")
	
	set(-16, 1, "arrowpathred",1)
	set(-16, 1, "arrowpathgreen",1)
	set(-16, 1, "arrowpathblue",1)
	ease(3, 1, "outExpo", 0.25, "arrowpath",1)
	
	set(-16, 1, "sudden",1)
	set(-16,555, "sudden__offset",1)
	
	
	ease(74, 4, "inOutSmoothStep", 1, "twirl",2)
	
	ease(80-2, 4, "inOutSmoothStep", -1, "tipsy",2)
	
	ease(32, 1, "inOutSmoothStep", 1, "reverse",2)
	ease(34, 1, "inOutSmoothStep", 0, "reverse",2)
	ease(32+4, 1, "inOutSmoothStep", 1, "reverse",2)
	ease(34+4, 1, "inOutSmoothStep", 0, "reverse",2)
	
	ease(66, 1, "inOutSmoothStep", 1, "reverse",2)
	ease(96, 4, "backIn", -0.6, "reverse",2)
	ease(96, 4, "outSine",1, "drunk",2)
	ease(96, 2, "pop",-0.25*tinyMultFix, "tiny",2)
	
	ease(102, 2, "sineIn",1*tinyMultFix, "tiny",1)

	set(5, 35, "arrowpathgrain", 1)
	set(5, 0, "arrowpathbacklength", 1)
	
	set(0, 2750, "arrowpathlength", 1)
	set(5, 1.0, "drawdistance", 1)
	
	set(0, 0.1, "arrowpathwidth", 1)
	set(0, 1, "zsort")
	
	
	for i = 3, 128 do
		add(i, 0.5, "pop",0.25,"arrowpathwidth",1)
	end
	
	
	
	ease(97, 6, "inSine", 0,"arrowpathlength",1)
	

	--ease(7, 1, "outExpo", 1, "bumpyx--1")
	
	ease(9, 1, "linear", 0.85,"dark",1)
	
	if downScroll then
		ease(9, 1, "linear", -90,"rotatex",1)
	else
		ease(9, 1, "linear", 90,"rotatex",1)
	end
	
	--add(20, 64+64, "smoothstepinout", 360*16,"rotatey",1)
	add(88, 32, "linear", 360*4,"rotatey",1)

	add(96, 8, "outCubic", 360*1,"rotatey",1)

	--set(0, 1, "spiralholds", 1)
	
	ease(5, 1, "linear", 0.5,"flip",1)
	
	local bumpSize = 3
	local speedMod = 3
	local bumpMult = 0.5/speedMod
	set(5, speedMod, "speedmod", 1)
	
	set(7, 1*bumpMult, "bumpyx--0__mult",1)
	ease(7, 1, "outExpo", 1*bumpSize, "bumpyx--0",1)
	set(7, 0.5*bumpMult, "bumpyz--0__mult",1)
	ease(7, 1, "outExpo", 1*bumpSize, "bumpyz--0",1)
	
	set(7, 0.5*bumpMult, "bumpyx--1__mult",1)
	ease(7, 1, "outExpo", 1*bumpSize, "bumpyx--1",1)
	set(7, 1*bumpMult, "bumpyz--1__mult",1)
	ease(7, 1, "outExpo", -1*bumpSize, "bumpyz--1",1)
	
	set(7, 0.5*bumpMult, "bumpyx--2__mult",1)
	ease(7, 1, "outExpo", -1*bumpSize, "bumpyx--2",1)
	set(7, 1*bumpMult, "bumpyz--2__mult",1)
	ease(7, 1, "outExpo", 1*bumpSize, "bumpyz--2",1)
	
	set(7, 1*bumpMult, "bumpyx--3__mult",1)
	ease(7, 1, "outExpo", -1*bumpSize, "bumpyx--3",1)
	set(7, 0.5*bumpMult, "bumpyz--3__mult",1)
	ease(7, 1, "outExpo", -1*bumpSize, "bumpyz--3",1)
	
	ease(9, 1, "linear", 2, "movey",1)
	
	
	ease(16, 4, "linear", 0.25, "alphastrum",1)
	ease(32, 1, "linear", 0.0, "alphastrum",1)
	
	--ease(7, 1, "outExpo", 1, "tornado",1)
	--ease(7, 1, "outExpo", 1, "tornadoz",1)
	
	
	
	--ease(9, 1, "outExpo",0.03, "spiralx--3",1)
	--ease(9, 1, "outExpo",-0.03, "spiralx--1",1)
	--ease(9, 1, "outExpo",0.2, "circx--0",1)


	set(-16, -1, "centered", 1)
	ease(0.78, 0.59, "outCubic", 0, "centered",1)
	
	set(-16, 1*tinyMultFix, "tiny", 1)
	ease(0.78, 0.59, "backOut", 0, "tiny",1)

	for i = 32 , 128 do
		add(i, 1, "linear", beatLength * 1 * 2.225, "drive2",1)
		add(i, 1, "linear", beatLength * 1 * speedMod *-1, "drive",1)
	end
	

end
