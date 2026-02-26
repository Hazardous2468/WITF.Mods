function modsTimeline()	

	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	runHaxeCode(
	[[
	
		var target1 = PlayState.instance.playerStrumline.mods;

	
		var glitch2 = new FlxRuntimeShader(Assets.getText(Paths.frag("TOOMANYTRUMPETS/glitch2")), null);
		glitch2.setFloat('amount', 0.021);
		glitch2.setInt('NUM_SAMPLES', 16);
		addUpdate(function(elapsed){
			glitch2.setFloat('uTime', Conductor.instance.songPosition/1000*2);
		});	
		
		addResetEvent(function(){
			glitch2.setFloat('amount', 0.021);
		});
		
		
		
		
		eh.funcTweenModEvent(target1, 96, 4,  ModConstants.getEaseFromString("outSine"), 0.021*4, 0.021, function(v) {
			glitch2.setFloat('amount', v);
		}, "glitch2");
		

		
		
		
		eh.funcTweenModEvent(target1, 536, 1,  ModConstants.getEaseFromString("outExpo"), 0.021, 0.021*2, function(v) {
			glitch2.setFloat('amount', v);
		}, "glitch2");
		
		
		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(glitch2));
		
		game.camHUD.filters=(newCamEffects);
		game.camNotes.filters=(newCamEffects);
		game.camAFT.filters=(newCamEffects);
	
		
		
		var bg = createSpr("bg", 'TRUMPETS/bg_temp');
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.screenCenter();	

		var bg_temp_desat = createSpr("bg_temp_desat", 'TRUMPETS/bg_temp_desat');
		bg_temp_desat.setGraphicSize(FlxG.width, FlxG.height);
		bg_temp_desat.screenCenter();	
		bg_temp_desat.alpha = 0;
		addResetEvent(function(){
			bg_temp_desat.alpha = 0;
		});
		
		eh.funcTweenModEvent(target1, 222, 2,  ModConstants.getEaseFromString("inQuad"), 0.0, 1, function(v) {
			bg_temp_desat.alpha = v;
		}, "bg_temp_desat");
		
		eh.funcTweenModEvent(target1, 316, 6,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			bg_temp_desat.alpha = v;
		}, "bg_temp_desat");
		
		eh.funcTweenModEvent(target1, 384, 8,  ModConstants.getEaseFromString("outQuad"), 0.0, 1, function(v) {
			bg_temp_desat.alpha = v;
		}, "bg_temp_desat");
		
		eh.funcTweenModEvent(target1, 392, 1,  ModConstants.getEaseFromString("outExpo"), 1,0, function(v) {
			bg_temp_desat.alpha = v;
		}, "bg_temp_desat");
		
		eh.funcTweenModEvent(target1, 526, 8,  ModConstants.getEaseFromString("inOutCubic"), 0.0, 1, function(v) {
			bg_temp_desat.alpha = v;
		}, "bg_temp_desat");
		
		
		
		
		
		var gear1 = createSpr("gear1", 'TRUMPETS/gear');
		gear1.screenCenter();		
		gear1.x = FlxG.width-gear1.width/2 - 50;
		gear1.y = FlxG.height-gear1.height/2-50;
		gear1.angularVelocity = -60;
		
		var gear2 = createSpr("gear2", 'TRUMPETS/gear');
		gear2.screenCenter();		
		gear2.x = -gear2.width/2 - 50;
		gear2.y = -40;
		gear2.angularVelocity = 54;
		
		var gear3 = createSpr("gear3", 'TRUMPETS/gear');
		gear3.screenCenter();		
		gear3.scale.set(2,2);
		gear3.x = FlxG.width*0.82-(gear3.width/2);
		gear3.y = -200;
		gear3.angularVelocity = 54;
		
		var gear4 = createSpr("gear4", 'TRUMPETS/gear');
		gear4.screenCenter();		
		gear4.scale.set(1.5,1.5);
		gear4.x = FlxG.width*0.3-(gear4.width/2);
		gear4.y = -250;
		gear4.angularVelocity = -24;
		
		var gear5 = createSpr("gear5", 'TRUMPETS/gear');
		gear5.screenCenter();		
		gear5.scale.set(2.2,2.2);
		gear5.x = FlxG.width*0.2-(gear5.width/2);
		gear5.y = FlxG.height-100;
		gear5.angularVelocity = 30;
		
		var gear6 = createSpr("gear6", 'TRUMPETS/gear');
		gear6.screenCenter();		
		gear6.scale.set(2.2,2.2);
		gear6.x = FlxG.width*0.2-(gear6.width/2);
		gear6.y = FlxG.height-100;
		gear6.angularVelocity = 30;
		
		var vignette = createSpr("vignette", 'TRUMPETS/vignette');
		vignette.setGraphicSize(FlxG.width, FlxG.height);
		vignette.screenCenter();	
		vignette.camera = game.camNotes;
		
		var alert_tl = createSpr("alert_tl", 'TRUMPETS/phase_basic');
		alert_tl.camera = game.camNotes;
		alert_tl.x = 0;
		alert_tl.y = 0;
		alert_tl.angle=270;
		
		var alert_bl = createSpr("alert_bl", 'TRUMPETS/phase_basic');
		alert_bl.camera = game.camNotes;
		alert_bl.x = 0;
		alert_bl.y = FlxG.height - alert_bl.height;
		alert_bl.angle=180;
		
		var alert_br = createSpr("alert_br", 'TRUMPETS/phase_basic');
		alert_br.camera = game.camNotes;
		alert_br.x = FlxG.width - alert_br.width;
		alert_br.y = FlxG.height - alert_br.height;
		alert_br.angle=90;
		
		var alert_main = createSpr("alert_mainbase", 'TRUMPETS/phase_base');
		alert_main.camera = game.camNotes;
		alert_main.x = FlxG.width - alert_main.width;
		alert_main.y = 0;
		
		var alerttxt_GATE = createSpr("alerttxt_GATE", 'TRUMPETS/phase_txt_GATE');
		alerttxt_GATE.camera = game.camNotes;
		alerttxt_GATE.setPosition(alert_main.x, alert_main.y);

		var alerttxt_CONSTRUCT = createSpr("alerttxt_CONSTRUCT", 'TRUMPETS/phase_txt_CONSTRUCT');
		alerttxt_CONSTRUCT.camera = game.camNotes;
		alerttxt_CONSTRUCT.setPosition(alert_main.x, alert_main.y);
		
		var alerttxt_FILTER = createSpr("alerttxt_FILTER", 'TRUMPETS/phase_txt_FILTER');
		alerttxt_FILTER.camera = game.camNotes;
		alerttxt_FILTER.setPosition(alert_main.x, alert_main.y);
		
		var alerttxt_TRANQUIL = createSpr("alerttxt_TRANQUIL", 'TRUMPETS/phase_txt_TRANQUIL');
		alerttxt_TRANQUIL.camera = game.camNotes;
		alerttxt_TRANQUIL.setPosition(alert_main.x, alert_main.y);
		
		var alerttxt_DISRUPTION = createSpr("alerttxt_DISRUPTION", 'TRUMPETS/phase_txt_DISRUPTION');
		alerttxt_DISRUPTION.camera = game.camNotes;
		alerttxt_DISRUPTION.setPosition(alert_main.x, alert_main.y);
		
		var alerttxt_STRETCH = createSpr("alerttxt_STRETCH", 'TRUMPETS/phase_txt_STRETCH');
		alerttxt_STRETCH.camera = game.camNotes;
		alerttxt_STRETCH.setPosition(alert_main.x, alert_main.y);
		
		var alerttxt_FATE = createSpr("alerttxt_FATE", 'TRUMPETS/phase_txt_FATE');
		alerttxt_FATE.camera = game.camNotes;
		alerttxt_FATE.setPosition(alert_main.x, alert_main.y);
		
		addResetEvent(function(){	
			alert_bl.alpha=0;
			alert_br.alpha=0;
			alert_tl.alpha=0;
			alert_main.alpha=0;
		
			alerttxt_DISRUPTION.alpha=0;
			alerttxt_FATE.alpha=0;
			alerttxt_CONSTRUCT.alpha=0;
			alerttxt_TRANQUIL.alpha=0;
			alerttxt_STRETCH.alpha=0;
			alerttxt_FILTER.alpha=0;
			alerttxt_GATE.alpha=0;
		});
		
		eh.funcTweenModEvent(target1, 0, 16,  ModConstants.getEaseFromString("inCubic"), 0, 1, function(v) {
			alert_bl.alpha=v;
			alert_br.alpha=v;
			alert_tl.alpha=v;
			alert_main.alpha=v;
		}, "goodbyeAlerts");
		
		eh.funcTweenModEvent(target1, 28, 4,  ModConstants.getEaseFromString("outQuad"), 0, 1, function(v) {
			alerttxt_GATE.alpha = v;
		}, "alerttxt_GATE");
		
		
		eh.funcTweenModEvent(target1, 94, 1,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			alerttxt_GATE.alpha = v;
		}, "alerttxt_GATE");
		
		eh.funcTweenModEvent(target1, 95, 1,  ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			alerttxt_CONSTRUCT.alpha = v;
		}, "alerttxt_CONSTRUCT");
		
		eh.funcTweenModEvent(target1, 159, 1,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			alerttxt_CONSTRUCT.alpha = v;
		}, "alerttxt_CONSTRUCT");
		
		eh.funcTweenModEvent(target1, 159, 1,  ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			alerttxt_FILTER.alpha = v;
		}, "alerttxt_FILTER");
		
		eh.funcTweenModEvent(target1, 222, 2,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			alerttxt_FILTER.alpha = v;
		}, "alerttxt_FILTER");
		
		eh.funcTweenModEvent(target1, 224, 2,  ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			alerttxt_TRANQUIL.alpha = v;
		}, "alerttxt_TRANQUIL");
		
		eh.funcTweenModEvent(target1, 316, 2,  ModConstants.getEaseFromString("outCubic"),1, 0, function(v) {
			alerttxt_TRANQUIL.alpha = v;
		}, "alerttxt_TRANQUIL");
		
		eh.funcTweenModEvent(target1, 319, 1,  ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			alerttxt_DISRUPTION.alpha = v;
		}, "alerttxt_DISRUPTION");
		
		eh.funcTweenModEvent(target1, 384, 4,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			alerttxt_DISRUPTION.alpha = v;
		}, "alerttxt_DISRUPTION");
		
		eh.funcTweenModEvent(target1, 392, 1,  ModConstants.getEaseFromString("outCubic"), 0, 1, function(v) {
			alerttxt_STRETCH.alpha = v;
		}, "alerttxt_STRETCH");
		
		eh.funcTweenModEvent(target1, 526, 4,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			alerttxt_STRETCH.alpha = v;
		}, "alerttxt_STRETCH");
		
		eh.funcTweenModEvent(target1, 526, 4,  ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			alerttxt_FATE.alpha = v;
		}, "alerttxt_FATE");
		
		eh.funcTweenModEvent(target1, 541, 3,  ModConstants.getEaseFromString("inExpo"), 1, 0, function(v) {
			alerttxt_FATE.alpha = v;
		}, "alerttxt_FATE");
		
		eh.funcTweenModEvent(target1, 541, 3,  ModConstants.getEaseFromString("inExpo"), 1, 0, function(v) {
			alert_bl.alpha=v;
			alert_br.alpha=v;
			alert_tl.alpha=v;
			alert_main.alpha=v;
		}, "goodbyeAlerts");
		

		
		
		
		
		
		
		
		
		

		
		//Create AFT to capture notesCameras
		var stageAFT:HazardAFT = new HazardAFT(game.camGame);
		stageAFT.recursive=false;
		stageAFT.updateAFT();	
		setVar("stageAFT",stageAFT);
		

		var aftSprite = createSpr("aftSprite_forBack");
		aftSprite.loadGraphic(getVar("stageAFT").bitmap);
		aftSprite.screenCenter();	
		aftSprite.camera = game.camGame;
		aftSprite.scrollFactor.set();
		addResetEvent(function(){		
			aftSprite.visible = false;
		});
		
		
		eh.funcModEvent(target1, 206, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});eh.funcModEvent(target1, 205, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});eh.funcModEvent(target1, 204, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		eh.funcModEvent(target1, 208.1, function() {
			aftSprite.visible = false;
		});
		
		eh.funcModEvent(target1, 172, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		eh.funcModEvent(target1, 173, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});eh.funcModEvent(target1, 174, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		
		
		
		eh.funcModEvent(target1, 96, function() {
			aftSprite.visible = false;
		});
		
		eh.funcModEvent(target1, 94, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		
		eh.funcModEvent(target1, 76, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		eh.funcModEvent(target1, 77, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		eh.funcModEvent(target1, 78, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		
		
		
		eh.funcModEvent(target1, 44, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		eh.funcModEvent(target1, 45, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		eh.funcModEvent(target1, 46, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		for (beat in 0...5)
		{
			var lol:Float = beat * 0.25;
			eh.funcModEvent(target1, 47+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
			eh.funcModEvent(target1, 79+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
			eh.funcModEvent(target1, 175+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
			eh.funcModEvent(target1, 207+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
		}
		eh.funcModEvent(target1, 48, function() {
			aftSprite.visible = false;
		});
		
		eh.funcModEvent(target1, 80, function() {
			aftSprite.visible = false;
		});
		eh.funcModEvent(target1, 176, function() {
			aftSprite.visible = false;
		});
		
		
		eh.funcModEvent(target1, 60, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		eh.funcModEvent(target1, 61, function() {
			aftSprite.visible = false;
			stageAFT.updateAFT();	
			aftSprite.visible = true;
		});
		
		eh.funcModEvent(target1, 64, function() {
			aftSprite.visible = false;
		});
		
		
		
		
		
		for (beat in 0...5)
		{
			var lol:Float = beat * 0.5;
			eh.funcModEvent(target1, 430+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
			
			
			eh.funcModEvent(target1, 462+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
			
			eh.funcModEvent(target1, 494+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
				eh.funcModEvent(target1, 526+lol, function() {
				aftSprite.visible = false;
				stageAFT.updateAFT();	
				aftSprite.visible = true;
			});
			
		}
		eh.funcModEvent(target1, 430+2, function() {
				aftSprite.visible = false;
			});
		eh.funcModEvent(target1, 462+2, function() {
				aftSprite.visible = false;
			});
			
		eh.funcModEvent(target1, 494+2, function() {
				aftSprite.visible = false;
			});
		eh.funcModEvent(target1, 526+2, function() {
				aftSprite.visible = false;
			});
		
		
		
		
		
		
		var bg_beat = createSpr("bg_beat", 'TRUMPETS/bg_crack');
		bg_beat.setGraphicSize(FlxG.width, FlxG.height);
		bg_beat.screenCenter();	
		bg_beat.alpha = 0;
		
		for (beat in 32...95)
		{
			eh.funcTweenModEvent(target1, beat, 1,  ModConstants.getEaseFromString("outCubic"), 0.32, 0, function(v) {
				bg_beat.alpha = v;
			}, "bg_pulse");
		}
		
		for (beat in 160...223)
		{
			eh.funcTweenModEvent(target1, beat, 1,  ModConstants.getEaseFromString("outCubic"), 0.28, 0, function(v) {
				bg_beat.alpha = v;
			}, "bg_pulse");
		}
		
		for (beat in 400...528)
		{
			eh.funcTweenModEvent(target1, beat, 1,  ModConstants.getEaseFromString("outCubic"), 0.8, 0, function(v) {
				bg_beat.alpha = v;
			}, "bg_pulse");
		}
		
		addResetEvent(function(){
			bg_beat.alpha = 0;
		});
		
		
		
		var blackOutBG:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOutBG.alpha=1;
		PlayState.instance.add(blackOutBG);
		game.customLuaSprites.set("black", blackOutBG);
		setResetEvent(function(){
			getSpr("black").alpha = 1;
		});	
		
		eh.funcTweenModEvent(target1, 0, 32,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			getSpr("black").alpha = v;
		}, "black");
		
		eh.funcTweenModEvent(target1, 544, 8,  ModConstants.getEaseFromString("inQuint"), 0, 1, function(v) {
			getSpr("black").alpha = v;
		}, "black");
		
		
	]])

	--set(0, 1, "3d")
	--ease(0, 16, "inExpo", 666, "vibrateMod", "bf")
end


