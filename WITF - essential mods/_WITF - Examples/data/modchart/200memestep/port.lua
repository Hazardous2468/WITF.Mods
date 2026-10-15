function modsTimeline()

	addHaxeLibrary("Constants", "funkin.util")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "funkin")
	runHaxeCode(
	[[
		var eh = PlayState.instance.modchartEventHandler;

		var fisheyeShader:FlxRuntimeShader;
		var newCamEffects:Array<BitmapFilter>=[];
		fisheyeShader = new FlxRuntimeShader(Assets.getText(Paths.frag("FishEyeShader")), null);
		fisheyeShader.setFloat('uFrequency', 0.0);		
		
		newCamEffects.push(new ShaderFilter(fisheyeShader));
		game.camNotes.filters=(newCamEffects);
		game.camGame.filters=(newCamEffects);
		game.camHUD.filters=(newCamEffects);


		var fisheyeModifier:CustomModifier = createCustomMod("fisheye", 0.0);
		fisheyeModifier.modPriority = -9990;
		fisheyeModifier.specialMod = true;
		fisheyeModifier.unknown = false;
		eh.addCustomMod("1", fisheyeModifier);
		fisheyeModifier.specialMathFunc = function() {
			fisheyeShader.setFloat('uFrequency', fisheyeModifier.currentValue);		
		};


		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.drawArrowPaths = false;

			var customMod:CustomModifier = createCustomMod("InvertSine", 0.0);
			customMod.strumsMod = false;
			customMod.notesMod = true;
			customMod.holdsMod = true;
			customMod.pathMod = true;
			customMod.specialMod = false;
			customMod.speedMod = false;
			customMod.unknown = false;
			
			strumLine.mods.addCustomMod(customMod);	
					
			customMod.noteMathFunc = function(noteData){
				var curPos:Float = noteData.curPos / Constants.PIXELS_PER_MS;
				noteData.x += FlxMath.fastSin(0 + (curPos*0.004))*(ModConstants.strumSize * (noteData.direction % 2 == 0 ? 1 : -1) * customMod.currentValue*0.5);
			}
		}	


		var strumLine = PlayState.instance.playerStrumline;
		var strumBaseX:Float = strumLine.x = (FlxG.width / 2 - strumLine.width / 2);

		var wallWalkTransition:Float = 0;
		var wallWalkMove:Float = 0;
		
		addResetEvent(function(){
			strumLine.drawFunc = null;
			strumLine.x = strumBaseX;
			strumLine.alpha = 1;
			
			wallWalkTransition = 0;
			wallWalkTransitionAlpha = 1;
			wallWalkMove = 0;
			
		});

		var howMany:Int = 2;
		var noteSize:Float = ModConstants.strumSize;
		var strumSize:Float = ModConstants.strumSize*5;
		eh.funcModEvent(strumLine.mods, 155, function() {
			strumLine.drawFunc = function():Void{
				for (i in -howMany...howMany+1){
				
					strumLine.x = strumBaseX;
					strumLine.x += strumSize*wallWalkTransition*i;	
					
					if(i==0){ //center is alpha 1
						strumLine.alpha = 1;
					}else{ //others are faded in / out
						strumLine.alpha = wallWalkTransition * wallWalkTransitionAlpha;
					}
					
					strumLine.arrowPaths.alpha=0; //fix for arrowpaths appearing
					
					strumLine.x += wallWalkMove;
					
					strumLine.draw();
				}
			}

		});
		
		eh.funcModEvent(strumLine.mods, 224, function() {
			strumLine.drawFunc = null;
			strumLine.x = strumBaseX;
			strumLine.alpha=1;
			//strumLine.arrowPaths.alpha=1;
		});


		eh.funcTweenModEvent(strumLine.mods, 156, 4, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			wallWalkTransition = v;
		}, "wallWalkTransition");


		eh.funcTweenModEvent(strumLine.mods, 192, 1, ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
			wallWalkTransition = v;
		}, "wallWalkTransition");

		eh.funcTweenModEvent(strumLine.mods, 194, 2, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			wallWalkTransition = v;
		}, "wallWalkTransition");

		eh.funcTweenModEvent(strumLine.mods, 223, 0.7, ModConstants.getEaseFromString("outQuad"), 1, 0, function(v) {
			wallWalkTransitionAlpha = v;
		}, "wallWalkTransitionAlpha");


		eh.funcTweenModEvent(strumLine.mods, 160, 192-160, ModConstants.getEaseFromString("linear"), 0, strumSize*14, function(v) {
			wallWalkMove = v % strumSize;
		}, "wallWalkMove");

		eh.funcTweenModEvent(strumLine.mods, 196, 192-160-5, ModConstants.getEaseFromString("linear"), 0, strumSize*-13, function(v) {
			wallWalkMove = FlxMath.mod(v, strumSize);
		}, "wallWalkMove");



	]])


	set(-16, 1, "alpha")
	ease(0, 16, "outExpo", 0, "alpha")

	add(117, 1, "flip(outQuad)", 0.11, "fisheye", "1")
	add(119, 1, "flip(outQuad)", 0.11, "fisheye", "1")
	add(117-16, 1, "flip(outQuad)", 0.11, "fisheye", "1")
	add(119-16, 1, "flip(outQuad)", 0.11, "fisheye", "1")

	add(136, 1, "outExpo", 0.3, "fisheye", "1")
	add(137, 1, "outExpo", -0.3, "fisheye", "1")

	add(96, 1, "pop", -0.2, "fisheye", "1")
	add(96+16, 1, "pop", -0.2, "fisheye", "1")
	add(96+32, 1, "pop", -0.2, "fisheye", "1")
	add(96+48, 1, "pop", -0.2, "fisheye", "1")

	ease(158, 2, "smootherStepInOut", -0.2, "fisheye", "1")
	ease(192, 0.5, "expoOut", 0.2, "fisheye", "1")
	ease(194, 2, "smootherStepInOut", -0.2, "fisheye", "1")

	value(224, 12, "smootherStepInOut", 0.2, 0, "fisheye", "1")


	--ease(0, 3, "sineOut", 1, "waveymod", 0.3, "speedMod", 0.8, "drunkxmod", -0.5, "drunkymod", 4, "drunkxmod:speed")

	setdefault(60, "grain")

	set(-16, 0.25, "waveyy")
	set(-16, 0.3, "speedMod")
	set(-16, 0.8, "drunk")
	set(-16, 0.75, "drunky__speed")
	set(-16, 2, "drunk__speed")
	setdefault(2, "drunk__speed")
	set(-16, -0.25, "drunky")

	set(-16, -64, "z")
	set(-16, 0.25, "drawsize")


	ease(30, 2, "quadOut", 0.87, "speedMod")
    ease(64, 4, "quadOut", 0.87, "speedMod")
    ease(64, 1, "inOutSine", 0.5, "brake")
    for i=80, 92 do
    	add(i, 1, "flip(outQuad)", -0.13, "brake")
    end

    ease(62, 4, "sineInOut", {0, "drunk", 0, "drunky", 0, "waveyy"})

     for i = 0, 3 do
        local b = 32 + i * 8
        add(b,  	1, "flip(quadOut)", 1, "scale")
        add(b + 3,  1, "flip(quadOut)", 1, "scale")
        add(b + 5,  1, "flip(quadOut)", 1, "scale")
        add(b + 6.5,  1, "flip(quadOut)", 1, "scale")

        ease(b + 2,    1, "cubeOut", 360, "angle")
        ease(b + 6,    1, "cubeOut",   0, "angle")
    end

    add(45.5,  1, "flip(quadOut)", 1, "scale")
    add(61.5,  1, "flip(quadOut)", 1, "scale")


 	for i = 0, 2 do
 		local b = 101 + i * 16
	    value(b, 2, "cubeOut",  -2, 0, "drunk")
	    value(b+2, 2, "cubeOut",  2, 0, "drunk")
	end


    add(64, 8, "impulse",{ -0.25/2, "mini", 0.5/2, "scale"})
    add(64, 4, "pop",{ -0.25/2, "mini", 0.5/2, "scale"})
    add(72, 8, "impulse",{ -0.25/2, "mini", 0.5/2, "scale"})
    add(72, 4, "pop",{ -0.25/2, "mini", 0.5/2, "scale"})

    add(80, 3, "pop",{ -0.25, "mini", 0.5, "scale"})
    add(84, 3, "pop",{ -0.25, "mini", 0.5, "scale"})
    add(88, 3, "pop",{ -0.25, "mini", 0.5, "scale"})



    for i = 138, 142 - 0.5, 0.5 do
    	add(i, 0.25, "flip(expoInOut)", 4, "invertSine")
	    add(i+0.25, 0.25, "flip(expoInOut)", -4, "invertSine")
    	add(i, 0.25, "flip(expoInOut)", -12, "x")
	    add(i+0.25, 0.25, "flip(expoInOut)", 12, "x")
	end
    for i = 154, 158 - 0.5, 0.5 do
    	add(i, 0.25, "flip(expoInOut)", 4, "invertSine")
	    add(i+0.25, 0.25, "flip(expoInOut)", -4, "invertSine")
	    add(i, 0.25, "flip(expoInOut)", -12, "x")
	    add(i+0.25, 0.25, "flip(expoInOut)", 12, "x")
	end

	ease(138, 4, "linear", 0.3, "speedMod")
    ease(144, 2, "quadOut", 1, "speedMod")


    add(142, 1, "bounce", {10, "rotatez", -0.065, "reverse", -0.1, "zoomx"})
    add(143, 1, "bounce", {-10, "rotatez", -0.065, "reverse", -0.1, "zoomx"})


	ease(136, 1, "quartOut", 1, "invertSine")
    ease(137, 1, "quartOut", 0, "invertSine")


	ease(39, 0.5, "cubeOut", 1, "invert")
    ease(39.5, 0.5, "cubeOut", 0, "invert")
    ease(47, 0.5, "cubeOut", 1, "invert")
    ease(47.5, 0.5, "cubeOut", 0, "invert")
    ease(55, 0.5, "cubeOut", 1, "invert")
    ease(55.5, 0.5, "cubeOut", 0, "invert")

    ease(78, 0.75, "cubeOut", 1, "invert")
    ease(79.5, 0.5, "cubeOut", {0.25, "flip", -0.75, "invert"})
    ease(79, 0.5, "cubeOut", {0.75, "invert", 0.75, "flip"})
    ease(80, 0.8, "cubeOut", {0, "invert", 0, "flip"})

    ease(104, 0.5, "cubeOut", 1, "invert")
    ease(104.5, 0.5, "cubeOut", 0, "invert")
    ease(133.5, 0.5, "cubeOut", 0, "invert")
    ease(133, 0.5, "cubeOut", 1, "invert")
    ease(135, 0.5, "cubeOut", 1, "invert")
    ease(135.5, 0.5, "cubeOut", 0, "invert")

    ease(149.5, 0.5, "cubeOut", 0, "invert")
    ease(149, 0.5, "cubeOut", 1, "invert")
    ease(151, 0.5, "cubeOut", 1, "invert")
    ease(151.5, 0.5, "cubeOut", 0, "invert")

    ease(133, 1, "sineInOut", -200, "x")
    ease(135, 1, "sineInOut", 0, "x")
    ease(149, 1, "sineInOut", 200, "x")
    ease(151, 1, "sineInOut", 0, "x")

    ease(133, 0.75, "outExpo", 0.5, "stealth")
    ease(133.5, 0.75, "outExpo", 0.0, "stealth")
    ease(135, 0.75, "outExpo", 0.5, "stealth")
    ease(135.5, 0.75, "outExpo", 0.0, "stealth")

    ease(149, 0.75, "outExpo", 0.5, "stealth")
    ease(149.5, 0.75, "outExpo", 0.0, "stealth")
    ease(151, 0.75, "outExpo", 0.5, "stealth")
    ease(151.5, 0.75, "outExpo", 0.0, "stealth")

  	ease(120, 1, "cubeOut", -1, "bouncex")
    ease(121, 1, "backOut", 0, "bouncex")
    ease(130, 0.5, "quartOut", -20, "bumpy")
    ease(130.5, 0.5, "quartOut", 0, "bumpy")
    ease(146, 0.5, "quartOut", -20, "bumpy")
    ease(146.5, 0.5, "quartOut", 0, "bumpy")

    add(98-0.1, 1, "inverse", 5, "drunk")
    add(98-0.1+16, 1, "inverse", 5, "drunk")
    

    
    for i = 0, 3 do
        local b = 99 + i * 16
        ease(b,        0.25, "quartOut", -0.7,  "tipsy")
        ease(b + 0.25, 0.25, "quartOut",  0.7,  "tipsy")
        ease(b + 0.5,  0.25, "quartOut", -0.72, "tipsy")
        ease(b + 0.75, 0.25, "quartOut",  0.73, "tipsy")
        ease(b + 1,    0.25, "quartOut",  0.0,  "tipsy")
    end



    add(112, 2, "quartOut", 360, "rotatey")
    add(128, 2, "quartOut", 360, "rotatey")
    add(144, 2, "quartOut", -360, "rotatey")


    add(112, 2, "pop", 0.45, "zoomx")
    add(128, 2, "pop", 0.45, "zoomx")
    add(144, 2, "pop", 0.45, "zoomx")
    add(96, 2, "pop", 0.3, "zoomx")



    add(98, 2, "bell", 6, "bumpy")





    ease(96, 0.75, "cubeOut", {-5.2, "bumpy", 1, "speedMod"})
    ease(96.75, 0.75, "linear", {0, "bumpy", 0, "waveyy"})
    ease(112.75, 0.75, "linear", {0, "bumpy", 1, "speedMod"})
    ease(112, 0.75, "cubeOut", 5, "bumpy")

    set(95, 1, "spiralholds")
    set(96.1, 0, "spiralholds")

    ease(95, 0.6, "cubeOut", {1 - 2.3, "mini", -25, "rotatez", -25, "anglez", -112, "x"})

    ease(95.75, 1.25, "cubeInOut", {0, "mini", 0, "rotatez", 0, "anglez", 0, "x"})
    ease(96, 0.5, "cubeOut", {0, "mini", 0, "rotatez", 0, "anglez", 0, "x"})

	ease(92, 4, "quadOut", 0, "brake")
	ease(95, 1, "quadOut", {0.75, "speedMod", 0, "brake"})
   	ease(96, 1.75, "cubeOut", {0, "rotatey", 1, "speedMod"})



   	ease(151.5, 1, "inOutCubic", 180, "skewy")
   	ease(152.5, 1, "inOutCubic", 360, "skewy")
   	set(154,0,"skewy")
   	set(152, 1, "reverse")
   	set(153, 0, "reverse")
   	set(152, 64, "x")
   	set(153, 0, "x")

   	ease(152, 1, "backOut", {-20, "notesrotatez", 3, "bumpy"})
    ease(153, 1, "backOut", {0, "notesrotatez", 0, "bumpy"})


    ease(132, 0.5, "cubeOut", 45, "noteskewx")
    ease(132.5, 0.5, "cubeOut", 0, "noteskewx")
    ease(132+2, 0.5, "cubeOut", -45, "noteskewx")
    ease(132.5+2, 0.5, "cubeOut", 0, "noteskewx")

    ease(132+16, 0.5, "cubeOut", -45, "noteskewx")
    ease(132.5+16, 0.5, "cubeOut", 0, "noteskewx")
    ease(132+2+16, 0.5, "cubeOut", 45, "noteskewx")
    ease(132.5+2+16, 0.5, "cubeOut", 0, "noteskewx")

    add(153, 1.5, "impulse",1, "scale")

    if songDifficulty == "hard" then
    	set(88, -360, "angle")
	    for i=88, 91 do
	    	add(i, 1.5, "outElastic", 90, "angle")
	    end
	end


    ease(88, 1, "outElastic", 28, "rotatey")
    ease(89, 1, "outElastic", -30, "rotatey")
    ease(90, 1, "outElastic", 32, "rotatey")
    ease(91, 1, "outElastic", -40, "rotatey")

    ease(126, 2, "quadInOut", 0, "rotatey")
    ease(126, 1, "sineInOut", 0.6, "speedMod")
    ease(128, 0.3, "quadOut", 1, "speedMod")


    ease(92, 3, "quadIn", 690, "rotatey")
    ease(92, 3, "quadIn", 0.5, "speedMod")


    add(110, 1, "bounce", { -0.065, "reverse", -0.1, "zoomx"})
    add(111, 1, "bounce", { -0.065, "reverse", -0.1, "zoomx"})

    ease(110, 1, "quartOut", {-7, "rotatez",-7, "angle"})
    ease(111, 1, "quartOut", {17, "rotatez",17, "angle"})
    ease(112, 1, "quartOut", {0, "rotatez",0, "angle"})




    set(122, 52, "drunk__speed")
    set(106, 52, "drunk__speed")
    set(110, 2, "drunk__speed")
    set(126, 2, "drunk__speed")
    set(95, 2, "drunk__speed")
    ease(106, 4, "linear", {-1, "mini", 1, "drunk", 0.5, "speedMod"})
    ease(122, 4, "flip(linear)", {-1, "mini", 1, "drunk", 0.5, "speedMod"})

    ease(110, 0.3, "expoOut", 0, "drunk")

    ease(110, 1, "quartOut", {-0.25, "mini", 0.7, "speedMod"})
    ease(111, 1, "quartOut", {0, "mini", 0.8, "speedMod"})


    ease(192, 0.5, "backOut", {-90, "angle", 1-2.0, "mini", 0.5 ,"scale"})
    ease(192, 1, "backOut", 1, "flip")
    ease(193, 2, "backOut", {360, "angle", 0, "mini", 0, "scale", 0, "flip"})


    for i = 160, 223 do
    	if not (i >= 192 and i < 196) then
	    	add(i, 1, "bounce", -0.05, "reverse")
	    	add(i, 1, "impulse", 0.2, "scale")
	    	if i%2 == 1 then
	    		add(i, 1, "impulse", 0.2, "scale")

	    		if i < 220 then
		    		if i%4 == 1 then
		    			add(i, 2, "impulse", 32, "rotatey")
			    	else
			    		add(i, 2, "impulse", -32, "rotatey")
			    	end
			    end

	    	end
	    end
    end

    ease(220, 0.7, "outQuart", 32, "rotatey")
    ease(221, 0.7, "outQuart", -32, "rotatey")
    ease(222, 0.7, "outQuart", 32, "rotatey")
    ease(223, 0.5, "outQuart", 0, "rotatey")
    ease(223, 0.5, "backOut", 90, "angle")

    add(223, 0.5, "outSine", 0.5, "speedmod")
    add(223, 1, "linear", 2, "speedmod")
    --add(223.5, 0.5, "inSine", -1, "speedmod")
    ease(224, 4, "inOutSine", 1, "speedmod")


    ease(224, 16, "cubeOut", {-1370, "rotatex", 5555, "angle"})
    ease(240, 1, "expoOut", 1, "alpha")

    ease(224, 0.89, "expoOut", 1, "alphanotes")




end
