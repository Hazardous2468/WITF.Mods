function onCreate()
	notesBehindHUD(true)
end


function onBeatHit()
	runHaxeCode(
	[[	
		var curBeat = Conductor.instance.currentBeat;
		if (curBeat%2 == 0){
			var dot = game.customLuaSprites.get("REC_circle");
			if (dot != null){
				dot.visible = !dot.visible;
			}
		}
	]])
end


function modsTimeline()
	addHaxeLibrary("FlxBitmapText", "flixel.text")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxStringUtil", "flixel.util")
	addHaxeLibrary("FlxBar", "flixel.ui")
	runHaxeCode(
	[[
		var col = 0xFFBDBEAE;
	
		var target1 = PlayState.instance.playerStrumline.mods;
		
		// Hide original HUD elements
		game.healthBar.visible = false;
		game.healthBarBG.visible = false;
		game.iconP1.visible = false;
		game.iconP2.visible = false;
		game.scoreText.visible = false;

		
		// Create custom HUD elements
		
		
		var REC_txt = new FlxBitmapText(0, 0, "REC", Paths.getFlxBitmapFontFromAngelCode("fonts/vcr", "preload"));
		REC_txt.scale.set(1.5,1.5);
		//REC_txt.borderStyle = textBorderStyle("outline");
		//REC_txt.borderColor = 0xFF000000;
		//REC_txt.borderSize = 2;
		REC_txt.x = FlxG.width - REC_txt.width - 48;
		REC_txt.y = 28;
		REC_txt.color = col;
		REC_txt.camera = PlayState.instance.camHUD;
		PlayState.instance.add(REC_txt);
		game.customLuaSprites.set("REC_txt", REC_txt);
		
		var REC_circle = createSpr("REC_circle", 'looping_rooms/hud_rec_circle');
		REC_circle.cameras = [game.camHUD];
		REC_circle.x = REC_txt.x - REC_circle.width;
		REC_circle.y = REC_txt.y;
		REC_circle.scale.set(0.675, 0.675);
		
		var battery_bar = new FlxBar(0, 0, "LEFT_TO_RIGHT", 100, 26);
		battery_bar.setRange(0, 2);
		game.customLuaSprites.set("battery_bar", battery_bar);
		battery_bar.parent = PlayState.instance;
		battery_bar.parentVariable = 'healthLerp';
		battery_bar.createFilledBar(0, 0xFFFFFFFF);
		battery_bar.numDivisions = Std.int(104/8);
		battery_bar.cameras = [game.camHUD];
		PlayState.instance.add(battery_bar);
		battery_bar.value = 1;
		battery_bar.x = 40+8;
		battery_bar.y = 26+8;
		
		var battery_sprite = createSpr("battery_sprite", 'looping_rooms/battery_bar_spr');
		battery_sprite.cameras = [game.camHUD];
		battery_sprite.x = 40;
		battery_sprite.y = 26;
		
		
		var battery_txt = new FlxBitmapText(0, 0, "??%", Paths.getFlxBitmapFontFromAngelCode("fonts/vcr", "preload"));
		battery_txt.scale.set(1.0,1.0);
		battery_txt.color = col;
		battery_txt.camera = PlayState.instance.camHUD;
		battery_txt.x = battery_sprite.x + battery_sprite.width + 12;
		battery_txt.y = battery_sprite.y + 10;
		PlayState.instance.add(battery_txt);
		game.customLuaSprites.set("battery_txt", battery_txt);
		
		
		
		
		var timeInfoTxt = new FlxBitmapText(0, 0, "songPos: null", Paths.getFlxBitmapFontFromAngelCode("fonts/vcr", "preload"));
		timeInfoTxt.scale.set(1.5,1.5);
		//timeInfoTxt.borderStyle = textBorderStyle("outline");
		//timeInfoTxt.borderColor = 0xFF000000;
		//timeInfoTxt.borderSize = 2;
		timeInfoTxt.x = 58;
		timeInfoTxt.y = FlxG.height - timeInfoTxt.height - 28;
		timeInfoTxt.color = col;
		timeInfoTxt.camera = PlayState.instance.camHUD;
		PlayState.instance.add(timeInfoTxt);
		game.customLuaSprites.set("timeInfoTxt", timeInfoTxt);
		
		var scoreTxt = new FlxBitmapText(0, 0, "???", Paths.getFlxBitmapFontFromAngelCode("fonts/vcr", "preload"));
		scoreTxt.scale.set(1.25,1.25);
		//scoreTxt.borderStyle = textBorderStyle("outline");
		//scoreTxt.borderColor = 0xFF000000;
		//scoreTxt.borderSize = 2;
		scoreTxt.x = FlxG.width - scoreTxt.width - 64;
		scoreTxt.y = FlxG.height - scoreTxt.height - 32;
		scoreTxt.color = col;
		scoreTxt.camera = PlayState.instance.camHUD;
		PlayState.instance.add(scoreTxt);
		game.customLuaSprites.set("scoreTxt", scoreTxt);
		

		
		
		addUpdate(function(elapsed){
		
			battery_txt.text = Math.floor(game.health * 100/2) + "%";
			
			var curTime:Float = Conductor.instance.songPosition;		
			var secondsTotal:Int = Math.floor(curTime / 1000);
			if(secondsTotal < 0) secondsTotal = 0;
			timeInfoTxt.text = FlxStringUtil.formatTime(secondsTotal, false);
			timeInfoTxt.text += ":"+Std.string(Math.floor(curTime-(secondsTotal*1000)));
			
			//battery_bar.value = game.healthLerp;
			
			scoreTxt.text = game.scoreText.text;
			scoreTxt.x = FlxG.width - scoreTxt.width - 54;
		});	
		
		
		var hud_overlay = createSpr("hud_overlay", 'looping_rooms/hud_layer1');
		var scaleFactor = FlxG.width / hud_overlay.width;
		
		hud_overlay.scale.set(scaleFactor, 1);
		hud_overlay.screenCenter();	
		hud_overlay.cameras = [game.camHUD];
		
		
		var scanLines_overlay = createSpr("scanLines_overlay", 'looping_rooms/scan_lines');
		scanLines_overlay.scale.set(scaleFactor,scaleFactor);
		scanLines_overlay.screenCenter();	
		scanLines_overlay.cameras = [game.camHUD];
		scanLines_overlay.alpha=0.333;

		var noise:FunkinSprite = new FunkinSprite();
		noise.frames = Paths.getSparrowAtlas('looping_rooms/noise');	
		noise.animation.addByPrefix('idle', 'noise', 48, true);	
		noise.animation.play("idle");
		game.customLuaSprites.set("noise", noise);
		game.add(noise);
		noise.scrollFactor.set();
		noise.setGraphicSize(FlxG.width, FlxG.height);
		noise.screenCenter();
		noise.cameras = [game.camHUD];
		noise.alpha = 0.12;
		
		
		var cam_out = createSpr("cam_out", 'looping_rooms/cam_room_edited');
		cam_out.scale.set(scaleFactor,scaleFactor);
		cam_out.screenCenter();	
		cam_out.cameras = [game.camHUD];
		
		
		eh.funcModEvent(target1, 0, function() {
			game.defaultHUDCameraZoom = 1;
			game.currentCameraZoom = 1;
		}, "zoom reset", false);
		
		eh.funcTweenModEvent(target1, 323, 352-323,  ModConstants.getEaseFromString("smootherStepIn"), 1, 0.575, function(v) {
			game.defaultHUDCameraZoom = v;
			game.currentCameraZoom = v;
			//game.camHUD.zoom = v;
		});
		
		
		
		
		var blackOut:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOut.scrollFactor.set();
		game.customLuaSprites.set("blackOut", blackOut);
		PlayState.instance.add(blackOut);
		blackOut.screenCenter();
		blackOut.cameras = [game.camHUD];
		
		eh.funcTweenModEvent(target1, 0, 3, ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			blackOut.alpha = v;
		}, "blackOut");
		
		eh.funcTweenModEvent(target1, 324, 352-324, ModConstants.getEaseFromString("linear"), 0, 0.12, function(v) {
			blackOut.alpha = v;
		}, "blackOut");
		
		eh.funcTweenModEvent(target1, 355, 2, ModConstants.getEaseFromString("linear"), 0.12, 1, function(v) {
			blackOut.alpha = v;
		}, "blackOut");
		
		addResetEvent(function(){
			blackOut.alpha = 1;
		});
		
		
		
	]])
end
