function onCreate()
	notesBehindHUD(true)
end
local tinyMultFix = 2 --WITF 1.0.0a fix

function setUp()
	centerPlayer("")
	centerOpponent("")
	createNewPlayer(true)
end


function stageStuff()
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")

	runHaxeCode(
	[[
	var target1 = PlayState.instance.playerStrumline.mods;
		

	var bg = createSpr("bg", 'cat-meme/nya');
	bg.setGraphicSize(FlxG.width, FlxG.height);
	bg.screenCenter();
	
	var nyaHeart1 = createSpr("nyaHeart1", 'cat-meme/nyaHeart');
	nyaHeart1.screenCenter();
	nyaHeart1.angle = 12;
	nyaHeart1.setGraphicSize(Std.int(nyaHeart1.width * 0.77));
	nyaHeart1.x += 257;
	nyaHeart1.y -= 162;
	
	var nyaHeart2 = createSpr("nyaHeart2", 'cat-meme/nyaHeart');
	nyaHeart2.screenCenter();
	nyaHeart2.angle = -8;
	nyaHeart2.setGraphicSize(Std.int(nyaHeart2.width * 0.65));
	nyaHeart2.x -= 432;
	nyaHeart2.y -= 230;
	
	var nyaPlus1 = createSpr("nyaPlus1", 'cat-meme/nyaPlus');
	nyaPlus1.screenCenter();
	nyaPlus1.angle = -8;
	nyaPlus1.setGraphicSize(Std.int(nyaPlus1.width * 0.57));
	nyaPlus1.x += 431;
	nyaPlus1.y += 292;
	nyaPlus1.angularVelocity = 31;
	
	var nyaPlus2 = createSpr("nyaPlus2", 'cat-meme/nyaPlus');
	nyaPlus2.screenCenter();
	nyaPlus2.angle = -8;
	nyaPlus2.setGraphicSize(Std.int(nyaPlus2.width * 0.38));
	nyaPlus2.x -= 320;
	nyaPlus2.y += 269;
	nyaPlus2.angularVelocity = -19;
	
	
	
	var plusOffsetYMod:CustomModifier = createCustomMod("bg_nyaplus_offset_y_mod", 0.0);
	plusOffsetYMod.modPriority = -9990;
	plusOffsetYMod.unknown = false;
	plusOffsetYMod.strumsMod = false;
    plusOffsetYMod.notesMod = false;
    plusOffsetYMod.holdsMod = false;
    plusOffsetYMod.pathMod = false;
    plusOffsetYMod.specialMod = true;
    plusOffsetYMod.speedMod = false;
	eh.addCustomMod("bf", plusOffsetYMod);
	plusOffsetYMod.specialMathFunc = function() {
		var nya1 = getSpr("nyaPlus1");
		var nya2 = getSpr("nyaPlus2");
		if(nya1 != null)
			nya1.offset.y = plusOffsetYMod.currentValue;
		if(nya2 != null)
			nya2.offset.y = plusOffsetYMod.currentValue;
	};
	
	var heartOffsetYMod:CustomModifier = createCustomMod("bg_nyaheart_offset_y_mod", 0.0);
	heartOffsetYMod.modPriority = -9990;
	heartOffsetYMod.unknown = false;
	heartOffsetYMod.strumsMod = false;
    heartOffsetYMod.notesMod = false;
    heartOffsetYMod.holdsMod = false;
    heartOffsetYMod.pathMod = false;
    heartOffsetYMod.specialMod = true;
    heartOffsetYMod.speedMod = false;
	eh.addCustomMod("bf", heartOffsetYMod);
	heartOffsetYMod.specialMathFunc = function() {
		var nya1 = getSpr("nyaHeart1");
		var nya2 = getSpr("nyaHeart2");
		
		if(nya1!=null)
			nya1.offset.y = heartOffsetYMod.currentValue;
		if(nya2!=null)
			nya2.offset.y = heartOffsetYMod.currentValue;
	};
	
	//Create AFT to capture notesCameras
	var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
	notesAFT.recursive=false;
	
	//Move the original camera offscreen
	//game.camNotes.x -= 10000;
	
	//Create a scrollingSprite to render the AFT
	var bgScrolling:FlxTiledSprite = new FlxTiledSprite(null, FlxG.width, FlxG.height, true, true);
	bgScrolling.loadGraphic(notesAFT.bitmap);
	PlayState.instance.add(bgScrolling);
	bgScrolling.camera = game.camAFT;
	bgScrolling.scrollFactor.set();
	bgScrolling.screenCenter();
	PlayState.instance.customLuaSprites.set("scrollingBG", bgScrolling);
	
	addUpdate(function(elapsed){
		notesAFT.updateAFT();	
	});	
	
	
	//we don't have perframe yet so errrr, lol?
	/*
	eh.funcTweenModEvent(target1, 64, 120, FlxEase.linear, 0,1, function(v) {
		notesAFT.updateAFT();
	}, "fakePerframe");
	*/
	
	//make it only use the AFT when needed!
	eh.funcModEvent(target1, 64, function() {
		game.camAFT.visible = true;
		game.camNotes.x -= 10000;
		//game.modDebugNotif("aft active");
	}, "showAFT");
	
	
	
	var scrollingCameraMod:CustomModifier = createCustomMod("camerascroll", 0.0);
	scrollingCameraMod.modPriority = -9990;
	scrollingCameraMod.unknown = false;
	scrollingCameraMod.strumsMod = false;
    scrollingCameraMod.notesMod = false;
    scrollingCameraMod.holdsMod = false;
    scrollingCameraMod.pathMod = false;
    scrollingCameraMod.specialMod = true;
    scrollingCameraMod.speedMod = false;
	eh.addCustomMod("bf", scrollingCameraMod);
	scrollingCameraMod.specialMathFunc = function() {
		var nya = getSpr("nyaHeart1");
		if(nya!=null)
			nya.offset.y = scrollingCameraMod.currentValue;
		bgScrolling.scrollX = scrollingCameraMod.currentValue;
	};
	
	/*
	eh.funcTweenModEvent(target1, 64, 128, FlxEase.linear, 0,FlxG.width * 12, function(v) {
		bgScrolling.scrollX = v;
	}, "scrollingCamera");
	*/
	
	
	setResetEvent(function(){
		getSpr("black").alpha = 1;
		getSpr("nyaHeart1").setGraphicSize(Std.int(nyaHeart1.width * 0.77));
		getSpr("nyaHeart2").setGraphicSize(Std.int(nyaHeart2.width * 0.65));
		getSpr("nyaPlus1").setGraphicSize(Std.int(nyaPlus1.width * 0.57));
		getSpr("nyaPlus2").setGraphicSize(Std.int(nyaPlus2.width * 0.38));
		bgScrolling.scrollX = 0;
		
		game.camAFT.visible = false;
		game.camNotes.x = 0;
	});
	
	
	var blackOverlay = createSpr("black", 'cat-meme/black');
	blackOverlay.setGraphicSize(FlxG.width, FlxG.height);
	blackOverlay.camera = game.camHUD;
	blackOverlay.screenCenter();
	
	eh.funcTweenModEvent(target1, 0, 22, FlxEase.linear, 1,0, function(v) {
		blackOverlay.alpha = v;
	}, "blackOverlayFade");
	
	eh.funcTweenModEvent(target1, 23, 2, FlxEase.sineInOut, 0,0.25, function(v) {
		blackOverlay.alpha = v;
	}, "blackOverlayFade");
	
	eh.funcTweenModEvent(target1, 30, 2, FlxEase.sineInOut, 0.25, 0.0, function(v) {
		blackOverlay.alpha = v;
	}, "blackOverlayFade");
	
	eh.funcTweenModEvent(target1, 96, 2, FlxEase.sineInOut, 0.0, 1.0, function(v) {
		blackOverlay.alpha = v;
	}, "blackOverlayFade");
	
	
	for (i in 32...100){
		eh.funcTweenModEvent(target1, i, 1, ModConstants.getEaseFromString("pop"), 1, 1.1, function(v) {
			
			getSpr("nyaHeart1").setGraphicSize(Std.int(nyaHeart1.width * 0.77 * v));
			getSpr("nyaHeart2").setGraphicSize(Std.int(nyaHeart2.width * 0.65 * v));
			getSpr("nyaPlus1").setGraphicSize(Std.int(nyaPlus1.width * 0.57 * v));
			getSpr("nyaPlus2").setGraphicSize(Std.int(nyaPlus2.width * 0.38 * v));
		}, "nyaHeartBounce");
	}
	
	]])
	
	set(-16, -sh, "bg_nyaplus_offset_y_mod", 1)
	ease(30, 1, "backOut", 0, "bg_nyaplus_offset_y_mod", 1)
	set(-16, sh, "bg_nyaheart_offset_y_mod", 1)
	ease(31, 1, "backOut", 0, "bg_nyaheart_offset_y_mod", 1)
	
	ease(95.6, 2.7, "backIn", -sh, "bg_nyaplus_offset_y_mod", 1)
	ease(95.6, 2.7, "backIn", sh, "bg_nyaheart_offset_y_mod", 1)
	
	if difficulty == "easy" then
		add(64, 92-64+4, "linear", sw*1, "camerascroll", 1)
		add(64, 92-64+4, "quadInOut", sw*1, "camerascroll", 1)
	else
		add(64, 92-64+4, "linear", sw*2, "camerascroll", 1)
		add(64, 92-64+4, "quadInOut", sw*2, "camerascroll", 1)
	end
end



function modsTimeline()
	stageStuff()
	targetExclude("dad")

	--for fnf v0.6.3
	setdefault(0.27, "drawdistance")
	
	--go away dad
	setdefault(1, "alpha", "dad")
	setdefault(-222, "x", "dad")
	setdefault(1, "debugalpha", "dad")
	setasleep(0, "dad", true) --dad doesn't do anything lmao

	
	setdefault(1000, "mathcutoff")
	
	
	--set(32, 1, "cull")
	
	--set(0,180, "anglex")
	--add(0,96,"linear", 360*20, "anglex")
	
	--ngl, this kinda cute
	add(0,32-8,"linear", 360*4, "anglex")

	
	
	
	setdefault(112*3, "debugx", "1")
	setdefault(112*3*-1, "debugx", "3")
	
	setdefault(100, "3d", "1")
	setdefault(100, "3d", "3")

	set(-16, 1*tinyMultFix,"tiny")
	set(-16, 0.5,"flip")
	set(-16, 0.5, "tipsy")
	
	ease(0, 22, "sineOut", 1.5, "tipsy")
	ease(23, 2, "smoothStepInOut", 0, "tipsy")
	
	ease(0, 24, "sineOut", 0, "flip")
	ease(0, 24, "sineOut", 0, "tiny")
	
	ease(0, 24, "sineOut", 1, "beat")
	ease(23, 1, "linear", 0, "beat")
	
	for i = 28, 32-1 do
	
		ease(i, 1, "bounce", -0.2, "movey")
		ease(i, 1, "bounce", -0.2, "movey")
	end
	
	ease(30, 1, "bounce", -30, "rotatey")
	ease(30, 1, "bounce", -30, "angley")
	ease(31, 1, "bounce", 30, "rotatey")
	ease(31, 1, "bounce", 30, "angley")
	
	add(30, 1, "pop", -1*tinyMultFix, "tiny")
	add(31, 1, "pop", -1*tinyMultFix, "tiny")
	
	if difficulty ~= "easy" then
		ease(30, 1, "outExpo", 1, "invert")
		ease(31, 1, "outExpo", 0, "invert")
		ease(94, 1, "outExpo", 1, "invert")
		ease(95, 1, "outExpo", 0, "invert")
	end
	add(30, 1, "pop", -1*tinyMultFix, "tiny")
	add(31, 1, "pop", -1*tinyMultFix, "tiny")
	add(94, 1, "pop", -1*tinyMultFix, "tiny")
	add(95, 1, "pop", -1*tinyMultFix, "tiny")
	
	
	ease(31.5, 0.5, "quadInOut", -1, "beat",1)
	ease(31.5, 0.5, "quadInOut", 1, "beat",3)
	
	--PART1
	for i = 32, 64-16, 16 do
	
		for k = 0, 15 do
			if i+k < 60 then
				if (i+k) % 2 == 1 then
					add(i+k,1, "bounce", 39, "rotatey")
					add(i+k,1, "bounce", 39, "angley")
					
					add(i+k,1, "bounce", 10, "anglez")
				else
					add(i+k,1, "bounce", -39, "rotatey")
					add(i+k,1, "bounce", -39, "angley")
					
					add(i+k,1, "bounce", -10, "anglez")
				end
			
				add(i+k,1, "bounce", 0.17, "brake")
			
				add(i+k,1, "bounce", -0.125, "centered")
			end
		end
		
		if difficulty ~= "easy" then
			add(i+3.5, 3.5, "sineInOut", 360*2, "angley")
			add(8+i+3.5, 3.5, "sineInOut", -360*2, "angley")
		end
	
		ease(i+8-2,2, "quadInOut", 1, "reverse")
		if i+16-2 < 60 then
			ease(i+16-2, 2, "quadInOut", 0, "reverse")			
		end
	end
	
	--PART 2
	for i = 64, 92, 16 do
		for k = 0, 15 do
			if i+k < 60+32 then
				if (i+k) % 2 == 1 then
					add(i+k,1, "bounce", 39, "rotatey")
					add(i+k,1, "bounce", 39, "angley")
					
					add(i+k,1, "bounce", 10, "anglez")
				else
					add(i+k,1, "bounce", -39, "rotatey")
					add(i+k,1, "bounce", -39, "angley")
					
					add(i+k,1, "bounce", -10, "anglez")
				end
			
				add(i+k,1, "bounce", 0.17, "brake")
			
				add(i+k,1, "bounce", -0.125, "centered")
			end
		end
		
		if difficulty ~= "easy" then
			add(i+3.5, 3.5, "sineInOut", 360*2, "angley")
			add(8+i+3.5, 3.5, "sineInOut", -360*2, "angley")
		end
	
		ease(i+8-2,2, "quadInOut", 1, "reverse",3)
		ease(i+8-2,2, "quadInOut", 0, "reverse",1)
		
		if i+16-2 < 60+32 then
			ease(i+16-2, 2, "quadInOut", 0, "reverse",3)
			ease(i+16-2, 2, "quadInOut", 1, "reverse",1)
		end
	end
	
	
	
	
	ease(62, 2, "expoOut", {-3*112, "x", -3*112,"perspectiveoffsetx"}, "3")
	ease(62, 2, "expoOut", {3*112, "x", 3*112,"perspectiveoffsetx"}, "1")
	
	--ease(62, 2, "expoOut", -3, "movex", "3")
	--ease(62, 2, "expoOut", 3, "movex", "1")
	--ease(62, 2, "expoOut", -3*112, "rotatey__offset_x", "3")
	--ease(62, 2, "expoOut", 3*112, "rotatey__offset_x", "1")
	
	add(62, 1, "pop", -1*tinyMultFix, "tiny")
	add(63, 1, "pop", -1*tinyMultFix, "tiny")
	
	ease(63, 2, "expoOut", 0, "reverse", "3")
	
	
	add(96, 2, "pop", -1*tinyMultFix, "tiny")
	add(96, 2, "sineOut", 1*tinyMultFix, "tiny")
	
	
	

end