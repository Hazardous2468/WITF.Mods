function onCreate()
	notesBehindHUD(true)
end

function setUp()
	centerPlayer("")
	createNewPlayer(true)
	--hideNotifs(true)
end

function modsTimeline()

	local upscrollfix = -1
	if downScroll then
		upscrollfix = 1
	end

	setdefault(1, "stealthglowred")
	setdefault(1, "stealthglowgreen")
	setdefault(1, "stealthglowblue")


	setasleep(0, "dad", true) --dad doesn't do anything lmao
	
	setasleep(0, "3", false) --used for the driven drop at start
	
	
	set(-16, 1, "dark", 3)
	set(-16, 1, "stealth", 1)
	
	set(-16, 0, "movex", 3)
	set(-16, 0, "alpha", 3)
	set(-16,-4*112, "debugx", "3")
	set(-16,4*112, "debugx", "1")
	
	set(32, 1 , "jump", "3")
	set(32, 0.5 , "jump__beat", "3")
	set(36, 0.25 , "jump__beat", "3")
	
	setasleep(50, "3", true) 

	setdefault(-16, "movex", "3")
	setdefault(-16*112, "debugx", "3")
	setdefault(1, "alpha", "3")
	
	setdefault(-16, "movex", "dad")
	setdefault(-16*112, "debugx", "dad")
	setdefault(1, "alpha", "dad")
	
	setdefault(0, "center")
	--setdefault(1, "center__oldmath")
	
	--fix for speedmod lane?
	setdefault(1, "speedmod--1")
		
	set(-16, 0.56, "speedmod")
	set(-16, 0.56, "oldwave")
	
	
	set(-16, 0.5, "drawdistance")
	
	set(-16, -0.25, "flip")
	set(-16, -0.5, "bumpyx")
	set(-16, -2, "movez")
	--set(-16, -0.665, "moveyd--1")
	--set(-16, -0.665, "moveyd--2")
	
	ease(0.1, 8.5, "inOutSine", -0.669  , "moveyd--2")
	ease(0.1, 8.5, "inOutSine", -0.669  , "moveyd--1")
	
	set(-16, -0.2, "waveyx")
	set(-16, -0.89745, "waveyx__desync")
	
	add(0, 32, "pop", -0.2, "tiny")
	
	ease(0, 4, "linear", -0.2, "waveyangle")
	
	add(32, 16, "sineIn",1, "speedmod")
	add(32+8, 8, "sineIn",1, "speedmod")
	
	
	
	
	ease(16, 6, "inOutSine", 1.5  , "invert")
	
	
	
	reset(48)
	
	set(49, 0.3,  "bumpyx--0")
	set(49, -0.3,  "bumpyx--1")
	set(49, -0.3,  "bumpyx--2")
	set(49, 0.3,  "bumpyx--3")
	
	set(49, 12,  "waveyy__speed")
	set(49, 0.3,  "waveyy__desync")
	
	
	set(49, 1,  "tiny")
	set(49, 1,  "flip")
	ease(50, 2, "inSine", 0, "tiny")
	add(52, 2, "pop", -1, "tiny")
	add(52, 2, "pop", 20, "angle")
	add(54, 1.87, "bounce", -9, "angle")
	
	ease(54, 4, "inOutQuad", -1, "waveyy", "bf")
	ease(50, 6, "inOutQuad", -1, "movez", "bf")
	ease(50, 6, "inOutQuad", -0.1, "moveyd", "bf")
	
	ease(55, 1, "inOutQuad", 0.5, "beatangle", "bf")
	ease(55, 1, "inOutQuad", 0.3, "beat", "bf")
	ease(116, 4, "inOutQuad", 0.0, "beat", "bf")
	ease(116, 4, "inOutQuad", 0.0, "beatangle", "bf")
	
	add(59.25, 1, "pop", 49, "noteskewx", "bf")
	add(64, 1, "pop", 67, "noteskewy", "bf")

	add(67.38, 1, "pop", 49, "noteskewx", "bf")
	add(75.37, 1, "pop", -48, "noteskewx", "bf")
	add(79.89, 1, "pop", -48, "noteskewy", "bf")
	add(83.37, 1, "pop", 48, "noteskewx", "bf")
	add(91.4, 1, "pop", 39, "noteskewx", "bf")
	
	
	ease(53, 2, "inOutQuad", -0.12, "flip", "bf")
	
	
	--set(71.999, 1,  "reverse")
	ease(71, 1, "linear", 1, "reverse")
	ease(71, 1, "linear", 0.1, "moveyd")
	ease(71, 1, "outQuad", 0.1, "waveyy")
	
	
	ease(85, 5, "inOutQuad", 1, "waveyy", "bf")
	
	ease(112, 8, "inOutQuad", 0, "waveyy", "bf")
	
	add(86, 0.5, "pop", 0.75,"drunk")
	add(86.4, 1, "pop", -1.2,"drunk")
	
	
		
	reset(120)
	
	
	set(120, 1, "spiralpaths")
	set(120, 1, "spiralholds")
	set(120, 0.1, "arrowpath")
	set(120, 0.1, "arrowpathwidth")
	set(120, 0.0, "arrowpathbacklength")
	
	set(120, 1, "centerx")
	set(120, 1, "center")
	set(120, -5, "movez")
	set(120, 0.5, "flip")
	
	set(120, -2, "drawdistanceback")
	
	set(120, -1, "speedmod--1")
	
	if downScroll then
		set(120, 0.35, "speedmod")
		ease(152-0.1, 4, "inOutQuad" , 0.4, "speedmod")
	else
		set(120, -0.35, "speedmod")
		ease(152-0.1, 4, "inOutQuad" , -0.4, "speedmod")
	end
	
	set(120, -0.35, "wave")
	
	
	
	setdefault(0, "lineary--0__use_unscaled")
	setdefault(0, "lineary--3__use_unscaled")
	setdefault(0, "linearx--3__use_unscaled")
	setdefault(0, "linearx--0__use_unscaled")
	
	
	set(120, -1, "lineary--0")
	set(120, -1, "lineary--3")
	
	set(120, -1*upscrollfix, "linearx--0")
	set(120, 1*upscrollfix, "linearx--3")
	
	set(120, -0.6, "movex--0")
	set(120, 0.6, "movex--3")
	set(120, 0.6, "movey--1")
	set(120, -0.6, "movey--2")
	
	set(120, 1, "sudden")
	set(120, 695, "sudden__offset")
	
	set(120, 0.5, "drawdistance")
		
	
	
	add(152-0.1, 3.2, "pop" , -1, "tiny")
	add(151-0.05, 1, "tap" , 0.1, "tiny")
	
	if downScroll then
		for i = 152, 184-4, 4 do
			add(i, 2, "bounce" , 0.12, "circx--1")
			add(i+2, 2, "bounce" , -0.12, "circx--1")
			add(i, 2, "bounce" , -0.07, "dizzy--1")
			add(i+2, 2, "bounce" , 0.07, "dizzy--1")
			
			add(i, 2, "bounce" , -0.12, "circx--2")
			add(i+2, 2, "bounce" , 0.12, "circx--2")
			add(i, 2, "bounce" , -0.07, "dizzy--2")
			add(i+2, 2, "bounce" , 0.07, "dizzy--2")
			
			add(i, 2, "bounce" , 0.12, "circy--3")
			add(i+2, 2, "bounce" , -0.12, "circy--3")
			add(i, 2, "bounce" , -0.07, "dizzy--3")
			add(i+2, 2, "bounce" , 0.07, "dizzy--3")
			
			add(i, 2, "bounce" , -0.12, "circy--0")
			add(i+2, 2, "bounce" , 0.12, "circy--0")
			add(i, 2, "bounce" , -0.07, "dizzy--0")
			add(i+2, 2, "bounce" , 0.07, "dizzy--0")
		end
	else
		for i = 152, 184-4, 4 do
			add(i, 2, "bounce" , 0.12, "circx--1")
			add(i+2, 2, "bounce" , -0.12, "circx--1")
			add(i, 2, "bounce" , 0.07, "dizzy--1")
			add(i+2, 2, "bounce" , -0.07, "dizzy--1")
			
			add(i, 2, "bounce" , -0.12, "circx--2")
			add(i+2, 2, "bounce" , 0.12, "circx--2")
			add(i, 2, "bounce" , 0.07, "dizzy--2")
			add(i+2, 2, "bounce" , -0.07, "dizzy--2")
			
			add(i, 2, "bounce" , -0.12, "circy--3")
			add(i+2, 2, "bounce" , 0.12, "circy--3")
			add(i, 2, "bounce" , 0.07, "dizzy--3")
			add(i+2, 2, "bounce" , -0.07, "dizzy--3")
			
			add(i, 2, "bounce" , 0.12, "circy--0")
			add(i+2, 2, "bounce" , -0.12, "circy--0")
			add(i, 2, "bounce" , 0.07, "dizzy--0")
			add(i+2, 2, "bounce" , -0.07, "dizzy--0")
		end

	end
	
	
	add(182.95, 1 , "pop", 2 , "longholds")
	
	add(182.95, 1 , "linear", 1 , "speedmod")


	reset(184)
	set(184, -0.5, "waveyy", 3)
	set(184, 0.5, "waveyy", 1)
	set(184, -0.5, "beat")
	set(184, -0.5, "beatskewx")
	set(184, 8, "waveyy__speed")
	
	local lazyAlt = true
	for i=184, 184+64-4, 4 do
		lazyAlt = not lazyAlt
		if lazyAlt then
			add(i+1.25, 0.8, "tap", 70 , "noteskewx")
		else
			add(i+1.25, 0.8, "tap", -70 , "noteskewx")
		end
	end
	
	for i=184, 184+64-2, 2 do

		add(i+1, 0.5, "pop", -1 , "tiny")
		
		add(i, 1, "bounce", -0.5 , "tiny")
		add(i+1, 1, "bounce", -0.5 , "tiny")

	end
	
	
	setasleep(184, "3", false)
	setasleep(264, "3", true)
	
	set(184, -3, "movex", 3)
	set(184, 3, "movex", 1)
	set(184, 0, "alpha", 3)
	
	
	set(247.65, 0, "beat")
	set(247.65, 0, "beatskewx")
	
	
	ease(246, 2, "inOutSine", 0 , "waveyy")
	
	set(247.65, 0.5, "bumpy__mult")
	ease(247.7, 4, "pop", -3  , "bumpy")
	
	ease(247.8, 0.1, "linear", -0.5  , "tiny")
	ease(248, 8, "outSine", 0  , "tiny")
	
	
	add(255, 1.2, "outExpo", 360 , "angle--3")
	
	set(252.3, 20, "noteskewy")
	set(253.4, 0, "noteskewy")
	set(254.4, -20, "noteskewy")
	set(255, 0, "noteskewy")
	
	set(255, 1, "stealthglowred")
	set(255, 0, "stealthglowblue")
	set(255, 1, "stealthglowgreen")
	
	
	set(255.5, 1.0, "stealthglowred")
	set(255.5, 1.0, "stealthglowgreen")
	set(255.5, 1.0, "stealthglowblue")
	
	set(255, 0.5, "stealth")
	set(255.5, 0.0, "stealth")
	
	
	set(256.38, -70, "noteskewy")
	set(257, 10, "noteskewy")
	set(257, 10, "noteskewx")
	set(263.8, -45, "noteskewx")
	set(264, 1, "dark")
	set(264, 0, "movex")
	
	ease(257, 1.2, "linear", -2 , "Attenuate")
	
	ease(267, 8, "inOutQuad", 0 , "dark")
	
	
	set(267, 0, "noteskewy")
	set(267, 0, "noteskewx")
	set(267, -1, "Attenuate")
	set(294, 0, "Attenuate")
	
	
	set(252.3, 1, "reverse--2")
	set(253.5, 0, "reverse--2")
	set(252.3, 1, "reverse--1")
	set(253.5, 0, "reverse--1")
	set(254.3, 1, "reverse--1")
	set(255, 0, "reverse--1")
	
	set(255, 4, "beat__speed")
	ease(256, 1, "outExpo", -1  , "beat")
	ease(257.7, 1, "outExpo", 0  , "beat")
	
	
	setasleep(288.5, "3", false) 
	setasleep(295.5, "3", true) 
	
	ease(295,0.25, "linear", 0, "reverse",3)
	ease(295,0.25, "linear", 1, "alpha",3)
	ease(295,0.25, "linear", -16, "movex",3)
	
	ease(289,0.25, "linear", 1, "reverse",3)
	ease(289,0.25, "linear", 0, "alpha",3)
	ease(289,0.25, "linear", 0, "movex",3)
	
	ease(290, 4, "linear", 0.6  , "tipsy")
	ease(294, 1, "linear", 0  , "tipsy")
	
	ease(289,1, "linear", 0.2, "speedmod")
	ease(290, 4.5, "outSine", 1 , "speedmod")
	
	ease(289,1, "linear", 1, "tinyx")
	ease(291, 1, "outBack", 0 , "tinyx")
	
	ease(295, 0.25, "outBack", 0 , "tiny")
	
	ease(289,1, "linear", -4*112 , "z")
	ease(290, 8, "linear", 1*112 , "z")
		
	ease(290, 8, "linear", -0.5 , "tiny")
	ease(290, 8, "linear", 360*2 , "rotatey",3)
	ease(290, 8, "linear", 360*-2 , "rotatey",1)
	
	
	ease(291.86, 0.24, "outExpo", 0.5 , "stealth")
	ease(291.86, 0.24, "outExpo", 0.5 , "strumstealth")
	
	ease(292.95, 0.24, "outExpo", 0.0 , "stealth")
	ease(292.95, 0.24, "outExpo", 0.0 , "strumstealth")

	
	set(307, 14, "rotatez", 1)
	set(307, 18, "angle", 1)
	set(307, 18, "noteskewx", 1)
	set(307, 0.3, "speedmod", 1)
	set(307, -0.5, "oldwave", 1)
	set(307, -112*2, "x", 1)
	
	set(307, 0.5, "stealth", 1)
	set(310, 0, "stealth", 1)
	set(307, 0.09, "drawdistance", 1)
	
	set(311.9, 0, "x", 1)
	set(311.9, 1, "speedmod", 1)
	set(311.9, 0.0, "rotatez", 1)
	set(311.9, 0.0, "angle", 1)
	set(311.9, 0.0, "noteskewx", 1)
	
	
	set(312, -4, "movez")
	set(312, -0.5, "moveyd")
	
	
	ease(314, 2, "linear", 0.4  , "drunk")
	ease(314, 2, "linear", -0.2  , "drunkangle")
	ease(314, 2, "linear", 0.6  , "oldwave")
	ease(314, 2, "linear", 0.5  , "speedmod")
	
	ease(370, 4, "inOutSine", 0.0  , "oldwave")
	ease(370, 6, "inOutQuad", 1.2  , "speedmod")
	ease(370, 4, "inOutSine", 0  , "drunkz")
	ease(370, 6, "inOutSine", 0  , "drunkangle")
	ease(370, 6, "inOutSine", 0  , "drunk")
	
	set(312, 1, "drunkz__desync")
	set(312, 2, "drunkz__mult")
	ease(314, 2, "linear", 2  , "drunkz")
	
	ease(314, 2, "linear", 2  , "bumpyx")
	ease(347, 0.5, "outExpo", 0  , "bumpyx")
	ease(348, 0.5, "outExpo", -1.5  , "bumpyx--0")
	ease(348, 0.5, "outExpo", 1.5  , "bumpyx--1")
	ease(348, 0.5, "outExpo", -1.5  , "bumpyx--2")
	ease(348, 0.5, "outExpo", 1.5  , "bumpyx--3")
	
	ease(370, 6, "inSine", 0  , "bumpyx--3")
	ease(370, 6, "inSine", 0  , "bumpyx--0")
	ease(370, 6, "inSine", 0  , "bumpyx--1")
	ease(370, 6, "inSine", 0  , "bumpyx--2")
	
	set(375, 0, "angle--3", 1)
	set(376, 1, "spiralholds", 1)
	ease(376, 6, "linear", -1  , "flip", 1)
	ease(376, 6, "outSine", -24  , "rotatez--0", 1)
	ease(376, 6, "outSine", -24  , "angle--0", 1)
	ease(376, 6, "outSine", 0.5  , "moveyd--0", 1)
	
	ease(376, 6, "outSine", 1  , "moveyd--1", 1)
	ease(376, 6, "inOutQuad", 0.4  , "movex--1", 1)
	ease(376, 6, "outSine", -64  , "angle--1", 1)
	ease(376, 6, "outSine", 0.4  , "moveyd--2", 1)
	ease(376, 6, "outSine", 70  , "angle--2", 1)
	
	ease(376, 6, "outSine", 12  , "rotatez--3", 1)
	ease(376, 6, "outSine", 50  , "angle--3", 1)
	
	add(376, 2, "outExpo", -0.34  , "speedmod", 1)
	add(376, 2, "outExpo", 0.1  , "brake", 1)
	
	
	reset(377.8, "all")
	set(377.8, 0.5, "stealth")
	set(377.8, 1, "dark")
	ease(378, 1, "inOutExpo", 0  , "stealth")
	ease(378, 1, "inOutExpo", 0  , "dark")
	
	
	ease(380, 1, "outExpo", 0.2  , "tandrunk",3)
	ease(380, 1, "outExpo", -0.2  , "tandrunk",1)
	
	
	
	setasleep(378, "3", false) 
	
	set(378, 112*3, "debugx", "1")
	set(378,112*3*-1, "debugx", "3")
	set(378, 0, "movex", "3")
	set(378, 0, "alpha", "3")

	
	ease(378, 1, "outExpo", -2  , "movez")
	ease(378, 1, "outExpo", 3  , "movex", 1)
	ease(378, 1, "outExpo", -1.4  , "moveyd", 1)
	ease(378, 1, "outExpo", -14*upscrollfix  , "rotatez", 1)
	ease(378, 1, "outExpo", -3  , "movex", 3)
	ease(378, 1, "outExpo", -1.4  , "moveyd", 3)
	ease(378, 1, "outExpo", 14*upscrollfix  , "rotatez", 3)
	

	set(378, 3  , "bumpyscale__mult")
	ease(378, 1, "outExpo", 0.35  , "bumpyscale")
	
	
	
	add(411.8, 0.2, "outExpo", -8  , "movex", 3)
	add(415.85, 0.2, "outExpo", 8  , "movex", 3)
	
	ease(411.8, 0.2, "outExpo", 0  , "rotatez", 1)
	ease(411.8, 0.2, "outExpo", 0  , "movex", 1)
	ease(411.8, 0.2, "outExpo", 0  , "moveyd", 1)
	
	
	add(411.8, 0.2, "outExpo", -0.2  , "flip", 1)
	add(411.8, 0.2, "outExpo", -0.6  , "moveyd--1", 1)
	add(411.8, 0.2, "outExpo", -0.6  , "moveyd--2", 1)
	add(412, 4, "bell", -40 , "noteskewx", 1)
	add(412, 4, "linear", 360*2  , "angle--0", 1)
	add(412, 4, "linear", 360*2*-1  , "angle--1", 1)
	add(412, 4, "linear", 360*2  , "angle--2", 1)
	add(412, 4, "linear", 360*2*-1  , "angle--3", 1)
	
	
	ease(415.9, 0.2, "outExpo", -14*upscrollfix  , "rotatez", 1)
	ease(415.9, 0.2, "outExpo", -1.4  , "moveyd", 1)
	ease(415.9, 0.2, "outExpo", 3  , "movex", 1)
	ease(415.9, 0.2, "outExpo", 0  , "moveyd--1", 1)
	ease(415.9, 0.2, "outExpo", 0  , "moveyd--2", 1)
	ease(415.9, 0.2, "outExpo", -0.1  , "flip", 1)
	
	
	set(379, 0.1  , "arrowpathwidth")
	ease(379, 1, "inOutExpo",  0.2  , "arrowpath")
	ease(411.8, 0.2, "outExpo", 0  , "arrowpath")
	
	ease(415.9, 0.2, "outExpo", 0.2  , "arrowpath")
	
	
	
	add(379, 1, "inOutExpo", -0.1 , "flip", 1)
	
	
	
	set(379, 56, "drunk__speed")
	ease(379, 1, "inOutSine", 0.2  , "drunk")
	
	set(379, 32, "waveyy__speed")
	set(379, 1.63, "waveyy__desync")
	ease(379, 1, "inOutSine", 0.5  , "waveyy")
	
	--ease(379, 1, "inOutSine", -0.5  , "square")
	ease(379, 1, "inOutSine", -0.5  , "squarey")
	
	
	add(392, 5, "outQuint", -360, "angle",1)
	add(392, 5, "outQuint", 360, "angle",3)
	
	add(424, 5, "outQuint", 360, "angle",1)
	add(424, 5, "outQuint", -360, "angle",3)
	
	
	
	ease(440, 6, "outQuad", 0.0  , "waveyy")
	
	ease(440, 4, "inOutQuad", 0.5  , "flip")
	add(440, 4, "outQuad", -1  , "tiny")
	ease(440, 6, "outQuad", 2  , "bumpyx--0")
	ease(440, 6, "outQuad", -1  , "bumpyx--1")
	ease(440, 6, "outQuad", 1  , "bumpyx--2")
	ease(440, 6, "outQuad", -2  , "bumpyx--3")
	
	
	ease(440, 6, "outQuad", 1  , "oldwave")
	
	set(440,112*-2, "rotatey__offset_z")
	ease(440, 32, "inOutQuad", 360*2  , "rotatey")
	
	add(440, 48, "inOutQuad", 0.1  , "glitch2","1")
	
	add(468, 1, "outExpo", 0.1  , "glitch2","1")
	add(468, 1, "outExpo", 0.011  , "glitchLines","1")

	add(470, 1, "outExpo", 0.1  , "glitch2","1")
	add(470, 1, "outExpo", 0.02  , "glitchLines","1")
	
	add(472, 1, "outExpo", 0.05  , "glitchLines","1")
	add(474, 1, "outExpo", 0.05  , "glitchLines","1")
	add(475, 2, "inOutExpo", 0.05  , "glitch2","1")
	
	
end
