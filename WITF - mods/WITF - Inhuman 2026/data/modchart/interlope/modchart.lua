function setUp()
	centerStrum("all")
end

function modsTimeline()

	for i=128, 254-0.5, 0.5 do
		add(i,0.5, "instant", 360/4/2/2, "angle")
	end
	for i=254, 256-0.25, 0.25 do
		add(i,0.25, "instant", 360/4/2/2, "angle")
	end
	for i=256, 382-0.5, 0.5 do
		add(i,0.5, "instant", 360/4/2/2, "angle")
	end
	for i=382, 384-0.25, 0.25 do
		add(i,0.25, "instant", 360/4/2/2, "angle")
	end
	for i=384, 444-0.5, 0.5 do
		add(i,0.5, "instant", 360/4/2/2, "angle")
	end
	for i=448, 510-0.5, 0.5 do
		add(i,0.5, "instant", 360/4/2/2, "angle")
	end
	for i=512, 574-0.5, 0.5 do
		add(i,0.5, "instant", 360/4/2/2, "angle")
	end


	for c = 0, 3 do
		set(-16, 1, "alpha--"..c, "bf")
		set(-16, 0.5, "centered--"..c, "bf")
	end
	ease(64,16, "outCubic", 0, "alpha--0", "bf")
	ease(64,16, "outCubic", 360, "angle--0", "bf")
	ease(64,16, "outCubic", 0, "centered--0", "bf")

	set(-16, 25, "x--1", "bf")
	ease(80,16, "outCubic", 0, "x--1", "bf")
	ease(80,16, "outCubic", 0, "centered--1", "bf")
	ease(80,16, "outCubic", 0, "alpha--1", "bf")
	ease(80,16, "outCubic", -360, "angle--1", "bf")


	set(-16, -55, "x--2", "bf")
	ease(96,16, "outCubic", 0, "x--2", "bf")
	ease(96,16, "outCubic", 0, "centered--2", "bf")
	ease(96,16, "outCubic", 360, "angle--2", "bf")
	ease(96,16, "outCubic", 0, "alpha--2", "bf")


	ease(110,16, "outCubic", -360, "angle--3", "bf")
	ease(110,16, "outCubic", 0, "centered--3", "bf")
	ease(112,16, "outCubic", 0, "alpha--3", "bf")


	set(-16, 0.559, "drunk", "bf")
	set(-16, 0.1, "waveyy", "bf")
	ease(64, 124-64, "linear", {0, "waveyy", 0, "drunk"}, "bf")


	set(-16, 0.35, "tinyholds")
	ease(254,2, "bounce", 0, "tinyholds")

	set(-16, -300, "debugX", "dad")
	set(-16, 300, "debugX",  "bf")

	set(-16, -3, "movex--0", "dad")
	set(-16, -3, "movex--1", "dad")
	set(-16, 3, "movex--2", "dad")
	set(-16, 3, "movex--3", "dad")


	set(-16, 1, "alphasplash", "dad")
	set(-16, 1, "alpha", "dad")
	set(-16, 2, "tipsy", "dad")

	ease(124,4, "outSmoothStep", 0.0, "tipsy", "dad")
	ease(124,4, "linear", 0.5, "alpha", "dad")
	ease(124,4, "linear", -0.5, "alphastrums", "dad")

	set(-16, 0.2, "strumstealth", "dad")
	set(-16, 0.2, "stealth", "dad")
	set(-16, 1, "stealthglowred", "dad")
	set(-16, 0, "stealthglowgreen", "dad")
	set(-16, 0, "stealthglowblue", "dad")


	set(447.9, 0.3, "strumstealth", "dad")
	set(447.9, 0.3, "stealth", "dad")


	for c = 0, 3 do
		ease(191,17, "inOutSine", 0.0, "movex--"..c, "dad")
	end


	ease(254,1.5, "inBack", 2, "tiny", "dad")
	ease(255,2, "inOutSine", {1, "alpha", 0, "alphastrums"}, "dad")

	set(510, 0, "tiny", "dad")
	ease(510,1, "outExpo", {0.5, "alpha", -0.5, "alphastrums"}, "dad")

	ease(574,2, "inOutSine", {1, "alpha", 0, "alphastrums"}, "dad")


	ease(256,16, "inOutSmootherStep", 0.5, "drunk", "bf")
	ease(381,3, "inOutSmootherStep", 0.0, "drunk", "bf")
	ease(381,3, "inOutSmootherStep", 1.75, "wave", "bf")
	ease(444,2, "outSine", 0, "wave", "bf")
	ease(444,2, "outSine", 0.75, "speed")

	ease(574,2, "outSine", 0.9, "speed")

	add(318,1, "impulse", -15, "skewy", "bf")
	add(319,1, "impulse", 15, "skewy", "bf")

	for i=256, 382-0.5, 0.5 do
		add(i, 0.5, "flip(outQuad)", 0.15, "tiny")
	end
	

	add(574, 2, "inOutSine", -180-360, "angle","bf")
	ease(574, 2, "inOutSine", 0, "x","bf")
	ease(574, 2, "inOutSine", -200, "z","bf")
	ease(574, 2, "inOutSine", -32, "yd","bf")
	
	
	

	local sideAlternator = 1
	for i=448, 574-1, 1 do

		if i==510 then
			set(i, strumSize * 2.5 * sideAlternator, "x", "dad")
			ease(i,1.67, "outBack", strumSize * -2.5 * sideAlternator, "x", "dad")
			add(i,1.67, "outBack", -360, "angle", "dad")
		elseif i == 511 then

		else
			if sideAlternator == 1 then
				sideAlternator = -1
			else 
				sideAlternator = 1
			end

			set(i, strumSize * 2.75 * sideAlternator, "x", "bf")
			set(i, strumSize * -2.75 * sideAlternator, "x", "dad")

			add(i, 0.5, "flip(outQuad)", -1, "tiny")
		end
	end
	add(510, .8, "pop", 0.25, "dizzy")
	add(510.75, .8, "pop", -0.26, "dizzy")
	add(511.25, .7, "pop", 0.2, "dizzy")
	add(511.75, .68, "pop", -0.125, "dizzy")

	for i=576, 640-1, 1 do
		add(i, 1, "flip(outQuad)", 1, "brake","bf")
	end

	set(576, 1, "cubicX__altcurpos", "bf")
	for i=576, 640-2, 2 do
		add(i, 1, "impulse", -0.2, "movex","bf")
		add(i+1, 1, "impulse", 0.2, "movex","bf")

		add(i, 1, "bounce", 0.125, "cubicX","bf")
		add(i+1, 1, "bounce", -0.125, "cubicX","bf")
	end

	for i=576, 640-8, 8 do
		for k=0,6 do
			add(i+k, 1, "impulse", -1, "tiny","bf")
		end

		add(i+7, 0.5, "impulse", -1, "tiny","bf")
		add(i+7.5, 0.5, "impulse", -1, "tiny","bf")
	end

	set(576, 1, "blacksphere__variant", "bf")
	for i=576, 640-8, 8 do
		add(i, 8, "linear", -360*1, "blacksphere", "bf")
	end
	--add(576, 16, "inOutSine", -360*3, "blacksphere", "bf")
	for i=576, 640-16, 16 do
		add(i, 16, "inOutSine", -360*2, "blacksphere", "bf")
	end




	ease(638, 2, "inBack", 0.5, "flip", "bf")
	add(640, 15, "outCubic", -360*3, "angle", "bf")

end
