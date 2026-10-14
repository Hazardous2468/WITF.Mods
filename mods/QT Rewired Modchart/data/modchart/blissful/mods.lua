function modsTimeline()
	if songVariation == "pico" then
		
	else
	
		for i = 16, 29 do
			--add(i, 1, "bounce", 0.1, "center")
			
			add(i, 1, "bounce",-0.4, "movez")
			add(i, 1, "bell", 0.5, "tipsy")
			if i % 2 == 1 then
				add(i,0.5, "pop", -1, "tiny")
			end
		end
		--set(16, 1, "beat")
		
		
		
		set(-4, 1, "showlanemods")
		setdefault(1, "drawdistance") --fnf v0.6.3 fix
		set(-4, 1, "spiralholds")
		
		for i = 32, 96-1 do
			add(i, 1, "bounce",-2,  "movez")
			add(i, 1, "pop", -0.5,  "tiny")
			add(i, 1, "pop", -0.25,  "tinyx")
			--add(i, 1, "pop", -0.2,  "flip")
		end
		
		
		for i = 32, 96-2,2 do
			add(i, 1, "bounce",-10,  "rotatez")
			
			add(i+1, 1, "bounce",10,  "rotatez")
		end
		
		ease(63, 2, "inOutExpo",1,  "bumpyangle")
		
		ease(95, 1, "linear",0,  "bumpyangle")
		
		
		add(96, 2, "outQuint", -360,  "rotatey")
		
		ease(96, 1, "outExpo",1,  "beat")
		
		ease(96, 1, "outExpo",0.4,  "speedmod")
		set(96, 1.75, "oldwave__mult")
		ease(96, 1, "outExpo",1.0,  "oldboost")
		ease(96, 1, "outExpo",0.5,  "oldwave")
		ease(96, 1, "outExpo",-22,  "rotatex")

		set(96, 600, "sudden__offset")
		ease(96, 1, "outExpo",1,  "sudden")
		ease(127, 1.5, "inOutQuad",0,  "sudden")


		
		
		ease(126, 2, "inQuad",0,  "oldboost")
		ease(126, 2, "inQuad",0,  "oldwave")
		ease(126, 2, "inQuad",0.8,  "speedmod")
		ease(126, 2, "inQuad",0,  "rotatex")
		
		ease(126, 2, "inQuad",0.5,  "drunk")
		
		
		
		for i = 128 , 156-1 do
			add(i, 1, "bounce", -2, "movez")
		end
		
		for i = 128 , 156-4,4  do
			add(i+1, 1, "pop", -10, "skewx")
			add(i+3, 1, "pop", 10, "skewx")
		end
		
		ease(156, 1.5, "outElastic", 1, "invert")
		ease(156+1.5, 1.5, "outElastic", 0, "invert")
		
		
		add(158.5, 1.5, "inOutCubic", 360, "angle")
		
		
		for i = 160 , 160+32-2, 2 do
			add(i, 1, "bounce", -2, "movez--0")
			add(i, 1, "bounce", -2, "movez--1")
			
			add(i+1, 1, "bounce", -2, "movez--2")
			add(i+1, 1, "bounce", -2, "movez--3")
		end
		
		
		
		for i = 193 , 192+32-2, 2 do
			add(i, 1, "bounce", -1, "movez")
			add(i+1, 1, "bounce", -1, "movez")
			
			add(i, 1, "pop", -12, "rotatez")
			add(i+1, 1, "pop", 12, "rotatez")
		end
		
		ease(223, 1, "linear", 0, "drunk")
		
		
		ease(254, 1.5, "inOutElastic", 2, "movex","bf")
		ease(254, 1.5, "inOutElastic", -2, "movex","dad")
		ease(254, 1.5, "inOutElastic", 1, "centerx")
		
		
		for i = 256, 288-2,2 do
			add(i, 1, "bounce", -1, "movez","bf")
			add(i, 1, "bounce", 1, "movez","dad")
			
			add(i+1, 1, "bounce", 1, "movez","bf")
			add(i+1, 1, "bounce", -1, "movez","dad")
		end
		
		
		for i = 256, 288-2,2 do
			add(i, 1, "pop", 10, "rotatex")
			add(i+1, 1, "pop", 10, "rotatex")
			
			add(i, 1, "pop", -0.5, "tipsy")
			add(i+1, 1, "pop", 0.5, "tipsy")
		end
		
		add(287, 1.3, "outQuad", -360, "angle","dad")
		add(287, 1, "outQuad", 360, "angle","bf")
		
		ease(287, 1, "outQuad", 0, "movex")
		ease(287, 1, "outQuad", 0, "centerx")
		
		
		for i = 288, 288+32-1,1 do
			add(i, 1, "bell", 0.15, "center")
			add(i+1, 0.1, "pop", -0.035, "center")

			add(i, 0.5, "pop", 0.15, "scaley")
			add(i, 1, "pop",-0.12, "tiny")
		end
		
		for i = 288, 288+32-2,2 do
			add(i, 1, "pop", 10, "rotatez")
			add(i+1, 1, "pop", -10, "rotatez")
		end
		
		
		
		for i = 321, 320+32-1,1 do
			local tgt = "both"
			if i >= 348 then
				tgt = "bf"
			end
		
			add(i, 1, "bell", 0.15, "center",tgt)
			add(i+1, 0.1, "pop", -0.035, "center",tgt)

			add(i, 0.5, "pop", 0.15, "scaley",tgt)
			add(i, 1, "pop",-0.12, "tiny",tgt)
		end
		
		for i = 320, 320+32-2,2 do
			if i >= 348 then
				add(i, 1, "pop", -10, "rotatez","bf")
				add(i+1, 1, "pop", 10, "rotatez","bf")
			else
				if i > 320 then
					add(i, 1, "pop", -10, "rotatez")
				end
				add(i+1, 1, "pop", 10, "rotatez")
				
			end
		end
		
		
		add(348, 1, "pop", -0.5, "tiny", "dad")
		
		add(348.5, 1, "outElastic", -45, "rotatey", "dad")
		
		add(350, 1, "bell", 1, "square", "dad")
		
		add(351, 1, "outQuad", 90, "noteskewy", "dad")
		add(352, 1, "outQuad", 90, "noteskewy", "dad")
		ease(351, 1, "outQuad", 0, "beat")
		set(352,0,"rotatey","dad" )
		
		ease(356, 1, "outQuad", -0.5, "drunk")
		
		
		add(360, 1, "outQuint", 360/3, "angle")
		add(360+0.75, 1, "outQuint", 360/3, "angle")
		add(360+1.5, 2, "outQuint", 360/3, "angle")
		add(360, 1, "pop", -1, "tiny")
		add(360+0.75, 1, "pop", -1, "tiny")
		add(360+1.5, 2, "pop", -1, "tiny")
		
		ease(360+1.5, 7, "inOutSmoothStep", 0, "drunk")
	
	end


	
end 
