function setUp()
end

function modsTimeline()

	setdefault(1,"showLaneMods")
	setdefault(1,"showsubmods")

	setdefault(45,"grain")

	-- KB note movement
	local b = getNoteBeats(0,1156,"dad")
	for i, v in ipairs(b) do
		if v[4] ~= "hurt" then
			add(v[1],0.5,"impulse",-0.35,"moveyd--"..v[2],"dad")
		end
	end


	for c=0,3 do
		set(-16, 1,  "alpha--"..c)
	end

	ease(0, 4, "outSmoothStep", 0, "alpha--0")
	ease(8, 4, "outSmoothStep", 0, "alpha--1")
	ease(16, 4, "outSmoothStep", 0, "alpha--2")
	ease(16+8, 4, "outSmoothStep", 0, "alpha--3")



	ease(616, 4, "inOutSmoothStep", 0.7, "speedmod","dad")
	ease(640, 4, "inOutSmoothStep", 0.7, "speedmod","bf")



	ease(696, 4, "inOutSmoothStep", 1.0, "speedmod","dad")
	ease(700, 4, "linear", 1.5, "speedmod","dad")
	ease(703, 1.7, "inOutSmoothStep", 1.3, "speedmod","dad")
	ease(704, 2, "inOutSmoothStep", 1.2, "speedmod","bf")

	ease(808, 4, "inOutSmoothStep", 1, "speedmod","dad")
	--ease(832, 2, "inOutSmoothStep", 1, "speedmod","bf")
	ease(828, 5, "inOutSmoothStep", 1, "speedmod","bf")



	set(703, 6, "beat__speed")
	ease(703.5, 0.5, "inOutExpo", 0.25, "beat")
	ease(831.5, 0.5, "inOutExpo", 0.0, "beat")


	set(703, 8, "waveyx__speed")
	ease(959, 4, "inOutSmoothStep", 0.09, "waveyx")
	ease(1023, 4, "inOutSmoothStep", 0.16, "waveyx")

	ease(1086, 4, "inOutSmoothStep", 0, "waveyx")



	local endNotes = getNoteBeats(1088,1116,"dad")
	for i, v in ipairs(endNotes) do
		--trace(v);
		if v[4] ~= "hurt" then


			ease(v[1],4,"inSine",1,"alpha--"..v[2],"dad")

		end
	end

	endNotes = getNoteBeats(1120,1150,"bf")
	for i, v in ipairs(endNotes) do
		--trace(v);
		if v[4] ~= "hurt" then
			ease(v[1],4,"inSine",1,"alpha--"..v[2],"bf")
		end
	end

end

