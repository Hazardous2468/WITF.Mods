
-- Silly modchart made by Hazard24 for WITF v1.0.2

-- Been wanting to do this song for a while and recently just had the motivation to make this
-- All created within around 2 days

-- Original song: https://www.youtube.com/watch?v=BoJwDxakqgo



function onCreate()
	notesBehindHUD(true)
end

function setUp()
	centerOpponent("")
	centerPlayer("")
	createNewPlayer(true) --For extra helper visuals.
end

-- Main drop modchart logic
function dropBounce(i)

	--Alternate from 1 to -1 every beat
	local m = 1
	if i % 2 == 1 then
		m = -1
	end
	
	local ang = math.random(40,62)*m
	add(i, 2, "pop", {ang, "rotatey",ang*1.1, "angley"}, "1")
	
	local ang2 = math.random(40,62)*m
	add(i, 2, "pop", {ang, "rotatey",ang2*1.1, "angley"}, "3")
	
	
	
	add(i, 2, "pop", ang/2.5,"scrolling_angle_y", "1")
	add(i, 1, "bounce", -16,"scrolling_y_bounce", "1")
	
	
	
	ang = math.random(19,22)*m*1.15

	if downScroll then
		add(i, 2, "pop", {ang, "rotatez"}, "1")
		add(i, 2, "pop", {112*m*0.75*-1, "x"}, "1")
		
		ang2 = math.random(19,22)*m*1.15*-0.9
		add(i, 2, "pop", {ang2, "rotatez"}, "3")
		add(i, 2, "pop", {112*m*0.75*-1, "x"}, "3")
	else
		add(i, 2, "pop", {ang, "rotatez"}, "1")
		add(i, 2, "pop", {112*m*0.75, "x"}, "1")
		
		ang2 = math.random(19,22)*m*1.15*-0.9
		add(i, 2, "pop", {ang2, "rotatez"}, "3")
		add(i, 2, "pop", {112*m*0.75, "x"}, "3")
	end
	
	add(i, 1.5, "pop", {m*1, "drunk",-1, "drunkz"})

	--Silly scale and bounce effects
	add(i, 1, "bounce", 0.25, "scalex")
	add(i, 1, "pop", -2.0, "tiny")
	add(i, 0.5, "impulse", -1.0, "tiny")
	add(i, 1, "pop", -0.1, "flip")
	add(i, 1, "bounce", -0.175, "centered")
	
	-- Off beats
	add(i+0.25, 0.75, "bell", -0.5, "tipsy")
	add(i+0.25, 0.75, "bell", 0.25, "arrowpath","1")
	for c = 0, 3 do
		local angleMult = 1
		if math.random() > 0.5 then
			angleMult = -1
		end
		
		add(i+0.25, 0.75, "bell", math.random(20,45) * angleMult, "anglez--"..c)
	end
	add(i+0.495, 0.25, "impulse", -22, "noteskewx")
end


function modsTimeline()

	--Custom modifier that acts like snapY but better lol. I should really improve the math for the snap modifiers cuz they're actually kinda neat to use.
	runHaxeCode(
	[[
		for (strumLine in PlayState.instance.allStrumLines)
		{
			var snappyY:CustomModifier = createCustomMod("snappy_notes", 0.0);
			snappyY.strumsMod = false;
			snappyY.notesMod = true;
			snappyY.holdsMod = true;
			snappyY.pathMod = false;
			snappyY.unknown = false;
			// Just a copy of the snapY modifier math but edited.
			snappyY.noteMathFunc = function(data){
				if (snappyY.currentValue == 0) return;
				
				var pos:Float = data.y;
				var s:Float = snappyY.currentValue*ModConstants.strumSize;
				//if(data.noteType == "hold"){ //I errr, just not gonna have holds for this section cuz idk how to fix them lmfao
					//s *= 0.5;
				//}
				var returnValue:Float = pos;				
				
				if (s != 0)
				{
				  returnValue = Math.floor(pos / s) * s;
				}
				
				// tbh I don't actually know wtf is going on. Don't question it, it just works.
				data.y = returnValue;
				//data.y += data.whichStrumNote.y * snappyY.currentValue * (Preferences.downscroll ? -1 : 1);
				data.y += s;
			}
			strumLine.mods.addCustomMod(snappyY);	
		}
	]])

	--Set defaults
	setdefault(1 , "alpha","dad") --Dad playfield stays invisible
	setdefault(1 , "debugalpha","dad")	
	setdefault(1 , "3D")
	setdefault(-112*1.5 , "z")
	setdefault(0.125 , "arrowpathwidth","1")
	set(65, 0.125 , "arrowpathwidth--0","1")
	set(65, 0.125 , "arrowpathwidth--1","1")
	set(65, 0.125 , "arrowpathwidth--2","1")
	set(65, 0.125 , "arrowpathwidth--3","1")
	setdefault(-100 , "debugy")
	setdefault(-112*3 , "debugx","3")
	setdefault(0.5 , "debugalpha","3")
	
	-- Dad stays asleep except for 1 section (where character appears)
	setasleep(0, "dad", true)
	setasleep(227, "dad", false)
	setasleep(259, "dad", true)
	
	setdefault(45 , "grain")
	setdefault(50 , "pathgrain","1")
	
	setdefault(1 , "alpha","3")
	
	-- intro
	set(-16, 0.3, "waveyy")
	set(-16, 2, "tinyy")
	ease(0, 5, "outQuad", 0, "tinyy")
	set(-16, 2, "mini")
	set(-16, 2, "stealth")
	set(-16, 0.75, "speedmod")
	ease(0, 5, "outQuad", 0, "mini")
	ease(0.25, 4, "outQuad", 0, "stealth")
	
	
	if downScroll then
		ease(15.8, 1.25, "bell", -23, "skewy")
		add(15.8+2, 1.25, "bell", 26, "skewy")
		add(18.5, 2, "pop", -12, "skewy")
	else
		ease(15.8, 1.25, "bell", 23, "skewy")
		add(15.8+2, 1.25, "bell", -26, "skewy")
		add(18.5, 2, "pop", 12, "skewy")
	end

	ease(15.8, 1.25, "bell", 1, "invert")
	ease(15.8+2, 1.25, "bell", 1, "invert")
	
	
	add(18, 2, "inOutQuint", -360, "angle")
	
	ease(19, 8, "linear", 0.75 , "orientx")
	
	ease(19, 3, "inOutQuint", 1.3, "drunkz")
	
	
	local b = getNoteBeats(4, 64.5, "bf")
	for i, v in ipairs(b) do
		add(v[1], 0.75, flip("linear"), 0.2, "arrowpath--"..v[2], "1")
		add(v[1], 0.35, "pop",0.7, "arrowpathwidth--"..v[2], "1")
		
		add(v[1], 1.5, "impulse",-0.125, "centered--"..v[2])
	end
	ease(33, 5, "linear", 1, "beat")
	
	--drop pause
	set(64.75,0, "orientx")
	ease(64, 1, "inOutQuint", 0, "drunkz")
	
	ease(63.5, 0.5, "outCubic", 0, "beat")
	ease(64, 0.5, "outCubic", 0, "waveyy")
	ease(60, 4, "linear", 1, "speedmod")
	
	ease(64, 0.5, "outExpo", 1, "stealth")
	ease(67, 1, "outCubic", 0, "stealth")
	
	ease(67.5, 0.5, "inOutExpo", 1.25, "bouncez")
	ease(67.5, 0.5, "inOutExpo", 1, "beat")
	
	ease(64, 0.5, "outExpo", 1, "strumstealth")
	ease(64, 0.5, "outExpo", 45, "noteskewy")
	set(65,{0, "noteskewy",0, "strumstealth",1, "flip",-180-55, "angle",1.64, "tipsy",0, "tipsy__speed"})
	ease(66, 2,"outQuad",{0, "angle",0, "flip",0, "tipsy"})
	set(67.9, 1, "tipsy__speed")
	
	-- Drop!
	for i = 68, 68+63 do
		dropBounce(i)
	end
	
	-- After first drop (just kicks lol)
	ease(130, 4, "inOutExpo", 1, "orient")
	ease(130, 4, "inOutExpo", 0.7, "speedmod")
	ease(130, 4, "inOutExpo", 1, "wave")
	
	for i = 132, 160-2, 2 do
		add(i, 2, "pop", 1, "drunk")
		add(i+1, 2, "pop", -1, "drunk")
		
		ease(i, 1, "outCubic", 1, "invert")
		ease(i+1, 1, "outCubic", 0, "invert")
		
		add(i, 1, "impulse", -1, "tiny")
		add(i+1, 1, "impulse", -1, "tiny")
	end 
	
	for i = 148, 160-1 do --off beat hats again
		add(i+0.18, 0.65, "bell", -1, "tipsy")
	end
	
	-- Before 2nd drop with the funny rotation thing
	add(162, 0.75, "impulse", 1, "tiny")
	add(163, 0.75, "impulse", 1, "tiny")
	add(163.5, 0.75, "impulse", 1, "tiny")
	
	ease(156, 162-156, "linear", 0.9, "speedmod")
	ease(195, 1, "inOutSine", 1.0, "speedmod")

	
	ease(162, 2, "outExpo", 0, "orient")
	
	--ease(162, 2, "outExpo", -2, "cubicz")
	ease(162, 2, "outExpo", 0, "bouncez")
	ease(162, 2, "outExpo", 0, "wave")
	ease(162, 2, "outExpo", 1, "bumpyangle")
	ease(162, 2, "outExpo", 1, "attenuate")
	ease(163, 1, "linear", 0.25, "arrowpath","1")
	
	set(164, 750, "hourglass__start")
	set(164, 200, "hourglass__end")
	for i = 164, 188-1,1 do
		add(i, 1, "impulse", -2, "tiny")
		add(i+0.5, 0.5, "pop", -1, "tipsy")
		
		add(i+0.5, 0.5, "impulse", 0.25, "arrowpathwidth","1")
		
		--add(i+0.5, 0.5, "pop", 1, "arrowpath","1")
		
		add(i, 1, "bounce", -0.5, "hourglass")
		add(i, 1, "bounce", 0.125, "flip")
	end
	
	ease(194, 2, "outExpo", 0, "arrowpath","1")
	ease(194, 2, "outExpo", 0, "bumpyangle")
	ease(194, 2, "outExpo", 0, "attenuate")
	
	ease(196, 1, "outExpo", 1.25, "bouncez")
	ease(227, 1, "linear", 0, "bouncez")
	ease(259, 1, "outCubic", 1.25, "bouncez")
	
	local b = getNoteBeats(163.95, 194.1, "bf")
	for i, v in ipairs(b) do
		add(v[1], 0.75, flip("linear"), 0.15/2, "arrowpath--"..v[2], "1")
		add(v[1], 0.35, "pop",0.7, "arrowpathwidth--"..v[2], "1")
	end
	
	
	for i = 164, 196-4,4 do
		add(i, 4, "linear", -360, "anglex")
		
		add(i+1, 1.75, "inOutExpo", -180, "rotatex")
		add(i+1+2, 1.75, "inOutExpo", -180, "rotatex")
	end
	
	--SnappY section. Using player 3 to ease into the effect smoother with alpha
	ease(227, 1, "linear", 0.5, "alpha", "3")
	ease(228, 5, "inOutCubic", 1, "alpha", "3")
	set(228, 1, "snappy_notes","1")
	--ease(228, 1, "outCubic", 1, "snappy_notes")
	set(258, 0, "snappy_notes","1")
	
	ease(259, 1, "inOutCubic", 0.63, "alpha", "3")
	
	for i = 228, 258-2, 2 do
		add(i+1, 1.35, "flip(outQuad)", -2, "tiny")
	end
	
	-- wiggle build-up
	for i = 244, 258-1, 1 do
		ease(i, 1, "flip(outQuad)", 0.5, "tipsy")
		ease(i+0.3333, 1, "flip(outQuad)", -0.5, "tipsy")
		
		ease(i+0.5, 1, "flip(outQuad)", 0.5, "tipsy")
		ease(i+0.5+0.3333, 1, "flip(outQuad)", -0.5, "tipsy")
		
		ease(i, 1, "flip(outQuad)", 0.5, "drunkx")
		ease(i+0.3333, 1, "flip(outQuad)", -0.5, "drunkx")
		
		ease(i+0.5, 1, "flip(outQuad)", 0.5, "drunkx")
		ease(i+0.5+0.3333, 1, "flip(outQuad)", -0.5, "drunkx")
	end
	
	ease(257, 1, "linear", 0, "beat")
	ease(259, 1, "linear", 1, "beat")
	
	ease(258, 0.5, "outExpo", 1, "stealth")
	ease(259, 1, "outCubic", 0, "stealth")
	ease(259, 1, "outCubic", 1, "speedmod")
	
	for i = 196, 227 do
		dropBounce(i) --another drop
	end
	
	-- The funny ring sample
	add(291, 1, "outCubic", 360, "angley")
	add(275, 1, "outCubic", 360, "angley")
	add(227, 1, "outCubic", -360, "angley")
	add(211, 1, "outCubic", 360, "angley")
	add(83, 1, "outCubic", -360, "angley")
	add(115, 1, "outCubic", 360, "angley")
	add(307, 1, "outCubic", -360, "angley")
	add(99.4, 0.5, "bell", -66, "anglex")
	
	
	for i = 260, 323 do
		if i >= 288 and i < 292 then
			-- do nothing for these beats
		else
			dropBounce(i)
		end
	end
	
	-- Outro effects
	set(324, 0.1, "drawdistance","1")
	add(323, 3, "inOutQuad", 0.15, "drunk")
	add(323, 3, "inOutQuad", 0.3, "waveyy")
	
	ease(322, 2, "linear", 0, "beat")
	ease(322, 2, "linear", 1, "alpha","3")
	
	local b = getNoteBeats(323.95, 340, "bf")
	for i, v in ipairs(b) do
		add(v[1], 0.75, flip("linear"), 0.15, "arrowpath--"..v[2], "1")
		add(v[1], 0.35, "pop",0.7, "arrowpathwidth--"..v[2], "1")
		
		add(v[1], 1, "impulse",112, "z--"..v[2], "1")
		
		add(v[1], 1, "impulse",math.random(-45,45), "angle--"..v[2], "1")
	end
	
	-- Goodbye arrows!
	ease(324, 16, "linear", 1, "mini")
	ease(338, 1, "inOutSine", 0.8, "zoomy")
	ease(338, 1, "inOutSine", 1.1, "zoomx")
	ease(339, 2, "inOutSine", 2.0, "zoomy")
	ease(339, 2, "inOutSine", 0.9, "zoomx")
end
