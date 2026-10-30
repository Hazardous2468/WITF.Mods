function onCreate()
	notesBehindHUD(true)
end


function setUp()
	centerPlayer("")
	centerOpponent("")
	createNewPlayer(true)
	createNewPlayer(true)
	createNewPlayer(true)
	
	--QT playfield
	createNewPlayer(true, "funkin")
end

local third = 1/3

local ydAmount = -112/3

function modsTimeline()

	setdefault(1, "alpha",{"3","4","5","6"})
	setdefault(112*3,"debugx","3")
	setdefault(112*3,"debugx","6")
	setasleep(-4, "3", true)
	setasleep(0, "3", true)
	setasleep(-4, "4", true)
	setasleep(0, "4", true)
	setasleep(-4, "5", true)
	setasleep(0, "5", true)
	
	setasleep(-4, "6", true)
	setasleep(0, "6", true)

	setdefault(1, "showlanemods")

	
	setdefault(40,"pathgrain")
	setdefault(40,"grain")
	setdefault(0,"3d")
	
	setdefault(112*-3,"debugx","dad")
	setdefault(1,"alpha","dad")
		
	setdefault({112*-1,"z", ydAmount, "yd"})
	
	
	
	set(-16, {1, "drunk",0.2, "waveyy",0.35, "speedmod",1, "drawdistance",0.5, "wave",-1.5, "drunkz", 2, "attenuate"}, "1")
	
	ease(94, 1, "outExpo", {0,"drunk", 0, "waveyy", 0, "wave", 0, "drunkz", 0, "attenuate"}, "1")
	ease(88, 8, "inOutSmoothStep", {1,"speedmod", 0, "drawdistance"}, "1")
	
	set(-16, {1, "alpha--0",1, "alpha--1", 1,"alpha--2",1, "alpha--3"})
	
	ease(0, 4, "outQuad", 0, "alpha--0")
	ease(8, 4, "outQuad", 0, "alpha--2")
	ease(8+8, 4, "outQuad", 0, "alpha--3")
	ease(8+16, 4, "outQuad", 0, "alpha--1")
	
	ease(94, 1.5, "impulse", 0.25, "glitchLines", "1")
	
	
	local lazyAlt = false
	local function startKickHit(when, scale, timeMult)
	
		add(when, 1*timeMult, "impulse", 0.2, "glitch2", "1")
		
		add(when, 1*timeMult, "impulse", 1*scale, "scale")
		
		add(when, 1*timeMult, "impulse", lazyAlt and 6*scale or -6*scale, "drunkx")
		
		
		lazyAlt = not lazyAlt
	end
	
	for i = 96, 160-16, 16 do
		for k = 0, 16-2,2 do
			add(i+k, 1, "bounce", -15, "rotatez")
			add(i+k+1, 1, "bounce", 15, "rotatez")
		end
	
	
		for k = 0, 16-8,8 do
			add(i+3+k, 1, "impulse", 0.5, "flip")
			add(i+3+k, 2, "impulse", 1.5, "scale")		
			add(i+3+k, 2, "outCubic", 360, "anglez")
		end
		
		for k = 0, 5 do
			startKickHit(i+k, 1, 1)
			startKickHit(i+k+8, 1, 1)
		end
		
		startKickHit(i+6 			,1, 	third*2)
		startKickHit(i+6+(third*2)	,1,  	third*2)
		startKickHit(i+6+(third*4)	,1,  	third*2)
		
		for k = 6, 8-0.5, 0.5 do
			startKickHit(i+k+8, 1, 0.5)
		end
		

	end
	
	
	
	
	for i = 160, 222, 1 do
		add(i, 1, "impulse", -0.237, "zoomx", "1")
		add(i, 1, "pop", 0.2, "scaley", "1")
	end	
	
	ease(158, 2, "inOutSine", 1, "tornado", "1")
	ease(219, 3, "inOutSine", 0, "tornado", "1")
	
	ease(158, 2, "inOutSine", 1, "beat", "1")
	ease(222, 1, "inOutSine", 0, "beat", "1")
	
	
	
	--360 degrees = 2 beats
	ease(192, 4, "linear", 0.8, "alpha", "2")
	ease(214, 5, "inQuad", 1, "alpha", "2")
	set(192, {0.5, "stealth",0.5, "strumstealth"},"2")
	set(192, 1, "blacksphere__variant","2")
	set(192, {1, "sudden", 355, "sudden__offset"},"2")
	add(192, 0.25, "instant" , 112*-4, "z","2")
	add(192, 32, "linear", 360*16, "blacksphere", "2")
	
	
	for i = 192, 224-4, 4 do
		add(i+2, 2, "bounce", 112*-3, "x", "2")
		add(i, 2, "bounce", 112*3, "x", "2")
		
		add(i+2-1, 2, "bounce", -0.5, "circx", "2")
		add(i-1, 2, "bounce", 0.5, "circx", "2")
	end
	
	
	-- FOCUS
	
	ease(222,2, "linear", 1, "tinyholds","1")
	ease(287,1, "inExpo", 0, "tinyholds","1")
	
	ease(255,3, "inOutSine", 1, "hidden","1")
	ease(224, 8, "inOutSine", 0.3, "brake","1")
	ease(272,8, "linear", 0.5, "brake","1")
	ease(286,2, "inOutSine", 0, "brake","1")
	ease(284,4, "inOutSine", 0, "hidden","1")

	-- Reverse logic
	
	local b = getNoteBeats(224,288,"dad")
	for i, v in ipairs(b) do
		if v[2] == 1 then
			--ease(v[1], 0.1, "instant", 180, "rotatex")
			ease(v[1], 0.5, "outExpo", {1, "reverse", -ydAmount, "yd"})
			ease(v[1], 0.5, "outExpo", 1, "hudreverse","1")
		elseif v[2] == 2 then
			--ease(v[1], 0.1, "instant", 0, "rotatex")
			ease(v[1], 0.5, "outExpo", {0, "reverse", ydAmount, "yd"})
			ease(v[1], 0.5, "outExpo", 0, "hudreverse","1")
		end
	end
	
	
	
	
	
	
	
	-- Draw Func
	runHaxeCode(
	[[
		var strumLine = PlayState.instance.playerStrumline;
	
		var alertOverlay:FlxSprite = new FlxSprite();
		alertOverlay.frames = Paths.getSparrowAtlas('inhuman/cinder/bullshit-alert-overlayv2');

		if(Preferences.downscroll){
			alertOverlay.animation.addByPrefix('up', 'alert-up.png', 24, false);	
			alertOverlay.animation.addByPrefix('down', 'alert-down.png', 24, false);	
		}else{
			alertOverlay.animation.addByPrefix('down', 'alert-up.png', 24, false);	
			alertOverlay.animation.addByPrefix('up', 'alert-down.png', 24, false);	
		}

		alertOverlay.cameras = [game.camHUD];
		
		alertOverlay.animation.addByPrefix('!', 'alert-normal.png', 24, false);	
		alertOverlay.animation.play("!");
		game.customLuaSprites.set("alertOverlay", alertOverlay);
		alertOverlay.scrollFactor.set();
		game.add(alertOverlay);
		alertOverlay.setGraphicSize(FlxG.width+2, FlxG.height+2);
		alertOverlay.screenCenter();
		
		addResetEvent(function(){
			alertOverlay.animation.play("!");
			alertOverlay.alpha=0;
		});
				
		
		// using dad notes which are placed on the chart for the flip effect due to the funny rhythms it has
		
		var noteBeats = ModConstants.getNoteBeats(224,288,"dad");
		for (i in noteBeats){
		
			if(i[1] == 1){ 
				eh.funcModEvent(strumLine.mods, i[0], function() {
					getSpr("alertOverlay").animation.play("up");
				});
			}else if(i[1] == 2){
				eh.funcModEvent(strumLine.mods, i[0], function() {
					getSpr("alertOverlay").animation.play("down");
				});
			}

			eh.funcTweenModEvent(strumLine.mods, i[0], 0.8, ModConstants.getEaseFromString("inQuad"), 1,0, function(v) {
				getSpr("alertOverlay").alpha=v;
			}, "alertOverlay");	
		}
		

	
		
		var strumBaseX:Float = strumLine.x = (FlxG.width / 2 - strumLine.width / 2);
		
		
		
		var wallWalkTransition:Float = 0;
		var wallWalkMove:Float = 0;
		
		addResetEvent(function(){
			strumLine.drawFunc = null;
			strumLine.x = strumBaseX;
			strumLine.alpha = 1;
			
			wallWalkTransition = 0;
			wallWalkMove = 0;
			
		});
		
		
		
		// 456 if it fucks up...
		
		eh.funcTweenModEvent(strumLine.mods, 222, 2, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			wallWalkTransition = v;
		}, "wallWalkTransition");
		
		eh.funcTweenModEvent(strumLine.mods,286, 2, ModConstants.getEaseFromString("inExpo"), 1, 0, function(v) {
			wallWalkTransition = v;
		}, "wallWalkTransition");
		
		wallWalkMove = 0;
		for (i in 224...287){
			eh.funcTweenModEvent(strumLine.mods, i, 1, ModConstants.getEaseFromString("outSine"), 
			wallWalkMove, wallWalkMove+ModConstants.strumSize, function(v) {
				wallWalkMove = v;
			}, "wallWalkMove");
			
			wallWalkMove += ModConstants.strumSize;
			if(i%4 == 0){
				wallWalkMove = 0;
			}else if(i%4 == 2){
				wallWalkMove = ModConstants.strumSize*-2;
			}
			
		}
		
		eh.funcTweenModEvent(strumLine.mods, 287, 1, ModConstants.getEaseFromString("outSine"), 
		wallWalkMove, 0, function(v) {
			wallWalkMove = v;
		}, "wallWalkMove");
		
		//eh.funcTweenModEvent(strumLine.mods, 287, 1, ModConstants.getEaseFromString("outSine"), 
		//wallWalkMove, wallWalkMove-(ModConstants.strumSize*7), function(v) {
		//	wallWalkMove = v;
		//}, "wallWalkMove");
		
		wallWalkMove=0;
		
		
		
		

		var howMany:Int = 2;
		eh.funcModEvent(strumLine.mods, 222, function() {
		
			var noteSize:Float = ModConstants.strumSize;
			var strumSize:Float = ModConstants.strumSize*4;

			strumLine.drawFunc = function():Void{
				for (i in -howMany...howMany+1){
				
					strumLine.x = strumBaseX;
					strumLine.x += strumSize*wallWalkTransition*i;	
					
					if(i==0){ //center is alpha 1
						strumLine.alpha = 1;
					}else{ //others are faded in / out
						strumLine.alpha = wallWalkTransition;
					}
					
					strumLine.arrowPaths.alpha=0; //fix for arrowpaths appearing
					
					strumLine.x += wallWalkMove;
					
					strumLine.draw();
				}
			}

		});
		
		eh.funcModEvent(strumLine.mods, 288, function() {
			strumLine.drawFunc = null;
			strumLine.x = strumBaseX;
			strumLine.alpha=1;
			//strumLine.arrowPaths.alpha=1;
		});
		
		
		
		
		
	]])
	
	for i = 224, 288-1, 1 do
	
		add(i, 1, "bounce", -112/2, "z", "bf")
		add(i, 1, "pop",  i%2==0 and 2 or -2, "rotatez", "bf")
	
		--Fuck, need it to change direction based on reverse...
		
		local isReverse = i % 2 == 0
		if (i-224) % 16 > 4 and (i-224) % 16 <= 12 then
			isReverse = not isReverse
		end
		if not downScroll then
			isReverse = not isReverse
		end
		add(i, 1, "outSine", isReverse and 180 or -180, "blacksphere", "bf")
		
		
		add(i, 1, "pop", 0.2, "centered", "bf")
		
		add(i, 1, "impulse", 0.2, "scale", "bf")
	end	
	

	ease(288.01, 2, "outCubic", -1 , "orient", "1")
	ease(350,1, "outCubic", 0, "orient", "1")
	set(288, {0, "blacksphere", 1, "blacksphere__variant"})
	
	for i = 288, 350-2,2 do 
		add(i,2, "pop", 0.25, "mini", "1")
		if i % 4 == 2 then
			add(i,2, "pop",0.5, "zoomx", "1")
		else
			add(i,2, "pop",-0.1, "zoomx", "1")
		end
		
	end
	
	
	add(288, 2, "impulse", 1 , "scale")
	add(288, 2, "impulse", 0.2 , "glitch2","1")
	
	--Spin	
	add(288,2, "linear", 360 , "blacksphere")
	add(288+4,2, "linear", -360 , "blacksphere")
	add(288+8,8, "linear", 360*4 , "blacksphere")
	
	add(288+16,2, "linear", 360 , "blacksphere")
	add(288+16+4,2, "linear", -360 , "blacksphere")
	add(288+8+16,4, "linear", 360*2 , "blacksphere")	
	
	add(320,2, "linear", 360 , "blacksphere")
	add(320+4,2, "linear", -360 , "blacksphere")
	add(320+8,8, "linear", 360*4 , "blacksphere")
	
	add(320+16,2, "linear", 360 , "blacksphere")
	add(320+16+4,2, "linear", -360 , "blacksphere")
	add(320+8+16,4, "linear", 360*2 , "blacksphere")
	
	
	for lp = 0, 1 do
		local i = lp * 32
		
		add(i+290, 2, "pop", 1 , "drunk","1")
		add(i+294, 2, "pop", 1 , "drunk","1")
		add(i+306, 2, "pop", 0.5 , "drunk","1")
		add(i+307, 2, "pop", -1 , "drunk","1")
		add(i+310, 2, "pop", 0.5 , "drunk","1")
		add(i+311, 2, "pop", -1 , "drunk","1")
		
		local b = getNoteBeats(i+315.9, i+319.5, "bf")
		for i, v in ipairs(b) do
			if v[4] ~= "hurt" then
				add(v[1], 1, "bounce", {-0.25, "centered--"..v[2]}, "1")
				add(v[1], 1, "pop", {-0.25, "tiny--"..v[2]}, "1")
			end
		end
	end

	
	add(350, 1.7, "linear", 360 , "angle","1")
	ease(348, 2, "inExpo", -180 , "rotatey", "1")
	ease(350, 2, "inOutExpo", 0 , "rotatey", "1")

	
	
	
	ease(350,2, "inOutSine", 1.345 , "speedmod", "1")
	

	local b = getNoteBeats(351.5, 415.5,"dad")
	for i, v in ipairs(b) do
		if v[2] == 0 then
			add(v[1], 0.5, "impulse", {0.5, "scale"})
		elseif v[2] == 1 then
			add(v[1], 1, "impulse", {0.6, "scale"})
		else
			add(v[1], 0.25, "impulse", {0.5, "scale"})
		end
		
		value(v[1], 1, "inOutQuad", 0.05, 0, "glitch2", "1")
		
		
		for c = 0, 3 do
			value(v[1], 1, "inOutQuad", math.random(-32,32)/112, 0, "movex--"..c, "1")
			value(v[1], 1, "inOutQuad", math.random(-32,32)/112, 0, "movey--"..c, "1")
		end
	end
	value(383, 0.75, "inOutQuad", 0.9, 0, "glitch2", "1")
	value(383, 0.5, "inOutQuad", 0.09, 0, "glitchLines", "1")
	
	add(383, 1.2, "impulse", {1, "scale"})
	add(383, 1.5, "outCubic", {-360, "angle"})
	
	add(382,1, "bounce", -0.1 , "reverse", "1")
	add(382,2, "inOutExpo", 1 , "reverse", "1")
	ease(444,0.1, "instant", 0 , "reverse", "1")
	ease(382,2, "inOutExpo", -ydAmount , "yd", "1")
	ease(444,0.1, "instant", ydAmount , "yd", "1")

	ease(382,1, "bounce", -0.1 , "hudreverse", "1")
	ease(382,2, "inOutExpo", 1 , "hudreverse", "1")
	add(444,2, "inOutSmoothStep", -1 , "hudreverse", "1")
	add(444,2, "inverse", 1 , "hudreverse", "1")
	
	ease(415,1, "linear", 0.7 , "tinyholds", "1")
	ease(472,4, "linear", 0 , "tinyholds", "1")
	
	
	ease(414-0.5,2, "inOutSine", 1.15 , "speedmod", "1")
	ease(444,1, "inOutSine", 1.0 , "speedmod", "1")
	
	ease(444,1, "outExpo", 1 , "invert", "1")
	ease(444,1, "outExpo", 1 , "alphastrum", "1")
	ease(447,1, "linear", 0 , "alphastrum", "1")
	ease(447,1, "linear", 0 , "invert", "1")
	ease(444,1, "outSine", 1 , "tornado", "1")
	ease(448,1, "outSine", 0, "tornado", "1")
	
	ease(444,1, "outSine", 0.5 , "brake", "1")
	ease(446,2, "linear", 0, "brake", "1")
	
	set(446,1.5, "bouncez__mult", "1")
	ease(446,2, "linear", 2.5, "bouncez", "1")
	ease(476,2, "linear", 0, "bouncez", "1")

	
	set(448, 440, "hourglass__start","1")
	set(448, 130, "hourglass__end","1")
	for i = 448, 476-2,2 do
		ease(i,1, "outCubic", -1 , "hourglass", "1")
		ease(i+1,1, "outCubic", 0 , "hourglass", "1")
		add(i,1, "outCubic", 180 , "blacksphereflip", "1")
		add(i+1,1, "outCubic", 180 , "blacksphereflip", "1")
	end
	set(476, {0, "blacksphereflip",0, "hourglass"},"1")
	
	for i = 416, 444-2,2 do
		add(i,1, "pop", 45/2 , "blacksphere", "1")
		add(i+1,1, "pop", -45/2 , "blacksphere", "1")
	end
	
	--set(476, 0, "tornado", "1")
	
	set(544, 1, "blacksphere__variant")
	
	
	for i = 416, 444-4, 4 do
		ease(i, 0.5, "outExpo", 0.5 , "stealth")
		ease(i+1, 1, "inExpo", 0.0 , "stealth")
	end
	
	for i = 416, 476-2, 2 do
		if not (i >= 444 and i < 448) then
		
		add(i, 1, "pop", 0.5 , "drunk")
		add(i+1, 1, "pop", -0.5 , "drunk")
		add(i, 1, "bounce", 0.5 , "drunk")
		add(i+1, 1, "bounce", -0.5 , "drunk")
		
		add(i, 1, "bounce", 4 , "skewx")
		add(i+1, 1, "bounce", -4 , "skewx")
		
		add(i, 1, "pop", -1 , "tiny")
		add(i+1, 1, "pop", -1 , "tiny")
		
		end
	end
	
	
	ease(456, 0.5, "outExpo", 0.5 , "stealth")
	ease(456+1, 1, "inExpo", 0.0 , "stealth")
	ease(464, 0.5, "outExpo", 0.5 , "stealth")
	ease(464+1, 1, "inExpo", 0.0 , "stealth")
	ease(472, 0.5, "outExpo", 0.5 , "stealth")
	ease(472+1, 1, "inExpo", 0.0 , "stealth")
	
	
	ease(444, 1, "inExpo", 0.7 , "hurtnotealpha","1")
	ease(472, 3, "inOutExpo", 0.0, "hurtnotealpha","1")
	
	
	
	
	
	
	
	setasleep(480, "3", false)
	setasleep(480, "4", false)
	setasleep(480, "5", false)
	set(476, 1, "sudden")
	set(476, 164, "sudden__offset")
	
	set(476, -0.5, "drawsize", {"3","4","5","1"})
	set(476, 0.8, "speedmod", {"3","4","5"})
	set(480, 0, "alpha", {"3","4","5"})
	
	
	if downScroll then
		set(476, 112*3, "rotatez__offset_y", {"3","4","5","1"})
	else
		set(476, -112*3, "rotatez__offset_y", {"3","4","5","1"})
	end
	
	
	local offscreenY = 112*2*-4
	
	local multArray = {0, 2, 0, -2, 2, 0, -2, 0, 2, -2}
	local multArrayCounter = 1
	
	
	local plrCounter = 1
	local _plr = plrCounter
	local function throwPlayer(when, timeMult)
		_plr = plrCounter
		if plrCounter >= 2 then
			_plr = plrCounter + 1
		end
		
		
		local length = 3*timeMult
		local whenBeat = when-(length/2)
		
		local mmmm = 1
		if math.random(0,1) >= 0.5 then
			mmmm = -1
		end
		
		local _spacing = 112*1.75
		
		set(whenBeat, {_spacing * multArray[multArrayCounter], "x"}, _plr)
		multArrayCounter = multArrayCounter + 1
		if multArrayCounter > #multArray then
			multArrayCounter = 1
		end
		
		--value(whenBeat, length, "bounce", -4*2*112, math.random(20,40)/100, "yd", _plr)
		
		set(whenBeat, offscreenY, "yd", _plr)
		local targetValue = math.random(20,40)/100
		add(whenBeat, length, "bounce", -offscreenY + targetValue, "yd", _plr)
		
		add(whenBeat, length/4, "instant", -112*0.5, "yd", _plr)
		add(whenBeat, length/2, "outQuad", 112*0.5, "yd", _plr)
		add(whenBeat+(length/2), length/2, "inQuad", -112*0.5, "yd", _plr)
		
		--local targetValue = math.random(44,100) * mmmm*2
		--value(whenBeat, length, "linear", -targetValue/112, targetValue/112, "movex", _plr)
		--value(whenBeat, length, "linear", -targetValue, targetValue, "rotatez__offset_x", _plr)
		
		
		
		local startAngle = math.random(19,37) * mmmm
		local endAngle = math.random(19,36) * mmmm * -1
		
		value(whenBeat, length, "linear", startAngle, endAngle, "rotatez", _plr)
		value(whenBeat, length, "linear", startAngle, endAngle, "angle", _plr)
		
		set(whenBeat, math.random(112*2,112*4)*-1 ,"z", _plr)
		
		plrCounter = plrCounter + 1
		if plrCounter > 4 then
			plrCounter = 1
		end
	end
	
	local function throwFlip(when, who)	
		add(when, 1, "outCubic", 1, "flip", who)
		add(when+1, 0.5, "inOutExpo", -1, "flip", who)
		
		ease(when, 1, "outCubic", 0.5, "stealth", who)
		ease(when+1, 0.5, "inOutExpo", 0, "stealth", who)
		
		ease(when, 1, "outCubic", 0.5, "strumstealth", who)
		ease(when+1, 0.5, "inOutExpo", 0, "strumstealth", who)
		
	end
	
	local b = getNoteBeats(479.9, 543,"dad")
	for i, v in ipairs(b) do

		if v[2] == 3 then
			add(v[1], 2/3, "impulse", {-0.75, "mini",0.1, "scale"})
			add(v[1], 2/3, "impulse", 0.14 , "glitch2","1")
		else
			add(v[1], 1, "impulse", {-0.75, "mini",0.1, "scale"})
			add(v[1], 1, "impulse", 0.15 , "glitch2","1")
		end
	
		if v[2] > 1 then
			if v[2] == 3 then
				throwPlayer(v[1], 0.8)
			else
				throwPlayer(v[1], 1)
			end
		else
			throwPlayer(v[1], 1)
			throwFlip(v[1], _plr)
			
			add(v[1], 1, "pop", 0.045 , "glitchLines","1")
		end
		
	end

	reset(543)
	
	ease(542, 0.9, "linear", 1, "alpha")
	ease(542, 0.9, "inQuad", 2, "tiny")
	value(543, 1, "outBack", 2, 0, "tiny", "1")
	
	setasleep(543, "3", true)
	setasleep(543, "4", true)
	setasleep(543, "5", true)
	
	local spacing = 112*1.77
	
	
	local _spacing = spacing
	_spacing = spacing*0.8
	set(476, {_spacing, "x",_spacing, "debugx"}, "1")
	_spacing = spacing*-2.2
	set(476, {_spacing, "x",_spacing, "debugx"}, "3")
	_spacing = spacing*2.2
	set(476, {_spacing, "x",_spacing, "debugx"}, "4")
	_spacing = spacing*-0.8
	set(476, {_spacing, "x",_spacing, "debugx"}, "5")
	
	
	
	
	set(476, {112*-12, "debugx"}, "dad")
	
	--set(476, -4, "centered", {"3","4","5","1"})
	set(476, offscreenY, "yd", {"3","4","5","1"})
	
	
	ease(543, 1 ,"inQuint", 0.25, "arrowpath", "1")
	set(543, {0, "arrowpathred", 0, "arrowpathblue", 0, "arrowpathgreen" }, "1")
	set(543, 0.5, "arrowpathwidth", "1")
	for i = 544, 620-1 do
		add(i, 1, "bounce", i%2==0 and 1.2 or -1.2, "cosbumpyx", "1")
		add(i, 1, "bounce", -0.1, "speedmod", "1")
		add(i, 1, "bounce", -0.1, "centered", "1")
		
		add(i, 1, "pop", i%2==0 and 45 or -45, "angle", "1")

		add(i, 1, "impulse", 1, "arrowpathwidth", "1")
	end
	
	set(543.01, 1, "3d", "1")
	
	for i = 576, 620-2, 2 do
		add(i,2, "linear", 360 , "blacksphere", "2")
		
		add(i,2, "linear", 360 , "angley", "1")
	end
	
	
	ease(576, 1, "outExpo", 0.8, "alpha", "2")
	ease(612, 6, "linear", 1, "alpha", "2")
	set(576, {0.5, "stealth",0.5, "strumstealth"},"2")
	set(576, 1, "blacksphere__variant","2")
	set(576, {1, "sudden", 355, "sudden__offset"},"2")
	add(575, 0.25, "instant" , 112*-4, "z","2")
	
	
	for i = 576-4, 620-4, 4 do
		add(i+2, 2, "bounce", 112*-3, "x", "2")
		add(i, 2, "bounce", 112*3, "x", "2")
		
		add(i+2-1, 2, "bounce", -0.5, "circx", "2")
		add(i-1, 2, "bounce", 0.5, "circx", "2")
	end
	
	
	
	
	ease(608, 4.5, "inOutCubic", 1 , "tandrunk")
	ease(608, 4.5, "inOutCubic", 64 , "snap","1")
	
	ease(608, 10, "linear", 31 , "skewy--0","1")
	ease(608, 10, "linear", -20 , "skewy--1","1")
	ease(608, 10, "linear", 33 , "skewy--2","1")
	ease(608, 10, "linear", -39 , "skewy--3","1")
	
	ease(608, 8, "linear", 0.03 , "glitchLines","1")
	ease(608, 8, "linear", 0.2 , "glitch2","1")
	set(620, {0, "glitch2", 0, "glitchLines"}, "1")
	
end


