

function modsTimeline()
	addHaxeLibrary("ModuleHandler", "funkin.modding.module")
	runHaxeCode(
	[[
		var target1 = game.playerStrumline.mods;

		var dodgeModule = ModuleHandler.getModule("SawbladeAndDodgeModule_HazardVersion");

		if(dodgeModule!=null){

			addResetEvent(function(){
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", 0);
				}
			});	

			eh.funcTweenModEvent(target1, 592-0.5, 606-592,  ModConstants.getEaseFromString("linear"), 0.0, 0.5, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");

			eh.funcTweenModEvent(target1, 605.9, 0.1,  ModConstants.getEaseFromString("instant"), 0.5, 0.0, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");



			eh.funcTweenModEvent(target1, 992, 0.5,  ModConstants.getEaseFromString("instant"), 0.0, 0.125/2, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");

			eh.funcTweenModEvent(target1, 1052, 0.5,  ModConstants.getEaseFromString("instant"), 0.125/2, 0.0, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");

			/*
			eh.funcTweenModEvent(target1, 1056, 1184-1056,  ModConstants.getEaseFromString("linear"), 0.0, 0.5, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");

			eh.funcTweenModEvent(target1, 1184, 1200-1184,  ModConstants.getEaseFromString("linear"), 0.5, 0.0, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");
			*/

			eh.funcTweenModEvent(target1, 1216, 1248-1216,  ModConstants.getEaseFromString("linear"), 0.0, 0.5, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");


		}

		



	]])



end

