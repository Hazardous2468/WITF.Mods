function setUp()
	centerPlayer("")
	centerOpponent("")
	createNewPlayer(true)
end

function modsTimeline()
	runHaxeCode(
	[[

	var target1 = PlayState.instance.playerStrumline.mods;

	for (strumLine in PlayState.instance.allStrumLines)
	{
		var isBF:Bool = strumLine == PlayState.instance.playerStrumline;
		strumLine.arrowPathFileName = "19ZZ/arrowPath";
	
		var spinAroundMod:CustomModifier = createCustomMod("infinitywalk1", 0.0);
		spinAroundMod.modPriority = -100;
		spinAroundMod.strumsMod = true;
		spinAroundMod.notesMod = true;
		spinAroundMod.holdsMod = true;
		spinAroundMod.pathMod = true;
		spinAroundMod.speedMod = true;
		strumLine.mods.addCustomMod(spinAroundMod);	
		spinAroundMod.strumMathFunc = function(data){
			if(data.direction % 2 == 0){
				var sine:Float = Math.abs(FlxMath.fastSin(spinAroundMod.currentValue * Math.PI));
				data.y -= sine * ModConstants.strumSize;
				
				
				var xOffset:Float = 0;
				xOffset -= spinAroundMod.currentValue * ModConstants.strumSize*2;
				xOffset = xOffset % (ModConstants.strumSize*4);
				
				if(isBF){
					xOffset += ModConstants.strumSize*4;
				}
				
				
				data.x += xOffset;
				
				
				var s:Float = 0;
				if(isBF){
					if(data.direction % 4 == 0){
						s -= (spinAroundMod.currentValue % 2) -1;
					}else if(data.direction % 4 == 2){
						s -= (spinAroundMod.currentValue % 2) - 2;
					}
				}else{
					if(data.direction % 4 == 0){
						s = spinAroundMod.currentValue % 2;
					}else if(data.direction % 4 == 2){
						s = (spinAroundMod.currentValue % 2) - 1;
					}
				}
				data.scaleX = FlxMath.lerp(data.scaleX, 0.0, FlxMath.bound(s, 0, 1) );
			}
		}
		spinAroundMod.noteMathFunc = function(data){
			if(data.direction % 2 == 0){
				var s:Float = 0;
				if(isBF){
					if(data.direction % 4 == 0){
						s -= (spinAroundMod.currentValue % 2) -1;
					}else if(data.direction % 4 == 2){
						s -= (spinAroundMod.currentValue % 2) - 2;
					}
				}else{
					if(data.direction % 4 == 0){
						s = spinAroundMod.currentValue % 2;
					}else if(data.direction % 4 == 2){
						s = (spinAroundMod.currentValue % 2) - 1;
					}
				}
				data.scaleX = FlxMath.lerp(data.scaleX, 0.0, FlxMath.bound(s, 0, 1) );
			}
		}
		spinAroundMod.speedMathFunc = function(curPos, lane){
			var retu_val:Float = 1;
			if(lane % 2 == 0){
				var yValue:Float = Math.abs(FlxMath.fastSin(spinAroundMod.currentValue * Math.PI));
				retu_val -= yValue * 0.35 * (downScroll ? 1 : -1);
			}
			return retu_val;
		}
		
		
		
		var spinAroundMod:CustomModifier = createCustomMod("infinitywalk2", 0.0);
		spinAroundMod.modPriority = -100;
		spinAroundMod.strumsMod = true;
		spinAroundMod.notesMod = true;
		spinAroundMod.holdsMod = true;
		spinAroundMod.pathMod = true;
		strumLine.mods.addCustomMod(spinAroundMod);	
		spinAroundMod.speedMathFunc = function(curPos, lane){
			var retu_val:Float = 1;
			if(lane % 2 == 1){
				
				var yValue:Float = Math.abs(FlxMath.fastSin(spinAroundMod.currentValue * Math.PI));
				retu_val -= yValue * 0.35* (downScroll ? 1 : -1);
			}
			return retu_val;
		}
		spinAroundMod.strumMathFunc = function(data){
			if(data.direction % 2 == 1){
				var sine:Float = Math.abs(FlxMath.fastSin(spinAroundMod.currentValue * Math.PI));
				data.y -= sine * ModConstants.strumSize;
				
				
				var xOffset:Float = 0;
				xOffset += spinAroundMod.currentValue * ModConstants.strumSize*2;
				xOffset = xOffset % (ModConstants.strumSize*4);
				
				if(isBF){
					xOffset -= ModConstants.strumSize*4;
				}
				
				
				data.x += xOffset;
				
				
				var s:Float = 0;
				if(isBF){
					if(data.direction % 4 == 1){
						s -= (spinAroundMod.currentValue % 2)-2;
					}else if(data.direction % 4 == 3){
						s -= (spinAroundMod.currentValue % 2) - 1;
					}
				}else{
					if(data.direction % 4 == 3){
						s = spinAroundMod.currentValue % 2;
					}else if(data.direction % 4 ==1){
						s = (spinAroundMod.currentValue % 2) - 1;
					}
				}
				data.scaleX = FlxMath.lerp(data.scaleX, 0.0, FlxMath.bound(s, 0, 1) );
			}
		}
		spinAroundMod.noteMathFunc = function(data){
			if(data.direction % 2 == 1){
				var s:Float = 0;
				if(isBF){
					if(data.direction % 4 == 1){
						s -= (spinAroundMod.currentValue % 2)-2;
					}else if(data.direction % 4 == 3){
						s -= (spinAroundMod.currentValue % 2) - 1;
					}
				}else{
					if(data.direction % 4 == 3){
						s = spinAroundMod.currentValue % 2;
					}else if(data.direction % 4 ==1){
						s = (spinAroundMod.currentValue % 2) - 1;
					}
				}
				data.scaleX = FlxMath.lerp(data.scaleX, 0.0, FlxMath.bound(s, 0, 1) );
			}
		}
		


	}

	
	]])
	


	
	set(-16, 1, "showallmods")
	
	set(-16, -80*112, "debugx","dad")
	set(-16, -80*112, "x","dad")
	set(-16, 1, "alpha","dad")
	setasleep(-12, "dad", true)
	
	set(-16, -3*112, "debugx","3")
	set(-16, 3*112, "debugx","bf")
	
	set(-16, 1, "alphasplash")

	
	for i = 0, 8-2, 2 do
		add(i, 1, "linear", 1, "infinitywalk1")
		add(i+1, 1, "linear", 1, "infinitywalk2")
	end
	
	for i = 8, 16-2, 2 do
		add(i, 1, "linear", -1, "infinitywalk1")
		add(i+1, 1, "linear", -1, "infinitywalk2")
	end
	
	for i = 16, 24-2, 2 do
		add(i, 1, "linear", 1, "infinitywalk1")
		add(i+1, 1, "linear", 1, "infinitywalk2")
	end
	
	for i = 24, 32-4, 4 do
		add(i, 1, "linear", 1, "infinitywalk1")
		add(i+1, 1, "linear", 1, "infinitywalk2")
		
		add(i+2, 1, "linear", -1, "infinitywalk1")
		add(i+1+2, 1, "linear", -1, "infinitywalk2")
	end
	
	
	
	ease(-2, 2, "linear", 0.75, "beatangle")
	ease(31, 2, "outQuad", 0, "beatangle")

	
end


