function modsTimeline()
	addHaxeLibrary("ZProjectSprite", "funkin.graphics")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FlxColorUtil", "funkin.util")
	addHaxeLibrary("FlxTiledSprite", "flixel.addons.display")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		var aftRecursiveAlphaVal = 0.5;
	
		var backgroundCol:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFFFFFFFF);
		PlayState.instance.add(backgroundCol);
		game.customLuaSprites.set("bg", backgroundCol);
		backgroundCol.scrollFactor.set(0,0);
	
		setVar("gear1AngV", -60);
		setVar("gear2AngV", 60);
		setVar("gear3AngV", 50);
		setVar("gear4AngV", 60);
		setVar("gear5AngV", -13);
		setVar("gear6AngV", 12);
		setVar("gear7AngV", -60);
		setVar("gear8AngV", -10);
		var gearScrollFactor = 0.5;
		
		
		
		addResetEvent(function(){
			setVar("stageCamShake", 0);
		});	
		
		eh.funcTweenModEvent(target1, 520, 6,  ModConstants.getEaseFromString("inSine"), 0, 1, function(v) {
			setVar("stageCamShake", v);
		}, "stageCamShake");
		
		eh.funcTweenModEvent(target1, 580, 4,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			setVar("stageCamShake", v);
		}, "stageCamShake");
		
		eh.funcTweenModEvent(target1, 64, 12,  ModConstants.getEaseFromString("outCube"), 200, 0, function(v) {
			game.cameraFollowPoint.setPosition(0, v);
			FlxG.camera.focusOn(game.cameraFollowPoint.getPosition());	
		}, "stageCamScroll");
		
		eh.funcTweenModEvent(target1, 418, 8,  ModConstants.getEaseFromString("inOutSmoothStep"), 0, -200, function(v) {

			game.cameraFollowPoint.setPosition(0, v);
			FlxG.camera.focusOn(game.cameraFollowPoint.getPosition());	
		}, "stageCamScroll");
		
		eh.funcTweenModEvent(target1, 516,4,  ModConstants.getEaseFromString("inOutSmoothStep"), -150, 0, function(v) {

			game.cameraFollowPoint.setPosition(0, v);
			FlxG.camera.focusOn(game.cameraFollowPoint.getPosition());	
		}, "stageCamScroll");
		
		addUpdate(function(elapsed){
			if(Conductor.instance.currentBeatTime >= 520 && Conductor.instance.currentBeatTime < 584){
				var m = getVar("stageCamShake");

				var posX:Float = FlxMath.fastSin(Conductor.instance.songPosition/2000*32) * 18*m/4;
				var posY:Float = FlxMath.fastCos(Conductor.instance.songPosition/2000*30) * 10*m/4;
				
				game.cameraFollowPoint.setPosition(posX, posY);
				FlxG.camera.focusOn(game.cameraFollowPoint.getPosition());	
			}
		});	
	
	
		var randomGibPiece1 = createSpr("randomGibPiece1", 'It-Go/gear6_gib1');
		randomGibPiece1.scale.set(0.232,0.232);
		randomGibPiece1.angularVelocity = -340;
		
		var randomGibPiece2 = createSpr("randomGibPiece2", 'It-Go/gear1_gib1');
		randomGibPiece2.scale.set(0.234,0.234);
		randomGibPiece2.angularVelocity = 310;
		
		var randomGibPiece3 = createSpr("randomGibPiece3", 'It-Go/gear3_gib1');
		randomGibPiece3.scale.set(0.24,0.24);
		var randomGibPiece4 = createSpr("randomGibPiece4", 'It-Go/gear0_gib0');
		randomGibPiece4.scale.set(0.5,0.5);
		randomGibPiece4.angularVelocity = 111;
		
		addResetEvent(function(){
			randomGibPiece1.y = -FlxG.height;
			randomGibPiece1.x = 0;
			randomGibPiece2.y = -FlxG.height;
			randomGibPiece2.x = -200;
			randomGibPiece3.y = -FlxG.height;
			randomGibPiece3.x = 0;
			randomGibPiece3.angularVelocity = -555;
			randomGibPiece4.y = -FlxG.height;
			randomGibPiece4.x = 600;
		});
		
		
		eh.funcTweenModEvent(target1, 570.8, 5.,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece4").y = v;
		}, "randomGibPiece4");
		
		eh.funcTweenModEvent(target1, 555.7, 5.2,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece4").y = v;
		}, "randomGibPiece4");
		
		eh.funcTweenModEvent(target1, 575.4, 5,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece4").y = v;
			getSpr("randomGibPiece4").x = 222;
		}, "randomGibPiece4");
		
		
		eh.funcTweenModEvent(target1, 554.4, 5,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece3").y = v;
			randomGibPiece3.x = v/5;
		}, "randomGibPiece3");
		
		
		eh.funcTweenModEvent(target1, 562, 5,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece3").y = v;
			randomGibPiece3.x = 400;
		}, "randomGibPiece3");
		
		eh.funcTweenModEvent(target1, 537.8, 5,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece3").y = v;
			randomGibPiece3.x = v/5;
		}, "randomGibPiece3");
		
		eh.funcTweenModEvent(target1, 544.8, 5.7,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece3").y = v;
			randomGibPiece3.x = 300;
		}, "randomGibPiece3");
		
		eh.funcTweenModEvent(target1, 525.5, 6,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece2").y = v;
			randomGibPiece2.x = 160;
		}, "randomGibPiece2");
		
		eh.funcTweenModEvent(target1, 532, 7,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece2").y = v;
			randomGibPiece2.x = -200;
		}, "randomGibPiece2");
		
		eh.funcTweenModEvent(target1, 551, 7,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece2").y = v;
			randomGibPiece2.x = 300;
		}, "randomGibPiece2");
		
		eh.funcTweenModEvent(target1, 521, 6,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece1").y = v;
			randomGibPiece1.x = -5;
		}, "randomGibPiece1");
		
		eh.funcTweenModEvent(target1, 533.3, 6.2,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece1").y = v;
			randomGibPiece1.x = 260;
		}, "randomGibPiece1");
		
		eh.funcTweenModEvent(target1, 558.7, 6.2,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece1").y = v;
			randomGibPiece1.x = -20;
		}, "randomGibPiece1");
		
		
		eh.funcTweenModEvent(target1, 540.5, 6.2,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece1").y = v;
			randomGibPiece1.x = 66;
		}, "randomGibPiece1");
		
		eh.funcTweenModEvent(target1, 565.7, 6.1,  ModConstants.getEaseFromString("linear"), -FlxG.height, FlxG.height + 300, function(v) {
			getSpr("randomGibPiece1").y = v;
			randomGibPiece1.x = 5;
		}, "randomGibPiece1");
		

		eh.funcTweenModEvent(target1, 535.95, 2,  ModConstants.getEaseFromString("inBack"), 130-(FlxG.height/4), FlxG.height, function(v) {
			getSpr("gear1").y = v;
		}, "gear1_fall");
		
		eh.funcTweenModEvent(target1, 543.95, 2,  ModConstants.getEaseFromString("inBack"), 400-(FlxG.height/4), FlxG.height, function(v) {
			getSpr("gear7").y = v;
		}, "gear7_fall");
		
		eh.funcTweenModEvent(target1, 555, 2,  ModConstants.getEaseFromString("inQuad"), -165-(FlxG.height/4), FlxG.height, function(v) {
			getSpr("gear3").y = v;
		}, "gear3_fall");
		
		eh.funcTweenModEvent(target1, 576, 3,  ModConstants.getEaseFromString("inQuad"),386-(FlxG.height/4), FlxG.height*1.5, function(v) {
			getSpr("gear5").y = v;
		}, "gear5_fall");
		
		eh.funcTweenModEvent(target1, 577, 4,  ModConstants.getEaseFromString("inQuad"),-290-(FlxG.height/4), FlxG.height*1.5, function(v) {
			getSpr("gear6").y = v;
		}, "gear6_fall");
		
		eh.funcTweenModEvent(target1, 571.5, 2,  ModConstants.getEaseFromString("inQuad"), -570-(FlxG.height/4), FlxG.height*1.2, function(v) {
			getSpr("gear8").y = v;
		}, "gear8_fall");
		
		
		
		
		var gear4_gib1 = createSpr("gear4_gib1", 'It-Go/gear6_gib1');
		gear4_gib1.angularVelocity = -130;
		gear4_gib1.scale.set(0.38,0.38);
		var gear4_gib2 = createSpr("gear4_gib2", 'It-Go/gear6_gib2');
		gear4_gib2.angularVelocity = -130;
		gear4_gib2.scale.set(0.38,0.38);
		gear4_gib1.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		gear4_gib2.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		addResetEvent(function(){
			gear4_gib1.screenCenter();
			gear4_gib1.x += 540;
			gear4_gib1.y += 232;
			gear4_gib1.alpha= 0;			
			gear4_gib2.screenCenter();
			gear4_gib2.x += 540;
			gear4_gib2.y += 232;
			gear4_gib2.alpha= 0;
			
			gear4_gib2.x -= FlxG.width/4;
			gear4_gib2.y -= FlxG.height/4;
			gear4_gib1.x -= FlxG.width/4;
			gear4_gib1.y -= FlxG.height/4;
		});
		
		eh.funcTweenModEvent(target1, 552, 0.2,  ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			getSpr("gear4").alpha = v;
			getSpr("gear4_gib1").alpha = 1-v;
			getSpr("gear4_gib2").alpha = 1-v;
		}, "gear4_disappear");
		
		
		eh.funcTweenModEvent(target1, 552, 2.5,  ModConstants.getEaseFromString("inCube"), 79-(FlxG.height/4), 405, function(v) {
			getSpr("gear4_gib1").y = v;
		}, "gear4_gib1_fall");
		
		eh.funcTweenModEvent(target1, 552, 2,  ModConstants.getEaseFromString("inCube"), 78-(FlxG.height/4), 404, function(v) {
			getSpr("gear4_gib2").y = v;
		}, "gear4_gib2_fall");
		
		
		
		
		var gear2_gib1 = createSpr("gear2_gib1", 'It-Go/gear2_gib2');
		gear2_gib1.scale.set(1.6/2,1.6/2);
		var gear2_gib2 = createSpr("gear2_gib2", 'It-Go/gear2_gib1');
		gear2_gib2.scale.set(1.6/2,1.6/2);
		var gear2_gib3 = createSpr("gear2_gib3", 'It-Go/gear2_gib3');
		gear2_gib3.scale.set(1.6/2,1.6/2);
		gear2_gib1.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		gear2_gib3.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		gear2_gib2.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		addResetEvent(function(){
			gear2_gib2.screenCenter();
			gear2_gib2.x += 350;
			gear2_gib2.y -= 524;
			gear2_gib1.alpha= 0;			
			gear2_gib1.screenCenter();
			gear2_gib1.x += 350;
			gear2_gib1.y -= 524;
			gear2_gib2.alpha= 0;gear2_gib3.screenCenter();
			gear2_gib3.x += 350;
			gear2_gib3.y -= 524;
			gear2_gib3.x -= FlxG.width/4;
			gear2_gib3.y -= FlxG.height/4;
			gear2_gib2.x -= FlxG.width/4;
			gear2_gib2.y -= FlxG.height/4;
			gear2_gib1.x -= FlxG.width/4;
			gear2_gib1.y -= FlxG.height/4;
			gear2_gib3.alpha = 0;
		});
		

		
		
		eh.funcTweenModEvent(target1, 568, 0.2,  ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			getSpr("gear2").alpha = 0.0;
			getSpr("gear2_gib1").alpha = 1-v;
			getSpr("gear2_gib2").alpha = 1-v;
			getSpr("gear2_gib3").alpha = 1-v;
		}, "gear2_disappear");
		
		
		eh.funcTweenModEvent(target1, 567.8, 3.52,  ModConstants.getEaseFromString("inBack"), -595-(FlxG.height/4), FlxG.height, function(v) {
			getSpr("gear2_gib3").y = v;
		}, "gear2_gibs_fall2");
		
		eh.funcTweenModEvent(target1, 567.8, 3.7,  ModConstants.getEaseFromString("inBack"), -595-(FlxG.height/4), FlxG.height, function(v) {
			getSpr("gear2_gib1").y = v;
			getSpr("gear2_gib2").y = v;
		}, "gear2_gibs_fall1");
		
		
		eh.funcTweenModEvent(target1, 568, 5.0,  ModConstants.getEaseFromString("inQuad"), 0, -45, function(v) {
			var a = getSpr("gear2").angle;
			getSpr("gear2_gib1").angle = a;
			getSpr("gear2_gib2").angle = a+v;
			getSpr("gear2_gib3").angle = a+v+v;
		}, "gear2_gibs_angleCopy");
	
	
		
	
		var gear6 = createSpr("gear6", 'It-Go/gear1');
		gear6.angularVelocity = getVar("gear6AngV");
		gear6.scale.set(1.0,1.0);
		gear6.alpha=0.6;
		gear6.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		
		var gear5 = createSpr("gear5", 'It-Go/gear2');
		gear5.angularVelocity = getVar("gear5AngV");
		gear5.scale.set(2.95/2,2.95/2);
		gear5.alpha=0.6;
		gear5.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		
		addResetEvent(function(){
			gear5.screenCenter();
			gear5.x += 425;
			gear5.y += 450;
			gear6.screenCenter();
			gear6.x -= 512;
			gear6.y -= 142;
			
			gear5.x -= FlxG.width/4;
			gear6.x -= FlxG.width/4;
			gear5.y -= FlxG.height/4;
			gear6.y -= FlxG.height/4;
		});
	
		var gear1 = createSpr("gear1", 'It-Go/gear0');
		gear1.angularVelocity = getVar("gear1AngV");
		gear1.scale.set(1.0,1.0);
		gear1.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		
		addResetEvent(function(){
			gear1.screenCenter();
			gear1.x += 250;
			gear1.y -= 20;
			gear1.x -= FlxG.width/4;
			gear1.y -= FlxG.height/4;
		});
		
		var gear7 = createSpr("gear7", 'It-Go/gear0');
		gear7.angularVelocity = getVar("gear7AngV");
		gear7.scale.set(1.0,1.0);
		gear7.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		addResetEvent(function(){
			gear7.screenCenter();
			gear7.x -= 360;
			gear7.y += 240;
			gear7.x -= FlxG.width/4;
			gear7.y -= FlxG.height/4;
		});

		var gear2 = createSpr("gear2", 'It-Go/gear2');
		gear2.angularVelocity = getVar("gear2AngV");
		gear2.scale.set(1.6/2,1.6/2);
		gear2.scrollFactor.set(gearScrollFactor,gearScrollFactor);

		addResetEvent(function(){
			gear2.screenCenter();
			gear2.x += 350;
			gear2.y -= 524;
			gear2.x -= FlxG.width/4;
			gear2.y -= FlxG.height/4;
		});
		
		var gear4 = createSpr("gear4", 'It-Go/gear6');
		gear4.screenCenter();
		gear4.angularVelocity = getVar("gear4AngV");
		gear4.scale.set(0.38,0.38);
		gear4.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		gear4.x += 540;
		gear4.y += 232;
		gear4.x -= FlxG.width/4;
			gear4.y -= FlxG.height/4;
		

		var gear3 = createSpr("gear3", 'It-Go/gear2');
		gear3.angularVelocity = getVar("gear3AngV");
		gear3.scale.set(1.9/2.05/2,1.9/2.05/2);
		gear3.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		gear3.flipX = true;
		addResetEvent(function(){
			gear3.screenCenter();
			gear3.x -= 240;
			gear3.y -= 100;
			gear3.x -= FlxG.width/4;
			gear3.y -= FlxG.height/4;
		});
		
		var gear8 = createSpr("gear8", 'It-Go/gear3');
		gear8.angularVelocity = getVar("gear8AngV");
		gear8.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		addResetEvent(function(){
			gear8.screenCenter();
			gear8.x -= 850;
			gear8.y -= 400;
			gear8.x -= FlxG.width/4;
			gear8.y -= FlxG.height/4;
		});
		
		
		var setGearAngV = function(mult:Float = 1.0):Void{
			getSpr("gear6").angularVelocity = getVar("gear6AngV") * mult;
			getSpr("gear5").angularVelocity = getVar("gear5AngV") * mult;	
			getSpr("gear1").angularVelocity = getVar("gear1AngV") * mult;
			getSpr("gear2").angularVelocity = getVar("gear2AngV") * mult;
			getSpr("gear3").angularVelocity = getVar("gear3AngV") * mult;
			getSpr("gear4").angularVelocity = getVar("gear4AngV") * mult;	
			getSpr("gear7").angularVelocity = getVar("gear7AngV") * mult;
			getSpr("gear8").angularVelocity = getVar("gear8AngV") * mult;
		}
		
		addResetEvent(function(){
			getSpr("gear6").alpha = 0.6;	
			getSpr("gear5").alpha = 0.6;	
			getSpr("gear1").alpha = 1;	
			getSpr("gear2").alpha = 1;	
			getSpr("gear3").alpha = 1;	
			getSpr("gear4").alpha = 1;	
			getSpr("gear7").alpha = 1;	
			getSpr("gear8").alpha = 1;				
			
			setGearAngV(1.0);
		});	
		
		eh.funcModEvent(target1, 424, function() {
			getSpr("gear1").alpha = 0;	
			getSpr("gear2").alpha = 0;	
			getSpr("gear3").alpha = 0;	
			getSpr("gear4").alpha = 0;	
			getSpr("gear7").alpha = 0;	
			getSpr("gear8").alpha = 0;	
			getSpr("gear5").alpha = 0;	
			getSpr("gear6").alpha = 0;	
		}, "gearAlpha");
		
		eh.funcTweenModEvent(target1, 518, 2,  ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			getSpr("gear1").alpha = v;	
			getSpr("gear2").alpha = v;	
			getSpr("gear3").alpha = v;	
			getSpr("gear4").alpha = v;	
			getSpr("gear7").alpha = v;	
			getSpr("gear8").alpha = v;	
			getSpr("gear5").alpha = v*0.6;	
			getSpr("gear6").alpha = v*0.6;	
		}, "gearAlpha");
		
		eh.funcTweenModEvent(target1, 510,8,  ModConstants.getEaseFromString("inExpo"), aftRecursiveAlphaVal, 0, function(v) {
			getSpr("aftStageBG").alpha = v;		
		}, "aftFade");
		
		
		eh.funcTweenModEvent(target1, 8, 1,  ModConstants.getEaseFromString("linear"), 1, 0.05, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 70, 4,  ModConstants.getEaseFromString("linear"), 0.05, 0.3, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 134, 1,  ModConstants.getEaseFromString("linear"), 0.5, 0.05, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 136, 2,  ModConstants.getEaseFromString("outSmoothStep"), 0.05, 1, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 198, 2,  ModConstants.getEaseFromString("linear"), 1, 0.7, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 296, 2,  ModConstants.getEaseFromString("linear"), 1,2, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 328, 1,  ModConstants.getEaseFromString("outQuad"), 2,0, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 329, 4,  ModConstants.getEaseFromString("outQuad"), 1,4, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 358, 1,  ModConstants.getEaseFromString("outQuad"), 3,0, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		eh.funcTweenModEvent(target1, 359, 1,  ModConstants.getEaseFromString("outQuad"), -4,0, function(v) {
			setGearAngV(v);
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 360, 1,  ModConstants.getEaseFromString("linear"), 0,1, function(v) {
			setGearAngV(v);	
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 451, 1,  ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
			setGearAngV(v);	
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 452, 4,  ModConstants.getEaseFromString("linear"), 0, 2.7, function(v) {
			setGearAngV(v);	
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 518, 4,  ModConstants.getEaseFromString("outQuad"), 2.7, -2.0, function(v) {
			setGearAngV(v);	
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 581, 4,  ModConstants.getEaseFromString("outQuad"), -2, -0.02, function(v) {
			setGearAngV(v);	
		}, "gearVelocity");
		
		eh.funcTweenModEvent(target1, 592, 1,  ModConstants.getEaseFromString("outQuad"), -0.03, 0.0, function(v) {
			setGearAngV(v);	
		}, "gearVelocity");
	
	
		
		
		
		var end_pile = createSpr("end_pile", 'It-Go/end_pile');
		var scaleToFit:Float = FlxG.width / end_pile.width;
		end_pile.scale.set(scaleToFit,scaleToFit);
		addResetEvent(function(){
			end_pile.screenCenter();
			end_pile.y = FlxG.height;
		});
		
		eh.funcTweenModEvent(target1, 574, 12,  ModConstants.getEaseFromString("inOutSmootherStep"), FlxG.height, 0.0, function(v) {
			end_pile.y = v;
		}, "end_pile Reveal");
		
		var end_pile_sky = createSpr("end_pile_sky", 'It-Go/end_pile_sky');
		end_pile_sky.scale.set(scaleToFit,scaleToFit);
		end_pile_sky.blend = getBlendMode("add");
		addResetEvent(function(){
			end_pile_sky.screenCenter();
			end_pile_sky.y = -FlxG.height;
			end_pile_sky.alpha = 0;
		});
		
		eh.funcTweenModEvent(target1, 574, 12,  ModConstants.getEaseFromString("inOutSmootherStep"), -FlxG.height, -111, function(v) {
			end_pile_sky.y = v;
		}, "end_pile_sky Reveal move");
		
		eh.funcTweenModEvent(target1, 579, 7,  ModConstants.getEaseFromString("linear"), 0, 0.3, function(v) {
			end_pile_sky.alpha = v;
		}, "end_pile_sky Reveal alpha");

	
		for (i in 0...9){
			var explosion_transition = createSpr("explosion_transition-"+i, 'It-Go/explosion_1');
			explosion_transition.scrollFactor.set(gearScrollFactor,gearScrollFactor);
			
			
			explosion_transition.setPosition(-420,-400);
			switch(i){
				case 0:
					explosion_transition.setPosition(-440,150);
				case 1:
					explosion_transition.setPosition(222,-500);
				case 2:
					explosion_transition.setPosition(-420,-400);
				case 3:
					explosion_transition.setPosition(-440,20);
				case 4:
					explosion_transition.setPosition(166,0);
				case 5:
					explosion_transition.setPosition(-430,-288);
				case 6:
					explosion_transition.setPosition(200,-199);
				case 7:
					explosion_transition.setPosition(-440,20);
			}
			
			
			addResetEvent(function(){
				explosion_transition.scale.set(0.2,0.2);
				explosion_transition.alpha=0;
			});
			
			var cap = i;
			if(cap > 6) cap = 6;
			var b = 518 + (1/3 * cap);
			
			eh.funcTweenModEvent(target1, b, 1.8,  ModConstants.getEaseFromString("outCube"), 0.2, 0.75, function(v) {
				explosion_transition.scale.set(v,v);
			}, "explosion_transition_scale-"+i);
			
			eh.funcTweenModEvent(target1, b, 1.72,  ModConstants.getEaseFromString("impulse"), 0.0, 1, function(v) {
				explosion_transition.alpha=v;
			}, "explosion_transition_alpha-"+i);
		}
	
		var explosion1 = createSpr("explosion1", 'It-Go/explosion_1');
		explosion1.scrollFactor.set(gearScrollFactor,gearScrollFactor);
		addResetEvent(function(){
			explosion1.scale.set(0.5,0.5);
			explosion1.screenCenter();
			explosion1.alpha=0;
		});
		
		eh.funcTweenModEvent(target1, 524, 1.8,  ModConstants.getEaseFromString("outCube"), 0.3, 1.3, function(v) {
			explosion1.scale.set(v,v);
		}, "explosion1_scale");
		
		eh.funcTweenModEvent(target1, 524, 1.72,  ModConstants.getEaseFromString("impulse"), 0.0, 1, function(v) {
			explosion1.alpha=v;
		}, "explosion1_alpha-");
		
		eh.funcModEvent(target1, 524, function() {
			explosion1.setPosition(333,216);
		});
		
		eh.funcTweenModEvent(target1, 528, 1.8,  ModConstants.getEaseFromString("outCube"), 0.3, 1.1, function(v) {
			explosion1.scale.set(v,v);
		}, "explosion1_scale");
		
		eh.funcTweenModEvent(target1, 528, 1.72,  ModConstants.getEaseFromString("impulse"), 0.0, 1, function(v) {
			explosion1.alpha=v;
		}, "explosion1_alpha-");
		
		eh.funcModEvent(target1, 528, function() {
			explosion1.setPosition(-300,-600);
		});
		
		eh.funcTweenModEvent(target1, 536, 1.8,  ModConstants.getEaseFromString("outCube"), 0.3, 0.8, function(v) {
			explosion1.scale.set(v,v);
		}, "explosion1_scale");
		
		eh.funcTweenModEvent(target1, 536, 1.72,  ModConstants.getEaseFromString("impulse"), 0.0, 1, function(v) {
			explosion1.alpha=v;
		}, "explosion1_alpha-");
		
		eh.funcModEvent(target1, 536, function() {
			explosion1.setPosition(260,-166);
		});
		
		eh.funcTweenModEvent(target1, 544, 1.8,  ModConstants.getEaseFromString("outCube"), 0.3, 0.8, function(v) {
			explosion1.scale.set(v,v);
		}, "explosion1_scale");
		
		eh.funcTweenModEvent(target1, 544, 1.72,  ModConstants.getEaseFromString("impulse"), 0.0, 1, function(v) {
			explosion1.alpha=v;
		}, "explosion1_alpha-");
		
		eh.funcModEvent(target1, 544, function() {
			explosion1.setPosition(-555,122);
		});
	
		
		
		eh.funcTweenModEvent(target1, 552, 1.8,  ModConstants.getEaseFromString("outCube"), 0.3, 1.3, function(v) {
			explosion1.scale.set(v,v);
		}, "explosion1_scale");
		
		eh.funcTweenModEvent(target1, 552, 1.72,  ModConstants.getEaseFromString("impulse"), 0.0, 1, function(v) {
			explosion1.alpha=v;
		}, "explosion1_alpha-");
		
		eh.funcModEvent(target1, 552, function() {
			explosion1.setPosition(400,160);
		});
	

	
	
		var blackOutBG:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOutBG.alpha=1;
		PlayState.instance.add(blackOutBG);
		game.customLuaSprites.set("black", blackOutBG);
		
		
		//Create AFT to capture notesCameras
		var aftCapture_alt:HazardAFT = new HazardAFT(game.camNotes);
		aftCapture_alt.recursive=true;
		aftCapture_alt.updateAFT();	
		setVar("aftCapture_alt",aftCapture_alt);
		aftCapture_alt.targetFps(60);
				
		
		var aftStageBG:FunkinSprite = new FunkinSprite(0, 0).loadGraphic(aftCapture_alt.bitmap);
		PlayState.instance.add(aftStageBG);
		aftStageBG.scrollFactor.set();
		aftStageBG.cameras = [game.camNotes];
		game.customLuaSprites.set("aftStageBG", aftStageBG);
		aftStageBG.visible = false;
		aftStageBG.scale.set(1.05,1.05);
		
		
		
		var aftStageBG2:FunkinSprite = new FunkinSprite(0, 0).loadGraphic(getVar("aftCapture").bitmap);
		PlayState.instance.add(aftStageBG2);
		aftStageBG2.scrollFactor.set();
		game.customLuaSprites.set("aftStageBG2", aftStageBG2);
		aftStageBG2.visible = true;
		
		
		addUpdate(function(elapsed){
			//Only update the AFT when needed.
			if(Conductor.instance.currentBeatTime >= 450 && Conductor.instance.currentBeatTime < 520){
				aftCapture_alt.update(elapsed);	
				getVar("aftCapture").updateAFT();	
			}
		});	
		
		
		setVar("aftRecursiveAlphaVal", aftRecursiveAlphaVal);
		
		addResetEvent(function(){
			getSpr("aftStageBG").visible = false;		
			getSpr("aftStageBG").alpha = 0;		
			getSpr("aftStageBG2").visible = false;		
			game.camNotes.x = 0;
			
			ModConstants.grabStrumModTarget("3").strum.cameras = [game.camNotes];
			ModConstants.grabStrumModTarget("3").strum.visible = false;
			
		});	
		eh.funcModEvent(target1, 447, function() {
			getSpr("aftStageBG2").visible = true;	
			getSpr("aftStageBG").visible = true;	
			getSpr("aftStageBG").alpha = getVar("aftRecursiveAlphaVal");	
			getVar("aftCapture_alt").clearAFT();
			
			getVar("aftCapture").clearAFT();
			
			ModConstants.grabStrumModTarget("3").strum.cameras = [game.camHUD];
			ModConstants.grabStrumModTarget("3").strum.visible = true;
			
			game.camNotes.x = FlxG.width * 5;
		});
		
		eh.funcModEvent(target1, 456, function() {
			ModConstants.grabStrumModTarget("3").strum.visible = false;
		});
		
		eh.funcModEvent(target1, 520, function() {
			getSpr("aftStageBG").visible = false;	
			getSpr("aftStageBG2").visible = false;	
		});
		
		
		
		var doorLeft = createSpr("doorLeft", 'It-Go/door');
		doorLeft.scale.set(1.1,1.5);
		doorLeft.screenCenter();
		
		var doorRight = createSpr("doorRight", 'It-Go/door');
		doorRight.flipX = true;
		doorRight.flipY = false;
		doorRight.scale.set(1.1,1.5);
		doorRight.screenCenter();
		doorRight.offset.y = -100;

		eh.funcTweenModEvent(target1, 67.25, 2,  ModConstants.getEaseFromString("inOutBack"), 0.0, 0.1, function(v) {
			getSpr("doorLeft").offset.x = v*FlxG.width;
			getSpr("doorRight").offset.x = v*-FlxG.width;
		}, "doors");
		
		eh.funcTweenModEvent(target1, 70, 3,  ModConstants.getEaseFromString("inCubic"), 0.1, 1.1, function(v) {
			getSpr("doorLeft").offset.x = v*FlxG.width;
			getSpr("doorRight").offset.x = v*-FlxG.width;
		}, "doors");
		
		
		
		eh.funcTweenModEvent(target1, 420, 4,  ModConstants.getEaseFromString("outQuad"), 1.1, 0, function(v) {
			getSpr("doorLeft").offset.x = v*FlxG.width;
			getSpr("doorRight").offset.x = v*-FlxG.width;
		}, "doors");
		
		
		
		eh.funcTweenModEvent(target1, 451, 2,  ModConstants.getEaseFromString("outBack"), 0.0, 0.1, function(v) {
			getSpr("doorLeft").offset.x = v*FlxG.width;
			getSpr("doorRight").offset.x = v*-FlxG.width;
		}, "doors");
		
		eh.funcTweenModEvent(target1, 454, 3.5,  ModConstants.getEaseFromString("inCubic"), 0.1, 1.1, function(v) {
			getSpr("doorLeft").offset.x = v*FlxG.width;
			getSpr("doorRight").offset.x = v*-FlxG.width;
		}, "doors");
		
		
		
		warningStripLeft = new FlxTiledSprite(Paths.image('It-Go/warning_strip'), 226, FlxG.height, true, true);
		warningStripLeft.scrollFactor.set();
		PlayState.instance.add(warningStripLeft);
		game.customLuaSprites.set("warningStripLeft", warningStripLeft);
		warningStripLeft.x = FlxG.width*0.175 - warningStripLeft.width/2;
		
		warningStripRight = new FlxTiledSprite(Paths.image('It-Go/warning_strip'), 226, FlxG.height, true, true);
		warningStripRight.scrollFactor.set();
		warningStripRight.flipX = true;
		PlayState.instance.add(warningStripRight);
		game.customLuaSprites.set("warningStripRight", warningStripRight);
		warningStripRight.x = (FlxG.width*(1-0.175)) - warningStripRight.width/2;
		
		eh.funcTweenModEvent(target1, -12, 100,  ModConstants.getEaseFromString("linear"), 0.0, FlxG.height*10.0, function(v) {
			warningStripRight.scrollY = -v;
			warningStripLeft.scrollY = -v;
		}, "warningStripScroll");
		
		
		
		eh.funcTweenModEvent(target1, 32, 4,  ModConstants.getEaseFromString("linear"), 0.0, 0.2, function(v) {
			getSpr("warningStripRight").alpha = v;
			getSpr("warningStripLeft").alpha = v;
		}, "warningStripAlpha");
		
		eh.funcTweenModEvent(target1, 59,1.5,  ModConstants.getEaseFromString("linear"), 0.3, 0.0, function(v) {
			getSpr("warningStripRight").alpha = v;
			getSpr("warningStripLeft").alpha = v;
		}, "warningStripAlpha");
		
		addResetEvent(function(){
			getSpr("warningStripRight").alpha = 0;
			getSpr("warningStripLeft").alpha = 0;
			
			getSpr("bg").color = 0xFFFFFFFF;	
			getSpr("doorLeft").offset.x = 0;	
			getSpr("doorRight").offset.x = 0;	
			
			getSpr("black").alpha = 0.75;
			game.cameraFollowPoint.setPosition(0, 0);
			FlxG.camera.focusOn(game.cameraFollowPoint.getPosition());
		});	
		
		
		
		var blackOutBG2:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFFFFFFFF);
		PlayState.instance.add(blackOutBG2);
		game.customLuaSprites.set("black2", blackOutBG2);
		
		addResetEvent(function(){
			getSpr("black2").color = 0xFF000000;	
			getSpr("black2").alpha = 0;	
		});	
		
		eh.funcModEvent(target1, 32, function() {
			getSpr("black2").color = 0xFFFF0000;	
		});
		
		eh.funcModEvent(target1, 66, function() {
			getSpr("bg").color = 0xFF6C6B6B;	
		}, "b");
		
		eh.funcTweenModEvent(target1, 70, 2,  ModConstants.getEaseFromString("linear"), 1,0, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFF0000, 0xFF6B6B6B, v);	
		}, "b");
		
		eh.funcTweenModEvent(target1, 72, 2,  ModConstants.getEaseFromString("linear"), 0.75,0.62, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		eh.funcTweenModEvent(target1, 76, 1,  ModConstants.getEaseFromString("outQuad"), 0.62,0.55, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		eh.funcTweenModEvent(target1, 134, 2,  ModConstants.getEaseFromString("outQuad"), 0.55,0.65, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		eh.funcTweenModEvent(target1, 136, 1,  ModConstants.getEaseFromString("outQuad"), 0.65,0.4, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		
		eh.funcTweenModEvent(target1, 196, 5,  ModConstants.getEaseFromString("inOutSine"), 0.4,0.89, function(v) {
			getSpr("black").alpha=v;	
		}, "bl");
		
		
		eh.funcTweenModEvent(target1, 296, 1,  ModConstants.getEaseFromString("outQuad"), 0.89,0.6, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		
		eh.funcTweenModEvent(target1, 360, 1,  ModConstants.getEaseFromString("outQuint"), 0.6,0.4, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		
		eh.funcTweenModEvent(target1, 454, 2,  ModConstants.getEaseFromString("linear"), 0.4,0.1, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		eh.funcTweenModEvent(target1, 518, 2,  ModConstants.getEaseFromString("linear"), 0.1,0.25, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		
		
		eh.funcTweenModEvent(target1, 580, 4,  ModConstants.getEaseFromString("linear"), 0.25,0.75, function(v) {
			getSpr("black").alpha = v;
		}, "bl");
		
		
		
		
		eh.funcTweenModEvent(target1, 134, 1.5,  ModConstants.getEaseFromString("outQuad"), 0,1, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFF0000, 0xFFA07272, v);	
		}, "b");
		
		eh.funcTweenModEvent(target1, 136, 1,  ModConstants.getEaseFromString("outQuad"), 1,0, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFF7100, 0xFFA07272, v);	
		}, "b");
		
		eh.funcTweenModEvent(target1, 198, 4,  ModConstants.getEaseFromString("linear"), 0,1, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFF8900, 0xFF822424, v);	
		}, "b");
		
		eh.funcTweenModEvent(target1, 230, 4,  ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFF822424, 0xFFFFFFFF, v);	
		}, "b");
		
		eh.funcTweenModEvent(target1, 264, 2,  ModConstants.getEaseFromString("outQuad"), 1, 0, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFF00FF00, 0xFFFFFFFF, v);	
		}, "b");

		eh.funcModEvent(target1, 358, function() {
			getSpr("bg").color = 0xFFFFFFFF;	
		}, "b");
		
		for (i in 296...358){
			if(i%4 == 1){
				eh.funcTweenModEvent(target1, i, 2,  ModConstants.getEaseFromString("inSine"), 1,0, function(v) {
					getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF2412, v);		
				}, "b");
			}
			else if(i%4 == 3){
				eh.funcTweenModEvent(target1, i, 2,  ModConstants.getEaseFromString("inSine"), 1,0, function(v) {
					getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFF0099FF, v);		
				}, "b");
			}
		}
		
		eh.funcTweenModEvent(target1, 359, 0.01,  ModConstants.getEaseFromString("outQuad"), 1,0, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFF8900, 0xFF822424, v);		
		}, "b");
		
		eh.funcTweenModEvent(target1, 450, 6,  ModConstants.getEaseFromString("linear"), 0,1, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFF555555, 0xFFFFFFFF, v);		
		}, "b");
		
		eh.funcTweenModEvent(target1, 520, 3,  ModConstants.getEaseFromString("linear"), 0,1, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");
		
		
		eh.funcTweenModEvent(target1, 536-0.2, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.25, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");
		
		eh.funcTweenModEvent(target1, 536-0.2+4, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.25, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");
		eh.funcTweenModEvent(target1, 536-0.2+4+4, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.25, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");	
		eh.funcTweenModEvent(target1, 552-0.2, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.35, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");	
		eh.funcTweenModEvent(target1, 552-0.2+4, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.2, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");	
		eh.funcTweenModEvent(target1, 568-0.2, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.2, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");
		eh.funcTweenModEvent(target1, 572-0.2, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.2, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");
		eh.funcTweenModEvent(target1, 572-0.2+4, 4,  ModConstants.getEaseFromString("pop"), 1,1-0.2, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF8900, v);		
		}, "b");
		
		eh.funcTweenModEvent(target1, 580, 4,  ModConstants.getEaseFromString("linear"), 0,1, function(v) {
			getSpr("bg").color = FlxColorUtil.interpolate(0xFFFF8900, 0xFF555555, v);		
		}, "b");
		
		
		
		
		for (i in 32...60){
			if(i%4 == 0){
				eh.funcTweenModEvent(target1, i, 4,  ModConstants.getEaseFromString("bounce"), 0, 0.2, function(v) {
					getSpr("black2").alpha = v;
				}, "black2_colorpulse");
			}
		}


		var tripWires:Array<FunkinSprite> = [];
		for (i in 0...10){
			var tripwire:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(4, FlxG.width*4, 0xFFFFFFFF);
			tripwire.alpha=0.25;
			PlayState.instance.add(tripwire);
			tripWires.push(tripwire);
			tripwire.screenCenter();
			tripwire.x -= FlxG.width/2;
			tripwire.y -= FlxG.height;
			game.customLuaSprites.set("tripwire"+i, tripwire);
			
			
			tripwire.angularVelocity = FlxG.random.int(-20, 20);
			tripwire.x -= FlxG.random.int(-600, 600);
			tripwire.y -= FlxG.random.int(-600, 600);
			tripwire.angle = FlxG.random.int(0, 360);
			
			
			eh.funcTweenModEvent(target1, 33, 4,  ModConstants.getEaseFromString("inOutSine"), 0.3, 0, function(v) {
				tripwire.alpha = v;
			}, "tripwire"+i+"alpha");
			
			eh.funcTweenModEvent(target1, 424, 4,  ModConstants.getEaseFromString("outQuint"), 0.0, 0.3, function(v) {
				tripwire.alpha = v;
			}, "tripwire"+i+"alpha");
			
			eh.funcTweenModEvent(target1, 451, 1,  ModConstants.getEaseFromString("outExpo"), 0.3, 0.0, function(v) {
				tripwire.alpha = v;
			}, "tripwire"+i+"alpha");
			
		}
		
		addResetEvent(function(){
			for (s in 0...tripWires.length)
			{
				var newSpr = tripWires[s];
				newSpr.color = 0xFFFFFFFF;
				newSpr.alpha=0.25;
			}
		});
		
		eh.funcModEvent(target1, 31, function() {
			for (s in 0...tripWires.length)
			{
				var newSpr = tripWires[s];
				newSpr.color = 0xFFFF0000;
				newSpr.alpha=0.3;
			}
		});
		
		eh.funcModEvent(target1, 420, function() {
			for (s in 0...tripWires.length)
			{
				var newSpr = tripWires[s];
				newSpr.color = 0xFFFFFFFF;
				newSpr.alpha=0.0;
			}
		});
		
		for (beat in 424...451){
			if(beat%2 == 1){
			
				for (s in 0...tripWires.length)
				{
					eh.funcTweenModEvent(target1, beat, 1.1,  ModConstants.getEaseFromString("inSine"), 1, 0, function(v) {
						var tripwire = tripWires[s];
						tripwire.color = FlxColorUtil.interpolate(0xFFFFFFFF, 0xFFFF0000, v);
					}, "tripwire"+s+"col");
				}
			
				
			}
		}
		
		

		
		
		
	]])
	
end







