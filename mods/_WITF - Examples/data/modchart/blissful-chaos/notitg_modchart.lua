
function setUp()
	centerPlayer("")
	centerOpponent("")
	createNewPlayer(true)
	hideNotifs(false)
end

local tinyMultFix = 2 --WITF 1.0.0a fix


function modsTimeline()
	local r = ((math.pi/180)) --multiply a degree by 'r' to convert degrees it to radians

	setasleep(-16, "dad", true)
	targetExclude("dad")
	
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		var enableShaders:Bool = true;
		
		
		
		var newCamEffects:Array<BitmapFilter>=[];
		var newCamEffects_notes:Array<BitmapFilter>=[];
		
		var fisheyeShader:FlxRuntimeShader;

		if(enableShaders){		
			var shaderrr_nootes = new FlxRuntimeShader(Assets.getText(Paths.frag("blissful-chaos")), null);
			addUpdate(function(elapsed){
				shaderrr_nootes.setFloat('uTime', Conductor.instance.songPosition/1000);
				shaderrr_nootes.setFloat('beat', Conductor.instance.currentBeatTime);			
			});	
			
			newCamEffects_notes.push(new ShaderFilter(shaderrr_nootes));
		
			var fxMix_Min = 0.1;
			var fxMix_Max = 0.5;
			
			addResetEvent(function(){
				shaderrr_nootes.setFloat('noiseMix', 0.0);
				shaderrr_nootes.setFloat('fxMix', fxMix_Min);
				shaderrr_nootes.setFloat('sepiaMix', 0.0);
			});
		
		
		
			var shaderrr = new FlxRuntimeShader(Assets.getText(Paths.frag("blissful-chaos")), null);
			addUpdate(function(elapsed){
				shaderrr.setFloat('uTime', Conductor.instance.songPosition/1000);
				shaderrr.setFloat('beat', Conductor.instance.currentBeatTime);			
			});	
			
			newCamEffects.push(new ShaderFilter(shaderrr));
			
			addResetEvent(function(){
				shaderrr.setFloat('noiseMix', 0.0);
				shaderrr.setFloat('fxMix', fxMix_Min);
				shaderrr.setFloat('sepiaMix', 0.0);
			});
		
		
		
		
			eh.funcTweenModEvent(target1, 12, 4,  ModConstants.getEaseFromString("linear"), 0, 0.029, function(v) {
				shaderrr.setFloat('noiseMix', v);
			}, "shader_noise");
			
			eh.funcTweenModEvent(target1, 160-4, 8+8,  ModConstants.getEaseFromString("linear"), 0.029, 0, function(v) {
				shaderrr.setFloat('noiseMix', v);
			}, "shader_noise");
		
		
			eh.funcTweenModEvent(target1, 18, 4,  ModConstants.getEaseFromString("inOutSine"), fxMix_Min, fxMix_Max, function(v) {
				shaderrr.setFloat('fxMix', v);
				shaderrr_nootes.setFloat('fxMix', v);
			}, "shader_fxMix");
		
		
			eh.funcTweenModEvent(target1, 144, 1,  ModConstants.getEaseFromString("inOutSine"), fxMix_Max, fxMix_Min/2, function(v) {
				shaderrr.setFloat('fxMix', v);
				shaderrr_nootes.setFloat('fxMix', v);
			}, "shader_fxMix");
		
			eh.funcTweenModEvent(target1, 146, 4,  ModConstants.getEaseFromString("inOutSine"), 0.0, 1.0, function(v) {
				shaderrr_nootes.setFloat('sepiaMix', v);
				shaderrr.setFloat('sepiaMix', v);
			}, "shader_sepiaMix");
		
		
		
			for (i in 18...47) 
			{
				if (i % 4 == 0 )
				{	
					eh.funcTweenModEvent(target1, i+1, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
					
					eh.funcTweenModEvent(target1, i+3, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
				}			
			}
		
		
			for (i in 47...78) 
			{
				if (i % 4 == 0 )
				{	
					eh.funcTweenModEvent(target1, i+1, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
					
					eh.funcTweenModEvent(target1, i+3, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
				}			
			}
			
			for (i in 82...114) 
			{
				if (i % 4 == 0 )
				{	
					eh.funcTweenModEvent(target1, i+1, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
					
					eh.funcTweenModEvent(target1, i+3, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
				}			
			}
			
		
			for (i in 114...142) 
			{
				if (i % 4 == 0 )
				{	
					eh.funcTweenModEvent(target1, i+1, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
					
					eh.funcTweenModEvent(target1, i+3, 1,  ModConstants.getEaseFromString("pop"), fxMix_Max, fxMix_Min, function(v) {
						shaderrr.setFloat('fxMix', v);
						shaderrr_nootes.setFloat('fxMix', v);
					}, "shader_fxMix");
				}			
			}


		
		
			


		
	
		
			fisheyeShader = new FlxRuntimeShader(Assets.getText(Paths.frag("FishEyeShader")), null);
			fisheyeShader.setFloat('uFrequency', 0.0);		
			
			newCamEffects.push(new ShaderFilter(fisheyeShader));
			newCamEffects_notes.push(new ShaderFilter(fisheyeShader));
		}
		
		
		
		
		game.camNotes.filters=(newCamEffects_notes);
		game.camGame.filters=(newCamEffects);
		game.camHUD.filters=(newCamEffects);
		game.camAFT.filters=(newCamEffects);
		
		
		
		
		
		var bg0 = createSpr("bg_back", 'blissful-chaos/bg_back');
		bg0.setGraphicSize(FlxG.width, FlxG.height);
		bg0.screenCenter();	
		bg0.visible = true;
		bg0.zIndex = 45;
		
		var bg1 = createSpr("bg", 'blissful-chaos/bg');
		var scaleFactor:Float = FlxG.height / bg1.height;
		bg1.scale.set(scaleFactor,scaleFactor);
		bg1.screenCenter();	
		bg1.visible = true;
		bg1.zIndex = 50;
		
		var bgDim = createSpr("bgDim", 'cat-meme/black');
		bgDim.setGraphicSize(FlxG.width, FlxG.height);
		bgDim.screenCenter();	
		bgDim.visible = true;
		bgDim.alpha = 1;
		bgDim.zIndex = 64;
		
		eh.funcTweenModEvent(target1, 12, 4,  ModConstants.getEaseFromString("inOutQuad"), 1, 0.75, function(v) {
			getSpr("bgDim").alpha=v;
		}, "bgDim");
		
		
		
		eh.funcTweenModEvent(target1, 160-4, 8+8,  ModConstants.getEaseFromString("linear"), 0.75, 1, function(v) {
			getSpr("bgDim").alpha=v;
		}, "bgDim");
		
		
		
		addResetEvent(function(){
			getSpr("bgDim").alpha=1;
		
			PlayState.instance.comboPopUps.offsets[0] = -400;
			PlayState.instance.comboPopUps.offsets[1] = 17;
			
			game.camNotes.zoom = 0;
			game.camHUD.zoom = 0;
		});
		
		
		var zoomMod:CustomModifier = createCustomMod("camZoom", 0.0);
		zoomMod.modPriority = -9990;
		zoomMod.unknown = false;
		zoomMod.specialMod = true;
		eh.addCustomMod("bf", zoomMod);
		zoomMod.specialMathFunc = function() {
			game.camNotes.zoom = zoomMod.currentValue;
			game.camHUD.zoom = zoomMod.currentValue;
		};
		
		var fisheyeModifier:CustomModifier = createCustomMod("fisheye", 0.0);
		fisheyeModifier.modPriority = -9990;
		fisheyeModifier.specialMod = true;
		fisheyeModifier.unknown = false;
		eh.addCustomMod("bf", fisheyeModifier);
		fisheyeModifier.specialMathFunc = function() {
			if(!enableShaders) return;
			fisheyeShader.setFloat('uFrequency', fisheyeModifier.currentValue);		
		};
		

		
		
		for (strumLine in PlayState.instance.allStrumLines)
		{			
			var fakeOutMod:CustomModifier = createCustomMod("fakeout", 0.0);
			fakeOutMod.modPriority = 100;
			fakeOutMod.strumsMod = true;
			fakeOutMod.unknown = false;
			fakeOutMod.notesMod = true;
			fakeOutMod.holdsMod = true;
			fakeOutMod.pathMod = true;
			fakeOutMod.specialMod = false;
			fakeOutMod.speedMod = false;
			strumLine.mods.addCustomMod(fakeOutMod);	
			
			fakeOutMod.strumMathFunc = function(data){
				data.x += ModConstants.strumSize * (data.direction % 2 == 0 ? 1 : -1) * fakeOutMod.currentValue;
				
				
				//Can't rotate until skew is compatible with rotation!
				switch(data.direction){
					case 0:
						data.angleZ += -90 * fakeOutMod.currentValue;
					case 1:
						data.angleZ += 90 * fakeOutMod.currentValue;
					case 2:
						data.angleZ += 90 * fakeOutMod.currentValue;
					case 3:
						data.angleZ += -90 * fakeOutMod.currentValue;
				}
				
			}
			
			fakeOutMod.noteMathFunc = function(data){
				data.stealth += fakeOutMod.currentValue;
			}
		}
		
	]])
	

		
	ease(160-4, 8+8, "linear", 1, "alpha")
	
	
	math.randomseed(69) --I'm lazy lol

	setdefault(0.5, "drawdistance")
	
	setdefault(1, "alphaholdcover") --no hold covers
	
	set(-4, 0, "drawdistance")
	set(14, 0.25, "drawdistance")
	
	setdefault(1, "3d")
	setdefault(-150, "z")
	setdefault(0.2, "arrowpathwidth","1")
	
	set(-16,0,"camZoom","bf")
	ease (0, 12, "inOutSine", 1, 'camZoom',"bf")
	
	set(-16,1,"alpha")
	ease (0, 11, "outCubic", 0, 'alpha')
	
	ease(0,4 ,"linear", 1.18, "speedmod")
	
	set(-16,112*3,'debugx',"3")
	set(-16,112*-3,'debugx',"1")
	
	--set(-16,333/100,'straightholds')
	set(-16,-13/100, 'longholds')


	--set(0,50,'movex1',-50,'movex2',-150,'movex3',150,'movex0',100,'centered',-360,'rotationy')
	set(-16,0.5,'movex--1')
	set(-16,-0.5,'movex--2')
	set(-16,-1.5,'movex--3')
	set(-16,1.5,'movex--0')
	set(-16,1.0,'centered')
	set(-16,-360,'rotationy')
	set(-16,-360,'angley')
	
	set(-16,45,'grain')
	set(-16,70,'arrowpathgrain')

	
	ease(10, 8, "inOutQuad", 0, 'centered')
	ease(10, 8, "inOutQuad", -112/2, 'yd')

	
	ease(14, 0.8, "outElastic", 0, 'movex--3')
	ease(15, 0.8, "outElastic", 0, 'movex--2')
	ease(16, 0.8, "outElastic", 0, 'movex--1')
	ease(17, 0.8, "outElastic", 0, 'movex--0')
	
	
	ease (0, 14, "inSine", 0.5, 'fisheye',"bf")
	ease (14, 2, "inOutQuad", 0, 'fisheye',"bf")
	
	
	add(4,1, "pop", 100/100, 'tipsy')
	add(4,1, "pop", 100/100, 'drunk')
	add(4+4,1, "pop", 100/100, 'tipsy')
	add(4+4,1, "pop", 100/100, 'drunk')
	for i = 10, 13, 0.5 do --tbh, I don't fucking know what I'm doing here XD
		add(i,0.25, "pop", -50/100, 'drunk')
		add(i,0.25, "pop", -50/100, 'tipsy')
		add(i+0.25,0.25, "pop", 50/100, 'tipsy')
		add(i+0.25,0.25, "pop", 50/100, 'drunk')
		
		add(i,0.25, "pop", -60/100*tinyMultFix, 'tiny')
	end
	
	
	ease (5,1, "outCubic", -180, 'rotationy')
	ease (5+4,1, "outCubic", 0, 'rotationy')
	ease (10,4, "linear", 360*2, 'rotationx', "1")
	ease (10,4, "linear", 360*-2, 'rotationx', "3")
	
	ease (5,1, "outCubic", -180, 'angley')
	ease (5+4,1, "outCubic", 0, 'angley')
	ease (10,4, "linear", 360*2, 'anglex', "1")
	ease (10,4, "linear", 360*-2, 'anglex', "3")
	

	set(17.5,0,'rotationx')
	set(17.5,0,'rotationy')

	set(17.5,0,'anglex')
	set(17.5,0,'angley')
	
	
	
	
	
	--arrowpath shit
	
	for i = 18, 143.5, 0.5 do		
		add(i, 0.5, "pop", 20/100, 'arrowpath',"1")
		
		for numb = 1, 2 do
			for col = 0, 3 do
				local red  = math.random(0,1)*1.5
				local green  = math.random(0,1)*1.55
				local blue  = math.random(0,1)*1.5
				
				set(i, red, "arrowpathred--"..col, numb)
				set(i, green, "arrowpathgreen--"..col, numb)
				set(i, blue, "arrowpathblue--"..col, numb)
			end
		end
	end
	
	
	ease (16, 2, "linear", 21/100, 'tipsy')
	ease (16, 2, "linear", -21/100, 'drunk')

	set(18,64/100,'beat')
	
	
	for i = 30, 146, 32 do
		ease (i, 3.9, "linear", -0.6, 'fisheye',"bf")
		ease (i+3.9, 0.1, "linear", 0.0, 'fisheye',"bf")
		
		ease (i+15.5, 0.5, "inSine", -0.6, 'fisheye',"bf")
		ease (i+16, 4, "linear", 0.0, 'fisheye',"bf")
		
		
		ease (i, 3.9, "linear", -46/100, 'reverse')
		ease (i+3.9, 0.1, "linear", 0.0, 'reverse')
		
		ease (i+15.5, 0.5, "inSine", -42/100, 'reverse')
		ease (i+16, 4, "linear", 0.0, 'reverse')
	end
	
	
	for i = 18, 77.5, 0.5 do
		local rx = math.random(-26,26)
		local ry = math.random(-26,26)
		local rz = math.random(-11,11)
		ease (i, 0.2, "outCubic", rx, 'anglex')
		ease (i, 0.2, "outCubic", ry, 'angley')
		ease (i, 0.2, "outCubic", rz, 'anglez')
		ease (i, 0.2, "outCubic", rx, 'rotationx')
		ease (i, 0.2, "outCubic", ry, 'rotationy')
		ease (i, 0.2, "outCubic", rz, 'rotationz')
	end
	
	for i = 82, 143.5, 0.5 do
		local rx = math.random(-33,33)
		local ry = math.random(-33,33)
		local rz = math.random(-19,19)
		ease (i, 0.2, "outCubic", rx, 'anglex')
		ease (i, 0.2, "outCubic", ry, 'angley')
		ease (i, 0.2, "outCubic", rz, 'anglez')
		ease (i, 0.2, "outCubic", rx, 'rotationx')
		ease (i, 0.2, "outCubic", ry, 'rotationy')
		ease (i, 0.2, "outCubic", rz, 'rotationz')
	end

	

	for i = 18, 77.5, 0.5 do
		value(i, 0.5, "inCirc", -0.15, 0.3, "scale")
	end
	ease (79,3, "linear", 0.3, 'scale')

	for i = 82, 143.5, 0.5 do
		value(i, 0.5, "inCirc", -0.15, 0.3, "scale")
	end
	


	ease (144,1, "linear", -50/100/2*tinyMultFix, 'tiny')
	ease (145,1, "linear", 200/100/2*tinyMultFix, 'tiny')
	
	
	
	local function fuckingRepeat(i)
		--ease (i, 1.0, "pop", 87/100, 'zoom')
		add (i, 1.0, "pop", ((100-87)/100)*-1, 'camZoom',"bf")
	end
	
	local function fuckingSnare(i)
		fuckingRepeat(i+1)
		fuckingRepeat(i+3)
		
		ease (i+0.75, 0.25, "inSine", 1, 'fakeout')
		ease (i+1, 0.75, "outSine", 0, 'fakeout')
		
		ease (i+2.75, 0.25, "inSine", 1, 'fakeout')
		ease (i+3, 0.75, "outSine", 0, 'fakeout')
		
		
		
		ease (i, 1, "inCirc", -200/3*0.9, 'skewx')
		ease (i+1, 1, "outCirc", 0, 'skewx')
	
		ease (i+2, 1, "inCirc", 200/3*0.9, 'skewx')
		ease (i+3, 1, "outCirc", 0, 'skewx')
	end
	
	local function fuckingSnareFREAKOUT(i)

		--ease (i+0.75, 0.25, "inSine", 100, 'fakeout')
		--ease (i+0.75+0.5, 0.25, "linear", 0, 'fakeout')
		ease (i+1, 0.15, "outQuad", 111/3, 'skewx')
		ease (i+1, 0.15, "outQuad", -80/3, 'skewy')
		
		ease (i+1.25, 0.15, "outQuad", -111/3, 'skewx')
		ease (i+1.25, 0.15, "outQuad", 80/3, 'skewy')
		
		ease (i+1.5, 0.15, "outQuad", 0, 'skewy')
		ease (i+1.5, 0.15, "outQuad", 0, 'skewx')

		ease (i+2.5-0.25, 0.25, "inCirc", -100/3, 'skewy')
		ease (i+3-0.25, 0.25, "inCirc", 100/3, 'skewy')
		ease (i+3, 1, "inOutQuad", 0, 'skewy')
	end
	

	fuckingSnareFREAKOUT(46)
	fuckingSnareFREAKOUT(110)
	for i = 18, 47-4, 4 do
		fuckingSnare(i)
	end
	for i = 50, 74, 4 do
		fuckingSnare(i)
	end

	for i = 82, 110-4, 4 do
		fuckingSnare(i)
	end
	for i = 114, 142-4, 4 do
		fuckingSnare(i)
	end
	
	

	local function l0l(i)
		ease(i,2, "pop", 0.2, 'hidden', "3")
		
		add(i,2, "pop", -200/100, 'movex--0', "3")
		add(i,2, "pop", -200/100, 'movex--1', "3")
		add(i,2, "pop", 200/100, 'movex--2', "3")
		add(i,2, "pop", 200/100, 'movex--3', "3")
	end
	
	
	set (78, 400, 'hidden__offset')
	ease(78,4, "outBack", 80/100, 'dark', "3")
	ease(78,4, "outBack", 1, 'hidden', "3")


	l0l(85)
	l0l(85+4)
	l0l(85+8)
	l0l(85+16)
	l0l(85+20)
	l0l(85+24)
	l0l(125)
	l0l(117)
	l0l(117+4)
	l0l(133)
	l0l(133+4)
	l0l(141)
	
	add(111.5,2, "bounce", 87/100, 'hidden', "3")
	add(111.5,2, "bounce", -200/100, 'movex--0', "3")
	add(111.5,2, "bounce", -200/100, 'movex--1', "3")
	add(111.5,2, "bounce", 200/100, 'movex--2', "3")
	add(111.5,2, "bounce", 200/100, 'movex--3', "3")

	add(143,2.5, "bounce", 90/100, 'hidden', "3")
	add(143,2.5, "bounce", -200/100, 'movex--0', "3")
	add(143,2.5, "bounce", -200/100, 'movex--1', "3")
	add(143,2.5, "bounce", 200/100, 'movex--2', "3")
	add(143,2.5, "bounce", 200/100, 'movex--3', "3")

	
	
	
	
	--reverse waves
ease (85, 0.3, "outQuad", 45/100, 'reverse--1')
ease (85+0.5, 0.3, "outQuad", 0, 'reverse--1')
ease (85+4, 0.3, "outQuad", 45/100, 'reverse--1')
ease (85+0.5+4, 0.3, "outQuad", 0, 'reverse--1')
ease (85+8, 0.3, "outQuad", 45/100, 'reverse--1')
ease (85+0.5+8, 0.3, "outQuad", 0, 'reverse--1')

ease (85+16, 0.3, "outQuad", 45/100, 'reverse--2')
ease (85+0.5+16, 0.3, "outQuad", 0, 'reverse--2')
ease (85+20, 0.3, "outQuad", 45/100, 'reverse--1')
ease (85+0.5+20, 0.3, "outQuad", 0, 'reverse--1')
ease (85+24, 0.3, "outQuad", 45/100, 'reverse--2')
ease (85+0.5+24, 0.3, "outQuad", 0, 'reverse--2')

ease (117, 0.3, "outQuad", 45/100, 'reverse--2')
ease (117+0.5, 0.3, "outQuad", 0, 'reverse--2')
ease (117+4, 0.3, "outQuad", 45/100, 'reverse--1')
ease (117+0.5+4, 0.3, "outQuad", 0, 'reverse--1')
ease (117+8, 0.3, "outQuad", 45/100, 'reverse--0')
ease (117+0.5+8, 0.3, "outQuad", 0, 'reverse--0')

ease (133, 0.3, "outQuad", 45/100, 'reverse--0')
ease (133+0.5, 0.3, "outQuad", 0, 'reverse--0')
ease (133+4, 0.3, "outQuad", 45/100, 'reverse--0')
ease (133+0.5+4, 0.3, "outQuad", 0, 'reverse--0')
ease (141, 0.3, "outQuad", 45/100, 'reverse--2')
ease (141+0.5, 0.3, "outQuad", 0, 'reverse--2')


add (110, 1, "bounce", -10/100, 'reverse--3')
add (111, 2, "bounce", 35/100, 'reverse--3')
add (111 + 0.5, 2, "bounce", 35/100, 'reverse--2')
add (111 + 1.0, 2, "bounce", 35/100, 'reverse--1')
add (111 + 1.5, 2, "bounce", 35/100, 'reverse--0')
	
	
	
	
	
	
	
	value(143, 0.25, "outQuad", 200/4, 0, "skewy")
	value(143, 0.25, "outQuad", 666/4, 0, "skewx")
	
	value(143.25, 0.25, "outQuad", -200/4, 0, "skewy")
	value(143.25, 0.25, "outQuad", -666/4, 0, "skewx")
	
	value(143.5, 0.25, "outQuad", 200/4, 0, "skewy")
	value(143.5, 0.25, "outQuad", -200/4, 0, "skewx")

	
	
	
	
	
	--END
	set(146,0,'beat')
	set(146,0,'hidden',"3")
	set(146,0,'arrowpath')
	
	set(146,46,'grain')
	set(146,1.65,'drawsize')
	
	ease(144, 3, "inOutCubic", 0.5, 'flip')
	ease(144, 3, "inOutCubic", 0, 'straightholds')
	ease(144, 3, "inOutCubic", 0, 'longholds')
	ease(148, 16, "inCubic", -0.4*tinyMultFix, 'tiny')
	ease(149, 45, "inOutSine", 0, 'centered')


	
	ease(146, 0.1, "linear", 98/100, 'brake')
	ease(146, 0.1, "linear", 0.0, 'rotationx')
	ease(146, 0.1, "linear", 0.0, 'rotationy')
	ease(146, 0.1, "linear", 0.0, 'rotationz')
	ease(146, 0.1, "linear", 0.0, 'anglex')
	ease(146, 0.1, "linear", 0.0, 'angley')
	ease(146, 0.1, "linear", 0.0, 'anglez')
	
	ease(146, 0.1, "linear", 1, 'dark--0')
	ease(146, 0.1, "linear", 1, 'dark--1')
	ease(146, 0.1, "linear", 1, 'dark--2')
	
	
	ease(146, 0.1, "linear", 200/100, 'tornadoz', "1")
	ease(146, 0.1, "linear", 100/100, 'tornado', "1")
	ease(146, 0.1, "linear", 200/100, 'tornadoz', "3")
	ease(146, 0.1, "linear", -100/100, 'tornado', "3")
	
	ease(146, 0.1, "linear", -3, 'movez')
	
	ease(146, 0.1, "linear", -0.5, 'centered')

	
	set(146, -8, 'tornadoz__speed')
	set(146, 8, 'tornado__speed')
	
	ease(146, 32, "outSine", -6, 'tornadoz__speed')
	ease(146, 32, "outSine", 4, 'tornado__speed')
	
	ease(163,8, "inOutQuad", -90*r, 'confusionzoffset')
	
	
	
end







