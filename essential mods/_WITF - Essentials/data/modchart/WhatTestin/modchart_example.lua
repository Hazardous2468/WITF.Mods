function setUp()
	--centerStrum("bf")
	--centerStrum("dad")
	--createNewPlayer(true) --True means it's player controlled. False means it's bot (opponent) controlled

	trace("Welcome to the test song!")
	trace("\ngameVersion: "..gameVersion)
	trace("witfVersion: "..witfVersion)
end

function modsTimeline()

	

	-- SpiralHolds is a special modifier that changes how holds render.
	-- We use it so that when we use RotateZ modifier, the holds don't shrink on the y axis.
	set(-4, 1, "spiralholds")
	set(17, 0, "spiralholds") -- disable during the stealth to cover the transition as we want more wiggly sustains for the drunkX effect.
	
	-- 3D is another special modifier that, when active, will enable the notes 3D rendering method.
	setdefault(1, "3d")
	
	setdefault(1, "showlanemods")

	
	-- Rotate on the Z-axis
	ease(0, 4, "linear", -180, "rotateZ", "bf")
	ease(0, 4, "linear", 180, "rotateZ", "dad")
	
	-- Correct the strum order.
	ease(4.5, 2, "outElastic", 1, "flip")
	
	-- This is an example of changing two modifiers in the same command using {}.
	-- For the angleX modifier to work properly, the 3D modifier needs to be enabled.
	ease(6, 1.5, "outBack", {32, "rotateX", 32, "angleX"})
	ease(7, 1.5, "outBack", {0, "rotateX", 0, "angleX"})
	
	
	
	-- This is an example of a for loop. Useful for if you want to repeat events over a long period of time.
	-- The way I generally use them is by defining a starting beat, an ending beat (inclusive!), and the interval / frequency it gets repeated at.
	-- So for here, we start at beat 8 and keep adding 0.75 to it until we reach 10 (roughly).
	-- You can research more about Lua Loops elsewhere.
	for i = 8, 10, 0.75 do
		-- This is also a good example of using the 'add' command, 
		-- which acts the same as an ease but is additive 
		-- (doesn't overwrite the modifier value, just adds to it).
		add(i, 1, "outBack", 360/3, "angleZ")
		
		-- use 'trace(daText)' to print a message ingame to help with debugging your code! 
		-- Try it out by uncommenting the line below.
		--trace("beat: "..i)
	end
	
	ease(10, 1.5, "outBack", {-32, "rotateX", -32, "angleX"})
	ease(11, 1.5, "outBack", {0, "rotateX", 0, "angleX"})
	
	
	
	ease(4.5, 2, "inOutQuad", 1, "bumpyX")
	ease(11, 2, "inOutQuad", 0, "bumpyX")
	
	ease(12, 4, "inOutSine", 360, "rotatey")
	
	ease(16, 0.85, "outCubic", 1, "stealth")
	ease(17, 0.85, "outCubic", 0, "stealth")
	
	
	-- Value works similar to ease except you define the starting and ending value of the effect.
	value(17, 4, "inOutCubic", -1, 0, "roll")
	
	
	
	add(19, 1, "smoothStepInOut", -180, "rotateX")
	-- Reset our previous modifiers as we don't need them anymore after this rotateX.
	set(20,{0, "flip", 0, "rotateZ", 0, "angleZ", 0, "rotateX"})
	
	
	-- A neat little effect that combines reverse modifiers with invert. In Degrees.
	add(20, 3, "linear", 360, "blacksphere")
	
	ease(22.45, 2, "bell", -1, "tipsy")
	

	
	-- This is an example of using getNoteBeats to create an effect where when a note hits the receptor, it does an effect.
	-- Also works if you are using anything that modifiers the chart data (must be BEFORE timeline function gets called in the code)
	
	-- Specify a starting beat (inclusive) and a ending beat (exclusive), 
	-- and which strumline to take the data from. (either bf or dad as FNF only has two "players")
	-- This will then output a lua table for us to use (see below)
	
	local noteBeats = getNoteBeats(24, 32, "bf")
	for i, v in ipairs(noteBeats) do
	
		-- v[1] - The beat this note is on.
		-- v[2] - The data of the note (what lane / column). Between 0-3.
		-- v[3] - The length of the note (for holds).
		-- v[4] - The note kind (such as "hurt").
	
	
		if v[4] ~= "hurt" then
			-- The wiggle effect. We ensure the lane modifier is set to the correct speed before it occurs.
			-- The below is just 'drunkX--%__speed', where % is the lane. 
			set(v[1], 23.25, "drunkX--"..v[2].."__speed")
			set(v[1], 1.1, "drunkX--"..v[2].."__mult")
			add(v[1], 1.5, "impulse", 0.57, "drunkX--"..v[2])
			
			-- MoveYD is a modifier that acts the same as moveY but automatically inverts itself for Preferences.downscroll.
			add(v[1], 1, "impulse", -0.35, "moveyd--"..v[2])
		end
	end
	
	-- Increase the scroll speed and also make the holds make wiggly with a negative straightHolds modifier.
	ease(22.5, 0.5, "inOutQuad", 1.2, "speedmod")
	ease(22.5, 0.5, "inOutQuad", -1.55, "straightholds")
	
	
	-- Extend the length of the holds visually. 100% means twice the length.
	ease(28, 2, "inOutQuad", 1, "longholds")
	
	
	-- And finally at the bottom is the for loop responsible for the effects that play on the kick and snare of the song.
	-- Start at beat 0, and keep repeating every 4 beats until we reach beat 28-4 (done this way cuz remember, the end beat is Inclusive so I don't want to repeat between beats 28 and 32)
	
	-- Note how I'm flipping the ease so that instead of going from 0 -> 1, it goes 1 -> 0.
	-- Making the effect start at max intensity (0.5) and going back to it's original value (0.0)
	-- And using 'add' so it gets layered ontop of any 'scale' or 'noteSkewY' effects we might use.
	for i = 0, 28-4, 4 do
		add(i, 1, "flip(outSine)", 0.5, "scale")
		add(i+1.5, 1, "flip(outSine)", 0.5, "scale")
		add(i+3, 1, "flip(outSine)", 0.5, "scale")
		
		add(i+3, 1, "flip(outSine)", -45, "noteSkewY","dad")
		add(i+3, 1, "flip(outSine)", 45, "noteSkewY","bf")
	end
	
	add(28, 1, "flip(outSine)", 0.5, "scale")
	add(30, 1, "flip(outSine)", {-0.5, "mini",0.3, "scale"})
	
	
	
	
	-- and lastly, remember that rotateZ effect at the very start? 
	-- Well on easy difficulty our scroll speed is slower which results in a visible pop-in when the notes spawn.
	-- This if statement checks if we are playing on easy difficulty.
	-- Alternatively, you could also check the scroll speed of the song directly using the 'scrollSpeed' variable.
	
	
	trace("Song Difficulty: "..difficulty)
	if difficulty == "easy" then
		-- Increase render distance by 100%
		set(0, 1, "drawdistance")
		-- Then reset it back to normal after the rotation is done for performance.
		set(4, 0, "drawdistance")
	end
end


