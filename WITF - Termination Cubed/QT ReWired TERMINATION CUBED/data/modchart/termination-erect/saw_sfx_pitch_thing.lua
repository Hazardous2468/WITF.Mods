

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

			/*
			eh.funcTweenModEvent(target1, 704,4,  ModConstants.getEaseFromString("linear"), 0.0, 0.05, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");
			eh.funcTweenModEvent(target1, 708,4,  ModConstants.getEaseFromString("linear"), 0.05, 0.0, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");
			eh.funcTweenModEvent(target1, 720,4,  ModConstants.getEaseFromString("linear"), 0.0, 0.05, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");
			eh.funcTweenModEvent(target1, 720+4,4,  ModConstants.getEaseFromString("linear"), 0.05, 0.0, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");
			eh.funcTweenModEvent(target1, 736,4,  ModConstants.getEaseFromString("linear"), 0.0, 0.05, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");
			eh.funcTweenModEvent(target1, 736+4,4,  ModConstants.getEaseFromString("linear"), 0.05, 0.0, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");
			*/

			eh.funcTweenModEvent(target1, 752, 8,  ModConstants.getEaseFromString("linear"), 0.0, 0.25, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");

			eh.funcTweenModEvent(target1, 758.98, 0.02,  ModConstants.getEaseFromString("instant"), 0.0, 0.05, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");


			eh.funcTweenModEvent(target1, 822, 2,  ModConstants.getEaseFromString("inOutSine"), 0.05, 0.0, function(v) {
				if(dodgeModule!=null){
					dodgeModule.scriptSet("sfxPitchAdditive", v);
				}
			}, "sfxPitchAdditive");



		}

		



	]])



end

