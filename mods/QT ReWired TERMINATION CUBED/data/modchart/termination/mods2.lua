function setUp()
end

function modsTimeline()


	local skewAmountStart = 6
	local skewAmountDrop = 6
	local skewAmountEndDrop = 7

	for i = 32, 92-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", -skewAmountStart, "skewx")
		else
			add(i+1-0.08, 1, "pop", skewAmountStart, "skewx")
		end

	end
	for i = 92, 96-1, 1 do

		add(i, 1, "impulse", -0.35, "tiny")

		if i % 2 >= 1 then
			add(i-0.08, 1, "pop", -skewAmountStart, "skewx")
		else
			add(i-0.08, 1, "pop", skewAmountStart, "skewx")
		end

	end



	value(190, 2, "bounce", 0, 0.5, "tiny")
	add(192, 1, "flip(outQuad)", -1, "tiny")

	for i = 192, 302-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", -skewAmountDrop, "skewx")
		else
			add(i+1-0.08, 1, "pop", skewAmountDrop, "skewx")
		end

	end

	for i = 302, 304-1, 1 do

		add(i, 1, "impulse", -0.35, "tiny")

		if i % 2 >= 1 then
			add(i-0.08, 1, "pop", skewAmountDrop, "skewx")
		else
			add(i-0.08, 1, "pop", -skewAmountDrop, "skewx")
		end

	end

	for i = 304, 320-1, 1 do

		add(i+0.5, 0.5, "impulse", -0.35, "tiny")
		add(i, 0.5, "impulse", -0.35, "tiny")

		if i % 2 >= 1 then
			add(i-0.08, 1, "pop", skewAmountDrop, "skewx")
		else
			add(i-0.08, 1, "pop", -skewAmountDrop, "skewx")
		end

	end


	ease(510, 1, "outQuad", 1, "speedmod", "dad")

	ease(381, 3, "inOutQuad", 0.8, "speedmod", "dad")
	ease(390, 4, "inOutQuad", 0.8, "speedmod", "bf")


	for i = 574, 576-0.125, 0.125 do

		add(i, 0.125, "impulse", -0.23, "tiny")
		add(i, 0.125, "impulse", -0.1, "tinyx")


	end



	for i = 832, 924-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", skewAmountEndDrop, "skewx")
		else
			add(i+1-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
		end

	end

	add(925-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
	add(926-0.08, 1, "pop", skewAmountEndDrop, "skewx")
	add(927-0.08, 1, "pop", -skewAmountEndDrop, "skewx")


	for i = 924, 927, 1 do
		add(i, 1, "impulse", -0.35, "tiny")
	end

	for i = 928, 958-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
		else
			add(i+1-0.08, 1, "pop", skewAmountEndDrop, "skewx")
		end

	end


	for i = 960, 988-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", skewAmountEndDrop, "skewx")
		else
			add(i+1-0.08, 1, "pop",-skewAmountEndDrop, "skewx")
		end

	end

	for i = 988, 991, 1 do
		add(i, 1, "impulse", -0.35, "tiny")
	end
	add(989-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
	add(990-0.08, 1, "pop", skewAmountEndDrop, "skewx")
	add(991-0.08, 1, "pop", -skewAmountEndDrop, "skewx")


	for i = 992, 1020-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
		else
			add(i+1-0.08, 1, "pop",skewAmountEndDrop, "skewx")
		end

	end

	for i = 1020, 1023, 1 do
		add(i, 1, "impulse", -0.35, "tiny")
	end
	add(1021-0.08, 1, "pop", skewAmountEndDrop, "skewx")
	add(1022-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
	add(1023-0.08, 1, "pop", skewAmountEndDrop, "skewx")


	for i = 1024, 1052-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", skewAmountEndDrop, "skewx")
		else
			add(i+1-0.08, 1, "pop",-skewAmountEndDrop, "skewx")
		end

	end

	for i = 1052, 1055, 1 do
		add(i, 1, "impulse", -0.35, "tiny")
	end
	add(1053-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
	add(1054-0.08, 1, "pop", skewAmountEndDrop, "skewx")
	add(1055-0.08, 1, "pop", -skewAmountEndDrop, "skewx")

	for i = 1056, 1088-2, 2 do

		add(i, 1, "impulse", -0.35, "tiny")
		add(i+1, 1, "impulse", -0.35, "tiny")

		if i % 4 >= 2 then
			add(i+1-0.08, 1, "pop", -skewAmountEndDrop, "skewx")
		else
			add(i+1-0.08, 1, "pop",skewAmountEndDrop, "skewx")
		end

	end

	for i = 1084, 1088-0.25, 0.25 do
		add(i, 0.25, "impulse", -0.35, "tiny")
	end
	for i = 1080, 1084-0.5, 0.5 do
		add(i, 0.5, "impulse", -0.35, "tiny")
	end

	add(1088, 24, "flip(outSine)", -0.15, "tiny")
end

