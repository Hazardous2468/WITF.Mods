function setUp()

end

function modsTimeline()

	runHaxeCode(
	[[

		var target1 = PlayState.instance.playerStrumline.mods;
				
		for (strumLine in PlayState.instance.allStrumLines)
		{
			var expandMod:CustomModifier = createCustomMod("custom_expand", 0.0);
			strumLine.mods.addCustomMod(expandMod);	
			expandMod.speedMod = true;
			expandMod.createSubMod("speed", 1);
			expandMod.speedMathFunc = function(curPos, lane){				
				var b:Float = Conductor.instance.currentBeatTime / 2 * expandMod.getSubVal("speed");
				
				var sine:Float = FlxMath.fastSin(b* Math.PI);

				if(expandMod.currentValue > 0){
				
					return 1 + (sine*expandMod.currentValue/4); //400% means that the scroll speed becomes 0!
					
				}else{ //special negative behaviour
					
					var r:Float = FlxMath.lerp(1, 0, expandMod.currentValue*-1 );
					r = FlxMath.bound(r, 0, 1);
					
					
					r += sine * (1-r) * (expandMod.currentValue*-0.5); //200 % is normal speed for both ways? idk
					
					return r;
				}	
				
			}
			
		}

		
		]])

	
	add(0, 4, "linear", -2, "custom_expand")
	--add(0, 1, "outQuint", 1, "center")
	

	
	
end


