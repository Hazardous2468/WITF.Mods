
function modsTimeline()
	runHaxeCode(
	[[
		var hudReverseMod:CustomModifier = createCustomMod("hudreverse", 0.0);
		hudReverseMod.modPriority = -9999;
		hudReverseMod.strumsMod = false;
		hudReverseMod.notesMod = false;
		hudReverseMod.holdsMod = false;
		hudReverseMod.pathMod = false;
		hudReverseMod.specialMod = true;
		hudReverseMod.speedMod = false;		
		hudReverseMod.unknown = false;		
		hudReverseMod.notPercentage = false;		
		eh.addCustomMod("bf", hudReverseMod);
		hudReverseMod.specialMathFunc = function() {
			//Make sure this is the same as the initHealthBar() function in PlayState!
			
			var defaultYPos:Float = Preferences.downscroll ? FlxG.height * 0.1 : FlxG.height * 0.9;
			var flippedYPos:Float = !Preferences.downscroll ? FlxG.height * 0.1 : FlxG.height * 0.9;
			
			var healthBarYPos:Float = FlxMath.lerp(defaultYPos, flippedYPos, hudReverseMod.currentValue);
			PlayState.instance.healthBarBG.y = healthBarYPos;
			PlayState.instance.healthBar.y = PlayState.instance.healthBarBG.y+4;
			PlayState.instance.scoreText.y = PlayState.instance.healthBarBG.y+30;			
		};
		

	]])
end
