
function modsTimeline()

	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")

	runHaxeCode(
	[[
		var target1 = game.playerStrumline.mods;


		//Create AFT to capture notesCameras
		var freezeAFT:HazardAFT = new HazardAFT(game.camNotes);
		freezeAFT.recursive=false;
		setVar("freezeAFT",freezeAFT);

		
		var freezeSprite = createSpr("aftFreezeSprite");
		freezeSprite.loadGraphic(getVar("freezeAFT").bitmap);
		freezeSprite.screenCenter();	
		freezeSprite.camera = game.camAFT;
		freezeSprite.visible = false;
		freezeSprite.zIndex = 6000;



		//Create AFT to capture notesCameras
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
		notesAFT.targetFps(90);
		notesAFT.recursive=true;
		notesAFT.updateAFT();	
		setVar("notesAFT",notesAFT);

		var targetAlphaAmount:Float = 0.3;

		var aftSprite = createSpr("aftSprite");
		aftSprite.loadGraphic(getVar("notesAFT").bitmap);
		aftSprite.screenCenter();	
		aftSprite.camera = game.camNotes;
		aftSprite.scale.set(1.01, 1.01);
		aftSprite.alpha=targetAlphaAmount;

		aftSprite.zIndex = -1000;
		PlayState.instance.refresh();
		aftSprite.blend = ModConstants.blendModeFromString("overlay");


		var aftSprite2 = createSpr("aftSprite2");
		aftSprite2.loadGraphic(getVar("notesAFT").bitmap);
		aftSprite2.screenCenter();	
		aftSprite2.camera = game.camNotes;
		aftSprite2.scale.set(1.035, 1.035);
		aftSprite2.alpha=0;
		
		aftSprite2.blend = ModConstants.blendModeFromString("screen");


		aftSprite.zIndex = -1001;
		aftSprite2.zIndex = -1000;
		PlayState.instance.refresh();


		addUpdate(function(elapsed){
			if(aftSprite.alpha > 0 || aftSprite2.alpha > 0){ 
				notesAFT.update(elapsed);	
				aftSprite.angle = FlxMath.fastSin(Conductor.instance.currentBeatTime)*0.5;
				aftSprite2.angle = FlxMath.fastSin(Conductor.instance.currentBeatTime*2)*1;
			}
		});		

		
		addResetEvent(function(){	
			game.camNotes.x=0;	
			aftSprite.alpha = 0.0;
			aftSprite2.alpha = 0.0;
			freezeSprite.visible = false;
		});

		eh.funcModEvent(target1, 759.01, function() {
			freezeAFT.clearAFT();
			freezeAFT.updateAFT();
			game.camNotes.x = FlxG.width * -5;
			freezeSprite.visible = true;
		});

		eh.funcModEvent(target1, 760, function() {
			freezeAFT.clearAFT();
			game.camNotes.x = 0;
			freezeSprite.visible = false;
		});



		eh.funcModEvent(target1, 8, function() {
			notesAFT.clearAFT();
			notesAFT.bitmap.fillRect(notesAFT.rec, 0xFF000000);
		}, "aftClear", false);


		eh.funcModEvent(target1, 296, function() {
			notesAFT.clearAFT();
			notesAFT.bitmap.fillRect(notesAFT.rec, 0xFF000000);
		}, "aftClear", false);

		eh.funcModEvent(target1, 616, function() {
			notesAFT.clearAFT();
			notesAFT.bitmap.fillRect(notesAFT.rec, 0xFF000000);
		}, "aftClear", false);
		eh.funcModEvent(target1, 1016, function() {
			notesAFT.clearAFT();
			notesAFT.bitmap.fillRect(notesAFT.rec, 0xFF000000);
		}, "aftClear", false);

		eh.funcTweenModEvent(target1, 8, 1,  ModConstants.getEaseFromString("outExpo"), 0.0, targetAlphaAmount*0.7, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");

		eh.funcTweenModEvent(target1, 72, 1,  ModConstants.getEaseFromString("outExpo"),  targetAlphaAmount*0.7, 0, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");
		eh.funcTweenModEvent(target1, 1016, 1,  ModConstants.getEaseFromString("outExpo"), 0.0, targetAlphaAmount*0.7, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");

		eh.funcTweenModEvent(target1, 1016+64, 1,  ModConstants.getEaseFromString("outExpo"),  targetAlphaAmount*0.7, 0, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");


		eh.funcModEvent(target1, 696, function() {
			notesAFT.clearAFT();
		}, "aft2Clear", false);

		eh.funcTweenModEvent(target1, 696, 1,  ModConstants.getEaseFromString("outExpo"), 0.0, 0.2, function(v) {
			aftSprite2.alpha=v;
		}, "aft2Fade");
		eh.funcTweenModEvent(target1, 759, 1,  ModConstants.getEaseFromString("outExpo"), 0.2, 0.0, function(v) {
			aftSprite2.alpha=v;
		}, "aft2Fade");



		eh.funcTweenModEvent(target1, 296, 1,  ModConstants.getEaseFromString("outExpo"), 0.0, targetAlphaAmount, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");

		eh.funcTweenModEvent(target1, 359, 2,  ModConstants.getEaseFromString("inOutQuad"), targetAlphaAmount, 0.0, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");


		eh.funcTweenModEvent(target1, 616, 1,  ModConstants.getEaseFromString("outExpo"), 0.0, targetAlphaAmount, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");

		eh.funcTweenModEvent(target1, 676, 4,  ModConstants.getEaseFromString("linear"), targetAlphaAmount, 0, function(v) {
			aftSprite.alpha=v;
		}, "aftFade");



	]])


end

