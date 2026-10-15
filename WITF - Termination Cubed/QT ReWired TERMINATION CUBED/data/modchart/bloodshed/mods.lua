function setUp()
end

function modsTimeline()

	setdefault(1,"showLaneMods")
	setdefault(1,"showsubmods")


	setdefault(45,"grain")
	set(1151.5, 32, "grain")


	set(-16, 270, "rotatey","dad")
	ease(29, 3, "inOutBack",0, "rotatey","dad")


	set(-16, 0.5, "flip","dad")
	ease(29, 2, "inOutBack",0, "flip","dad")

	set(-16, 2, "tinyx","dad")
	ease(29, 2, "inOutBack",0, "tinyx","dad")


	--[[
	set(-16, .5, "waveyy","bf")
	ease(0, 32, "linear",0, "waveyy","bf")

	set(-16, 1.5, "waveyx__speed","bf")
	set(-16, .3, "waveyx","bf")
	ease(0, 32, "linear",0, "waveyx","bf")


	set(-16, 1, "alpha","bf")
	ease(0, 32, "linear",0, "alpha","bf")
	--]]


	-- KB note movement
	local b = getNoteBeats(0,1000,"dad")
	for i, v in ipairs(b) do
		if v[4] ~= "hurt" then
		
			if v[1] >= 735 and v[1] < 795.8 then
				add(v[1],1.5,"impulse",-0.2,"moveyd","dad")
			else
				add(v[1],0.5,"impulse",-0.35,"moveyd--"..v[2],"dad")
			end

		end
	end


	-- Main drop 
	local function mainDropBeatHit(i)
		if i%4 == 1 then
			add(i,1.5,"flip(outQuad)",1,"cosbumpyx")
			add(i,1.5,"flip(outQuad)",45,"noteskewx")

		elseif i%4 == 3 then
			add(i,1.5,"flip(outQuad)",-1,"cosbumpyx")
			add(i,1.5,"flip(outQuad)",-45,"noteskewx")

		end
		add(i,1,"impulse",-1,"tiny")
	end

	for i=32,158-1 do
		mainDropBeatHit(i)
	end
	for i=608,734-1 do
		mainDropBeatHit(i)
	end
	for i=936,1054-1 do
		mainDropBeatHit(i)
	end

	add(158, 2, "inOutBack",-360, "angle","bf")

	ease(158, 2, "inOutQuad",0.125, "drunk")
	ease(158, 2, "inOutQuad",0.125, "waveyy")
	ease(216, 8, "inOutQuad",0.0, "drunk")
	ease(216, 8, "inOutQuad",0.0, "waveyy")

	ease(223, 1, "inOutQuad",1, "beat")
	ease(350, 1, "inOutQuad",0, "beat")

	--set(224, 112*4, "rotatez__offset_x","dad")
	--set(224, 112*-4, "rotatez__offset_x","bf")
	if downScroll then
		set(224, 112*5, "rotatez__offset_y","bf")
	else
		set(224, 112*-5, "rotatez__offset_y","bf")
	end


	--for i=224,352-4,4 do
	--	add(i,2,"bounce",{-11,"rotatez",-11,"anglez"},"bf")
	--	add(i+2,2,"bounce",{11,"rotatez",11,"anglez"},"bf")
	--
	--	add(i,2,"bounce",{-11,"pincers_angle"},"1")
	--	add(i+2,2,"bounce",{11,"pincers_angle"},"1")
	--
	--end

	set(280, 1.5, "bumpyz__mult")
	ease(290, 1, "inOutQuad",1.1, "bumpyz")
	ease(415, 1, "inOutQuad",0, "bumpyz")



	for i=352,352-1+64-1,1 do

		add(i,1,"bounce",-0.075,"centered")
		add(i,1,"bounce",-0.25,"movez")

		add(i,1,"impulse",-.2,"tiny")
		add(i,1,"impulse",0.2,"zoomx")
	end


	--calm section

	ease(416,3,"outQuad",{0.7, "speedmod"},"bf")
	ease(447,3,"outQuad",{1.0, "speedmod"},"bf")


	local b = getNoteBeats(431.75,432.5,"bf")
	for i, v in ipairs(b) do
		add(v[1], 0.1,"instant",26,"drunk--"..v[2].."__speed","bf")
		add(v[1], 1,"pop",0.35,"drunk--"..v[2],"bf")
	end
	b = getNoteBeats(435.78,436.5,"bf")
	for i, v in ipairs(b) do
		add(v[1], 4,"tap",0.26,"drunk--"..v[2],"bf")
		add(v[1]+2, 2,"tap",-6,"notesrotatez--"..v[2],"bf")
		add(v[1]+2, 2,"tap",-6,"angle--"..v[2],"bf")
	end


	ease(416,1,"inOutQuad",0.2,"drunk","bf")

	ease(424,1,"bounce",0.685,"drunk","bf")
	ease(425,1,"inOutQuad",-0.7,"drunk","bf")
	ease(426,1,"outQuad",-0.2,"drunk","bf")

	ease(424+16,1,"bounce",-0.685,"drunk","bf")
	ease(425+16,1,"inOutQuad",-0.7,"drunk","bf")
	ease(426+16,1,"outQuad",0.2,"drunk","bf")

	add(424.5,1.75,"inOutCubic",5, "drunk__offset","bf")
	add(440.5,1.75,"inOutCubic",5, "drunk__offset","bf")


	for i=416,447-1-1,1 do
		add(i,1,"impulse",-0.22,"tinyx")
		add(i,1,"pop",-0.1,"tinyy")
		add(i,1,"bounce",0.1,"tiny")
	end

	ease(412,8,"inOutSine",{0.8,"alpha",0.3,"tipsy"},"dad")
	ease(438,446-438,"inCubic",{0,"alpha",0,"tipsy"},"dad")

	set(416, 0.43, "wave--0__mult","dad")
	set(416, 0.5, "wave--1__mult","dad")
	set(416, 0.45, "wave--2__mult","dad")
	set(416, 0.39, "wave--3__mult","dad")

	ease(416,1,"outQuad",{0.68, "speedmod",1,"tornado"},"dad")
	ease(446,2,"inOutCubic",{1, "speedmod"},"dad")
	ease(446,1,"inOutCubic",{0,"tornado"},"dad")

	for c=0,3 do
		ease(416,1,"outQuad",{2,"wave--"..c},"dad")
		ease(446,2,"inOutCubic",{0,"wave--"..c},"dad")
		set(448, 1, "wave--"..c.."__mult","dad")
	end
	

	

	ease(447,1,"outQuad",0.0,"drunk","bf")


	for i=448,576-1,1 do

		add(i,1,"bounce",-0.075,"centered")
		add(i,1,"impulse",-3.5,"tiny")

		if i%2 ==0 then
			add(i,1,"impulse",22,"skewy")
		else
			add(i,1,"impulse",-22,"skewy")
		end
	end


	for i=576,592-2,2 do
		add(i,2,"impulse",-1,"tiny")
	end
	for i=592,600-1,1 do
		add(i,1,"impulse",-1,"tiny")
	end
	for i=600,606-.5,.5 do
		add(i,.6,"impulse",-1,"tiny")
	end




	--noteskin offset fix thingy
	local offsetX_fix = 24
	ease(576, 606-576 ,"linear", {offsetX_fix, "noteoffsetx", -offsetX_fix, "holdoffsetx"})
	ease(606, 2 ,"outBack", {0, "noteoffsetx",0, "holdoffsetx"})

	ease(576, 606-576 ,"linear", 0.5, "zoomx")
	ease(586, 606-586 ,"linear", 1.34, "zoomy")
	ease(606, 2 ,"outBack", {1, "zoomx",1, "zoomy"})

	add(606-0.01, 0.01 ,"instant", 24, "drunk__speed","dad")
	add(606, 2 ,"impulse", 2, "drunk","dad")
	add(606-0.01+2, 0.01 ,"instant", 1, "drunk__speed","dad")
	add(606, 2 ,"flip(inQuad)", -3, "tiny","dad")


	ease(606, 2.5 ,"flip(inExpo)", 0.85, "alpha","dad")

	add(606, 2 ,"outCubic", -360, "rotatey","dad")
	add(606, 2 ,"outCubic", 360, "rotatey","bf")


	ease(734, 2 ,"inOutBack", 0.5, "flip")
	ease(734, 2 ,"inOutBack", 2, "attenuate")
	ease(732, 4 ,"linear", .5, "speedmod","dad")
	ease(736, 8 ,"inOutQuad", .5, "speedmod","bf")

	ease(734, 2 ,"inOutBack", .4, "zigzag","dad")
	set(734,0.3,"zigzag__mult","dad")

	reset(796)
	set(796, 2, "tiny")
	set(796, 2, "alpha")
	ease(798, 2 ,"linear", 0, "alpha")
	ease(798, 2 ,"inExpo", 0, "tiny")
	add(800, 4 ,"flip(outSine)", -1.8, "tiny")

	for i=800,928-1-2,1 do

		add(i,1,"linear",360,"angle","dad")
		add(i,1,"linear",-360,"angle","bf")

	end


	ease(862,2,"flip(inQuint)",0,"zoomx","dad")
	ease(862,2,"flip(inQuint)",2,"zoomy","dad")

	add(864,2,"flip(outQuad)",-1.6,"tiny")
	add(898,2,"flip(outQuad)",-1.5,"tiny")

	ease(861,4,"bell",-1,"drunk","bf")
	ease(862,2,"outCubic",1,"mini","bf")
	ease(863,1,"inCubic",0,"mini","bf")

	for i=862,864-1,1 do
		add(i,1,"linear",-360,"angle","dad")
		add(i,1,"linear",360,"angle","bf")
	end
	set(928,0,"angle")

	ease(919,2,"inOutSine",1,"drunk","bf")
	ease(921,2,"inOutSine",-1,"drunk","bf")
	ease(919+4,2,"inOutSine",1,"drunk","bf")
	ease(921+4,2,"inOutSine",-1,"drunk","bf")
	ease(927,2,"inOutCubic",0,"drunk","bf")

	ease(927,2,"inOutCubic",-22,"skewy","dad")
	ease(932,2,"outElastic",0,"skewy","dad")
	ease(927,2,"inOutCubic",1,"tinyy","dad")
	ease(932,2,"outElastic",0,"tinyy","dad")
	ease(928,13,"linear",-360,"angle","dad")
	ease(932,2,"outElastic",0,"angle","dad")


	ease(896,2,"flip(inCubic)",0.0,"zoomy")
	ease(896,2,"flip(inCubic)",2,"zoomx")
	ease(897,1,"linear",1,"zoomy")
	ease(897,1,"linear",1,"zoomx")

	set(896,0,"stealth")
	ease(898,1,"outExpo",0.5,"stealth")
	for i=896,898-1,1 do
		add(i,1,"linear",-360,"angle","dad")
		add(i,1,"linear",360,"angle","bf")
	end



	if not invertStrumlineTarget then
		ease(799, 2 ,"inOutBack", 1, "hourglass","dad")
		ease(927, 3 ,"linear", 0, "hourglass","dad")
	end

	ease(864, 2 ,"outCubic", .5, "stealth")
	ease(920, 8 ,"inCubic", 0.0, "stealth")



	--ease(1055.5, .5, "linear",1, "orient")
	ease(1055.5, .5, "linear",1.25, "beat")

	set(1054, 20, "drunk__speed","1")
	add(1054,2.25,"flip(inCubic)",-0.6,"drunk","1")
	add(1054,2.0,"impulse",-0.6,"drunk","1")
	set(1056, 4, "drunk__speed","1")


	for i=1056,1248-1,1 do
		add(i,1,"impulse",-1,"tiny")
	end

	add(1200, 48, "inSine",360*16, "angle","dad")
	add(1200, 48, "linear",360*5, "angle","dad")


	ease(1247.5, .5, "linear",0, "beat")





	ease(1248, 3, "outElastic",45, "noteskewx","dad")
	ease(1248, 4, "outElastic",-0.04, "reverse--0","dad")
	ease(1248, 4, "outElastic",0.05, "reverse--1","dad")
	ease(1248, 4, "outElastic",0.0, "reverse--2","dad")
	ease(1248, 4, "outElastic",0.1, "reverse--3","dad")

	ease(1248, 2, "outCubic",-25, "angle--0","dad")
	ease(1248, 2, "outCubic",-9, "angle--2","dad")
	ease(1248, 2, "outCubic",9, "angle--1","dad")
	ease(1248, 2, "outCubic",0.81, "tinyx--1","dad")
	ease(1248, 2, "outCubic",-0.5, "tinyy--3","dad")

	add(1248, 64, "outQuint",-360*7, "angle","dad")
	add(1248, 64, "outSmootherStep",-360*4, "angle","dad")

	set(1247, 1, "tipsyx__timertype")
	ease(1248, 2, "outCubic",-0.02, "tipsyx","dad")






end




