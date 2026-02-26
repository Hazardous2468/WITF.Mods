function modsTimeline()
	

	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode(
	[[

	var target1 = PlayState.instance.playerStrumline.mods;

	
	
	//Create AFT to capture notesCameras
	var notesAFT:HazardAFT = new HazardAFT(game.camAFT);
	notesAFT.recursive=false;
	notesAFT.updateAFT();	
	setVar("notesAFT",notesAFT);
	
	var aftSprite = createSpr("aftSprite");
	aftSprite.loadGraphic(getVar("notesAFT").bitmap);
	aftSprite.screenCenter();	
	aftSprite.camera = game.camAFT;
	
	notesAFT.recursive=true;
	
	addResetEvent(function(){		
		aftSprite.alpha = 0.0;
		aftSprite.angle = 0.0;
	});
	
	
	//eh.funcModEvent(target1, 804, function() {
	//	aftSprite.alpha = 0.25;
	//}, "showAFT");
	
	
	eh.funcModEvent(target1, 116, function() {
		notesAFT.clearAFT();
		aftSprite.scale.set(1.01, 1.01);
	}, "clearAFT", false);
	
	eh.funcTweenModEvent(target1, 116, 8,  ModConstants.getEaseFromString("quintOut"), 0, 0.5, function(v) {
		aftSprite.alpha = v;
	}, "showAFT");
	
	eh.funcTweenModEvent(target1, 128, 4,  ModConstants.getEaseFromString("quintIn"), 0.5, 0.0, function(v) {
		aftSprite.alpha = v;
	}, "showAFT");
	
	
	eh.funcTweenModEvent(target1, 804, 8,  ModConstants.getEaseFromString("cubeOut"), 0, 0.25, function(v) {
		aftSprite.alpha = v;
	}, "showAFT");
	
	eh.funcTweenModEvent(target1, 932, 32,  ModConstants.getEaseFromString("linear"), 0.25, 1, function(v) {
		aftSprite.alpha = v;
	}, "showAFT");
	
	
	
	
	
	eh.funcModEvent(target1, 804, function() {
		notesAFT.clearAFT();
	}, "clearAFT", false);
	
	
	for (beat in 804...869)
	{
	
		eh.funcTweenModEvent(target1, beat, 1,  ModConstants.getEaseFromString("pop"), 1.002, 1.008, function(v) {
			aftSprite.scale.set(v, v);
		}, "aftScale");
		
	}
	
	
	
	addResetEvent(function(){		
		PlayState.instance.variables.set("aftSpinner",0.42);
	});
	
	eh.funcTweenModEvent(target1, 868, 32,  ModConstants.getEaseFromString("quadOut"), 0.42, 0.05, function(v) {
		PlayState.instance.variables.set("aftSpinner",v);
	}, "aftSpinner");

	
	addUpdate(function(elapsed){
		if(aftSprite.alpha > 0){
			notesAFT.updateAFT();	
			if(Conductor.instance.songPosition >= 289692){
			
				var a:Float = 0.45;
				if (PlayState.instance.variables.exists("aftSpinner")){
					a = PlayState.instance.variables.get("aftSpinner");
				}
				aftSprite.angle = FlxMath.fastSin(Conductor.instance.songPosition/1000*2)*a;
			
				
			}
		}
	});	

	
	
	
	]])
	
	
	
end



