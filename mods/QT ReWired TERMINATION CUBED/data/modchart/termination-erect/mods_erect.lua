function setUp()
end

function modsTimeline()

	setdefault(1,"showLaneMods")
	setdefault(1,"showsubmods")

	setdefault(45,"grain")

	-- KB note movement
	local b = getNoteBeats(0,1156,"dad")
	for i, v in ipairs(b) do
		if not (v[4] == "hurt" or v[4] == "kb_miss") then
			add(v[1],0.5,"impulse",-0.35,"moveyd--"..v[2],"dad")
		end
	end


	set(-16, 1, "alpha")
	set(-16, {-1, "mini",-1, "tiny",0.5, "flip"})
	ease(0,8, "linear", 0, "alpha")
	ease(0,8, "inExpo", {0, "mini",0, "tiny",0, "flip"})


	for r=0, 1 do
		r = r * (1016-8)

		ease(r+8,4, "inOutCubic",0.75, "speedmod","bf")
		ease(r+19,3, "inOutCubic",1, "speedmod","bf")
		ease(r+40,4, "inOutCubic",0.75, "speedmod","bf")
		ease(r+40+11,3, "inOutCubic",1, "speedmod","bf")

		ease(r+35,3, "inOutCubic",1, "speedmod","dad")
		ease(r+35-11,3, "inOutCubic",0.75, "speedmod","dad")
		
		ease(r+67-11,3, "inOutCubic",0.75, "speedmod","dad")
		ease(r+67,3, "inOutCubic",0.9, "speedmod","dad")
		ease(r+72,2, "inOutCubic",0.9, "speedmod","bf")

		ease(r+165.5,2, "inOutQuad",1, "speedmod")



		for i=8+r, 8+64+r-8,8 do
			for k=0,3 do
				add(i+k,1, "flip(outCubic)", -1, "tiny")
			end
			for k=0,2,2 do
				add(i+k,1, "pop", -0.5, "drunk")
				add(i+k+1,1, "pop", 0.5, "drunk")
			end

			add(i+4,1.5, "flip(outCubic)", -1, "tiny")
			add(i+4+1.5,1.5, "flip(outCubic)", -1, "tiny")
			add(i+4+3,1, "flip(outCubic)", -1, "tiny")

			add(i+4+1.5,1, "pop",	{ 0.8, "tipsy", 1, "bouncez"})
			add(i+4+3,1, "pop", 	{-0.8, "tipsy", 1, "bouncez"})
			add(i+4,1, "pop", 		{0.8, "tipsy", 1, "bouncez"})
		end 

	end

	for r=0, 1 do
		r = r * (888-168)
		for i=168+r, 296-4+r,4 do

			for k=0,3 do
				add(i+k,1, "flip(outCubic)", -1, "tiny")
			end
			add(i+3,2, "impulse", -0.7, "cosbumpyx")
			add(i+1,2, "impulse", 0.7, "cosbumpyx")
		end 
	
	end

	--set(72, 1, "3d", "bf")
	--set(59.5, 1, "3d", "dad")
	--set(104, 0, "3d")

	--ease(71, 2, "inOutSine", {0.635, "speedmod",1, "twirl"})
	--ease(102, 2, "inOutSine", {0.75, "speedmod",0, "twirl"})
	ease(104, 166-104, "linear", {1, "speedmod"})

	ease(71, 2, "inOutSine", 1, "orient","dad")
	ease(73, 2, "inOutSine", 1, "orient","bf")
	set(166,0, "orient")

	set(104, 128, "drunk__speed")
	for i = 104, 166, 8 do
		ease(i, 1, "outExpo", 0.105, "drunk")
		ease(i+4, 1, "outExpo", 0, "drunk")
	end
	set(166, 1, "drunk__speed")


	add(295, 1, "inOutCubic", 360, "angle")

	set(295, 450, "vanish__start")
	set(295, 170, "vanish__end")
	set(295, 145, "vanish__size")
	ease(295, 1, "inOutCubic", 1, "vanish","dad")
	ease(296, 1, "inOutCubic", 1, "vanish","bf")
	ease(295, 1, "inOutCubic", 0.85, "speedmod")
	for again=0,1 do
		again = again * (616-296)
		local endEarly = 1
		if again > 0 then
			endEarly = 5
		end
		for i=again+296, again+296+64-endEarly,1 do
			add(i,0.5, "pop", 0.2, "movex")
			add(i+0.5,0.5, "pop", -0.2, "movex")

			--add(i,0.5, "pop",1, "invert")
			--ease(i,0.5, "inOutCubic",1, "invert")
			--ease(i+0.5,0.5, "inOutCubic", 0, "invert")

			if i%2==0 then
				add(i,1, "pop", -1, "tipsy")
			else
				add(i,1, "pop", 1, "tipsy")
			end
			
			add(i,1, "impulse", -1, "tiny")
		end 
	end

	ease(614, 1, "inOutCubic", 1, "vanish","dad")
	ease(616, 1, "inOutCubic", 1, "vanish","bf")
	ease(610, 6, "inOutCubic", 0.895, "speedmod")
	ease(678, 1.5, "inOutCubic", 0, "vanish")


	ease(356, 1, "outCubic", 0, "vanish","dad")
	ease(360, 1, "outCubic", 0, "vanish","bf")

	ease(356, 1, "outCubic", .5, "speedmod","dad")
	ease(360, 1, "outCubic", .5, "speedmod","bf")
	ease(356, 1, "outCubic", 1, "tornado","dad")
	ease(360, 1, "outCubic", -1, "tornado","bf")

	ease(486, 1, "inOutCubic", 1, "speedmod")
	ease(486.2, 1.5, "outCubic", 0, "tornado")


	for i=488, 616-4-1,1 do
		add(i,1, "bounce", -0.1, "centered")
		add(i,1, "impulse", -0.3, "tiny")
		add(i,1, "impulse", -0.3, "tinyx")
	end 
	for i=488, 616-4-2,2 do
		add(i+1,1, "bounce", {-4, "rotatez",-4, "angle"})
		add(i,1, "bounce", {4, "rotatez",4, "angle"})

		add(i,1, "pop", {-0.2, "tipsy"})
		add(i+1,1, "pop", {0.2, "tipsy"})

		add(i,1, "pop", {-0.8, "cosbumpyx"})
		add(i+1,1, "pop", {0.8, "cosbumpyx"})
	end 


	add(680,1, "impulse", {-2, "tiny"}, "bf")
	add(681,1, "impulse", {-2, "tiny"}, "bf")
	add(682,1, "impulse", {-2, "tiny"}, "bf")
	add(683,1, "impulse", {-2, "tiny"}, "bf")
	add(684,1, "impulse", {-2, "tiny"}, "bf")
	add(684.5,1, "impulse", {-2, "tiny"}, "bf")
	add(685,1, "impulse", {-2, "tiny"}, "bf")
	add(686,1, "impulse", {-2, "tiny"}, "bf")
	add(687,1, "bounce", {-0.1, "centered"}, "bf")



	ease(694, 2, "outSine",  1, "speedmod")

	ease(694, 2, "outSine",  -64, "z")
	ease(759, 1, "outSine",  0, "z")

	for i = 704, 704+(16*3), 16 do
		if i == 704+(16*3) then
			add(i, 7, "inSine",  360*4.5, "angle")
			add(i, 7, "linear",  360*6.5, "angle")
		else
			add(i, 8, "inOutSine",  360*8/2, "angle")
			add(i, 8, "linear",  360*8, "angle")
		end
	end


	for i = 764, 822-2, 2 do
		add(i, 1, "impulse",  -2.56, "tiny")
		add(i+1, 1, "impulse",  -2.56, "tiny")

		add(i, 1, "impulse",  0.2, "zoomx")
		add(i+1, 1, "impulse",  0.2, "zoomx")
	end


	set(824, 0, "angle")

	set(759, 1, "3d")
	set(882, 0, "3d","dad")
	set(889, 0, "3d","bf")

	ease(816, 2, "inOutSine",  0.6, "twirl","dad")
	ease(880, 2, "inOutSine",  0, "twirl","dad")

	ease(816, 2, "inOutSine",  0.5, "speedmod","dad")
	ease(826, 2, "inOutSine",  0.5, "speedmod","bf")


	ease(826, 2, "inOutSine",  -0.6, "twirl","bf")



	ease(880, 2, "outCubic",  0.85, "speedmod")
	ease(884, 2, "outCubic",  1, "speedmod")
	ease(884, 2, "outCubic",  {0, "orient",0, "drunk"})
	ease(821, 3, "inSine",  0.75, "orient")
	ease(821, 3, "inSine",  0.5, "drunk")

	ease(888, 2, "inOutSine", 0, "twirl","bf")

end

