function modsTimeline()
	runHaxeCode(
	[[
	var customMod:CustomModifier = createCustomMod("pushback", 0.0);
	customMod.modPriority = -9990;
	customMod.unknown = false;
    customMod.notesMod = true;
    customMod.pathMod = false;
    customMod.holdsMod = true;
	eh.addCustomMod("1", customMod);
	
	
	customMod.noteMathFunc = function(data) {
		var curValue = customMod.currentValue;
		var section:Float = 1;
		
		if(data.strumTime >= 87055 && data.strumTime < 98622){
			var lol:Float = 0.5;
			if(data.strumTime >= 97803){ 
				section = 16+(lol*4);
			}else if(data.strumTime >= 97550){ 
				section = 16+(lol*3);
			}else if(data.strumTime >= 97367){ 
				section = 16+(lol*2);
			}else if(data.strumTime >= 97150){ //260
				section = 16+lol;
			}else if(data.strumTime >= 96798){ //259
				section = 16;
			}else if(data.strumTime >= 96420){ //258
				section = 15;
			}else if(data.strumTime >= 96081){ //257
				section = 14;
			}else if(data.strumTime >= 95690){ //256
				section = 13;
			}else if(data.strumTime >= 95338){
				section = 12;
			}else if(data.strumTime >= 94593){
				section = 11;
			}else if(data.strumTime >= 93811){ //251
				section = 10;
			}else if(data.strumTime >= 93062){ //249
				section = 9;
			}else if(data.strumTime >= 92310){ //247
				section = 8;
			}else if(data.strumTime >= 92278){
				section = 8;
			}else if(data.strumTime >= 91544){
				section = 7;
			}else if(data.strumTime >= 91400){
				section = 6;
			}else if(data.strumTime >= 90808){
				section = 6;
			}else if(data.strumTime >= 90099){
				section = 5;
			}else if(data.strumTime >= 89348){
				section = 4;
			}else if(data.strumTime >= 88545){
				section = 3;
			}else if(data.strumTime >= 87843){
				section = 2;
			}
			
			
			section -= curValue;
			
			var yFuckery:Float = (112*1.5) * (downScroll ? 1 : -1);
			
			
			
			data.y += (yFuckery * section);
			data.stealth += (section*0.333);
			data.alpha -= (section*0.35);
			
			data.scaleX -= (section*0.135);
			data.scaleY -= (section*0.135);
			
			data.z -= (section*200);
		}
	};
	game.zSortMod_SustainOffset = -222;
	]])
	
	
	for i = 232, 255, 2 do
		add(i+0.98, 0.85, "outBack", 1, "pushback","1")
		
		add(i+1, 1, "impulse", 0.15, "scalex")
		add(i+1, 1, "impulse", -0.15, "scaley")
		
		add(i+1, 1, "popElastic", 1, "movez","3")
		
		add(i+1, 1, "bounce", 0.04, "speedmod","1")
	end
	for i = 256, 259, 1 do
		add(i-0.02, 0.85, "outBack", 1, "pushback","1")
		add(i, 1, "impulse", 0.15, "scalex")
		add(i, 1, "impulse", -0.15, "scaley")
		add(i, 1, "popElastic", 1, "movez","3")
		add(i, 1, "bounce", 0.04, "speedmod","1")
	end
	
	for i = 0, 3, 1 do
		add(260 + (0.5*i), 0.85/2, "outBack", 0.5, "pushback","1")
		
		add(260 + (0.5*i), 0.5, "impulse", 0.09, "scalex")
		add(260 + (0.5*i), 0.5, "impulse", -0.12, "scaley")
		add(260 + (0.5*i)-0.02, 0.6, "popElastic", 1, "movez","3")
		add(260 + (0.5*i), 0.5, "bounce", 0.04, "speedmod","1")
	end
	
	ease(232, 1, "outQuart", -0.2, "drunk")
	ease(247.75, 0.25, "inOutQuart", 1, "beat")
	ease(261.75, 1.25, "linear", 0, "beat")
	ease(261.75, 1.25, "linear", 0, "drunk")
	
	
	set(230.05, 1, "zsort", "1")
	set(264, 0, "zsort", "1")
	
	set(230, 1, "drawdistance", "1")
	
	
	
	set(228, 1, "alpha", "3")
	set(230, 1, "alpha", "3")
	ease(230, 2.2, "inSine", 0, "alpha","3")
	ease(230, 2.2, "inSine", 0.66, "dark","1")
	set(228, -2, "moveyd", "3")
	ease(230, 2, "linear", 0, "moveyd","3")
	ease(263, 1, "linear", -2.1, "moveyd","3")
	ease(263, 1, "linear", 0, "dark","1")
	
	set(230, -200*2, "z", "3")

	--var yFuckery:Float = (112*1.5) * (downScroll ? 1 : -1);
	
	set(230, -112*1.5, "yd", "3")
	
	set(230, -0.0, "flip", "3")
	set(230, 1, "stealth", "3")
	set(230, 0.15, "strumstealth", "3")
	
	reset(264, "3")
	set(264, 1, "alpha", "3")
	set(447, 0, "alpha", "3")

	
	
	
	
end







