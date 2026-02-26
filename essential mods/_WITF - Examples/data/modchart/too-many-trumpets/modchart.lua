function setUp()
	--1 and 3 for gate, field and construct
	--2 (dad) for ending holds
	--4 and 5 for disruption
	--6 for stretch
	
	
	
	createNewPlayer(true)
	createNewPlayer(true)
	createNewPlayer(true)
	centerPlayer("")
	centerOpponent("")
end

local tinyMultFix = 2 --WITF 1.0.0a fix

local function defaultzzz(who)
	setasleep(-16, who, true) 
	setasleep(0, who, true) 
	setdefault(-16, "movex", who)
	setdefault(-16*112, "debugx", who)
	setdefault(1, "alpha", who)
end



function hxCode()
	addHaxeLibrary("Constants", "funkin.util")
	runHaxeCode(
	[[
		print("yo");
		
		addUpdate(function(elapsed){
			for (strumLine in PlayState.instance.allStrumLines)
			{		
			
				for (note in strumLine.notes.members){
				
					if(note==null||!note.alive) continue;
					
					var renderWindowEnd = note.strumTime+2000 + Constants.HIT_WINDOW_MS + (strumLine.renderDistanceMs / 8 * 1.0);
					
					if (Conductor.instance.songPosition >= renderWindowEnd)
					{
						note.kill();
						print("Excuse me note?");
						print("handledMiss? " + note.handledMiss);
						print("beenHit? " + note.hasBeenHit);
						print("-end");
					}
				}
			
			
				for (holdNote in strumLine.holdNotes.members){
				
					if(holdNote==null||!holdNote.alive) continue;
					
					var renderWindowEnd = holdNote.strumTime+2000 + holdNote.fullSustainLength + Constants.HIT_WINDOW_MS + (strumLine.renderDistanceMs / 8 * 1.0);
				
					if (Conductor.instance.songPosition >= renderWindowEnd)
					{
						// Hold note is offscreen, kill it.
						holdNote.visible = false;
						holdNote.kill(); // Do not destroy! Recycling is faster.
						print("Excuse me hold?");
					}
				}
			}
		});	
	]])
end


function modsTimeline()
	--hxCode()
	
	--Increase the grain if the ending is too laggy cuz of the BG holds :p
	local dadEndingHoldsGrain = 42
	
	local upscrollFix = 1
	if not downScroll then
		upscrollFix = -1
	end
	

	setdefault(1, "oldstealthholds")
	
	setdefault(0, "zsort", "1")
	setdefault(87, "grain")
	defaultzzz("dad")
	defaultzzz("4")
	defaultzzz("5")
	setdefault(0.85, "alphasplash", "all")
	
	
	setdefault(112*3, "debugx","3")
	setdefault(112*-3, "debugx","4")
	setdefault(112*3, "debugx","5")
	
	set(-16, 1, "reverse", "3")
	set(-16, 16, "movex", "3")
	ease(62, 2, "outElastic", 0, "movex", "3")
	
	set(-16, 1.4, "drawdistance", {1,3})
	
	set(30, 900, "sudden__offset")
	ease(30,2,"inOutQuad", 1, "sudden")
	--ease(94,1,"outExpo", 800, "sudden__offset")
	
	set(32, 0.25, "drawdistance", "1")
	set(32, 0.25, "drawdistance", "3")
	
	set(-16, 0.5, "speedmod")
	ease(28-4, 4, "linear", 1, "speedmod")
	
	add(31, 1, "impulse", 0.5*tinyMultFix, "tiny")
	
	
	set(-16, 1, "3D", "1")
	set(-16, 1, "3D", "3")
	
	set(-16, -210, "z")
	setdefault(750, "z__priority")
	set(-16, 750, "z__priority")
	resort(-16)
	
	for i = 15, 16-0.25, 0.5 do
		add(i, 0.25, "pop", 1, "tipsy")
		add(i+0.25, 0.25, "pop", -1, "tipsy")
		add(i, 0.25, "pop", 1, "drunk")
		add(i+0.25, 0.25, "pop", -1, "drunk")
	end
	
	add(23, 0.5, "pop", -70, "noteskewx", "1")
	add(23.5, 0.5, "pop", 70, "noteskewx", "1")
	
	add(28, 4, "outCubic", -360, "rotatey", "1")
	
	
	ease(28, 4, "pop",-4, "drunk")
	ease(28, 4, "pop",2, "tipsy")
	add(28, 4, "pop",360*2, "anglez")
	

	
	
	ease(28, 2, "outExpo", 0.5, "speedmod")
	ease(62, 2, "inOutCubic", 0.82, "speedmod")
	
	set(-16, 245*upscrollFix, "strumrotatez--0__offset_y")
	add(32, 60-30, "linear", 360*12 , "strumrotatez--0", "1")
	
	set(-16, 245*upscrollFix, "strumrotatez--1__offset_y")
	add(32, 60-30, "linear", 360*-12 , "strumrotatez--1", "1")
	
	set(-16, 245*upscrollFix, "strumrotatez--2__offset_y")
	add(32, 60-30, "linear", 360*-12 , "strumrotatez--2", "1")
	
	set(-16, 245*upscrollFix, "strumrotatez--3__offset_y")
	add(32, 60-30, "linear", 360*12 , "strumrotatez--3", "1")
	
	for i = 32, 61, 1 do		
		add(i, 1, "pop", -1*tinyMultFix , "tiny")
	end
	
	for i = 64, 64+32-1, 1 do		
		add(i, 1, "impulse", -1.9*tinyMultFix , "tiny")
		add(i, 1, "pop", -0.75*tinyMultFix , "tiny")
	end
	for i = 160, 190-1, 1 do		
		add(i, 1, "impulse", -1*tinyMultFix, "tiny")
	end
	for i = 192, 224-1, 1 do		
		add(i, 1, "impulse", -1.95*tinyMultFix, "tiny")
		add(i, 1, "pop", -0.75*tinyMultFix, "tiny")
	end
	
	add(94, 2, "bell", -0.5,"speedmod")
	add(94, 2, "bell", -0.3,"speedmod--3")
	add(94.5, 2, "bell", 2000,"sudden__offset","1")
	
	set(-16, -245*upscrollFix, "strumrotatez--0__offset_y", "3")
	set(-16, -245*upscrollFix, "strumrotatez--1__offset_y", "3")
	set(-16, -245*upscrollFix, "strumrotatez--2__offset_y", "3")
	set(-16, -245*upscrollFix, "strumrotatez--3__offset_y", "3")
	
	ease(158, 2, "linear", 0.5, "speedmod")
	ease(158, 2, "linear", 0.0, "oldWave","1")
	ease(158, 2, "linear", 0.0, "oldWave","3")
	ease(160+30, 2, "inOutCubic", 0.82, "speedmod")
	
	add(160, 60-30, "linear", -360*12 , "strumrotatez--0","1")
	add(160, 60-30, "linear", -360*-12 , "strumrotatez--1","1")
	add(160, 60-30, "linear", -360*-12 , "strumrotatez--2","1")
	add(160, 60-30, "linear", -360*12 , "strumrotatez--3","1")
	add(160, 60-30, "linear", 360*12 , "strumrotatez--0","3")
	add(160, 60-30, "linear", 360*-12 , "strumrotatez--1","3")
	add(160, 60-30, "linear", 360*-12 , "strumrotatez--2","3")
	add(160, 60-30, "linear", 360*12 , "strumrotatez--3","3")
	
	
	add(158, 2, "inOutCubic", 0.09, "scale")
	
	ease(158, 2, "inOutCubic", 0.95, "stealth", "3")
	ease(175, 2, "inOutCubic", 0, "stealth", "3")
	ease(175, 2, "inOutCubic", 0.95, "stealth", "1")
	ease(190, 2, "inOutCubic", 0, "stealth", "3")
	ease(190, 2, "inOutCubic", 0, "stealth", "1")
	
	ease(158, 2, "inOutCubic", 0.95, "dark", "3")
	ease(175, 2, "inOutCubic", 0, "dark", "3")
	ease(175, 2, "inOutCubic", 0.95, "dark", "1")
	ease(190, 2, "inOutCubic", 0, "dark", "3")
	ease(190, 2, "inOutCubic", 0, "dark", "1")
	
	

	
	for l = 0, 3 do
		set(-16, -210, "rotatex--"..l.."__offset_z","1")
		set(-16, -210, "rotatex--"..l.."__offset_z","3")
	end
	
	set(-16, -210, "rotatex__offset_z","3")
	set(-16, -210, "rotatex__offset_z","1")
	
	
	
	
	set(-16, 1, "alpha")
	set(-16, 1*tinyMultFix, "tiny")
	set(-16, 0.5, "flip","1")
	set(0, 4, "beat")
	ease(27.5, 0.5, "linear", 0, "beat")
	
	ease(0, 28, "inOutSine", 0, "flip","1")
	ease(0, 28, "linear", 0, "tiny")
	ease(0, 28, "outCubic", 0, "alpha")
	
	
	
	set(138, 90, "grain")
	set(216, 85, "grain")
	
	
	local function fuck(when, who, angle)
		for l = 0, 3 do
		
			local m = 1
			if l % 2 == 0 then
				m = -1
			end
		
			ease(when, 1, "inOutSine", angle*m, "rotatex--"..l, who)
			ease(when, 1, "inOutSine", angle*m, "anglex--"..l, who)
		end
	end
	
	for i = 64, 64+32 -4, 2 do
		fuck(i, "3", 90)
		fuck(i, "1", 0)
		
		fuck(i+1, "3", 0)
		fuck(i+1, "1", -90)
	end
	for i = 192, 192+32 -4, 2 do
		fuck(i, "3", 90)
		fuck(i, "1", 0)
		
		fuck(i+1, "3", 0)
		fuck(i+1, "1", -90)
	end
	
	
	add(94, 2, "inCubic",0.35, "bumpy")
	add(94, 2, "inCubic",1, "oldWave","3")
	add(94, 2, "inCubic",1, "oldWave","1")
	
	ease(94, 2, "linear",0.25, "drunk","3")
	ease(94, 2, "linear",-0.25, "drunk","1")
	
	set(-16, 800, "sudden__offset")
	ease(94, 2, "inCubic",1, "sudden")
	
	
	
	
	--Construct
	local dz_m = 0.39
	add(96, 2, "pop", 0.4, "drunkz")
	add(99, 2, "pop", -1 * dz_m, "drunkz")
	add(101, 2, "pop", 1 * dz_m, "drunkz")
	add(103, 2, "pop", -1 * dz_m, "drunkz")
	add(104, 2, "pop", -1 * dz_m, "drunkz")
	add(107, 2, "pop", -1 * dz_m, "drunkz")
	add(109, 2, "pop", -1 * dz_m, "drunkz")
	add(111, 1, "pop", -1 * dz_m, "drunkz")
	add(111.5, 1, "pop", -1 * dz_m, "drunkz")
	add(112, 2, "pop", -1 * dz_m, "drunkz")
	
	add(16+99, 2, "pop", -1 * dz_m, "drunkz")
	add(16+101, 2, "pop", 1 * dz_m, "drunkz")
	add(16+103, 2, "pop", -1 * dz_m, "drunkz")
	add(16+104, 2, "pop", -1 * dz_m, "drunkz")
	add(16+107, 2, "pop", -1 * dz_m, "drunkz")
	add(16+109, 2, "pop", -1 * dz_m, "drunkz")
	add(16+111, 1, "pop", 1 * dz_m, "drunkz")
	add(16+111.5, 1, "pop", 1 * dz_m, "drunkz")
	add(16+112, 2, "pop", 1 * dz_m, "drunkz")
	
	add(16+16+99, 2, "pop", -1 * dz_m, "drunkz")
	add(16+16+101, 2, "pop", 1 * dz_m, "drunkz")
	add(16+16+103, 2, "pop", -1 * dz_m, "drunkz")
	add(16+16+104, 2, "pop", -1 * dz_m, "drunkz")
	add(16+16+107, 2, "pop", -1 * dz_m, "drunkz")
	add(16+16+109, 2, "pop", -1 * dz_m, "drunkz")
	add(16+16+111, 1, "pop", 1 * dz_m, "drunkz")
	add(16+16+111.5, 1, "pop", 1 * dz_m, "drunkz")
	add(16+16+112, 2, "pop", 1 * dz_m, "drunkz")
	
	add(147, 2, "pop", 1 * dz_m, "drunkz")
	add(148, 2, "pop", -1 * dz_m, "drunkz")
	add(149, 2, "pop", 1 * dz_m, "drunkz")
	add(150, 2, "pop", -1 * dz_m, "drunkz")
	add(151, 2, "pop", 1 * dz_m, "drunkz")
	
	
	for l = 0, 3 do
	
		local m = 1
		if l % 2 == 0 then
			m = -1
		end
	

		--add(94, 2, "inCubic",-0.35, "movez", "3")
		--add(94, 2, "inCubic",-0.35, "movez", "1")
		
		ease(94, 2, "inCubic", 90*m, "rotatex--"..l, "3")
		ease(94, 2, "inCubic", 90*m *0.75*-1, "anglex--"..l, "3")
		

		
		ease(94, 2, "inCubic", 90*m *0.75*-1*-1, "anglex--"..l, "1")
		
		
		add(94, 32, "linear", 90*m *0.1*-1, "anglex--"..l, "3")
		add(94, 32, "linear", 90*m *0.1, "anglex--"..l, "1")
		
		
		ease(158, 2, "inCubic", 0, "anglex--"..l, "3")
		ease(158, 2, "inCubic", 0, "anglex--"..l, "1")
		
		
		ease(158, 2, "inCubic",0, "rotatex--"..l)
	end
	add(159, 2, "inOutSine",-0.35*4, "movez", "3")
	add(159, 2, "inOutSine",-0.35*4, "movez", "1")
	

	ease(112-16-0.5, 2, "outBounce",1, "reverse", "1")
	ease(112-16-0.5, 2, "outBounce",0, "reverse", "3")
	
	ease(112-0.5, 2, "outBounce",1, "reverse", "3")
	ease(112-0.5, 2, "outBounce",0, "reverse", "1")
	
	ease(128-0.5, 2, "outBounce",1, "reverse", "1")
	ease(128-0.5, 2, "outBounce",0, "reverse", "3")
	
	ease(128+16-0.5, 2, "outBounce",0, "reverse", "1")
	ease(128+16-0.5, 2, "outBounce",1, "reverse", "3")
	
	
	
	
	
	ease(222, 1.8, "linear", 1*tinyMultFix, "tinyy", "1")
	set(223.85, 60, "movex" , "1")
	set(223.85, 1, "alpha" , "1")
	
	
	ease(222, 1.8, "linear", 1.8, "drunk", "3")
	ease(222, 1.8, "linear", 0.52, "orient2", "3")
	
	ease(222, 1.8, "linear", -0.75, "beat", "3")
	
	ease(222, 1.8, "linear", 1, "oldWave", "3")
	ease(232, 252-232, "inQuad", 1.48, "oldWave", "3")
	
	
	ease(240, 252-240, "inQuad", 45*upscrollFix, "rotatex", "3")
	add(240, 252-240, "inQuad",45*upscrollFix, "anglex", "3")
	
	ease(240, 252-240, "inQuad", 2, "reverse", "3")
	ease(240, 252-240, "inQuad", -1*tinyMultFix, "tinyy", "3")
	ease(240, 250-240, "linear", 48, "grain", "3")
	ease(240, 250-240, "linear", 0.3, "orient2", "3")
	
	
	ease(240-0.5, 1, "inOutBack", 1, "invert", "3")
	ease(240-0.5+2, 1, "inOutBack", 0, "invert", "3")
	ease(240-0.5+4, 1, "inOutBack", 1, "invert", "3")
	ease(240-0.5+2+4, 1, "inOutBack", 0, "invert", "3")
	ease(240-0.5+4+4, 1, "inOutBack", 1, "invert", "3")
	ease(240-0.5+2+4+4, 1, "inOutBack", 0, "invert", "3")
	
	
	for i = 288, 316-0.25, 0.5 do
		set(i, 0.9, "stealth" , "1")
		set(i+0.25, 0.0, "stealth" , "1")
		
		set(i, 1, "flip" , "1")
		set(i+0.25, 0.0, "flip" , "1")
	end
	
	reset(252)
	
	set(252, 1.4, "drawdistance", "1")
	
	local speedMod = 0.5
	set(252, speedMod, "speedmod")
	set(252, -4, "movez")
	--set(252, -2, "movey")
	
	set(252, 1, "alpha")
	--ease(254, 2, "linear", 0.9, "dark", "1")
	ease(252.01, 8, "outExpo", 0, "alpha", "1")
	--set(252, -90, "rotx")
	set(252, 0.2, "arrowpathwidth", "1")
	--set(252, 0.4, "arrowpath", "1")
	ease(253, 3, "inQuint", 0.4, "arrowpath", "1")
	
	add(252, 7.5, "spike", -0.4*tinyMultFix, "tiny", "1")
	
	set(252, 1, "spiralpaths", "1")
	set(252, 1, "spiralholds", "1")
	
	set(252, 1, "sudden", "1")
	set(252, 1400, "sudden__offset", "1")
	
	set(252, 42, "grain", "1")
	
	set(320, 50, "grain")
	
	set(316, 112*3, "debugx","4")
	set(316, 112*-3, "debugx","5")
	

	add(256, 4, "outQuint", 360, "anglez","1")
	add(272, 4, "outQuint", 360, "anglez","1")
	add(288, 4, "outQuint", 360, "anglez","1")
	add(304, 4, "outQuint", 360, "anglez","1")
	
	
	
	add(320, 4, "outQuint", -360, "anglez","5")
	add(320, 4, "outQuint", 360, "anglez","4")
	add(336, 4, "outQuint", -360, "anglez","5")
	add(336, 4, "outQuint", 360, "anglez","4")
	
	add(352, 3, "outExpo", 360, "anglez")
	add(368, 3, "outExpo", -360, "anglez")
	add(372, 1.25, "outExpo", 360, "anglez")
	add(376, 1.25, "outExpo", -360, "anglez")
	add(378, 1.25, "outExpo", 360, "anglez")
	add(380, 1, "outExpo", -360, "anglez")
	add(381, 1, "outExpo", 360, "anglez")
	add(382, 1, "outExpo", -360, "anglez")
	add(383, 1, "outExpo", 360, "anglez")
	

	
	for i = 256 , 316-1 do
		add(i, 1, "linear", beatLength * 1 * 1.705 * speedMod * 0.45, "drive2","1")
		add(i, 1, "linear", beatLength * speedMod *-1, "drive","1")
	end
	
	ease(256, 4, "linear", 1, "beatSkewX")
	ease(315, 1, "inExpo", 0, "beatSkewX")
	
	for i = 256 , 256+64-1 do
		add(i, 0.5, "pop", -0.25*tinyMultFix, "tiny")
	end
	
	add(254, 2, "linear", 4, "bumpy--0", "1")
	add(254, 2, "linear", -4, "bumpy--1", "1")
	add(254, 2, "linear", 4, "bumpy--2", "1")
	add(254, 2, "linear", -4, "bumpy--3", "1")
	set(254, 0.5, "bumpyx__mult", "1")
	add(254, 2, "linear", 4, "bumpyx", "1")

	add(256, 64, "linear", 360*3, "roty", "1")
	set(256, 112*-4, "rotatey__offset_z","1")
	

	for i = 256 , 316-4, 4 do
		add(i, 4, "inOutSine", 90, "roty", "1")
	end
	
	add(316, 4, "inQuint", 90, "roty", "1")
	
	set(316, 1.22, "drawdistance", "5")
	set(316, 1.22, "drawdistance", "4")
	
	
	reset(320, "1")
	set(320, 1, "zsort", "1")
	
	
	set(319, -0.8, "drawdistance", "1")
	set(320, -0.8, "drawdistance", "1")
	set(320, 1, "alpha", "1")
	set(320, 0, "arrowpath", "1")
	set(320, 90, "grain")
	set(320, 2000, "mathCutOff")
	set(320.1, 10, "mathCutOff","1")
	set(320.1, 112, "movex","1")
	set(320.1, 200, "grain", "1")
	

	add(316, 3, "linear", 6.5*beatLength * 1 * 1.705 * speedMod, "drive2","1")
	
	ease(316, 4, "inQuad", 0, "alpha","5")
	ease(316, 4, "inQuad", 0, "alpha","4")

	ease(320, 64, "linear", 360*30, "blackSphere", "5")
	ease(320, 64, "linear", 360*-30, "blackSphere", "4")
	

	
	
	
	

	setasleep(316, "4", false) 
	setasleep(316, "5", false) 
	set(316, 0, "stealth", "4")
	set(316, 4, "movex", "5")
	set(316, -4, "movex", "4")
	set(317, 20, "movex","dad")
	set(317.5, 1, "zsort", "1")
	set(318, 1, "spiralholds")
	
	
	set(317, -4*112, "rotatex__offset_z")

	set(320, 0, "beatscale__alternate")
	set(320, 0, "beatscale__mult")
	set(320, 3, "beatscale")
	
	for i = 320, 352-8, 8 do
		ease(i+1, 2, "outExpo", 180, "rotatex", "4")
		ease(i+3, 2, "outExpo", 180, "rotatex", "5")
		
		ease(i+3+2, 2, "outExpo", 0, "rotatex", "4")
		ease(2+i+3+2, 2, "outExpo", 0, "rotatex", "5")
	
		--ease(i+1, 2, "outExpo", 1, "reverse", "4")
		--ease(i+3, 2, "outExpo", 1, "reverse", "5")
		
		--ease(i+3+2, 2, "outExpo", 0, "reverse", "4")
		--ease(2+i+3+2, 2, "outExpo", 0, "reverse", "5")
	end
	
	for i = 352, 384-4, 4 do
		ease(i-0.25, 1, "outExpo", 180, "rotatex", "4")
		ease(i+1-0.25, 1, "outExpo", 180, "rotatex", "5")
		
		ease(2+i-0.25, 1, "outExpo", 0, "rotatex", "4")
		ease(2+i+1-0.25, 1, "outExpo", 0, "rotatex", "5")
	
		--ease(i, 1, "outExpo", 1, "reverse", "4")
		--ease(i+1, 1, "outExpo", 1, "reverse", "5")
		
		--ease(2+i, 1, "outExpo", 0, "reverse", "4")
		--ease(2+i+1, 1, "outExpo", 0, "reverse", "5")
	end
	
	
	
	
	
	ease(384, 1, "outExpo", 4, "drunkz")	
	ease(384, 8, "linear", -4*upscrollFix, "tipsy")
	
	local circAmount = 0.25
	for i = 320, 384, 8 do
		add(i, 4, "bounce", 2, "movez", "4")
		add(i+4, 4, "bounce", -2, "movez", "4")
		
		add(i, 4, "bounce", -2, "movez", "5")
		add(i+4, 4, "bounce", 2, "movez", "5")
		
		add(i, 4, "bounce", 2*112, "rotatex__offset_z", "4")
		add(i+4, 4, "bounce", -2*112, "rotatex__offset_z", "4")
		add(i, 4, "bounce", -2*112, "rotatex__offset_z", "5")
		add(i+4, 4, "bounce", 2*112, "rotatex__offset_z", "5")
	
	
	
	
		ease(i, 4, "inOutSine", 4, "movex", "4")
		ease(i+4, 4, "inOutSine", -4, "movex", "4")
		ease(i, 2, "inOutSine", circAmount, "circx", "4")
		ease(i+2, 2, "inOutSine", 0, "circx", "4")
		ease(i+4, 2, "inOutSine", -circAmount, "circx", "4")
		ease(i+2+4, 2, "inOutSine", 0, "circx", "4")
		
		
		
		ease(i+4, 4, "inOutSine", 4, "movex", "5")
		ease(i, 4, "inOutSine", -4, "movex", "5")
		ease(i, 2, "inOutSine", -circAmount, "circx", "5")
		ease(i+2, 2, "inOutSine", 0, "circx", "5")
		ease(i+4, 2, "inOutSine", circAmount, "circx", "5")
		ease(i+2+4, 2, "inOutSine", 0, "circx", "5")
	end

	
	
	
	reset(392)
	

	setasleep(395, "5", true) 
	setasleep(395, "3", true) 
	setasleep(395, "4", true) 
	setasleep(392, "dad", false) 
	ease(392.1, 8, "outExpo", 0.75, "alpha", "dad")
	set(392,0, "movex","dad")
	
	set(392,2, "drawdistance","dad")
	
	set(392,1.2, "drawdistance","1")
	
	set(392,1, "sudden","dad")
	set(392,1, "sudden__noglow","dad")
	set(392,2000, "sudden__offset","dad")
	set(392,0.5, "speedmod","dad")
	set(392,1, "spiralholds","dad")
	
	set(392,1, "spiralx","dad")
	set(392,dadEndingHoldsGrain, "grain","dad")
	
	
	
	set(392,0, "lineary__altcurpos","dad")
	set(392,-1, "lineary","dad")
	set(392,1, "spiraly","dad")
	set(392,-0.1, "linearz","dad")
	
	set(392,1, "centered","dad")
	--set(392,-3*112, "rotatex__offset_z","dad")
	--ease(392, 72, "linear", 360*40, "rotatex", "dad")
	
	set(392,1, "spiraly__cos","dad")
	
	for i = 464, 528+32-1 do
		add(i, 1, "bell", 0.2,"stealth","dad")
	end
	
	
	
	
	
	
	set(392, -6*tinyMultFix, "tiny")
	ease(392.01, 7.8, "outExpo", 0, "tiny")
	
	set(392.1, 1,"alpha", "3")
	
	ease(398, 2, "inOutCubic", -3, "movez")
	
	set(392,1, "spiralpaths")
	set(392,0.15, "arrowpathwidth","1")
	set(392,0.0, "arrowpathbacklength","1")
	ease(394, 6, "inOutCubic", 0.175, "arrowpath", "1")
	
	
	ease(392, 2, "outExpo", 0.68, "speedmod")
	
	add(400, 60-30, "linear", 360*4 , "rotz", "1")
	
	set(392, 245*upscrollFix, "strumrotatez--0__offset_y")
	add(400, 60-30, "linear", -360*12 , "strumrotatez--0", "1")
	
	set(392, 245*upscrollFix, "strumrotatez--1__offset_y")
	add(400, 60-30, "linear", -360*-12 , "strumrotatez--1", "1")
	
	set(392, 245*upscrollFix, "strumrotatez--2__offset_y")
	add(400, 60-30, "linear", -360*-12 , "strumrotatez--2", "1")
	
	set(392, 245*upscrollFix, "strumrotatez--3__offset_y")
	add(400, 60-30, "linear", -360*12 , "strumrotatez--3", "1")
	
	set(400, 1, "beat")
	set(400, 1, "beatangle")
	set(528, 0, "beat")
	set(528, 0, "beatangle")
	
	add(432, 30, "linear", -360*4 , "rotz", "1")
	add(432, 30, "linear", 360*12 , "strumrotatez--0", "1")
	add(432, 30, "linear", 360*-12 , "strumrotatez--1", "1")
	add(432, 30, "linear", 360*-12 , "strumrotatez--2", "1")
	add(432, 30, "linear", 360*12 , "strumrotatez--3", "1")
	
	for i = 400, 464+64-1 do
		add(i, 1, "pop", -2*tinyMultFix , "tiny")
		add(i,1,"pop", 0.08, "arrowpathwidth","1")
		add(i,0.5,"pop", 0.5, "arrowpath","1")
	end
	for i = 400, 464+64-2,2 do
		add(i, 1, "pop", -0.5 , "drunkz")
		add(i+1, 1, "pop", 0.5 , "drunkz")
	end
	
	
	
	add(432+32, 30, "linear", 360*4 , "rotz", "1")
	add(432+32, 30, "linear", -360*12 , "strumrotatez--0", "1")
	add(432+32, 30, "linear", -360*-12 , "strumrotatez--1", "1")
	add(432+32, 30, "linear", -360*-12 , "strumrotatez--2", "1")
	add(432+32, 30, "linear", -360*12 , "strumrotatez--3", "1")
	
	add(432+64, 30, "linear", -360*4 , "rotz", "1")
	add(432+64, 30, "linear", 360*12 , "strumrotatez--0", "1")
	add(432+64, 30, "linear", 360*-12 , "strumrotatez--1", "1")
	add(432+64, 30, "linear", 360*-12 , "strumrotatez--2", "1")
	add(432+64, 30, "linear", 360*12 , "strumrotatez--3", "1")
	
	set(464, -3*112, "rotatex__offset_z")
	add(464, 32, "linear", 360*12 , "rotx", "1")
	add(464+32, 32, "linear", -360*12 , "rotx", "1")
	
	
	
	add(439, 0.5, "pop", 0.28, "stealth","1")
	add(439.5, 0.5, "pop", 0.285, "stealth","1")
	add(455, 0.5, "pop", 0.4, "stealth","1")
	add(455.5, 0.5, "pop", 0.4, "stealth","1")
	add(503, 0.5, "pop", 0.3, "stealth","1")
	add(503.5, 0.5, "pop", 0.32, "stealth","1")
	add(519, 0.5, "pop", 0.3, "stealth","1")
	add(519.5, 0.5, "pop", 0.3, "stealth","1")
	
	
	add(526, 2, "inCubic",1, "drunk","1")
	add(526, 5, "inOutCubic",1, "tornado","1")
	
	set(528, 1, "3d","1")
	ease(535.5, 0.5, "inCubic",-12*tinyMultFix, "tiny", "1")
	ease(535.5, 0.5, "inCubic", 2, "tandrunk", "1")
	ease(535.5, 0.5, "inCubic", 2, "tantipsy", "1")
	
	ease(535, 2, "inOutExpo", 1, "alpha", "dad")
	
	
	ease(538, 6, "inExpo",1*tinyMultFix, "tiny", "1")
	
	setdefault(1,"arrowpathred","1")
	setdefault(1,"arrowpathblue","1")
	setdefault(1,"arrowpathgreen","1")
	ease(538, 6, "inCubic",0, "arrowpathred", "1")
	ease(538, 6, "inCubic",0, "arrowpathblue", "1")
	ease(538, 6, "inCubic",0, "arrowpathgreen", "1")
	
end


