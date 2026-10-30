local third = 1/3

local pushBack1 = 862 - 734 

function modsTimeline()
	set(622, screenWidth*2, "x")
	reset(640)
	set(640, 1, "alpha")
	set(640, 0.75, "alpha","1")
	ease(692, 11, "inOutSine", 0, "alpha", "1")
	
	set(640, 0.5, "strumstealth","1")
	ease(692, 11, "inOutSine", 0, "strumstealth", "1")
	
	set(640, -422/112, "movez","1")
	ease(692, 11, "inOutSine", 0, "movez", "1")
	
	set(640, -2, "flip")
	ease(692, 12, "outSmoothStep", 0, "flip", "1")
	
	set(640, 1.4, "invert")
	ease(692, 12, "outSmoothStep", 0, "invert", "1")
	
	set(640, 4, "tipsy")
	ease(692, 12, "outSmoothStep", 0, "tipsy", "1")
	
	set(640, 1.5, "centered")
	ease(692, 12, "outSmoothStep", 0, "centered", "1")
	
	
	for i = 640, 692-0.5, 0.5 do
		add(i, 0.5, "linear", 45, "angle", "1")
	end
	
	set(692, 0, "angle", "1")
	ease(692, 12, "outSmoothStep", 360*4, "angle", "1")
	
	
	local upScrollFix = -1
	if downscroll then upScrollFix = 1 end
	
	
	local smashBeats = {712, 720, 724, 728}
	for i, v in ipairs(smashBeats) do
		add(v, 2, "impulse", 0.5, "glitch2", "1")
		
		add(v, 2, "outCubic", -360, "angle", "1")
		add(v, 2, "pop", -2, "tiny", "1")
	end
	
	local b = getNoteBeats(703.9, 731.7, "bf")
	for i, v in ipairs(b) do
		if(v[4] ~= "hurt") then
			value(v[1], 1, "pop", 0, -0.25, "scale--"..v[2], "1")
			
			value(v[1], 1, "impulse", 0, math.random(-21,21), "skewy--"..v[2], "1")
			value(v[1], 1, "impulse", 0, math.random(-20,20), "skewx--"..v[2], "1")
		end
	end
	
	
	reset(732)
	add(732, 1.5, "impulse", {1, "glitchLines",0.5, "glitch2"}, "1")
	setasleep(732, "3", false)
	setasleep(732, "4", false)
	--set(732, 0,"alpha","3")
	--set(732, 0,"alpha","4")
	
	ease(732, 4, "outExpo", {0.8, "speedmod"}, "1")
	ease(736, 1, "outExpo", {1, "speedmod"}, "1")
	
	ease(732, 4, "inBack", {-1.5, "centered"}, "1")
	ease(733.5, 2, "inSine", {1, "alpha",-0.3, "flip"}, "1")
	
	
	ease(733, 2, "inSine", 67,  "angle--0", "1")
	ease(733, 2, "inSine", -67,  "angle--1", "1")
	ease(733, 2, "inSine", -90,  "angle--2", "1")
	ease(733, 2, "inSine", -24,  "angle--3", "1")
	
	
	--set(732.5,16,  "drunkz__speed", {1,3,4})
	
	local pArray = {3, 4, 1}
	local multArrayCounter = 1
	
	local function thingy(when, timeMult, sus, fall)
	
		local p = pArray[multArrayCounter]
		local t = 1*timeMult
	
		if not fall then
			--add(when, 1*timeMult, "pop", 1, "centered",  p)
			value(when-t, t, "inSine", -1.5, 0, "flip", p)
			value(when-t, t, "linear", 1, 0, "alpha", p)
			value(when-t, t, "inSine", 2, 0, "tiny", p)
			value(when-t, t, "linear", -677, -112, "z", p)
			set(when-t, 0, "centered", p)
			value(when, t, "outSine", -2, 0, "tiny", p)
			
			set(when-t, 0, "blacksphereflip", p)
			set(when-t, 0, "angle", p)
			for col = 0, 3 do
				set(when-t, 0, "angle--"..col, p)
			end
			
			local x = math.random(-168,168)
			set(when-t, x, "x", p)
			add(when, t, "impulse", 0.3, "glitch2", "1")
			
			if when >= 798 then
				set(when, x, "x", "1")
			end
		end
		
		
		if sus <= 0 or fall then
			value(when, t, "inSine", 0, -1, "centered", p)
			value(when, t, "inSine", 0, 1, "alpha", p)
			
			for col = 0, 3 do
				local a = math.random(60,130)
				if math.random(0,1) >= 0.5 then
					a = a * -1
				end
				add(when, t, "inSine", a, "angle--"..col, p)
			end
			
			if fall then
				--value(when, t, "outExpo", 0, 1, "flip", p)
				value(when-0.4, t+0.4, merge("inCubic", "outQuint"), 0, 180, "blacksphereflip", p)
				value(when, t, "pop", 0, 0.5, "stealth", p)
				--add(when, t, "impulse", 6, "drunkz", p)
				add(when, t, "impulse", 0.05, "glitchLines", "1")
			else
				value(when, t, "inSine", 0, -1, "flip", p)
			end
			
			multArrayCounter = multArrayCounter + 1
			if multArrayCounter > #pArray then
				multArrayCounter = 1
			end
		end
		

	end
	
	local b = getNoteBeats(732, 797.5,"dad")
	for i, v in ipairs(b) do

		local timeMult = 1
		if v[2] == 1 then
			timeMult = 0.75
		elseif v[2] == 2 then
			timeMult = 0.5
		end
	
		if v[2] == 3 then
			thingy(v[1], timeMult, v[3], true)
		else
			thingy(v[1], timeMult, v[3], false)
		end
		
	end
	thingy(798, 1, 155, false)
	
	ease(799, 1, "outSine", 0, "x")
	setasleep(800.05, "3", true)
	setasleep(800.05, "4", true)
	set(799, {1, "alpha"}, {3,4})
	set(799, {0, "alpha",0,"flip", 0,"centered",-112, "z"}, "1")
	
	
	for i = 752, 800-2,2 do
		add(i+1, 1, "pop", -0.7, "cosbumpyx")
		add(i, 1, "pop", 0.7, "cosbumpyx")
		add(i+1, 1, "impulse", -0.7, "bumpyangle")
		add(i, 1, "impulse", 0.7, "bumpyangle")
	end
	
	
	

	
	
	
	
	for col = 0, 3 do
		set(799, 0, "angle--"..col, "1")
	end
	set(799, 0, "angle", "1")
	set(799, 0, "blacksphereflip", "1")
	
	set(799.5,0.5, "beat__speed","1")
	set(799.5,1.2, "beat__mult","1")
	ease(799.5, 1, "inOutExpo", 2, "beat","1")
	ease(859.25, 0.75, "inOutExpo", 0, "beat","1")
	
	ease(800, 62, "linear", 1.6, "speedmod","1")
	ease(860, 2, "outCubic", 1.0, "speedmod","1")
	
	for i = 800, 860-2,2 do
		add(i, 2, "bounce", -0.89, "tiny","1")
		add(i, 2, "bounce", -0.1, "centered","1")
	end
	
	ease(800, 62, "linear", 0.1, "glitch2","1")
	set(860,0, "glitch2","1")

	
	
	
	ease(pushBack1+734, 2, "inOutSine", 0.422, "speedmod", "1")
	ease(pushBack1+800-4, 4, "inOutSine", 1, "speedmod", "1")
	ease(pushBack1+800, 4, "inOutSine", 0.575, "speedmod", "1")
	ease(pushBack1+800, 4, "inOutSine", 0.69, "wave", "1")
	
	ease(pushBack1+800, 4, "inOutSine", 0.333, "alphaholds")
	ease(pushBack1+928, 1, "inOutSine", 0.0, "alphaholds")
	
	
	set(pushBack1+734, 1222, "sudden__start")
	set(pushBack1+734, 455, "sudden__end")
	ease(pushBack1+734, 2, "inOutSine", 1.0, "sudden")
	ease(pushBack1+800-4, 4, "inOutSine", 0, "sudden")
	
	set(pushBack1+734,0, "lineary__type")
	set(pushBack1+734,0.032, "spiralz__mult")
	set(pushBack1+734,0.032, "cosspiraly__mult")
	
	
	ease(pushBack1+734,2, "linear", {
	0.4, "lineary",
	1.126, "oldboost", 
	-6.1*upScrollFix, "spiralz", 
	-6.1*upScrollFix, "cosspiraly", 
	-1, "movez",
	-0.25, "moveyd",
	-0.25, "mini"
	}, "1")
	
	ease(pushBack1+800-4,4, "inOutSine", {0.0, "lineary",0, "oldboost", 0.0, "spiralz", 0.0, "cosspiraly", 0, "movez",0, "moveyd",0, "mini"}, "1")
	
	set(860, 1, "alpha", "1")
	set(862, 0, "alpha", "1")
	value(862, 2, "outQuad", 0.5, 1.1, "flip", "1")
	
	set(862, 180, "hourglass__start","1")
	set(862, 30, "hourglass__end","1")
	value(862, 2, "outQuad", 0.0, -1.25, "hourglass", "1")
	
	set(862, 300, "hidden__start","1")
	set(862, 20, "hidden__end","1")
	ease(862, 2, "outQuad",  0.5, "hidden", "1")
	
	ease(926, 1, "inOutQuad",  0.0, "hidden", "1")
	
	local lazyAlt = false
	for i = 926, 928, 0.5 do
	
		add(i, 0.5, "impulse", 1, "scale", "1")
		lazyAlt = not lazyAlt
		
		if lazyAlt then
			ease(i, 0.5, "outCubic", 0, "hourglass", "1")
			ease(i, 0.5, "outCubic", 0, "flip", "1")
		else
			ease(i, 0.5, "outCubic", -1, "hourglass", "1")
			ease(i, 0.5, "outCubic", 1, "flip", "1")
		end
		
	end
	
	
	value(862,2, "linear", 0.0, 0.002, "glitchLines", "1")
	value(862,2, "linear", 0.0, 0.044, "glitch2", "1")
	
	ease(926,2, "inOutCubic", {0.0, "glitch2",0.0, "glitchLines"}, "1")
	
	setasleep(860, "3", false)
	reset(860,"3")
	ease(860.25, 2 ,"inOutQuad", {0.0, "alpha"}, "3")
	set(860, {1,"alpha",90,"yd", 2, "reverse", -1.24, "flip",1.25, "invert",0.25, "drawdistance",0.5, "speedmod"}, "3")
	set(860, {4,"bumpy",1,"hidden",1,"dizzy",1,"alphastrum"}, "3")
	ease(926, 2 ,"inOutQuad", {-1.5, "flip",0.5, "alpha"}, "3")
	ease(988, 6 ,"inOutQuad", {0.5, "reverse"}, "3")
	ease(990, 2 ,"inOutQuad", {-3, "flip",1.0, "alpha"}, "3")
	setasleep(992.1, "3", true)
	
	local lazyAlt = false
	local function doInsecurityKick(when, timeMult)
		if when < 798 or when >= 800 then
			when = when + pushBack1
			local mult = lazyAlt and 1 or -1
		
			add(when, 1, "pop",{ mult/2 , "drunk", mult/2 , "bumpyangle"})
			add(when, 1, "impulse", -2.25 , "tiny")
			lazyAlt = not lazyAlt
		end
	end
	
	
	for i = 736, 800-8,8 do
		for k = 0, 6 do
			doInsecurityKick(i+k, 1)
		end
		doInsecurityKick(i+7, 0.5)
		doInsecurityKick(i+7.5, 0.5)
	end
	
	ease(pushBack1+799, 1, "linear", 1250, "hourglass__start")
	ease(pushBack1+799, 1, "linear", 0, "hourglass__end")
	for i = pushBack1+800, pushBack1+864-2,2 do
	
		add(i, 2, "linear", 360, "blacksphereflip")
		
		--ease(i, 0.5, "inSine", 0.5, "flip")
		--ease(i+0.5, 0.5, "outSine", 1, "flip")
		--ease(i+1, 0.5, "inSine", 0.5, "flip")
		--ease(i+0.5+1, 0.5, "outSine", 0, "flip")
		
		ease(i, 0.5, "inSine", -0.5, "tornado")
		ease(i+0.5, 0.5, "outSine", -1, "tornado")
		ease(i+1, 0.5, "inSine", -0.5, "tornado")
		ease(i+0.5+1, 0.5, "outSine", 0, "tornado")
		
		add(i, 1, "pop", 1, "hourglass")
		add(i+1, 1, "pop", 1, "hourglass")
	end
	
	set(pushBack1+799.5, 1, "3d","1")
	
	
	local function anotherKickFunc(when, timeMult)
		when = when + pushBack1
		
		local mult = lazyAlt and 1 or -1
	
		add(when, 1*timeMult, "pop",{ mult/2 , "drunk", mult/2 , "bumpyangle"})
		add(when, 1*timeMult, "impulse", -2.25 , "tiny")
		--add(when, 1, "impulse", -4 , "tiny")
		--add(when, 1*timeMult, "impulse", 0.35 , "stealth")
		
		add(when, 1, "impulse", lazyAlt and 27 or -27, "skewx","1")
		add(when, 1, "impulse", 0.8, "scale","1")
		
		lazyAlt = not lazyAlt
		
	end
	
	ease(800, 50, "linear", 1, "zigzag", "1")
	
	ease(800, 60, "linear", 15*1000, "zigzag__offset", "1")
	
	ease(860, 1, "outExpo", 0, "zigzag", "1")
	
	ease(800, 1, "outExpo", 0.5, "orient", "1")
	ease(860, 0.75, "outExpo", 0, "orient", "1")
	
	set(800, 0.865, "arrowpath", "1")
	set(800, 0, "arrowpathwidth", "1")
	for i = 800, 860-1,1 do

		add(i, 1, "pop",0.1, "zoomx", "1")
		
		if i % 2 == 0 then
			add(i, 1, "pop",0.2, "zoomx", "1")
			add(i, 1.5, "pop",2, "arrowpathwidth", "1")
		end

	end

	
	for i = 800, 864-8,8 do
		if i == 800 or i == 824 or i == 832 or i == 856 then
			for k = 0, 6 do
				anotherKickFunc(i+k, 1)
			end
			anotherKickFunc(i+7, 0.5)
			anotherKickFunc(i+7.5, 0.5)
		else
			for k = 0, 7 do
				anotherKickFunc(i+k, 1)
			end
		end
	end
	
	
	for i = 926, 928-0.5,0.5 do
		add(i, 0.5, "impulse", 1, "scale")
	end
	
	
	
	local qtPlayer = "6"
	
	setasleep(pushBack1+864, qtPlayer, false)
	reset(pushBack1+864,qtPlayer)
	set(pushBack1+864, {0.4, "speedmod", 1, "reverse",  -1.5, "flip",1.25, "invert"},qtPlayer)
	set(pushBack1+864,1, "alphastrum", qtPlayer)
	set(pushBack1+864.05, 0.5, "drawdistance", qtPlayer)
	set(pushBack1+927, 0, "drawdistance", qtPlayer)
	ease(pushBack1+896, 2, "linear", 0.2, "alphastrum", qtPlayer)
	
	set(pushBack1+927, {0.8, "speedmod", 1, "reverse",  0, "flip",0, "invert",0, "yd",0, "alpha",0, "alphastrum",112*-4, "x",112*-2, "z"},qtPlayer)
	set(pushBack1+927, {0.1, "waveyx", 0.1, "waveyy"},qtPlayer)
	
	
	set(pushBack1+864,{3.1, "waveyy__speed",2, "waveyx__speed"}, qtPlayer)
	
	set(pushBack1+864,{0.5, "waveyx",0.5, "waveyy"}, qtPlayer)
	
	set(pushBack1+864,1.5*112, "yd", qtPlayer)
	set(pushBack1+864,1, "hurtnotealpha", qtPlayer)
	ease(pushBack1+864, 1, "linear", 0.7, "alpha",qtPlayer)
	
	
	add(pushBack1+862,2,"inOutSine", -180, "rotatey","1")
	add(pushBack1+862,2,"inOutSine", -90, "angle","1")
	add(pushBack1+862,2,"inOutSine", 1, "hourglass","1")
	add(pushBack1+862,2,"inOutSine", 0.75, "stealth","1")
	add(pushBack1+862,2,"inOutSine", 0.5, "strumstealth","1")
	for i = pushBack1+864, pushBack1+927,1 do
		add(i,1,"linear", -90, "angle","1")
	end
	
	for i = pushBack1+864, pushBack1+928-4,4 do
	
		value(i+3, 1, "outQuad",2,0,"tiny",qtPlayer)
		value(i+3, 4, "outSine",1,0,"drunkangle",qtPlayer)
		value(i, 3, "linear",0,beatLength*3*0.4,"drive",qtPlayer)
		value(i+3, 1, "linear",beatLength*-1*0.4,0,"drive",qtPlayer)
		--add(i,3,"inSine", -0.5, "reverse",qtPlayer)
		--add(i+3,1,"outSine", 0.5, "reverse",qtPlayer)
		--add(i+3,1,"inverse",-1, "reverse",qtPlayer)
		
		
		add(i+3,2,"outSine", -180, "angle","1")
		add(i+3,2,"outSine", -180, "rotatey","1")
		if i % 8==0 then
			add(i+3,2,"outSine", -180, "blacksphere","1")
		end
		add(i+3,1,"impulse", -4, "tiny","1")
	end
	
	
	--for i = pushBack1+928, pushBack1+928+64-1,1 do
	--	add(i,1,"linear", -90, "angle","1")
	--end
	
	set(1055, 0.002, "glitchLines","1")
	add(1055.001, 1.5, "impulse", {1, "glitchLines",0.5, "glitch2"}, "1")
	
	add(972, 1, "outCubic", 0.5, "stealth")
	add(976, 1, "outCubic", -0.5, "stealth")
	
	add(983, 0.7, "outCubic", 0.25, "stealth")
	add(984, 0.8, "outCubic", -0.25, "stealth")
	
	ease(1055, 1, "outCubic", 0.75, "strumstealth","1")
	
	
	for i = 1056, 1120, 8 do
		for c = 0, 3 do
			--set(i+k, math.random(-112,112))
			for k = 0, 4-0.5, 0.5 do
				set(i+k, math.random(-20,20)/300, "movey--"..c, "1")
				add(i+k,0.1,"instant", math.random(-45,45), "angle--"..c,"1")
			end
			for k = 4, 8-0.5, 0.5 do
				set(i+k, math.random(-40,40)/200, "movey--"..c, "1")
				add(i+k,0.1,"instant", math.random(-180,180)*1.2, "angle--"..c,"1")
			end
		end
	end
	ease(1120, 0.5, "outExpo", {4, "tipsy", -0.3, "flip"}, "1")
	
	ease(1120, 0.5, "outExpo", {4, "tipsy", -0.3, "flip"}, "1")
	
	
end


