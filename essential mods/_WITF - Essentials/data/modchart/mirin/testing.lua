
function hxCode()
	addHaxeLibrary("ZSpriteProjected", "funkin.graphics")
	addHaxeLibrary("Constants", "funkin.util")
	runHaxeCode(
	[[
		print("HI!");
		
		var test:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image("testbig") );
		test.cullMode = "none";
		test.subdivisions = 5;
		test.scaleX = 1;
		test.scaleY = 1;
		test.tag = "test";
		game.currentStage.add(test);
		test.screenCenter();
		game.customLuaSprites.set("test", test);
		
		addUpdate(function(elapsed){
			test.angleX += elapsed*25;
		});	
		
	]])
end

function modsTimeline()
	setdefault(1, "showallmods")
	hxCode()
	setdefault(25,"pathgrain")
	setdefault(25,"grain")
end


