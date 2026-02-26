function setUp()

end

function modsTimeline()

	runHaxeCode(
	[[

		var target1 = PlayState.instance.playerStrumline.mods;
		
		addResetEvent(function(){
			PlayState.instance.comboPopUps.offsets[0] = -400;
			PlayState.instance.comboPopUps.offsets[1] = 17;
		});
		
		
		for (strumLine in PlayState.instance.allStrumLines)
		{
			var spinAroundMod:CustomModifier = createCustomMod("repeatmovex", 0.0);
			spinAroundMod.modPriority = 100;
			strumLine.mods.addCustomMod(spinAroundMod);	
			spinAroundMod.strumMathFunc = function(data){
			
				var c:Float = spinAroundMod.currentValue;
				
				if(c < 0){
					c *= -1;
					
					c += 3-data.direction;
					var v:Float = c % 4;
					if(v > 3){
						v -= (v-3)*4 ;
						
						
						var zFunny:Float = (v-3)/3;
						data.z += FlxMath.fastSin(zFunny * Math.PI) * ModConstants.strumSize*2;
					}
					data.x -= (v-(3-data.direction)) * ModConstants.strumSize;
					
				}else{
				
					c += data.direction;
					var v:Float = c % 4;
				
					if(v > 3){
						v -= (v-3)*4;
						var zFunny:Float = (v-3)/3;
						data.z += FlxMath.fastSin(zFunny * Math.PI) * ModConstants.strumSize*2;
					}
					data.x += (v-data.direction) * ModConstants.strumSize ;
					
				}

				
			}	
		}

		
		]])

	setdefault(1, "centerx")
	
	add(0, 4, "linear", 4, "repeatmovex")
	
	add(4, 4, "inOutSine", 6, "repeatmovex")
	add(8, 10, "inOutSine", -20, "repeatmovex")
	
	add(16, 4, "outQuad", 10, "repeatmovex")
	
	add(20, 4.5, "inOutSine", 6, "repeatmovex")
	add(24,10, "inOutSine", -20, "repeatmovex")
	
	
end


