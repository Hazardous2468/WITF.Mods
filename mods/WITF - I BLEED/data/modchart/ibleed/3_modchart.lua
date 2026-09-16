function setUp()
	centerStrum("1")
end

function modsTimeline()
	runHaxeCode(
	[[
		game.camHUD.alpha=0.1;
		for (strumLine in PlayState.instance.allStrumLines)
		{
			//strumLine.doUpdateClipsInDraw = false;
			strumLine.arrowPathFileName = "matoi/arrowPath";
		}
	]])

	-- getting rid of the dad playfield
	setasleep(-20, "dad", true)
	setdefault(1, "alpha", "dad")
	setdefault(112*10, "debugx", "dad")
	setdefault(1, "debugalpha", "dad")
	targetExclude("dad")

	
	local lazyalternator = false
	local r = ((math.pi/180)) --multiply a degree by 'r' to convert degrees it to radians

	
	
	setdefault(-1, "alphasplash")
	
	setdefault(55, "grain")
	setdefault(55, "pathgrain")
	setdefault(-112*1.5, "z")
	setdefault(.7, "speedmod")
	setdefault(.1, "ArrowPathWidth")
	setdefault({1, "spiralholds", 1, "spiralpaths"})
	--setdefault(1, "3d")	
	
	-- INTRO STUFF
	
	
	set(-16, 1, "drawsize")
	set(90, 0, "drawsize")
	set(-16, -77/100, "drunk")
	set(-16, -45/100, "tipsy")
	ease(92, 2, "inOutQuad", {0, "drunk", 0, "tipsy"})
	
	set(-16, 2.5, "wave")
	set(-16, 0.5, "wave__mult")
	set(-16, 0.75, "boost")
	set(-16, -40/100, "cubicz")
	set(32, 3, "beat__speed")
	set(-16, 0.5, "speedmod")

	
	
	ease(93, 2, "outQuad", {0, "drunk", 0, "tipsy", 0, "boost", 0, "wave", 0, "cubicz"})
	ease(93, 2, "outQuad", 0.7125, "speedmod")
	
	
	
	ease(63, 2, "inOutQuad", 1, "reverse")
	ease(79, 2, "inOutQuad", 0, "reverse")
	
	local function funnybounce(i)
		add(i, 1, "flip(outQuad)", {-300/100, 'tiny', 100/100, 'zigzag'})
		
		--add(i, 1, "flip(outQuad)", 36, 'glitch_line',"1")
		
		add(i, 1, "outSine", 555/100, 'drunk__offset')
		lazyalternator = not lazyalternator
		if lazyalternator then
			add(i, 1, "flip(outQuad)", -45, 'noteskewy')
			add(i, 1, "flip(outQuad)", -45/2, 'skewx')
			--set(i, 1, 'wireframe')
		else
			add(i, 1, "flip(outQuad)", 45, 'noteskewy')
			add(i, 1, "flip(outQuad)", 45/2, 'skewx')
			--set(i, 0, 'wireframe')
		end
	end
	
	
	for i = 32, 96-8, 8 do
		if i < 96-8 then
			ease (i+7, 0.5, "outQuad", 50/100, 'flip')
			ease (i+8, 0.5, "outQuad", 0, 'flip')
			ease (i+7, 0.5, "outQuad", 100/100, 'dark')
			ease (i+8, 0.5, "outQuad", 0, 'dark')
			ease (i+7, 0.5, "outQuad", 90/100, 'stealth')
			ease (i+8, 0.5, "outQuad", 0, 'stealth')
		end
		
		ease (i, 0.5, "outQuad", 1, 'beat')
		ease (i+6.5, 0.5, "linear", 0, 'beat')
		add (i, 7, "linear", {-360*2*r, 'confusionzoffset--0', 360*2*r, 'confusionzoffset--1', -360*2*r, 'confusionzoffset--2', 360*2*r, 'confusionzoffset--3'})
		
		funnybounce(i)
		funnybounce(i+3.5)
		funnybounce(i+4)
		funnybounce(i+5.5)
		funnybounce(i+7)
	end
	
	lazyalternator = false
	
	-- DPAD TRANSITION

	set(92, 0, "ArrowPathBackLength")
	set(92, 0, "ArrowPathLength")
	set(92, 0.5, "ArrowPath")
	ease(95,1, "outCubic", 1000, 'ArrowPathLength')
	
	

	
	set(92, 1, "hidden")
	set(92, 1.0, "hidden__noglow")
	set(92, -1, "hidden__start")
	set(92, -70, "hidden__end")
	
	ease(93, 1, "outExpo", 1, "sudden")
	set(93, 360, "sudden__offset")
	set(93, 525, "sudden__start")
	set(93, 375, "sudden__end")
	

	if downScroll then
		ease(93, 2, "outQuad", -90, "notesrotatez--0")
		ease(93, 2, "outQuad", 180, "notesrotatez--1")
		ease(93, 2, "outQuad", 90, "notesrotatez--3")
	else
		ease(93, 2, "outQuad", 90, "notesrotatez--0")
		ease(93, 2, "outQuad", 180, "notesrotatez--2")
		ease(93, 2, "outQuad", -90, "notesrotatez--3")
	end
	ease(93, 2, "outQuad", 1, "centered")
	ease(93, 2, "outQuad", 0.5, "flip")
	

	ease (190-96, 1, "outCubic", 23/100, 'brake')
	ease (255-96, 1, "outQuad", 0, 'brake')

	
	
	-- DPAD 1
	add (192-96, 255-192, "linear", 360*4, 'rotationz')
	
	for i = 96, 254-96, 1 do
		add(i, 1, "pop", 100, 'glitch2',"1")
		add(i, 1, "bounce", 1.5, "spacing","1")
		add(i, 1, "pop", -200/100, 'tiny')
		
		add(i, 1, "popElastic", 1, 'bumpyx')
		
	end
	
	
	
	for i = 96, 254-8-96, 8 do
		ease(i+6, 1, "outCubic", 100/100, 'dark')
		ease(i+8, 0.5, "outQuad", 0, 'dark')
		ease(i+6, 1, "outCubic", 90/100, 'stealth')
		ease(i+8, 0.5, "outQuad", 0, 'stealth')

		add(i+6,2, "inOutQuad", -360*r, 'ConfusionZOffset--0')
		add(i+6,2, "inOutQuad", 360*r, 'ConfusionZOffset--1')
		add(i+6,2, "inOutQuad", -360*r, 'ConfusionZOffset--2')
		add(i+6,2, "inOutQuad", 360*r, 'ConfusionZOffset--3')
	end
	
	

	
	
	
	-- DPAD 2
	
	add(160, 224-160, "linear", 360*-4, 'rotationz')

	for i = 160, 224-8, 8 do
		add(i, 8, "inOutSine", -90, 'rotationz')
		add(i, 8, "bell", -0.35, 'dizzy')
	end
	
	
	for i = 160, 192-1, 1 do
		add(i, 1, "pop", 100, 'glitch2',"1")
		add(i, 1, "bounce", 1.5, "spacing","1")
		add(i, 1, "pop", -200/100, 'tiny')
		
		add(i, 1, "popElastic", 1, 'bumpyx')
	end
	for i = 200, 224-1, 1 do
		add(i, 1, "pop", 100, 'glitch2',"1")
		add(i, 1, "bounce", 1.5, "spacing","1")
		add(i, 1, "pop", -200/100, 'tiny')
		
		add(i, 1, "popElastic", 1, 'bumpyx')
	end
	
	for i = 160, 192-8, 8 do
		ease(i+6, 1, "outCubic", 100/100, 'dark')
		ease(i+8, 0.5, "outQuad", 0, 'dark')
		ease(i+6, 1, "outCubic", 50/100, 'stealth')
		ease(i+8, 0.5, "outQuad", 0, 'stealth')

		add(i+6,2, "inOutQuad", -360*r, 'ConfusionZOffset--0')
		add(i+6,2, "inOutQuad", 360*r, 'ConfusionZOffset--1')
		add(i+6,2, "inOutQuad", -360*r, 'ConfusionZOffset--2')
		add(i+6,2, "inOutQuad", 360*r, 'ConfusionZOffset--3')
	end

	for i = 200, 224-8, 8 do
		ease(i+6, 1, "outCubic", 100/100, 'dark')
		ease(i+8, 0.5, "outQuad", 0, 'dark')
		ease(i+6, 1, "outCubic", 50/100, 'stealth')
		ease(i+8, 0.5, "outQuad", 0, 'stealth')

		add(i+6,2, "inOutQuad", -360*r, 'ConfusionZOffset--0')
		add(i+6,2, "inOutQuad", 360*r, 'ConfusionZOffset--1')
		add(i+6,2, "inOutQuad", -360*r, 'ConfusionZOffset--2')
		add(i+6,2, "inOutQuad", 360*r, 'ConfusionZOffset--3')
	end
	
	
	local bb = getNoteBeats(191.9,192.1,"bf")
	for i, v in ipairs(bb) do
		if v[4] ~= "hurt" then
			ease(192, 1, "outQuad", 0.2, "tanbumpyx--"..v[2])
			ease(192+5, 2, "inOutQuad", 0, "tanbumpyx--"..v[2])
		end
	end


	
	-- Make the receptors show the most recently pressed arrow by moving it's z slightly above the rest.
	local b = getNoteBeats(95.9,285.9,"bf")
	for i, v in ipairs(b) do
		-- v[1] == the beats that the charted notes are on
		-- v[2] == the column that the charted notes are on, starting from 0
		-- v[3] == the hold length (0 means no hold) in ms
		-- v[4] == the type of note (such as "default", "hurt", "invisible", "dodge",etc)
		if v[4] ~= "hurt" then
			if v[3] <= 0 then
				add(v[1], 2, "pop",112/4, "z--"..v[2])
			else
				local hold_length_in_beats = getTimeInSteps(v[3]) / stepsPerBeat
				--trace(hold_length_in_beats)
				add(v[1], 1, "outExpo",112/4, "z--"..v[2])
				add(v[1]+hold_length_in_beats, 1, "inOutQuint",112/4*-1, "z--"..v[2])
			end
		end
	end
	
	
	
		
	-- ENDING


	ease(224, 0.75, "linear", 0.5, 'tanbumpyx')


	for i=224,286,8 do
		for k=0,6 do
			add (i+k, 1, "flip(outQuad)", 4/100, 'zoom')
			add (i+k, 1, "flip(outQuad)", 4, 'spacing',"1")
			add (i+k, 1, "flip(outQuad)", 5/100, 'brake')
		end
	end

	reset(286)
	set(286, 1, "alpha","2")
	set(286, 0, "alpha","1")

	set(286, 16, "beat__speed","1")
	set(286, 0.12, "beat","1")

	ease(286, 1, "inBack", 0, 'zoomx')
	add(286, 1, "bounce", -13, 'skewy')
	
	
end



