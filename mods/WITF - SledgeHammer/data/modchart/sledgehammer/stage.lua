
-- All this file does is add the pixelateShader for that one part lmao

function modsTimeline()	
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		var pixelateShader = new FlxRuntimeShader(Assets.getText(Paths.frag("sledgehammer/pixelate_effect")), null);
		addResetEvent(function(){
			pixelateShader.setFloat('xAmount', 16);
			pixelateShader.setFloat('yAmount', 16);
			game.camNotes.filters = [];
			game.camHUD.filters = [];
			game.camGame.filters = [];
		});	
		
		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(pixelateShader));

		eh.funcModEvent(target1, 94.5, function() {
			game.camNotes.filters = newCamEffects;
			game.camHUD.filters = newCamEffects;
			game.camGame.filters = newCamEffects;
		});

		eh.funcModEvent(target1, 96, function() {
			game.camNotes.filters = [];
			game.camHUD.filters = [];
			game.camGame.filters = [];
		});
		
		
		var pixelShaderModifier:CustomModifier = createCustomMod("pixelshader", 1.0);
		pixelShaderModifier.modPriority = -9990;
		pixelShaderModifier.unknown = false;
		pixelShaderModifier.strumsMod = false;
		pixelShaderModifier.notesMod = false;
		pixelShaderModifier.holdsMod = false;
		pixelShaderModifier.pathMod = false;
		pixelShaderModifier.specialMod = true;
		pixelShaderModifier.speedMod = false;
		eh.addCustomMod("bf", pixelShaderModifier);
		pixelShaderModifier.specialMathFunc = function() {
			var v:float = pixelShaderModifier.currentValue;
			pixelateShader.setFloat('xAmount', v);
			pixelateShader.setFloat('yAmount', v);
		};





	]])
	
	ease(94.5, 0.5, "outSine", 16, "pixelShader", "1")
	ease(95.5, 0.5, "inQuad", 1, "pixelShader", "1")
end


