function modsTimeline()	
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
	
		//Create AFT to capture notesCameras
		var notesAFT:HazardAFT = new HazardAFT(game.camNotes);
		notesAFT.recursive=false;
		notesAFT.updateAFT();	
		setVar("notesAFT",notesAFT);
		
		
		
		var aftSprite = createSpr("aftSprite");
		aftSprite.loadGraphic(getVar("notesAFT").bitmap);
		aftSprite.screenCenter();	
		aftSprite.camera = game.camAFT;
				
		addResetEvent(function(){		
			aftSprite.camera = game.camAFT;
			aftSprite.angle = 0;
			game.camAFT.visible = false;
			game.camNotes.x = 0;
			game.camNotes.alpha=1;
			notesAFT.recursive=false;
			
			aftSprite.setGraphicSize(Std.int(notesAFT.w),  Std.int(notesAFT.h));
		});
		
		//44, 45, 46
		eh.funcModEvent(target1, 44, function() {
			game.camAFT.visible = true;
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 45, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 46, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 47, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		
		eh.funcTweenModEvent(target1, 44, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		eh.funcTweenModEvent(target1, 45, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		eh.funcTweenModEvent(target1, 46, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		
		
		
		eh.funcModEvent(target1, 76, function() {
			game.camAFT.visible = true;
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 77, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 78, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 79, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		
		eh.funcTweenModEvent(target1, 76, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		eh.funcTweenModEvent(target1, 77, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		eh.funcTweenModEvent(target1, 78, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		
		
		
		
		
		eh.funcModEvent(target1, 172, function() {
			game.camAFT.visible = true;
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 173, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 174, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		eh.funcModEvent(target1, 175, function() {
			//game.camNotes.alpha=1;
			notesAFT.updateAFT();	
		}, "showAFT");
		
		eh.funcTweenModEvent(target1, 172, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		eh.funcTweenModEvent(target1, 173, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		eh.funcTweenModEvent(target1, 174, 1,  ModConstants.getEaseFromString("outCubic"), 1,  0, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
		
		
		
		
		addUpdate(function(elapsed){
			if(Conductor.instance.songPosition >= 125000){
				notesAFT.updateAFT();	
			}
		});	
	
		
		eh.funcModEvent(target1, 392, function() {
			notesAFT.updateAFT();	
			aftSprite.alpha = 0.0;
			aftSprite.camera = game.camNotes;
		}, "showAFT");
		
		eh.funcModEvent(target1, 400, function() {
			aftSprite.alpha = 0.5;
			notesAFT.recursive=true;
			
			aftSprite.angle = 2;
			aftSprite.setGraphicSize(Std.int(notesAFT.w * 1.009),  Std.int(notesAFT.h* 1.009));
		}, "rec");
		
		
		eh.funcTweenModEvent(target1, 462, 4,  ModConstants.getEaseFromString("inOutQuad"), 2,  -3.3, function(v) {
			aftSprite.angle = v;
		}, "aft_despin");
		
		
		eh.funcTweenModEvent(target1, 528, 8,  ModConstants.getEaseFromString("outQuad"), -3.3,  0.1, function(v) {
			aftSprite.angle = v;
		}, "aft_despin");
		
		
		eh.funcTweenModEvent(target1, 535.5, 0.5,  ModConstants.getEaseFromString("inCubic"), 0.5,  0.8, function(v) {
			aftSprite.alpha = v;
		}, "aft_Fade");
		
	
	]])
end


