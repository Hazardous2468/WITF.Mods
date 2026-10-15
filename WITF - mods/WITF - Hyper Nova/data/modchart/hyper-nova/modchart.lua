local drivenDropNova = true

function setUp()
	centerPlayer("")
	centerOpponent("")
	createNewPlayer(true)
	--hideNotifs(true)
end



function modsTimeline()

	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	runHaxeCode(
	[[
		for (strumLine in PlayState.instance.allStrumLines)
		{
			strumLine.arrowPathFileName = "hyper-nova/arrowPath";

		}
	
	
	
		var target1 = PlayState.instance.playerStrumline.mods;

		
		
		var infinityWallShader = new FlxRuntimeShader(Assets.getText(Paths.frag("hyper-nova-wall")), null);
		addUpdate(function(elapsed){
			infinityWallShader.setFloat('time', Conductor.instance.songPosition/1000);
		});	
		
		addResetEvent(function(){
			infinityWallShader.setFloat('anglewave', 0.0);
			infinityWallShader.setFloat('edgeDistortIntensity', -0.64);
			infinityWallShader.setFloat('redactionSystemTransitionThing', 0.5);
			infinityWallShader.setBool('newFisheye', true);
			infinityWallShader.setBool('haz_active', false);
			infinityWallShader.setBool('edgeDistort', true);
		});
		
		
		eh.funcTweenModEvent(target1, 542, 3,  ModConstants.getEaseFromString("inOutSine"), 0 , 10.0, function(v) {
			infinityWallShader.setFloat('anglewave', v);
		}, "infinitywall-anglewave");
		
		eh.funcTweenModEvent(target1, 607, 3,  ModConstants.getEaseFromString("inOutSine"), 10 , 12.0, function(v) {
			infinityWallShader.setFloat('anglewave', v);
		}, "infinitywall-anglewave");
		
		eh.funcTweenModEvent(target1, 668, 4,  ModConstants.getEaseFromString("inOutSine"), 12 , 0.0, function(v) {
			infinityWallShader.setFloat('anglewave', v);
		}, "infinitywall-anglewave");
		
		
		
		eh.funcTweenModEvent(target1, 668, 2,  ModConstants.getEaseFromString("linear"), -0.64 , -0.8, function(v) {
			infinityWallShader.setFloat('edgeDistortIntensity', v);
		}, "infinitywall-edgedistort");
		
		
		eh.funcTweenModEvent(target1, 671, 1,  ModConstants.getEaseFromString("outSine"), -0.8 , 0.0, function(v) {
			infinityWallShader.setFloat('edgeDistortIntensity', v);
		}, "infinitywall-edgedistort");
		
		eh.funcTweenModEvent(target1, 672, 1,  ModConstants.getEaseFromString("outCubic"), 0.0 , -0.6, function(v) {
			infinityWallShader.setFloat('edgeDistortIntensity', v);
		}, "infinitywall-edgedistort");
		
		

		
		eh.funcTweenModEvent(target1, 672, 31,  ModConstants.getEaseFromString("linear"), 0, Preferences.downscroll ? 4 : -4, function(v) {
			infinityWallShader.setFloat('iTimeY', v);
		}, "infinitywall-timmyyy");
		
		eh.funcTweenModEvent(target1, 672+32, 32,  ModConstants.getEaseFromString("linear"), Preferences.downscroll ? 4 : -4, 0, function(v) {
			infinityWallShader.setFloat('iTimeY', v);
		}, "infinitywall-timmyyy");
		
		addResetEvent(function(){
			infinityWallShader.setFloat('iTimeY', 0);
		});
		
		
		var camEffects_Empty:Array<BitmapFilter>=[];
		
		
		var outlineHelpShader = new FlxRuntimeShader(Assets.getText(Paths.frag("hyper-nova-outline")), null);
		
		addResetEvent(function(){
			outlineHelpShader.setBool('haz_active', false);
		});
		
		
		
		var camEffects_WallDrop:Array<BitmapFilter>=[];
		camEffects_WallDrop.push(new ShaderFilter(outlineHelpShader));
		camEffects_WallDrop.push(new ShaderFilter(infinityWallShader));
		
		
		game.camNotes.filters = camEffects_WallDrop;
		game.camAFT.filters = camEffects_WallDrop;
		
		//game.camNotes.setFilters(camEffects_WallDrop);
		//game.camAFT.setFilters(camEffects_WallDrop);

		
		eh.funcModEvent(target1, 126.25, function() {
			infinityWallShader.setBool('haz_active', true);
			outlineHelpShader.setBool('haz_active', true);
		});
		eh.funcModEvent(target1, 320, function() {
			infinityWallShader.setBool('haz_active', false);
			outlineHelpShader.setBool('haz_active', false);
		});
		
		eh.funcModEvent(target1, 478, function() {
			infinityWallShader.setBool('haz_active', true);
			outlineHelpShader.setBool('haz_active', true);
		});
		
		eh.funcModEvent(target1, 671, function() {
			infinityWallShader.setBool('haz_active', false);
			outlineHelpShader.setBool('haz_active', false);
		});
		
		eh.funcModEvent(target1, 672, function() {
			infinityWallShader.setBool('haz_active', true);
			outlineHelpShader.setBool('haz_active', false);
		});
		
		eh.funcModEvent(target1, 736, function() {
			infinityWallShader.setBool('haz_active', false);
			outlineHelpShader.setBool('haz_active', false);
		});
		
		
		eh.funcModEvent(target1, 1022, function() {
			infinityWallShader.setBool('haz_active', true);
			outlineHelpShader.setBool('haz_active', true);
		});
		
		eh.funcModEvent(target1, 1088, function() {
			infinityWallShader.setBool('haz_active', false);
			outlineHelpShader.setBool('haz_active', false);
		});
		
		
		var infinityWallScrollX:CustomModifier = createCustomMod("infinitywall_scrollx", 0.0);
		infinityWallScrollX.modPriority = -9990;
		infinityWallScrollX.strumsMod = false;
		infinityWallScrollX.notesMod = false;
		infinityWallScrollX.unknown = false;
		infinityWallScrollX.holdsMod = false;
		infinityWallScrollX.pathMod = false;
		infinityWallScrollX.specialMod = true;
		infinityWallScrollX.speedMod = false;
		eh.addCustomMod("bf", infinityWallScrollX);
		infinityWallScrollX.specialMathFunc = function() {
			infinityWallShader.setFloat('uTimeX', infinityWallScrollX.currentValue);
		};
		
		var infinityWallScrollY:CustomModifier = createCustomMod("infinitywall_scrolly", 0.0);
		infinityWallScrollY.modPriority = -9991;
		infinityWallScrollY.strumsMod = false;
		infinityWallScrollY.notesMod = false;
		infinityWallScrollY.unknown = false;
		infinityWallScrollY.holdsMod = false;
		infinityWallScrollY.pathMod = false;
		infinityWallScrollY.specialMod = true;
		infinityWallScrollY.speedMod = false;
		eh.addCustomMod("bf", infinityWallScrollY);
		infinityWallScrollY.specialMathFunc = function() {
		
			var yyy:Float = 1;
			if(!Preferences.downscroll){
				yyy = -1;
			}
		
			infinityWallShader.setFloat('uTimeY', infinityWallScrollY.currentValue * yyy);
		};
		
		
		var infinityWallScale:CustomModifier = createCustomMod("infinitywall_scale", 0.0);
		infinityWallScale.modPriority = -9991;
		infinityWallScale.strumsMod = false;
		infinityWallScale.notesMod = false;
		infinityWallScale.holdsMod = false;
		infinityWallScale.unknown = false;
		infinityWallScale.pathMod = false;
		infinityWallScale.specialMod = true;
		infinityWallScale.speedMod = false;
		eh.addCustomMod("bf", infinityWallScale);
		infinityWallScale.specialMathFunc = function() {
			infinityWallShader.setFloat('scaleX', 0.6+infinityWallScale.currentValue);
			infinityWallShader.setFloat('scaleY', 0.6+infinityWallScale.currentValue);
		};
		
		
		

	]])

	
	setdefault(0.5, "drawsize")
	set(102, 1.5, "drawsize","bf")
	set(126, 0.5, "drawsize","bf")
	
	set(320.01, 0.75, "drawsize")
	set(736.01, 0.75, "drawsize")
	set(384.01, 1, "drawsize")
	set(800.01, 1, "drawsize")
	set(478.182, 0.5, "drawsize")
	
	set(894, 0.785, "drawsize")
	
	set(1024, 0.5, "drawsize")
	
	add(671, 1, "pop", -1, "tiny")

	
	add(672, 31, "linear", 1, "infinitywall_scrolly","1")
	ease(672, 1, "outBack", -0.65, "infinitywall_scale","1")
	set(671,0,"infinitywall_scrollx" ,"1")
	set(671,0.25,"infinitywall_scrolly" ,"1")
	set(671, -1 ,"infinitywall_scale" ,"1")
	add(704, 32, "linear", -1, "infinitywall_scrolly","1")
	
	add(704, 32, "linear", -1.1, "infinitywall_scrollx","1")
	--add(733.5, 2.5, "inQuad", -0.75, "infinitywall_scrollx","1")
	
	add(733.5, 2.5, "inQuad", 1, "infinitywall_scale","1")
	add(735, 1, "inExpo", -1.8, "infinitywall_scale","1")
	
	
	setasleep(-16, "dad", false)
	setasleep(-16, "3", true)
	--targetExclude("dad") --v0.9.1a thing for optimisation
	setasleep(32, "dad", true)
		
	setdefault(70, "arrowpathgrain")
	setdefault(0.25, "arrowpathwidth")
	setdefault(78, "grain")
	setdefault(222, "sudden__offset")
	--setdefault(0.2, "arrowpath", "bf")
	
	
	set(-8, 4, "tipsy", "dad")
	set(-8, 0.5, "orient", "dad")
	set(-8, 4, "drunk", "dad")
	set(-8, 0.5, "center", "dad")
	
	set(-8, 1, "alpha", "bf")
	
	ease(30, 2, "outCubic", 0, "alpha", "bf")
	ease(30, 2, "outCubic", 1, "alpha", "dad")
	
	
	set(-8, 0.8, "speedmod", "bf")
	
	ease(31, 1, "inOutQuad", 2, "bumpy")
	
	
	local lazyAlternator = false
	for i = 32, 32+32-4-1 do
		lazyAlternator = not lazyAlternator
		add(i, 1, "pop", lazyAlternator and 0.1 or -0.1, "movex", "bf")
		add(i, 1, "bounce", -0.1, "tiny", "bf")
	end
	
	for i = 32+32, 32+32+32-4-1 do
		lazyAlternator = not lazyAlternator
		add(i, 1, "pop", lazyAlternator and 0.1 or -0.1, "movex", "bf")
		add(i, 1, "bounce", -0.1, "tiny", "bf")
	end
	
	for i = 64, 32+32+32-4-2, 2 do
		add(i+1, 1, "pop", -0.1, "flip", "bf")
	end
	
	add(44, 1, "bounce", -20, "angle", "bf")
	add(45, 1, "bounce", 20, "angle", "bf")
	add(46, 1.5, "inOutCubic", -360, "angle", "bf")
	
	add(44+16, 1, "bounce", 20, "angle", "bf")
	add(45+16, 1, "bounce", -20, "angle", "bf")
	add(46+16, 2 , "linear", 360*4, "angle", "bf")
	
	
	
	
	add(32+44, 1, "bounce", -20, "angle", "bf")
	add(32+45, 1, "bounce", 20, "angle", "bf")
	add(32+46, 1.5, "inOutCubic", -360, "angle", "bf")
	
	add(32+44+16, 1, "bounce", 20, "angle", "bf")
	add(32+45+16, 1, "bounce", -20, "angle", "bf")
	add(32+46+16, 2 , "linear", 360*4, "angle", "bf")
	
	
	add(94, 2 , "linear", -2, "tiny", "bf")
	
	
	reset(96)
	setasleep(96, "3", false)
	set(96, 1, "alpha")
	set(96, 112*2*-1, "z")
	set(96, 0.4, "speedmod")
	ease(96, 16, "linear", 0, "alpha","bf")
	ease(96, 16, "linear", 0, "z")
	
	for i = 112, 112+6,2 do
		add(i, 1, "bounce", -45, "rotatey")
		add(i+1, 1, "bounce", 45, "rotatey")
	end
	
	add(112+8, 4, "linear", 360*-2, "rotatey")
	add(112+8, 4, "inOutSine", 112*-2, "z")
	add(112+8, 4, "inOutSine", 112*-0.5, "yd")
	
	ease(112+8, 4, "linear", 1, "speedmod")
	
	ease(126.25, 0.1, "instant", 0, "alpha", "3")
	ease(126.25, 0.1, "instant", 112*3.5, "x", "1")
	ease(126.25, 0.1, "instant", 112*3.5*-1, "x", "3")
	
	ease(126.25, 0.1, "instant", 112*3.5, "debugx", "1")
	ease(126.25, 0.1, "instant", 112*3.5*-1, "debugx", "3")
	
	ease(126.25, 0.1, "instant", 1, "sudden")
	set(126, 222, "sudden__offset")
	
	ease(127, 1, "inExpo", -1, "beat","3")
	ease(127, 1, "inExpo", 1, "beat","1")

	for i = 128, 254 do
		add(i, 1, "bounce", -0.5, "tiny")
		add(i, 1, "bounce", -0.075, "flip")
	end
	
	
	
	--DROP MOVEMENT
	for i = 128, 256-32, 32 do
		add(i, 15, "linear", -0.75, "infinitywall_scrollx","1")
		add(i, 15, "linear", -0.5, "infinitywall_scrolly","1")
		
		add(i+15, 1, "bounce", -0.3, "infinitywall_scale","1")
		
		
		add(i+16, 15, "linear", 0.75, "infinitywall_scrollx","1")
		add(i+16, 15, "linear", -0.5, "infinitywall_scrolly","1")
		
		if i+15+16 ~= 191 then
			add(i+15+16, 1, "bounce", -0.3, "infinitywall_scale","1")
		end
		
		
		if drivenDropNova then
			add(i, 16, "linear", 3.85, "infinitywall_scrolly","1")
			add(i+16, 16, "linear", 3.85, "infinitywall_scrolly","1")
		end
	end
	
	add(256, 64, "linear", -0.75*3, "infinitywall_scrollx","bf")
	add(256, 64, "linear", -0.5*4, "infinitywall_scrolly","bf")
	
	
	
	set(255, 1, "bumpyangle__mult")
	ease(255, 4, "sineInOut", 0.5, "bumpyangle","bf")
	ease(255, 4, "sineInOut", -0.5, "bumpyangle","3")
	
	
	
	
	-- DROP END
	ease(316, 4, "linear", 0, "bumpyangle")
	add(319, 1, "bounce", 0.2, "infinitywall_scale","1")
	add(319, 1, "inSine", -0.8, "infinitywall_scale","1")
	set(320, 0, "sudden")
	ease(319, 1, "outExpo", 0.0, "beat")
	set(320, 0, "beat")
	set(320, 0, "bumpyangle")
	
	ease(318, 4, "inOutExpo", 0.69, "speedmod")
	ease(320, 2, "outQuad", 0.45, "wave")
	
	ease(380, 4, "outQuad", 1, "speedmod")
	ease(380, 4, "outQuad", 0.0, "wave")
	
	
	ease(380, 3, "linear", -360*3, "angle")
	
	-- SPACE THING
	
	ease(383, 1, "outCubic", 1, "alpha")
	reset(384)
	setasleep(384, "3", true)
	set(384, 1, "3d")
	set(384, -112*2, "z")
	set(384, -112/2, "yd")
	if downScroll then
		set(384, -43, "rotatex")
		set(384, -43, "anglex")
	else
		set(384, 43, "rotatex")
		set(384, 43, "anglex")
	end
	set(384, -0.25, "flip")
	--set(384, 0.1, "arrowpath","bf")
	
	set(384, -1, "bumpy")
	set(384, 0.2, "bumpyanglex")
	
	set(384, 1, "beat")
	

	ease(443, 1, "inOutExpo", 0, "beat")
	
	
	add(396, 1, "bounce", -20, "angle", "bf")
	add(397, 1, "bounce", 20, "angle", "bf")
	add(398, 1.5, "inOutCubic", -360, "angle", "bf")
	
	add(396+16, 1, "bounce", 20, "angle", "bf")
	add(397+16, 1, "bounce", -20, "angle", "bf")
	add(398+16, 2 , "linear", 360*4, "angle", "bf")
	

	add(32+396, 1, "bounce", -20, "angle", "bf")
	add(32+397, 1, "bounce", 20, "angle", "bf")
	add(32+398, 1.5, "inOutCubic", -360, "angle", "bf")
	
	add(32+396+16, 1, "bounce", 20, "angle", "bf")
	add(32+397+16, 1, "bounce", -20, "angle", "bf")
	add(32+398+16, 2 , "linear", 360*4, "angle", "bf")
	
	
	
	for i = 384, 412-1 do
		lazyAlternator = not lazyAlternator
		add(i, 1, "bounce", -0.2, "tiny", "bf")
	end
	
	for i = 416, 416+32-4-1 do
		lazyAlternator = not lazyAlternator
		add(i, 1, "bounce", -0.2, "tiny", "bf")
	end
	
	for i = 384+32, 384+32+32-4-2, 2 do
		add(i+1, 1, "pop", -0.1, "flip", "bf")
	end
	
	
	
	ease(446, 3, "inOutQuint", 0, "bumpy")
	ease(446, 3, "inOutQuint", 0, "rotatex")
	ease(446, 3, "inOutQuint", 0, "bumpyanglex")
	ease(446, 3, "inOutQuint", 0, "anglex")
	ease(446, 3, "inOutQuint", -0.05, "flip")
	
	
	
	for i = 448, 476-4,4 do
		add(i, 2, "tap",  i % 8 == 4 and 20 or -20, "noteskewy")
	
		add(i, 2, "tap", -1.75, "tinyy")
		add(i, 2, "tap", -0.6, "tinyx")
		add(i, 2, "bell", -0.25, "tinyx")
		
		add(i+1.8, 1, "pop", 0.1, "tiny")
	end
	
	for i = 864, 890,4 do
		add(i, 2, "tap",  i % 8 == 4 and 20 or -20, "noteskewy")
	
		add(i, 2, "tap", -1.75, "tinyy")
		add(i, 2, "tap", -0.6, "tinyx")
		add(i, 2, "bell", -0.25, "tinyx")
		
		add(i+1.8, 1, "pop", 0.1, "tiny")
	end
	
	
	
	set(475, 2, "arrowpathwidth")
	set(475, 0, "arrowpathred")
	set(475, 0, "arrowpathgreen")
	set(475, 0, "arrowpathblue")
	set(475, 90, "arrowpathgrain")
	set(475, 505, "arrowpathlength")
	set(475, 0, "arrowpathbacklength")
	ease(476, 2, "linear", 0.5, "arrowpath")
	
	
	-- Drop 2 Transition
	
	value(476, 0.5, "outSine", -0.5, 0, "drunk")
	value(476.5, 0.5, "outSine", 1, 0, "drunk")
	value(476.75, 0.5, "outSine", -1, 0, "drunk")
	value(477, 0.5, "outSine", 1, 0, "drunk")
	value(477.5, 0.5, "outSine", -0.75, 0, "drunk")
	value(478, 2, "outSine", 1, 0, "drunk")
	
	
	setasleep(477.8, "3", false)
	set(477.8, 1, "alpha","3")
	set(476, 0, "3d")
	set(475, -1.2, "infinitywall_scale","1")
	set(475, 0.25, "infinitywall_scrollx","1")
	set(475, 0.25, "infinitywall_scrolly","1")
	ease(478, 2, "outExpo", -0.25, "infinitywall_scale", "1")
	
	
	ease(478, 2, "outExpo", 0.9, "speedmod")
	ease(478, 2, "outExpo", 0, "flip")
	ease(478, 2, "outExpo", 0, "alpha", "3")
	ease(478, 2, "outExpo", 112*3.5, "x", "1")
	ease(478, 2, "outExpo", 112*3.5*-1, "x", "3")
	
	ease(476, 2, "inOutSine", 112*-2, "z")
	ease(476, 2, "inOutSine", 112*-0.5, "yd")
	
	ease(478, 2, "outExpo", 112*3.5, "debugx", "1")
	ease(478, 2, "outExpo", 112*3.5*-1, "debugx", "3")
	
	-- Drop 2
	set(475, 222, "sudden__offset")
	ease(476, 2, "quadIn", 1, "sudden")
	
	
	
	set(476, 3.975*2.76, "tipsy__speed")
	
	
	local lazyAlt_2 = false
	
	local function fuck(w, speedMult, ignoreCheck)
		if ignoreCheck or not ( w % 16 >= 14 ) then
			lazyAlt_2 = not lazyAlt_2
			
			--add(w, 0.5 / speedMult, "pop", -1, "tiny")
			
			add(w, 0.5 / speedMult, "pop", -0.1, "speedmod")
			
			if lazyAlt_2 then
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--0" , "3")
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--2" , "3")
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--1" , "1")
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--3" , "1")
				
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--0" , "3")
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--2" , "3")
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--1" , "1")
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--3" , "1")
			else
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--0" , "1")
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--2" , "1")
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--1" , "3")
				add(w, 0.5 / speedMult * 2, "pop", -1, "tiny--3" , "3")
				
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--0" , "1")
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--2" , "1")
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--1" , "3")
				add(w, 0.5 / speedMult * 2, "pop", 0.01, "movez--3" , "3")
			end
			
		end
	end
	
	for i = 480, 544-8,8 do
		add(i+3.39, 1, "bell", -0.5, "tipsy")
		
		
		
		for k = i, i+4-1, 0.5 do
			fuck(k, 1, false)
		end
		fuck(i+3.5, 2, false)
		fuck(i+3.75, 2, false)
		
		for k = i, i+4-0.5, 0.5 do
			fuck(k+4, 1, false)
		end
		
	end
	
	for i = 480, 544-16, 16 do
		for k = i+14, i+15-0.125, 0.125 do
			fuck(k, 4, true)
		end
	end
	ease(543, 0.2, "outExpo", -1, "square", "3")
	ease(543, 0.2, "outExpo", 1, "square", "1")
	ease(544, 0.2, "outExpo", 0, "square")
	for k = 543, 544-(0.125/2), 0.125/2 do
		fuck(k, 8, true)
	end
	
	for i = 480, 544-32, 32 do
		add(i, 15, "linear", -0.75, "infinitywall_scrollx","bf")
		add(i, 15, "linear", -0.5, "infinitywall_scrolly","bf")
		
		
		
		add(i+16, 15, "linear", 0.75, "infinitywall_scrollx","bf")
		add(i+16, 15, "linear", -0.5, "infinitywall_scrolly","bf")
		
		
		if drivenDropNova then
			add(i, 16, "linear", 3.3, "infinitywall_scrolly","bf")
			add(i+16, 16, "linear", 3.3, "infinitywall_scrolly","bf")
		end
	end
	
	
	
	
	
	
	-- DON'T BLINK
	ease(544, 2, "outExpo", 0.5, "bumpyangle", "3")
	ease(544, 2, "outExpo", -0.5, "bumpyangle", "bf")
	ease(544, 2, "outExpo", 0.5, "bumpyx", "3")
	ease(544, 2, "outExpo", -0.5, "bumpyx", "bf")
	
	for i = 544, 544+64-8, 8 do
		add(i,6, "pop", 0.5, "stealth")
		add(i,6, "pop", 0.5, "strumstealth")
	end
	
	for i = 544, 606-1 do
		add(i, 1, "pop", -0.3, "tiny")
		add(i, 1, "pop", -0.02, "flip")
	end
	
	
	add(544, 62, "linear", -0.75*3, "infinitywall_scrollx","bf")
	add(544, 62, "linear", -0.5*4, "infinitywall_scrolly","bf")
	
	if drivenDropNova then
		add(544, 62, "linear", 3.3*4, "infinitywall_scrolly","bf")
	end
	
	
	add(606, 0.5, "pop", 1, "drunk")
	add(606.5, 0.5, "pop", -1, "drunk")
	add(607, 0.5, "pop", 1, "drunk")
	add(607.5, 0.5, "pop", -1, "drunk")
	
	local loltinyamount = 0.4
	add(606, 0.5, "outBack", -loltinyamount, "tiny")
	add(606.5, 0.5, "outBack", -loltinyamount, "tiny")
	add(607, 0.5, "outBack", -loltinyamount, "tiny")
	add(607.5, 0.5, "outBack", -loltinyamount, "tiny")
	
	add(608, 1, "outCubic", loltinyamount*4, "tiny")
	
	
	add(608, 60, "linear", -0.75*3*-1.4, "infinitywall_scrollx","bf")
	add(608, 60, "linear", -0.5*4, "infinitywall_scrolly","bf")
	
	if drivenDropNova then
		add(608, 60, "linear", 3.3*4, "infinitywall_scrolly","bf")
	end
	
	add(668, 4, "outCubic", 0.75*0.15, "infinitywall_scrollx","bf")
	add(668, 4, "outCubic", -0.5*0.15, "infinitywall_scrolly","bf")
	
	for i = 608, 668-1 do
		add(i, 0.5, "pop", -1, "tiny")
	end
	
	
	
	
	ease(668, 4, "outCubic", 0.0, "bumpyangle")
	ease(668, 4, "outCubic", 0.0, "bumpyx")
	
	add(668, 4, "inOutCubic", 0.25, "infinitywall_scale","1")
	add(668, 4, "outCubic", 0.75, "infinitywall_scale","1")
	
	add(670, 1, "inExpo", -1.5, "infinitywall_scale","1")
	

	
	
	--INVIS GIMIK 2
	reset(736)
	set(736, 0, "alpha", "3")
	set(736, 112*3.5*-1, "x", "3")
	set(736, 112*3.5, "x", "1")
	set(736, 112*3.5*-1, "debugx", "3")
	set(736, 112*3.5, "debugx", "1")
	set(736, 112*-2, "z")
	set(736, 112*-0.5, "yd")
	
	set(736, 0.45, "wave")
	set(736, 0.69, "speedmod")
	
	for i = 736, 800-4, 4 do
		add(i, 2, "bounce", -0.4, "movez", "1")
		add(i+2, 2, "bounce", 0.4, "movez", "1")
	
		add(i, 2, "bounce", 0.4, "movez", "3")
		add(i+2, 2, "bounce", -0.4, "movez", "3")
	end
	
	--for the first one too cuz why not lol?
	for i = 320, 384-4, 4 do
		add(i, 2, "bounce", -0.4, "movez", "1")
		add(i+2, 2, "bounce", 0.4, "movez", "1")
	
		add(i, 2, "bounce", 0.4, "movez", "3")
		add(i+2, 2, "bounce", -0.4, "movez", "3")
	end
	
	
	
	ease(799, 1, "outCubic", 1, "alpha")
	--SPACE 2
	reset(800)
	set(800, 112*-2, "z")
	set(800, 112*-0.5, "yd")
	set(800, 1, "alpha", "3")
	set(800, 1, "3d")
	set(800, -112*2, "z")
	set(800, -112/2, "yd")
	if downScroll then
		set(800, -43, "rotatex")
		set(800, -43, "anglex")
	else
		set(800, 43, "rotatex")
		set(800, 43, "anglex")
	end
	set(800, -0.25, "flip")
	set(800, -1, "bumpy")
	set(800, 0.2, "bumpyanglex")
	
	set(800, 1, "beat")
	
	
	
	
	ease(443, 1, "inOutExpo", 0, "beat")
	
	
	add(812, 1, "bounce", -20, "angle", "bf")
	add(813, 1, "bounce", 20, "angle", "bf")
	add(814, 1.5, "inOutCubic", -360, "angle", "bf")
	
	add(812+16, 1, "bounce", 20, "angle", "bf")
	add(813+16, 1, "bounce", -20, "angle", "bf")
	add(814+16, 1, "bounce", 20, "angle", "bf")
	add(815+16, 1, "bounce", -20, "angle", "bf")

	

	add(32+812, 1, "bounce", -20, "angle", "bf")
	add(32+813, 1, "bounce", 20, "angle", "bf")
	add(32+814, 1.5, "inOutCubic", -360, "angle", "bf")
	
	add(32+812+16, 1, "bounce", 20, "angle", "bf")
	add(32+813+16, 1, "bounce", -20, "angle", "bf")
	add(32+814+16, 2 , "inOutSmoothStep", 360, "angle", "bf")
	
	
	
	for i = 800, 828-1 do
		add(i, 1, "bounce", -0.2, "tiny", "bf")
	end
	
	for i = 832, 860-1 do
		add(i, 1, "bounce", -0.2, "tiny", "bf")
	end
	
	for i = 800+32, 860-2, 2 do
		add(i+1, 1, "pop", -0.1, "flip", "bf")
	end
	
	
	
	
	
	ease(860, 4 , "inOutSine", 0, "anglex")
	ease(860, 4 , "inOutSine", 0, "rotatex")
	ease(860, 4 , "inOutSine", 0, "flip")
	ease(860, 4 , "inOutSine", 0, "bumpy")
	ease(860, 4 , "inOutSine", 0, "beat")
	ease(860, 4 , "inOutSine", 0, "bumpyanglex")
	ease(860, 4 , "inOutSine", 0.75, "speedmod")
	
	
	ease(864, 892 - 864 , "inOutSine", -0.66, "reverse","1")
	
	ease(892, 2 , "linear", 1, "alpha","1")
	
	set(890, 90, "noteskewx--3", "3")
	set(890, -90, "noteskewx--2", "3")
	set(890, 90, "noteskewx--1", "3")
	set(890, -90, "noteskewx--0", "3")
	ease(892, 4 , "outQuad", 0, "noteskewx--0","3")
	ease(892, 4 , "outQuad", 0, "noteskewx--2","3")
	ease(892, 4 , "outQuad", 0, "noteskewx--3","3")
	ease(892, 4 , "outQuad", 0, "noteskewx--1","3")
	
	
	--END DROP 1
	
	for i = 896, 1020-1, 1 do
		add(i, 1,"bounce", -0.4, "tiny")
		
		if i % 2 == 0 then
			if i % 4 == 0 then
				add(i, 1,"bounce", 45, "anglez", "3")
				add(i, 1,"bounce", -45, "anglez", "1")
			else
				add(i, 1,"bounce", -45, "anglez", "3")
				add(i, 1,"bounce", 45, "anglez", "1")
			end
		else
			add(i, 1,"pop", -0.5, "tiny")
			add(i, 1,"pop", -0.25, "tinyy")
		end
	end
	
	local dumbUpscrollFix = -1
	if downScroll then
		dumbUpscrollFix = 1
	end
	
	set(890,1,  "3d")
	set(890,-68*dumbUpscrollFix,  "anglex", "3")
	set(890,-68*dumbUpscrollFix,  "rotatex", "3")
	set(890,-1.95,  "moveyd", "3")
	set(890,-0.38,  "circz", "3")
	set(890,-0.12*dumbUpscrollFix,  "circanglex", "3")
	
	set(890,0.25,  "waveyx", "3")
	set(890,4,  "waveyx__speed", "3")
	set(890,-0.4,  "waveyy", "3")
	set(890,8,  "waveyy__speed", "3")
	
	
	--set(892, 1500, "arrowpathlength")
	--set(892, 0, "arrowpathbacklength")	
	--ease(892, 2 , "linear", 1, "arrowpath","3")
	ease(892, 2 , "linear", 0, "alpha","3")
	
	
	
	set(882, 112*2, "debugx","1")	
	set(882, 112*-2, "debugx","3")	
	
	set(892, 0.0055, "spiralx--0__mult")	
	set(892, 0.0055, "spiralx--1__mult")	
	set(892, 0.0055, "spiralx--2__mult")	
	set(892, 0.0055, "spiralx--3__mult")	
	ease(894, 2 , "linear", 2, "spiralx--0", "3")
	ease(894, 2 , "linear", -2, "spiralx--1", "3")
	ease(894, 2 , "linear", 2, "spiralx--2", "3")
	ease(894, 2 , "linear", -2, "spiralx--3", "3")
	
	ease(894, 2 , "linear", -2, "spiralx--0", "1")
	ease(894, 2 , "linear", 2, "spiralx--1", "1")
	ease(894, 2 , "linear", -2, "spiralx--2", "1")
	ease(894, 2 , "linear", 2, "spiralx--3", "1")

	
	
	
	set(950,-68*dumbUpscrollFix,  "anglex", "1")
	set(950,-68*dumbUpscrollFix,  "rotatex", "1")
	set(950,-1.95,  "moveyd", "1")
	set(950,-0.38,  "circz", "1")
	
	set(950,0,  "reverse", "1")
	set(950,-0.12*dumbUpscrollFix,  "circanglex", "1")
	
	set(950,0.25,  "waveyx", "1")
	set(950,4,  "waveyx__speed", "1")
	set(950,0.4,  "waveyy", "1")
	set(950,8,  "waveyy__speed", "1")
	
	
	add(956-0.075, 1, "pop", 45, "noteskewy")
	add(957-0.075, 1, "pop", 45, "noteskewy")
	add(958-0.075, 1, "pop", 45, "noteskewy")
	
	
	
	ease(959, 1 , "outExpo", 0.0, "alpha","1")
	
	ease(959, 1 , "outBack", -2, "movex--0","1")
	ease(959, 1 , "outBack", -1, "movex--0","3")
	
	ease(959, 1 , "outBack", -1, "movex--1","1")
	
	ease(959, 1 , "outBack", 1, "movex--2","3")
	
	ease(959, 1 , "outBack", 2, "movex--3","3")
	ease(959, 1 , "outBack", 1, "movex--3","1")
	
	
	

	ease(1020, 1 , "outQuad", 0.25, "speedmod")
	ease(1022, 2 , "outQuad", 0.75, "speedmod")
	
	ease(1020, 4 , "inOutQuint", 0, "circz")
	ease(1020, 4 , "inOutQuint", 0, "circanglex")
	ease(1020, 4 , "inOutQuint", 0, "rotatex")
	ease(1020, 4 , "inOutQuint", 0, "anglex")
	ease(1020, 4 , "inOutQuint", 0, "spiralx--0")
	ease(1020, 4 , "inOutQuint", 0, "spiralx--1")
	ease(1020, 4 , "inOutQuint", 0, "spiralx--2")
	ease(1020, 4 , "inOutQuint", 0, "spiralx--3")
	
	
	ease(1022, 1 , "outBack", 0, "movex--1")
	ease(1022, 1 , "outBack", 0, "movex--2")
	ease(1022, 1 , "outBack", 0, "movex--0")
	ease(1022, 1 , "outBack", 0, "movex--3")
	ease(1020, 3 , "inOutQuint", 0, "moveyd")
	
	set(1020, 222, "sudden__offset")
	ease(1020, 2, "quadIn", 1, "sudden")
	
	
	ease(1022, 1 , "outBack", 112*3.5*-1, "x","3")
	ease(1022, 1 , "outBack", 112*3.5, "x","1")
	ease(1022, 1 , "outBack", 112*3.5*-1, "debugx","3")
	ease(1022, 1 , "outBack", 112*3.5, "debugx","1")
	
	
	ease(1022, 1 , "outBack", 112*-2, "z")
	ease(1022, 1 , "outBack", 112*-0.5, "yd")
	
	
	ease(1022, 1 , "outBack", 0, "waveyx")
	ease(1022, 1 , "outBack", 0, "waveyy")

	
	for i = 1024, 1088-1 do
		add(i, 1, "bounce", -0.5, "tiny")
		add(i, 1, "bounce", -0.075, "flip")
	end
	
	for i = 1024, 1088-32, 32 do
		add(i, 15, "linear", -0.75, "infinitywall_scrollx","1")
		add(i, 15, "linear", -0.5, "infinitywall_scrolly","1")
		
		add(i+16, 15, "linear", 0.75, "infinitywall_scrollx","1")
		add(i+16, 15, "linear", -0.5, "infinitywall_scrolly","1")
		
		if drivenDropNova then
			add(i, 16, "linear", 3, "infinitywall_scrolly","1")
			add(i+16, 16, "linear", 3, "infinitywall_scrolly","1")
		end
		
	end
	
	add(1052, 1, "outSine", 0.15, "infinitywall_scrolly","1")
	add(1053, 1, "outSine", 0.15, "infinitywall_scrolly","1")
	add(1054, 1, "outSine", 0.15, "infinitywall_scrolly","1")
	add(1055, 1, "outSine", 0.15, "infinitywall_scrollx","1")

	
	
	add(1084, 1, "outSine", 0.15, "infinitywall_scrolly","1")
	add(1085, 1, "outSine", 0.15, "infinitywall_scrolly","1")
	add(1086, 1, "outSine", 0.15, "infinitywall_scrolly","1")
	add(1087, 1, "outSine", 0.15+0.01, "infinitywall_scrollx","1")
	add(1087, 1, "outSine", 0.15*2.3, "infinitywall_scrollx","1")
	
	
	
	add(1087, 1, "bounce", 0.4, "infinitywall_scale","1")
	add(1087, 1, "inSine", -0.8, "infinitywall_scale","1")
	
	
	
	
	--END
	reset(1088)
	add(1088, 2, "pop", -0.5, "tiny")
	
	for i = 1088, 1148-2, 2 do
		add(i, 2, "bounce", -0.1, "tiny")
	end
	
	
	set(1088, 65, "grain")
	set(1088, 0.75, "speedmod")
	ease(1088, 1, "outQuad", 0.5, "bumpyx", "1")
	ease(1088, 1, "outQuad", -0.5, "bumpyx", "3")
	
	ease(1088, 1, "outQuad", 0.1, "drunk", "3")
	ease(1088, 1, "outQuad", -0.1, "drunk", "1")
	
	ease(1088, 1, "outQuad", 0.1, "waveyy", "3")
	ease(1088, 1, "outQuad", -0.1, "waveyy", "1")
	
	
	ease(1148, 4, "outCubic", 0, "bumpyx")
	ease(1148, 4, "outCubic", 0, "waveyy")
	ease(1148, 4, "outCubic", 0, "drunk")
	
	ease(1152, 16, "linear", 6, "bumpyx", "1")
	ease(1152, 16, "linear", -6, "bumpyx", "3")
	
	ease(1152, 13, "inSine", -38, "rotatez")
	ease(1152, 13, "inSine", -38*1.5, "anglez")
	ease(1151, 12, "inSine", -112*4, "z")
	ease(1159, 2, "inOutCubic", 1, "tinyx")
	--set(1152, 1, "spiralholds")
	
	
	
	ease(1087, 1.5, "outBack", 0, "x")
end
