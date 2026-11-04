function setUp()
	centerStrum("1") -- Making the playfield be in the middle of the screen.
	createNewPlayer(true)
	hideNotifs(true)
	--allowMobileUI(false)
end

local p1 = 1
local p2 = 3

function modsTimeline()	



	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;

		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.arrowPathFileName = "matoi/arrowPath";
		}	

		game.comboPopUps.offsets[0] = 34;
		game.comboPopUps.offsets[1] = 40;


		var reticle = createZSpr("target_reticle", 'yararara/reticle');
		reticle.screenCenter();	
		reticle.zIndex = 5000;
		reticle.camera = game.camAFT;
		reticle.scale.set(0.7,0.7);


		var reticlePositionMod:CustomModifier = createCustomMod("reticle", 0.0);
		reticlePositionMod.modPriority = -9999;
		reticlePositionMod.strumsMod = false;
		reticlePositionMod.notesMod = false;
		reticlePositionMod.holdsMod = false;
		reticlePositionMod.pathMod = false;
		reticlePositionMod.specialMod = true;
		reticlePositionMod.speedMod = false;		
		reticlePositionMod.unknown = false;		
		reticlePositionMod.notPercentage = false;	
		reticlePositionMod.createSubMod("x", 0);
		reticlePositionMod.createSubMod("y", 0);
		reticlePositionMod.createSubMod("z", 0);
		reticlePositionMod.createSubMod("angle", 0);
		reticlePositionMod.createSubMod("scale", 0.5);
		eh.addCustomMod("1", reticlePositionMod);
		reticlePositionMod.specialMathFunc = function() {
			var r = getSpr("target_reticle");
			if(r!=null){
				r.x2 = reticlePositionMod.getSubVal("x");
				r.y2 = reticlePositionMod.getSubVal("y");
				r.z2 = reticlePositionMod.getSubVal("z");
				r.angle = reticlePositionMod.getSubVal("angle");
				r.scale.x = reticlePositionMod.getSubVal("scale");
				r.scale.y = reticlePositionMod.getSubVal("scale");
			}
		};
	]])


	setdefault(sh, "reticle__y", "1")
	
	setdefault(0, "drawsize")


	-- getting rid of the dad playfield as it isn't used for anything.
	setasleep(-20, "dad", true)
	setdefault(1, "alpha", "dad")
	setdefault(112*10, "debugx", "dad")
	setdefault(1, "debugalpha", "dad")
	targetExclude("dad")

	
	setdefault(50, "grain")
	setdefault(1, "3d")
	setdefault(0.1, "arrowpathwidth")

	

	setdefault(sw*0.25, "debugx", p2)
	setdefault(sw*0.25, "x", p2)
	setdefault(sw*-0.25, "debugx", p1)
	setdefault(sw*-0.25, "x", p1)



	set(-16, 4, "tipsy", p1)
	set(-16, -4, "tipsy", p2)
	set(-16, 1, "centered")
	set(-16, 90+360, "anglex")
	set(-16, 2, "tinyy")

	set(-16, 0.25, "speed")
	ease(0, 8, "inSine", 1, "speed")

	ease(0, 10, "inOutSine", 0.42, "tipsy")
	ease(10, 6, "linear", 0, "tipsy")

	ease(0, 8, "inOutSine", 0, "centered")
	ease(0, 9, "inOutSine", 0, "anglex")
	ease(0, 8, "inOutSine", 0, "tinyy")
	

	ease(7.75, 0.25, "inQuad", 2, "beat")
	ease(21.68, 0.1, "inOutSine", 0, "beat")


	for i = 8, 21 do
		add(i, 1, "bounce", -0.1, "centered")
	end
	for i = 156, 161 do
		add(i, 1, "bounce", -0.1, "centered")
	end


	add(162, 0.75, "pop", -20, "skewy")
	add(162.75, 0.75, "pop", 20, "skewy")
	add(162.75+0.75, 0.75, "pop", -20, "skewy")

	add(22, 0.75, "bounce", -1, "drunk")
	add(22.75, 0.75, "bounce", 1, "drunk")
	add(22.75+0.75, 0.75, "bounce", -1, "drunk")




	ease(23.75, 0.25, "linear", -2, "beat")
	ease(51.6, 0.1, "inOutSine", 0, "beat")


	add(39, 0.55, "impulse", 1, "scale")
	add(39.5, 0.55, "impulse", 1, "scale")
	add(40, 1, "impulse", 1, "scale")

	ease(51, 2.5, "inOutSine", 0.5, "waveyy")
	ease(84, 4, "inOutSine", 0, "waveyy")


	set(54, sw*0.25, "reticle__x", "1")
	ease(54.4, 1, "outBack", 0, "reticle__y", "1")
	ease(83, 4, "inBack", sh, "reticle__y", "1")

	set(90, sw*-0.25, "reticle__x", "1")
	ease(90.1, 1.5, "outBack", 0, "reticle__y", "1")

	local function kaboom(when, which)
		ease(when, 1, "outExpo", 0.75, "stealth", which)
		ease(when, 1, "outExpo", 0.75, "drunk", which)
		add(when, 4, "outCubic", 360, "angle", which)
		add(when, 4, "outCubic", 0.68, "wave", which)

		ease(when, 1, "outExpo", -0.5, "flip", which)
		set(when,0.1, "tipsy__speed",which)
		ease(when, 1, "outExpo", -2, "tipsy", which)

		add(when, 4, "pop", -1, "zigzag", which)

		ease(when+3, 1, "inCubic", 0, "drunk", which)
		ease(when+3, 1, "inCubic", 0, "tipsy", which)
		ease(when+3, 1, "inCubic", 0, "flip", which)
		ease(when+3, 1, "inCubic", 0, "stealth", which)
		ease(when+3, 1, "inCubic", 0, "wave", which)
		ease(when, 4, "bounce", 0.5, "mini", which)

		add(when, 4, "bounce",33, "rotatex", which)
		add(when, 4, "bounce",33, "anglex", which)

		add(when, 2, "flip(outQuad)",0.2, "reticle__scale", "1")
	end


	set(194, sw*0.25, "reticle__x", "1")
	ease(194.5, 1.5, "outBack", 0, "reticle__y", "1")

	for lp=0, 1 do
		lp = lp*(196-56)
		for i=56, 80-4,8 do
			i=i + lp
			kaboom(i, p2)
			kaboom(i+4, p1)

			add(i, 4, "pop", -0.2, "mini", p1)
			add(i+4, 4, "pop", -0.2, "mini", p2)

			add(i, 4, "bounce",15, "rotatex", p1)
			add(i, 4, "bounce",15, "anglex", p1)
			add(i+4, 4, "bounce",15, "rotatex", p2)
			add(i+4, 4, "bounce",15, "anglex", p2)

			ease(i+1, 2, "inOutSine", sw*-0.25, "reticle__x", "1")
			ease(i+1+4, 2, "inOutSine", sw*0.25, "reticle__x", "1")

		end
	end
	add(80, 4, "pop", -0.2, "mini", p1)
	add(220, 4, "pop", -0.2, "mini", p1)
	kaboom(80, p2)
	kaboom(220, p2)

	ease(221, 4, "inSine", -sh, "reticle__y", "1")

	for lp=0, 1 do
		for i=92, 120, 2 do
			i = i + (lp*(268-92))
			for k=0, 1 do
				add(i+k, 1, "impulse", 1, "scale")
			end

			if i%4==0 then
				ease(i+1, 2, "flip(inQuad)",-1, "tornado", p1)

				add(i+1, 1, "flip(outQuad)",0.2, "reticle__scale", "1")
				ease(i, 1, "outQuart",sw*-0.25, "reticle__x", "1")
				add(i+1, 1, "impulse", {-40, "rotatex", -40, "anglex"}, p1)
				add(i+1, 1.2, "impulse", {-6, "bumpyz"}, p1)
				add(i+1, 1.5, "impulse", {0.5, "stealth"}, p1)
				add(i+1, 1, "impulse", 1.5, "scale", p1)
				add(i+1, 2, "outExpo", -360, "angle", p1)
				add(i+1, 2, "outSine", -360, "angle", p1)
				ease(i+1, 1, "outExpo", 1, "flip", p1)
				ease(i+2, 1, "outExpo", 0, "flip", p1)

				add(i+1, 2, "pop", -0.5, "brake", p1)

				if i~=92 then
					add(i, 1, "pop", -7, "reticle__angle", "1")
				end
			else
				ease(i+1, 2, "flip(inQuad)",-1, "tornado", p2)
				add(i+3-2, 1, "flip(outQuad)",0.2, "reticle__scale", "1")
				ease(i, 1, "outQuart",sw*0.25, "reticle__x", "1")
				add(i+1+2-2, 1, "impulse", {-40, "rotatex", -40, "anglex"}, p2)
				add(i+1+2-2, 1.2, "impulse", {-6, "bumpyz"}, p2)
				add(i+1+2-2, 1.5, "impulse", {0.5, "stealth"}, p2)
				add(i+1+2-2, 1, "impulse", 1.5, "scale", p2)
				add(i+1+2-2, 2, "outExpo", 360, "angle", p2)
				add(i+1+2-2, 2, "outSine", 360, "angle", p2)
				ease(i+3-2, 1, "outExpo", 1, "flip", p2)
				ease(i+4-2, 1, "outExpo", 0, "flip", p2)

				add(i+1, 2, "pop", -0.5, "brake", p2)

				add(i, 1, "pop", 7, "reticle__angle", "1")
			end
			
		end
	end
	ease(122, 1, "inOutSine", 0, "reticle__x", "1")

	--ease(122, 1, "inOutSine", 1, "flip", p1)
	--ease(123, 1, "inOutBack", 0, "flip", p1)
	ease(122.75, 1, "outExpo", 1, "flip", p2)
	ease(122.75+0.75, 1, "outExpo", 1, "flip", p1)

	ease(124, 1, "outExpo", 0, "flip")
	add(124, 1, "outCubic", -360, "rotatey")


	ease(298.75, 1, "outExpo", 1, "flip", p2)
	ease(298.75+0.75, 1, "outExpo", 1, "flip", p1)


	for i=124, 154-2, 2 do
		if i%4>=2 then
			add(i+1, 1, "flip(outQuad)",0.2, "reticle__scale", "1")
			ease(i, 1, "outQuart",sw*-0.25, "reticle__x", "1")
			add(i, 1, "pop", -7, "reticle__angle", "1")
		else
			add(i+3-2, 1, "flip(outQuad)",0.2, "reticle__scale", "1")
			ease(i, 1, "outQuart",sw*0.25, "reticle__x", "1")
			add(i, 1, "pop", 7, "reticle__angle", "1")
		end
		
	end

	ease(298, 2, "inBack",sh, "reticle__y", "1")
	add(298, 2.5, "tap",-3, "reticle__angle", "1")

	ease(54.5, .5, "outExpo", 1, "invert")
	ease(55, .5, "outExpo", 0, "invert")
	ease(195, .5, "outExpo", 1, "invert")
	ease(195.5, .5, "outExpo", 0, "invert")



	ease(153.5, 3, "inBack",sh, "reticle__y", "1")
	add(154, 3, "tap",7, "reticle__angle", "1")


	ease(156, 1, "inOutSine", {0, "sudden",0, "hidden"})
	ease(122, 1, "inOutSine", {1, "sudden",1, "hidden"})
	set(122, 675, "sudden__start")
	set(122, 595, "sudden__end")
	set(122, -15, "hidden__start")
	set(122, -100, "hidden__end")

	ease(231, 1, "inOutSine", {1, "sudden",1, "hidden"})
	set(231, 675, "sudden__start")
	set(231, 595, "sudden__end")
	set(231, -15, "hidden__start")
	set(231, -100, "hidden__end")


	set(234, 0, "reticle__x", "1")
	ease(234.1, 1.5, "outBack", 0, "reticle__y", "1")

	for i=240, 264, 2 do
		if i%4==0 then
			add(i+1, 1, "flip(outQuad)",0.2, "reticle__scale", "1")
			ease(i, 1, "outQuart",sw*-0.25, "reticle__x", "1")
			add(i, 1, "pop", -7, "reticle__angle", "1")
		else
			add(i+3-2, 1, "flip(outQuad)",0.2, "reticle__scale", "1")
			ease(i, 1, "outQuart",sw*0.25, "reticle__x", "1")
			add(i, 1, "pop", 7, "reticle__angle", "1")
		end
		
	end

	ease(268, 1, "outQuart",sw*-0.25, "reticle__x", "1")
	ease(266, 2, "inOutCubic",sw*0.25, "reticle__x", "1")



	ease(268, 298-268, "linear",-300, "sudden__offset")
	add(268, 296-268, "linear",-100, "reticle__y","1")





	ease(163, 1, "inOutQuart",1, "beat")
	ease(191, 1, "inOutQuart",0, "beat")
	ease(163, 1, "inOutQuart",1, "wave")
	set(1, -100, "zigzagz__priority")
	resort(1)
	ease(163, 1, "inOutQuart",2, "zigzagz")
	ease(192, 4, "inOutQuart",0, "zigzagz")


	ease(162, 2, "inOutQuart",0, "x", p1)
	ease(162, 2, "inOutQuart",sw, "x", p2)

	add(167, 2, "tap",{23, "rotatez",23, "angle"}, p1)

	ease(167, 2, "inOutQuart",strumSize*2, "x", p2)
	ease(167, 2, "inOutQuart",sw*-1, "x", p1)
	set(166, 180, "rotatex", p2)

	ease(171, 2, "inOutQuart",strumSize*-2, "x", p1)
	ease(171, 2, "inOutQuart",strumSize*2, "x", p2)
	add(171, 2, "pop",{20, "rotatez",20, "angle"}, p1)
	add(186, 2, "pop",{-20, "rotatez",-20, "angle"}, p2)

	ease(176, 1, "linear", (sw*0.5) - (strumSize*3), "x", p1)
	ease(176, 1, "linear", (sw*-0.5) + (strumSize*3), "x", p2)
	ease(176+1.5, 1, "linear", (sw*0.5) - (strumSize*3), "x", p2)
	ease(176+1.5, 1, "linear", (sw*-0.5) + (strumSize*3), "x", p1)


	set(180, 180, "rotatex", p1)
	set(186, 0, "rotatex", p2)

	ease(178.5, 2.25, "inOutQuart",sw*-1, "x", p1)
	add(178.5, 2, "tap",{-18, "rotatez",-18, "angle"}, p1)


	add(183, 2, "tap",{18, "rotatez",-18, "angle"}, p2)
	ease(183, 2, "inOutQuart",strumSize*-2, "x", p1)
	ease(183, 2, "inOutQuart",sw*1, "x", p2)
	ease(186, 2, "inOutQuart",strumSize*-2, "x", p1)
	ease(186, 2, "inOutQuart",strumSize*2, "x", p2)

	ease(192, 1, "linear", (sw*0.5) - (strumSize*3), "x", p1)
	ease(192, 1, "linear", (sw*-0.5) + (strumSize*3), "x", p2)

	ease(193.5, 1, "linear", sw*-0.25, "x", p1)
	ease(193.5, 1, "linear", sw*0.25, "x", p2)

	add(194.75, 1.4, "inOutBack", -180, "rotatex", p1)

	ease(195, 1, "inOutQuad", 0, "wave")

	for lp=0, 1 do
		lp = (lp * (192-176))
		for r=0, 1 do
			for i =  176, 177-0.25, 0.25 do
				i = i + (r*1.5) + lp
				add(i, 0.25, "impulse",0.73, "scale")
			end
		end
	end

	add(177, 1, "outBack", 180, "rotatex")
	add(177+1.5, 1, "outBack", 180, "rotatex")

	add(193, 1, "outBack", 180, "rotatex")
	add(193+1.5, 1, "outBack", 180, "rotatex")

	add(177, 1, "impulse", 1, "scale")
	add(177+1.5, 1, "impulse", 1, "scale")

	add(193, 1, "impulse", 1, "scale")
	add(193+1.5, 1, "impulse", 1, "scale")


	for i =  188, 191 do
		add(i, 1, "impulse",1, "scale")
	end


 	--ending funny 

	ease(299.5, 1, "outCubic", 1, "alpha")

	reset(301)
	value(301, 308-301, "inCubic", 0.0, 1, "centered")
	value(301, 308-301, "inQuad", 0.15, 0.8, "speed")
	set(301, 1, "alpha")
	set(301, 1, "invert")

	set(301, 1, "hidden")
	set(301, -94, "hidden__start")
	set(301, -258, "hidden__end")


	set(301, 0.7, "beat")
	set(301, 1, "beat__altCurPos")
	set(301, 2, "beat__mult")
	set(301, 4, "beat__speed")
	set(301, 0.5, "beat__accel")
	set(301, 1, "beat__total")
	
	set(301, 1, "drawsize")
	--set(301, 0.15, "speed")
	set(308, 0.0, "beat")

	set(301, -90, "angle--0")
	set(301, 90, "angle--1")
	set(301, 90, "angle--2")
	set(301, -90, "angle--3")

	ease(302, 2, "inOutQuad", 0, "alpha")

	ease(306, 2, "inExpo", 0, "invert")
	for c=0, 3 do
		ease(306, 2, "inExpo", 0, "angle--"..c)
	end

	add(308, 2, "flip(outCubic)", 2, "scale")


	add(308, 2.5, "impulse", {-50, "rotatex", -50, "anglex"})
	ease(313, 1, "inCubic", {4, "centered"})

	local ang = 45
	add(309, 1.5, "bounce", { ang, "anglex"})
	local ang = -40
	add(309+1.5, 1.5, "bounce", { ang, "anglex"})
	local ang = 30
	add(309+3, 1.5, "bounce", { ang, "anglex"})
	local ang = -39
	add(309+4.5, 1.5, "bounce", {ang, "anglex"})

	add(311, 3, "inCubic", {25, "rotatex"})

	









	-- Extra flavour

	set(233, 0, "angle")
	set(233, 0, "rotatex")

	--add(207,5, "inOutSine", 360, "angley")
	add(207,5, "inOutSine", 360, "rotatey")
	add(67,5, "inOutSine", -360, "rotatey")

	for i=221, 228 do
		add(i+0.5, 1, "inOutSine", -180, "angley")
	end
	add(230, 1, "bounce", -64, "x")
	add(230, 1, "bounce", -1, "cubicx")
	add(231, 1.2, "bounce", 106, "x")
	add(231, 1.2, "bounce", 2, "cubicx")

	local b = getNoteBeats(230.75,231.25,"bf")
	for i, v in ipairs(b) do
		ease(v[1]-2, 2, "outSmoothStep", 2, "longholds--"..v[2])
		ease(v[1]+1, 1, "linear", 0, "longholds--"..v[2])
	end




	add(10, 0.75, "pop", {0.7, "drunk",22, "angley"})
	add(10+0.75, 0.75, "pop", {-0.7, "drunk",-26, "angley"})
	add(10+0.75+0.75, 0.75, "pop", {0.7, "drunk",31, "angley"})

	add(14, 0.75, "pop", {10, "skewy"})
	add(14.75, 0.75, "pop", {-14, "skewy"})
	add(14.75+0.75, 0.75, "pop", {20, "skewy",-0.5, "waveyy",24, "angle"})


	add(18, 0.75, "pop", {0.7, "drunk",27, "anglex"})
	add(18+0.75, 0.75, "pop", {-0.75, "drunk",-33, "anglex"})
	add(18+0.75+0.75, 0.75, "pop", {0.8, "drunk",37, "anglex"})

	add(158, 0.75, "pop", {0.7, "drunk",27, "anglex"})
	add(158+0.75, 0.75, "pop", {-0.75, "drunk",-33, "anglex"})
	add(158+0.75+0.75, 0.75, "pop", {0.8, "drunk",37, "anglex"})




	local function miniBounceThing(when)
		add(when, 0.5, "bounce", {-0.1, "centered"})
		add(when+0.5, 0.5, "pop", {0.1, "centered"})
	end
	miniBounceThing(27.5)
	miniBounceThing(31.5)
	miniBounceThing(43.5)
	miniBounceThing(47.5)

	ease(35, 2, "inOutQuad", {1, "twirl",-1, "drunk"})
	ease(40, 1.5, "outCubic", {0, "twirl",0, "drunk"})

end



