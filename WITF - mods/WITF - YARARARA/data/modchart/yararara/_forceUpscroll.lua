function setUp()
end
function modsTimeline()
	runHaxeCode(
	[[

		var forceUpscroll:Bool = true;



		if(FlxG.onMobile) forceUpscroll = false;


		if(Preferences.downscroll && forceUpscroll){

			for (strumLine in PlayState.instance.allStrumLines)
			{
				var metaReverseMod = ModConstants.createNewMod("reverse");
				metaReverseMod.baseValue = 1.0;
				metaReverseMod.setVal(1.0);
				metaReverseMod.strumOwner = strumLine;
				metaReverseMod.tag = "meta" + metaReverseMod.tag;
				strumLine.mods.modifiers.set(metaReverseMod.tag, metaReverseMod);
				metaReverseMod.modPriority = 750;
			}


		}

		var hudReverseMod:CustomModifier = createCustomMod("hudreverse", (Preferences.downscroll && forceUpscroll ? 1.0 : 0.0));
		hudReverseMod.modPriority = -9999;
		hudReverseMod.strumsMod = false;
		hudReverseMod.notesMod = false;
		hudReverseMod.holdsMod = false;
		hudReverseMod.pathMod = false;
		hudReverseMod.specialMod = true;
		hudReverseMod.speedMod = false;		
		hudReverseMod.unknown = false;		
		hudReverseMod.notPercentage = false;		
		eh.addCustomMod("1", hudReverseMod);
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
