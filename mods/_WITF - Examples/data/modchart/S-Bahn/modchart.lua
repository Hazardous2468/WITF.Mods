function onCreate()
end
local tinyMultFix = 2 --WITF 1.0.0a fix



function setUp()
	centerOpponent("")
	centerPlayer("")
	createNewPlayer(true)
end


function stageVisuals()

	addHaxeLibrary("FlxTypedSpriteGroup", "flixel.group.FlxSpriteGroup")
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")
	
	runHaxeCode(
	[[
	var target1 = PlayState.instance.playerStrumline.mods;

	
	var bg = createSpr("bg", 'haz/bg');
	bg.setGraphicSize(FlxG.width, FlxG.height);
	bg.screenCenter();
	
	
	//Create a scrollingSprite to render the AFT
	var bgScrolling:FlxTiledSprite = new FlxTiledSprite(null, FlxG.width, FlxG.height, true, true);
	bgScrolling.loadGraphic(Paths.image('haz/binary'));
	game.add(bgScrolling);
	bgScrolling.scrollFactor.set();
	bgScrolling.screenCenter();
	bgScrolling.alpha=0.1;
	PlayState.instance.customLuaSprites.set("scrollingBG", bgScrolling);
	
	eh.funcTweenModEvent(target1, 0, 300, ModConstants.getEaseFromString("linear"), 0,FlxG.width * 12, function(v) {
		getSpr("scrollingBG").scrollY = v*-1;
	}, "hazardBinaryCode");
	
	addUpdate(function(elapsed){
		getSpr("scrollingBG").scrollX = FlxMath.fastSin(Conductor.instance.currentBeatTime/4) * 32;
	});	
	
	

	
	var particleCap:Int = 26;
	if(getVar("particles") == null){
		createSprGroup("particles");
	}else{
		var grp = getVar("particles");
		grp.forEach(function(a){grp.remove(a); a.destroy();});
	}
	
	for (i in 0...particleCap){
		var p:FlxSprite = new FlxSprite();
		p.loadGraphic(Paths.image("haz/hexagon"));
		p.screenCenter();
		p.x += i%2==0? 510 : -510;
		p.x += FlxG.random.float(-60, 60);
		
		p.y = FlxMath.remapToRange(i, 0, particleCap, -p.height, FlxG.height);
		p.y += FlxG.random.float(-20, 20);
		
		var scaleSize:Float = FlxG.random.float(0.4, 1.1);
		p.scale.x = scaleSize;
		p.scale.y = scaleSize;
		
		p.angle = FlxG.random.float(0, 180);
		p.angularVelocity = FlxG.random.float(-72, 72);
		addToSprGrp("particles",p);	
		
		p.velocity.y = FlxG.random.float(130, 175);
		
		p.velocity.x = FlxG.random.float(-8, 8);
	}
	
	addUpdate(function(elapsed){
		getVar("particles").forEach(function(p){
			//p.y += 120 * elapsed;	
			if(p.y > FlxG.height + 5){
				p.velocity.y = FlxG.random.float(145, 180);
				p.velocity.x = FlxG.random.float(-8, 8);
			
				var scaleSize:Float = FlxG.random.float(0.4, 1.1);
				p.scale.x = scaleSize;
				p.scale.y = scaleSize;
			
				var wasX:Float = p.x;
				p.screenCenter();
				p.x += wasX < FlxG.width/2 ? -510 : 510;
				p.y = -p.height - 5;
				
				p.angle = FlxG.random.float(0, 180);
				
				p.x += FlxG.random.float(-60, 60);
				p.angularVelocity = FlxG.random.float(-72, 72);
			}
		});
	});	
	
	
	
	
	
	var bgMidDark = createSpr("playfield_darken", 'haz/playfield_black');
	bgMidDark.setGraphicSize(FlxG.width, FlxG.height);
	bgMidDark.screenCenter();
	
	
	var hazard_hexagon = createSpr("haz_hexagon", 'haz/hazard_hexagon');
	hazard_hexagon.alpha=0.5;
	hazard_hexagon.angularVelocity = 60;
	hazard_hexagon.screenCenter();
	hazard_hexagon.y += 21;
	
	
	var haz_hand = createSpr("haz_hand1", 'haz/hazard_hand');
	haz_hand.alpha=0.5;
	haz_hand.screenCenter();
	haz_hand.setGraphicSize(Std.int(haz_hand.width * 0.15));
	haz_hand.x -= 110;
	haz_hand.angle = 13;
	haz_hand.y += 35;
	
	var haz_hand = createSpr("haz_hand2", 'haz/hazard_hand');
	haz_hand.alpha=0.5;
	haz_hand.screenCenter();
	haz_hand.setGraphicSize(Std.int(haz_hand.width * 0.15));
	haz_hand.x += 110;
	haz_hand.angle = 0;
	haz_hand.y += 36;
	haz_hand.flipX = true;
	
	
	var hand_l = createSpr("hand_l", 'haz/point');
	hand_l.setGraphicSize(Std.int(hand_l.width * 0.25));
	hand_l.angle = 90;
	hand_l.screenCenter();
	hand_l.x -= 300;
	hand_l.alpha = 0.9;
	hand_l.flipY = true;
	
	var hand_r = createSpr("hand_r", 'haz/point');
	hand_r.setGraphicSize(Std.int(hand_r.width * 0.25));
	hand_r.angle = 90;
	hand_r.screenCenter();
	hand_r.x += 300;
	hand_r.alpha = 0.9;
	
	hand_l.flipX = !downScroll;
	hand_r.flipX = !downScroll;
	

	
	//var hazard = createSpr("hazard", 'haz/Hazard_placeholder_v2');
	
	var hazard:FlxSprite = new FlxSprite();
	hazard.frames = Paths.getSparrowAtlas('haz/vshaz');	
	hazard.animation.addByPrefix('idle', 'Idle', 12, true);	
	hazard.animation.addByPrefix('laugh', 'Laugh', 24, false);	
	hazard.animation.play("idle");
	game.customLuaSprites.set("hazard", hazard);
	
	hazard.scrollFactor.set();
	game.add(hazard);
	hazard.setGraphicSize(Std.int(hazard.width * 0.7));
	hazard.screenCenter();
	hazard.y += 40;
	hazard.alpha = 1;
	hazard.angle = 0;
	addResetEvent(function(){
	
		
		getSpr("black").alpha = 1;
	
		getSpr("hand_flip_l_reverse").offset.y = 0;
		getSpr("hand_flip_r_reverse").offset.y = 0;
		getSpr("hand_flip_l").offset.y = 0;
		getSpr("hand_flip_r").offset.y = 0;
	
		getSpr("hand_l").offset.y=0;
		getSpr("hand_r").offset.y=0;
	
		getSpr("haz_hand1").offset.y = 0;
		getSpr("haz_hand2").offset.y = 0;
	
		getSpr("haz_hexagon").alpha=0.5;
	
		getSpr("hazard").animation.play("idle");
		
		getSpr("hazard").alpha=1;
		getSpr("hazard").screenCenter();	
		getSpr("hazard").offset.y = 0;	
		getSpr("hazard").offset.x = 0;	
		getSpr("hazard").angle=0;
		getSpr("hazard").y += 40;
		
		getSpr("hand_r").angle=90;
		getSpr("hand_l").angle=90;
	});	
	
	
	for (i in 0...36){
		if(i % 8 == 0){
			eh.funcTweenModEvent(target1, i, 4, ModConstants.getEaseFromString("sineInOut"), -10,10, function(v) {
				getSpr("hazard").offset.y=v;
			}, "hazardFloat");
			
			eh.funcTweenModEvent(target1, i+4, 4,  ModConstants.getEaseFromString("sineInOut"), 10, -10, function(v) {
				getSpr("hazard").offset.y=v;
			}, "hazardFloat");
		}
	}
	
	eh.funcModEvent(target1, 28, function() {
		//hazard.angle = -5;
		getSpr("hazard").animation.play("laugh");
		
		//offset fix
		getSpr("hazard").x -= 1;
		getSpr("hazard").y -= 9;
		
	}, "hazardAnimation");
	
	eh.funcTweenModEvent(target1, 28.5, 4, FlxEase.sineInOut, 1.0, 0.0, function(v) {
		hazard.alpha = v;
		hazard_hexagon.alpha = v/2;
	}, "hazardFade");
	
	eh.funcTweenModEvent(target1, 28.5, 4, ModConstants.getEaseFromString("backIn"), 0.0, 500.0, function(v) {
		getSpr("haz_hand1").offset.y = v;
		getSpr("haz_hand2").offset.y = v;
	}, "handsleave");
	
	
	
	var hand_flip_l = createSpr("hand_flip_l", 'haz/hand_side');
	hand_flip_l.setGraphicSize(Std.int(hand_flip_l.width * 0.25));
	hand_flip_l.angle = 0;
	hand_flip_l.screenCenter();
	hand_flip_l.x -= 300;
	hand_flip_l.y += 238;
	hand_flip_l.alpha = 0.9;
	
	var hand_flip_r = createSpr("hand_flip_r", 'haz/hand_side');
	hand_flip_r.flipX = true;
	hand_flip_r.setGraphicSize(Std.int(hand_flip_r.width * 0.25));
	hand_flip_r.angle = 0;
	hand_flip_r.screenCenter();
	hand_flip_r.x += 300;
	hand_flip_r.y += 238;
	hand_flip_r.alpha = 0.9;
	
	var hand_flip_l = createSpr("hand_flip_l_reverse", 'haz/hand_side');
	hand_flip_l.setGraphicSize(Std.int(hand_flip_l.width * 0.25));
	hand_flip_l.angle = 0;
	hand_flip_l.screenCenter();
	hand_flip_l.x -= 300;
	hand_flip_l.y -= 238;
	hand_flip_l.alpha = 0.9;
	
	var hand_flip_r = createSpr("hand_flip_r_reverse", 'haz/hand_side');
	hand_flip_r.flipX = true;
	hand_flip_r.setGraphicSize(Std.int(hand_flip_r.width * 0.25));
	hand_flip_r.angle = 0;
	hand_flip_r.screenCenter();
	hand_flip_r.x += 300;
	hand_flip_r.y -= 238;
	hand_flip_r.alpha = 0.9;
	
	hand_flip_l.flipY = true;
	hand_flip_r.flipY = true;
	
	//Wait, just set pos to strum?
	addUpdate(function(elapsed){
	
		var handRevL = getSpr("hand_flip_l_reverse");
		var handRevR = getSpr("hand_flip_r_reverse");
		var handL = getSpr("hand_flip_l");
		var handR = getSpr("hand_flip_r");
		
		var isDownscrolling:Bool = downScroll;
		
		var playerStrum0 = isDownscrolling ? ModConstants.grabStrumModTarget("3").strum.getByIndex(0) : game.playerStrumline.getByIndex(0);
		var playerStrum3 = isDownscrolling ? ModConstants.grabStrumModTarget("3").strum.getByIndex(3) : game.playerStrumline.getByIndex(3);
		var otherStrum0 = isDownscrolling ? game.playerStrumline.getByIndex(0): ModConstants.grabStrumModTarget("3").strum.getByIndex(0);
		var otherStrum3 = isDownscrolling ? game.playerStrumline.getByIndex(3): ModConstants.grabStrumModTarget("3").strum.getByIndex(3);

		
	
		var xPos:Float = playerStrum0.x - 125 - 50;
		if (playerStrum0.x + (playerStrum0.frameWidth/2) >= (FlxG.width/2)){
			xPos = playerStrum3.x - 125 - 50;
		}
		xPos -= 55;
	
		handL.x = xPos;
		handRevL.x = xPos;
		
		xPos = playerStrum3.x - 125 + 50;
		if (!(playerStrum3.x + (playerStrum3.frameWidth/2) >= (FlxG.width/2))){
			xPos = playerStrum0.x - 125 + 50;
		}
		handR.x = xPos;
		handRevR.x = xPos;		
		
		var alphaSample:Float = playerStrum0.alpha;
		handRevL.alpha = alphaSample;
		handRevR.alpha = alphaSample;
		
		
		alphaSample = otherStrum3.alpha;
		handL.alpha = alphaSample;
		handR.alpha = alphaSample;
		
	});	
	
		
	//add(250,6, "inExpo",-2, "center", "1")
	eh.funcTweenModEvent(target1, 250, 6, FlxEase.expoIn, 0.0, (FlxG.height/2)-10, function(v) {
		getSpr("hand_flip_l_reverse").offset.y = v;
		getSpr("hand_flip_r_reverse").offset.y = v;
		getSpr("hand_flip_l").offset.y = v*-1;
		getSpr("hand_flip_r").offset.y = v*-1;
	}, "strumHandsLeave");
	

	
	var blackOverlay = createSpr("black", 'haz/black');
	blackOverlay.setGraphicSize(FlxG.width, FlxG.height);
	//blackOverlay.camera = game.camHUD;
	blackOverlay.screenCenter();
	
	
		

	eh.funcTweenModEvent(target1, 0, 4, FlxEase.sineOut, 1.0, 0.0, function(v) {
		blackOverlay.alpha = v;
	}, "blackOverlayFade");
	
	
	

	
	
	var lazyAlternate:Bool = false;
	for (i in 0...94){
		if(i % 8 == 0){
			eh.funcTweenModEvent(target1, i, 2, ModConstants.getEaseFromString("cubeInOut"), lazyAlternate ? 90+180:90,lazyAlternate ? 90+180+180:90+180, function(v) {
				getSpr("hand_l").angle=v;
				getSpr("hand_r").angle=v*-1 + 180;
			}, "handsRotate");
			
			eh.funcTweenModEvent(target1, i+1.5, 1, ModConstants.getEaseFromString("pop"), 0, (lazyAlternate ? -10 : 10) * (downScroll ? 1 : -1), function(v) {
				getSpr("hand_l").offset.y=v;
				getSpr("hand_r").offset.y=v;
			}, "handsBounce");
			lazyAlternate = !lazyAlternate;
		}
	}
	
	eh.funcTweenModEvent(target1, 254, 4, ModConstants.getEaseFromString("sineInOut"), 0, FlxG.height*0.7* (downScroll ? 1 : -1), function(v) {
		getSpr("hand_l").offset.y=v;
		getSpr("hand_r").offset.y=v;
	}, "handsBounce");
	
	for (i in 128...128+32){
		if(i % 8 == 0){
			eh.funcTweenModEvent(target1, i, 2, ModConstants.getEaseFromString("cubeInOut"), lazyAlternate ? 90+180:90,lazyAlternate ? 90+180+180:90+180, function(v) {
				getSpr("hand_l").angle=v;
				getSpr("hand_r").angle=v*-1 + 180;
			}, "handsRotate");
			
			eh.funcTweenModEvent(target1, i+1.5, 1, ModConstants.getEaseFromString("pop"), 0, lazyAlternate ? -10 : 10, function(v) {
				getSpr("hand_l").offset.y=v;
				getSpr("hand_r").offset.y=v;
			}, "handsBounce");
			lazyAlternate = !lazyAlternate;
		}
	}
	
	for (i in 192...256){
		if(i % 8 == 0){
			eh.funcTweenModEvent(target1, i, 2, ModConstants.getEaseFromString("cubeInOut"), lazyAlternate ? 90+180:90,lazyAlternate ? 90+180+180:90+180, function(v) {
				getSpr("hand_l").angle=v;
				getSpr("hand_r").angle=v*-1 + 180;
			}, "handsRotate");
			
			eh.funcTweenModEvent(target1, i+1.5, 1, ModConstants.getEaseFromString("pop"), 0, lazyAlternate ? -10 : 10, function(v) {
				getSpr("hand_l").offset.y=v;
				getSpr("hand_r").offset.y=v;
			}, "handsBounce");
			lazyAlternate = !lazyAlternate;
		}
	}
	

	

	
	
	
	]])
end



local reversed = true
function reverseSwap(i)
	if reversed then
		ease(i, 1, "cubeOut", 1, "dark",1)
		ease(i, 1, "cubeOut", 1, "stealth",1)
		ease(i, 1, "cubeOut", 0, "dark",3)
		ease(i, 1, "cubeOut", 0, "stealth",3)
	else
		ease(i, 1, "cubeOut", 0, "dark",1)
		ease(i, 1, "cubeOut", 0, "stealth",1)
		ease(i, 1, "cubeOut", 1, "dark",3)
		ease(i, 1, "cubeOut", 1, "stealth",3)
	end		
	reversed = not reversed
end

function modsTimeline()

	runHaxeCode(
	[[
	setResetEvent(function(){
		PlayState.instance.comboPopUps.offsets[0] = -400;
		PlayState.instance.comboPopUps.offsets[1] = 17;
	});	
	]])
	
	stageVisuals()

	--go away dad
	setdefault(1, "alpha", "dad")
	setdefault(-222, "x", "dad")
	setdefault(1, "debugalpha", "dad")
	setasleep(0, "dad", true) --dad doesn't do anything lmao
	targetExclude("dad")
	
	setdefault(112*-2, "z")
	setdefault(100, "3d",1)
	setdefault(100, "3d",3)
	
	setdefault(0.25, "drawsize") --fix for v0.6.3 fnf
	set(92, 1, "drawsize")
	set(156, 1, "drawsize")
	set(223.9, 0.5, "drawsize")
	set(127.8, 0.5, "drawsize")
	
	set(0, 112*3*-1,"debugx","3")
	set(0, 112*3,"debugx","1")
	
	setdefault(1, "oldwave")
	
	setdefault( 1,"dark","3")
	setdefault( 1,"stealth","3")
	
	
	set(-16, 1,"reverse",3)	
	set(-16, -0.3,"flip")	
	set(-16, 1,"Attenuate")
	
	
	--set(0, 0,"beatscale__alternate")
	--set(0, 1,"beatscale")
	set(0, 1,"beatscale--0")
	set(0, -1,"beatscale--1")
	set(0, 1,"beatscale--2")
	set(0, -1,"beatscale--3")
	
	
	local rotateAmount = -25
	local lolAmount = 6
	for i = 0, 300, lolAmount do		
		add(i, (lolAmount/2), "bounce", rotateAmount, "anglex--3")
		add(i+(lolAmount/2), (lolAmount/2), "bounce",-rotateAmount, "anglex--3")
		add(i+(lolAmount/4), (lolAmount/2), "bounce", rotateAmount, "angley--3")
		add(i+(lolAmount/4)+(lolAmount/2), (lolAmount/2), "bounce",-rotateAmount, "angley--3")
	end
	
	rotateAmount = rotateAmount * -1
	lolAmount = 5
	for i = 0, 300, lolAmount do		
		add(i, (lolAmount/2), "bounce", rotateAmount, "anglex--1")
		add(i+(lolAmount/2), (lolAmount/2), "bounce",-rotateAmount, "anglex--1")
		add(i+(lolAmount/4), (lolAmount/2), "bounce", rotateAmount, "angley--1")
		add(i+(lolAmount/4)+(lolAmount/2), (lolAmount/2), "bounce",-rotateAmount, "angley--1")
	end
	
	rotateAmount = rotateAmount * -1
	lolAmount = 7
	for i = 0, 300, lolAmount do		
		add(i, (lolAmount/2), "bounce", rotateAmount, "anglex--0")
		add(i+(lolAmount/2), (lolAmount/2), "bounce",-rotateAmount, "anglex--0")
		add(i+(lolAmount/4), (lolAmount/2), "bounce", rotateAmount, "angley--0")
		add(i+(lolAmount/4)+(lolAmount/2), (lolAmount/2), "bounce",-rotateAmount, "angley--0")
		
		add(i, (lolAmount/2), "bounce", -rotateAmount, "anglex--2")
		add(i+(lolAmount/2), (lolAmount/2), "bounce",rotateAmount, "anglex--2")
		add(i+(lolAmount/4), (lolAmount/2), "bounce", -rotateAmount, "angley--2")
		add(i+(lolAmount/4)+(lolAmount/2), (lolAmount/2), "bounce",rotateAmount, "angley--2")
	end
	
	for i = 0, 92, 8 do
		reverseSwap(i+1.5)
	end
	
	for i = 128, 156, 8 do
		reverseSwap(i+1.5)
	end
	
	for i = 192, 256-8, 8 do
		reverseSwap(i+1.5)
	end
	
	
	for i = 32, 160-4, 4 do
		add(i+2, 1, "cubeOut", 45, "angle")
		add(i+2+0.75, 1, "cubeOut", 45, "angle")
		add(i+2+0.75+0.75, 1, "cubeOut", 45, "angle")
		
		ease(i+1, 1, "expoOut", 1, "hidden")
		ease(i+3, 1, "expoOut", 0, "hidden")
		ease(i+1, 1, "expoOut", 0, "sudden")
		ease(i+3, 1, "expoOut", 1, "sudden")
		
	end
	
	for i = 224, 256-4, 4 do
		add(i+2, 1, "cubeOut", 45, "angle")
		add(i+2+0.75, 1, "cubeOut", 45, "angle")
		add(i+2+0.75+0.75, 1, "cubeOut", 45, "angle")
		
		ease(i+1, 1, "expoOut", 1, "hidden")
		ease(i+3, 1, "expoOut", 0, "hidden")
		ease(i+1, 1, "expoOut", 0, "sudden")
		ease(i+3, 1, "expoOut", 1, "sudden")
		
	end
	
	
	
	add(60,4, "inOutQuint", 360*4, "anglex")
	add(60,4, "inOutQuint", 360*4, "rotatey")
	
	add(60,4, "inOutSine", 1, "roll")
	
	set(0, 4, "tipsy__speed")
	for i = 32, 92, 2 do
		add(i, 1, "pop", -0.2*tinyMultFix, "tiny")
		add(i+1, 1, "pop", -0.2*tinyMultFix, "tiny")
		
		add(i, 1, "pop", 0.6, "tipsy")
		add(i+1, 1, "pop", -0.6, "tipsy")

	end
	
	for i = 32, 92, 4 do
		add(i, 2, "bounce", 39, "rotatey")
		add(i+2, 2, "bounce", -39, "rotatey")
		
		add(i, 2, "bounce", 34, "angley")
		add(i+2, 2, "bounce", -34, "angley")
	end
	
	
	for i = 128, 152, 4 do
		add(i, 2, "bounce", 32, "rotatey")
		add(i+2, 2, "bounce", -32, "rotatey")
		
		add(i, 2, "bounce", 32, "angley")
		add(i+2, 2, "bounce", -32, "angley")
	end
	
	for i = 224, 256-4, 4 do
		add(i, 2, "bounce", 32, "rotatey")
		add(i+2, 2, "bounce", -32, "rotatey")
		
		add(i, 2, "bounce", 32, "angley")
		add(i+2, 2, "bounce", -32, "angley")
	end
	
	
	
	ease(92, 8, "linear", 0.5, "speedmod")
	ease(126, 0.5, "quadOut", 0.6, "speedmod")
	ease(126+0.75, 0.5, "quadOut", 0.8, "speedmod")
	ease(126+0.75+0.75, 0.5, "quadOut", 1, "speedmod")
	
	
	ease(92, 8, "quadInOut", 2, "drunkx")
	
	ease(123.2, 1, "expoIn", 0, "drunkx")
	
	ease(112, 124-112, "quintOut", 1, "tipsy")
	ease(123.2, 1, "expoIn", 0, "tipsy")
	
	
	
	
	
	add(156,4, "inOutQuint", 360*4, "anglex")
	add(156,4, "inOutQuint", 360*4, "rotatey")
	
	ease(158,2, "inOutQuad",1.25, "bumpyscale")
	ease(212,224-212-4, "inOutQuad",0, "bumpyscale")
	
	ease(158,4, "inOutQuad",1.5, "bumpyy")
	ease(158,2, "inOutQuad",-0.25, "lineary")
	
	ease(188,2, "inOutQuad",0, "bumpyy")
	ease(188,2, "inOutQuad",0, "lineary")
	
	
	if downScroll then
		ease(156,4, "inOutQuad", -40, "rotatex", 1)
		ease(156,4, "inOutQuad", 40, "rotatex", 3)
	else
		ease(156,4, "inOutQuad", 40, "rotatex", 1)
		ease(156,4, "inOutQuad", -40, "rotatex", 3)

	end
	
	add(156,4, "inOutQuad", -0.2, "centered")
	
	add(220,4, "expoOut", 0.2, "centered")
	
	
	ease(220,4, "expoOut", 0, "rotatex")
	add(220-0.25,4.6, "inOutQuint", 360*-4, "anglex")
	
	ease(160,16, "inOutQuad", 1.2, "flip")
	ease(160+16,16, "inOutQuad", -0.2, "flip")
	
	
	ease(156,4, "inOutSine", 0, "roll")
	
	ease(160,1, "inOutSine", 0, "sudden")
	ease(160,1, "inOutSine", 0, "hidden")
	
	
	set(220, 2.9, "drunkz__desync")
	set(220, 1.2, "drunkz__mult")
	ease(220,4, "pop",-13, "drunkz")
	
	add(220,4, "pop",-10, "movez")
	
	
	
	for i = 160, 160+64-2-4, 2 do
		ease(i,0.5, "outSine", 1, "square")
		ease(i+0.5,0.5, "inSine", 0, "square")
		ease(i+1,0.5, "outSine", -1, "square")
		ease(i+1.5,0.5, "inSine", 0, "square")
	end
	
	for i = 190, 256, 4 do
		add(i,1, "cubeInOut", 180+360, "angley")

	end
	
	
	
	
	ease(224,2, "inOutQuad",0.2, "circy", "1")
	ease(224,2, "inOutQuad",-0.2, "circy", "3")
	ease(224,2, "inOutQuad",1, "bumpyx--0")
	ease(224,2, "inOutQuad",-1, "bumpyx--1")
	ease(224,2, "inOutQuad",1, "bumpyx--2")
	ease(224,2, "inOutQuad",-1, "bumpyx--3")
	
	ease(191,2, "inOutQuad",-1, "zigzagangle")
	ease(220,2, "cubeOut",0, "zigzagangle")
	
	ease(224,2, "inOutQuad",0.5, "zigzagangle")
	
	add(250,6, "inExpo",-2, "center", "1")
	
	
end
