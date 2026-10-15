function modsTimeline()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("HazardAFT", "funkin.play.modchartSystem")
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;	
		
		var bloomShader = new FlxRuntimeShader(Assets.getText(Paths.frag("looping_rooms/bloom")), null);
		addResetEvent(function(){
			bloomShader.setFloat('BLOOM_INTENSITY', 1.25);
			bloomShader.setFloat('BLOOM_THRESHOLD', 0.25);
			bloomShader.setInt('BLUR_ITERATIONS', 2);
			bloomShader.setFloat('BLUR_SIZE', 0.015);
			bloomShader.setInt('BLUR_SUBDIVISIONS', 8);
			bloomShader.setBool('BLOOM_ONLY', false);
			bloomShader.setBool('DO_ALPHA', true);
			bloomShader.setBool('ENABLED', true);
		});	
		
		
		var wackyShader = new FlxRuntimeShader(Assets.getText(Paths.frag("looping_rooms/bloom")), null);
		addResetEvent(function(){
			wackyShader.setFloat('BLOOM_INTENSITY', 2);
			wackyShader.setFloat('BLOOM_THRESHOLD', 0.25);
			wackyShader.setInt('BLUR_ITERATIONS', 3);
			wackyShader.setFloat('BLUR_SIZE', 0.0175);
			wackyShader.setInt('BLUR_SUBDIVISIONS', 10);
			wackyShader.setBool('BLOOM_ONLY', true);
			wackyShader.setBool('DO_ALPHA', true);
			wackyShader.setBool('ENABLED', false);
		});	
		
		eh.funcModEvent(target1, 164, function() {
			wackyShader.setBool('ENABLED', true);
		});
		eh.funcModEvent(target1, 196, function() {
			wackyShader.setBool('ENABLED', false);
		});
		
		
		
		
		var newCamEffects_stage:Array<BitmapFilter>=[];
		newCamEffects_stage.push(new ShaderFilter(wackyShader));
		newCamEffects_stage.push(new ShaderFilter(bloomShader));
		game.camGame.filters = newCamEffects_stage;
		
		var sobelShader = new FlxRuntimeShader(Assets.getText(Paths.frag("looping_rooms/sobel_filter")), null);

		var newCamEffects_stage_2:Array<BitmapFilter>=[];
		newCamEffects_stage_2.push(new ShaderFilter(sobelShader));
		newCamEffects_stage_2.push(new ShaderFilter(bloomShader));
		
		
		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(bloomShader));
		game.camNotes.filters = newCamEffects;
		game.camHUD.filters = newCamEffects;
		
		
		
		
		var backgroundsAll:Array<FlxSprite> = [];
		var backgrounds_water:Array<FlxSprite> = [];
		var backgrounds_default:Array<FlxSprite> = [];
		function createBG(imagePath:String, type:String){
			var bg = createSpr("bg-"+imagePath, imagePath, false);
			
			PlayState.instance.customLuaSprites.set("bg-"+imagePath, bg);
			game.currentStage.add(bg);
			bg.zIndex = 5;
			
			game.currentStage.add(bg);
			
			bg.screenCenter();	
			bg.camera = game.camGame;
			backgroundsAll.push(bg);
			if (type=="water"){
				backgrounds_water.push(bg);
			}else if (type=="default"){
				backgrounds_default.push(bg);
			}
		}
		createBG('looping_rooms/bg1', "water");
		createBG('looping_rooms/bg2', "water");
		createBG('looping_rooms/bg3', "water");
		createBG('looping_rooms/bg4', "water");
		createBG('looping_rooms/bg5', "water");
		
		var backgrounds_water_brightness:Array<Float> = [
		-7, -4, -46, -16, -8, -8
		];
		setVar("backgrounds_water_brightness", backgrounds_water_brightness);
		
		var backgrounds_default_brightness:Array<Float> = [
		-64, 0, -105, -10, -42, -20, -16, -1, 0
		];
		setVar("backgrounds_default_brightness", backgrounds_default_brightness);
		
		createBG('looping_rooms/VRChat_1920x1080_2022-06-02_01-23-39.302', "default");
		createBG('looping_rooms/unsplash/angie-warren-EZMOlrocHDw-unsplash', "default");
		createBG('looping_rooms/unsplash/scarbor-siu-Ecb9O-btHYs-unsplash', "default");
		createBG('looping_rooms/unsplash/alex-kalinin-wS0vGoGIMlc-unsplash', "default");
		createBG('looping_rooms/unsplash/dynamic-wang-HEIUW9mM6_Q-unsplash', "default");
		createBG('looping_rooms/unsplash/leiada-krozjhen-mMC_hPMl9D4-unsplash', "default");
		createBG('looping_rooms/unsplash/scarbor-siu-hfuGK3XdYEc-unsplash', "default");
		createBG('looping_rooms/unsplash/nolan-issac-K5sjajgbTFw-unsplash', "default");
			
		
		
		setVar("backgrounds", backgroundsAll);
		setVar("backgrounds_default", backgrounds_default);
		setVar("backgrounds_water", backgrounds_water);
		setVar("curBackID_water", 0);
		setVar("curBackID_default", 0);
		setVar("curBackgroundSet", "none");
		
		addResetEvent(function(){
			setVar("curBackgroundSet", "none");
		});	
		
		eh.funcModEvent(target1, 3.5, function() {
			setVar("curBackgroundSet", "default");
		});
		eh.funcModEvent(target1, 17.5, function() {
			setVar("curBackgroundSet", "none");
		});
		eh.funcModEvent(target1, 19.5, function() {
			setVar("curBackgroundSet", "default");
		});
		eh.funcModEvent(target1, 35.5, function() {
			setVar("curBackgroundSet", "none");
		});
		eh.funcModEvent(target1, 67.5, function() {
			setVar("curBackgroundSet", "default");
		});
		eh.funcModEvent(target1, 145.5, function() {
			setVar("curBackgroundSet", "none");
		});
		eh.funcModEvent(target1, 147.5, function() {
			setVar("curBackgroundSet", "default");
		});
		eh.funcModEvent(target1, 95.5, function() {
			setVar("curBackgroundSet", "none");
		});
		eh.funcModEvent(target1, 131.5, function() {
			setVar("curBackgroundSet", "default");
		});
		
		
		eh.funcModEvent(target1, 164.2, function() {
			setVar("curBackgroundSet", "none");
		});
		
		eh.funcModEvent(target1, 194, function() {
			setVar("curBackgroundSet", "water");
		});
		eh.funcModEvent(target1, 223.75, function() {
			setVar("curBackgroundSet", "none");
		});
		eh.funcModEvent(target1, 291.65, function() {
			setVar("curBackgroundSet", "default");
		});
		eh.funcModEvent(target1, 323.65, function() {
			setVar("curBackgroundSet", "water");
		});
		eh.funcModEvent(target1, 351.7, function() {
			setVar("curBackgroundSet", "none");
		});
		
		
		
		
		
		var calmBGS_first:Array<FlxSprite> = [];
		var scrollAmounts_first:Array<Float> = [];
		var yPositions_first:Array<Float> = [];
		function createCalmBack_first(which:String, imagePath:String){
			var newSprite = new ZSprite(0,0);
			newSprite.scrollFactor.set();
			newSprite.loadGraphic(Paths.image(imagePath));
			newSprite.camera = game.camGame;
			newSprite.screenCenter();
			PlayState.instance.customLuaSprites.set(which, newSprite);
			
			game.currentStage.add(newSprite);
			newSprite.zIndex = 10;
			
			if (calmBGS_first.length > 0){
				var previous = calmBGS_first[calmBGS_first.length-1];
				if(previous!=null){
					//newSprite.y = previous.y + previous.height;
					newSprite.y = previous.y;
					newSprite.y += previous.frameHeight;
					//print(calmBGS.length-1);
				}
			}
			calmBGS_first.push(newSprite);
			scrollAmounts_first.push(-newSprite.height);
			yPositions_first.push(newSprite.y);
			
			newSprite.color = 0xFFD3D3D3;
		}
		createCalmBack_first("calm_bg_first_1", 'looping_rooms/bg2');
		createCalmBack_first("calm_bg_first_2", 'looping_rooms/bg3');
		createCalmBack_first("calm_bg_first_3", 'looping_rooms/bg4');
		createCalmBack_first("calm_bg_first_4", 'looping_rooms/bg5');
		
		addResetEvent(function(){
			for (i in 0...calmBGS_first.length)
			{
				var s = calmBGS_first[i];
				s.y = yPositions_first[i];
				s.alpha=0;
			}
		});	
		
		
		eh.funcTweenModEvent(target1, 36, 0.05, ModConstants.getEaseFromString("instant"), 0, 1, function(v) {
			for (i in 0...calmBGS_first.length)
			{
				var s = calmBGS_first[i];
				s.alpha = v;
			}
		}, "calm_background_first_fade");
		
		eh.funcTweenModEvent(target1, 68, 0.05, ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			for (i in 0...calmBGS_first.length)
			{
				var s = calmBGS_first[i];
				s.alpha = v;
			}
		}, "calm_background_first_fade");
		
		
		var curScroll = 0;
		var targetScroll = curScroll + scrollAmounts_first[0];
		eh.funcTweenModEvent(target1, 41, 3, ModConstants.getEaseFromString("inOutSine"), curScroll, targetScroll, function(v) {
			for (i in 0...calmBGS_first.length)
			{
				var s = calmBGS_first[i];
				s.y = yPositions_first[i] + v;
			}
		}, "calm_background_first_scroll");
		
		curScroll = targetScroll;
		targetScroll = curScroll + scrollAmounts_first[1];
		eh.funcTweenModEvent(target1, 41+8, 3, ModConstants.getEaseFromString("inOutSine"), curScroll, targetScroll, function(v) {
			for (i in 0...calmBGS_first.length)
			{
				var s = calmBGS_first[i];
				s.y = yPositions_first[i] + v;
			}
		}, "calm_background_first_scroll");
		
		curScroll = targetScroll;
		targetScroll = curScroll + scrollAmounts_first[2];
		eh.funcTweenModEvent(target1, 41+16, 3, ModConstants.getEaseFromString("inOutSine"), curScroll, targetScroll, function(v) {
			for (i in 0...calmBGS_first.length)
			{
				var s = calmBGS_first[i];
				s.y = yPositions_first[i] + v;
			}
		}, "calm_background_first_scroll");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		var calmBGS:Array<FlxSprite> = [];
		var scrollAmounts:Array<Float> = [];
		var yPositions:Array<Float> = [];
		function createCalmBack(which:String, imagePath:String){
			var newSprite = new ZSprite(0,0);
			newSprite.scrollFactor.set();
			newSprite.loadGraphic(Paths.image(imagePath));
			newSprite.camera = game.camGame;
			newSprite.screenCenter();
			PlayState.instance.customLuaSprites.set(which, newSprite);
			
			game.currentStage.add(newSprite);
			newSprite.zIndex = 10;
			
			if (calmBGS.length > 0){
				var previous = calmBGS[calmBGS.length-1];
				if(previous!=null){
					//newSprite.y = previous.y + previous.height;
					newSprite.y = previous.y;
					newSprite.y += previous.frameHeight;
					//print(calmBGS.length-1);
				}
			}
			calmBGS.push(newSprite);
			scrollAmounts.push(-newSprite.height);
			yPositions.push(newSprite.y);
			
			newSprite.color = 0xFFD3D3D3;
		}
		createCalmBack("calm_bg_1", 'looping_rooms/bg2');
		createCalmBack("calm_bg_2", 'looping_rooms/bg3');
		createCalmBack("calm_bg_3", 'looping_rooms/bg4');
		createCalmBack("calm_bg_4", 'looping_rooms/bg5');
		
		addResetEvent(function(){
			for (i in 0...calmBGS.length)
			{
				var s = calmBGS[i];
				s.y = yPositions[i];
				s.alpha=0;
			}
		});	
		
		
		eh.funcTweenModEvent(target1, 164, 2, ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
			for (i in 0...calmBGS.length)
			{
				var s = calmBGS[i];
				s.alpha = v;
			}
		}, "calm_background_fade");
		eh.funcTweenModEvent(target1, 196, 0.1, ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
			for (i in 0...calmBGS.length)
			{
				var s = calmBGS[i];
				s.alpha = v;
			}
		}, "calm_background_fade");
		
		
		curScroll = 0;
		targetScroll = curScroll + scrollAmounts[0];
		eh.funcTweenModEvent(target1, 169, 3, ModConstants.getEaseFromString("inOutSine"), curScroll, targetScroll, function(v) {
			for (i in 0...calmBGS.length)
			{
				var s = calmBGS[i];
				s.y = yPositions[i] + v;
			}
		}, "calm_background_scroll");
		
		curScroll = targetScroll;
		targetScroll = curScroll + scrollAmounts[1];
		eh.funcTweenModEvent(target1, 169+8, 3, ModConstants.getEaseFromString("inOutSine"), curScroll, targetScroll, function(v) {
			for (i in 0...calmBGS.length)
			{
				var s = calmBGS[i];
				s.y = yPositions[i] + v;
			}
		}, "calm_background_scroll");
		
		curScroll = targetScroll;
		targetScroll = curScroll + scrollAmounts[2];
		eh.funcTweenModEvent(target1, 169+16, 3, ModConstants.getEaseFromString("inOutSine"), curScroll, targetScroll, function(v) {
			for (i in 0...calmBGS.length)
			{
				var s = calmBGS[i];
				s.y = yPositions[i] + v;
			}
		}, "calm_background_scroll");
		
		
		
		var spiralShader = new FlxRuntimeShader(Assets.getText(Paths.frag("looping_rooms/spiral")), null);
		addUpdate(function(elapsed){
			spiralShader.setFloat('iTime', Conductor.instance.songPosition/1000);
		});	
		spiralShader.setFloat('_alpha', 0.0);
		addResetEvent(function(){
			spiralShader.setFloat('_alpha', 0.0);
		});	
		
		var spiralBack:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFFFF0000);
		spiralBack.scrollFactor.set();
		game.customLuaSprites.set("spiralBack", spiralBack);
		game.currentStage.add(spiralBack);
		spiralBack.zIndex = 75;
		spiralBack.screenCenter();
		spiralBack.camera = game.camGame;
		spiralBack.shader = spiralShader;
		
		
		
		eh.funcTweenModEvent(target1, 96, 4, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			spiralShader.setFloat('_alpha', v);
		}, "spiral_fade");
		
		eh.funcTweenModEvent(target1, 130,2, ModConstants.getEaseFromString("inOutSine"), 1, 0, function(v) {
			spiralShader.setFloat('_alpha', v);
		}, "spiral_fade");
		
		eh.funcTweenModEvent(target1, 224, 4, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			spiralShader.setFloat('_alpha', v);
		}, "spiral_fade");
		
		eh.funcTweenModEvent(target1, 258, 0.1, ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
			spiralShader.setFloat('_alpha', v);
		}, "spiral_fade");
		


		var end_bg1 = createSpr("end_bg1", "looping_rooms/back", false);
		PlayState.instance.customLuaSprites.set("end_bg1", end_bg1);
		game.currentStage.add(end_bg1);
		end_bg1.zIndex = 10;
		game.currentStage.add(end_bg1);
		end_bg1.screenCenter();	
		end_bg1.camera = game.camGame;
		
		eh.funcTweenModEvent(target1, 260, 1, ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
			end_bg1.alpha=v;
		},"end_bg1_alpha");
		eh.funcTweenModEvent(target1, 288, 2, ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
			end_bg1.alpha=v;
		},"end_bg1_alpha");
		
		eh.funcTweenModEvent(target1, 324, 32, ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
			end_bg1.alpha=v;
		},"end_bg1_alpha");
		
		eh.funcTweenModEvent(target1, 352, 0.1, ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
			end_bg1.alpha=v;
		},"end_bg1_alpha");
		
		
		
		addResetEvent(function(){
			end_bg1.alpha=0;
		
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.alpha=1;
			bf.scale.set(1,1);
			bf.visible = true;
			bf.scrollFactor.set();
			bf.screenCenter();
			bf.y = FlxG.height - bf.height;
			bf.y += 42;
			setVar("bf_Y_pos", bf.y);
		});	
		
		eh.funcTweenModEvent(target1, 224, 3.5, ModConstants.getEaseFromString("inQuad"), 0, 1, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.alpha = v;
		}, "bf_alpha");
		
		eh.funcTweenModEvent(target1, 18, 0.1, ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.alpha = v;
		}, "bf_alpha");
		
		eh.funcTweenModEvent(target1, 20, 0.1, ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.alpha = v;
		}, "bf_alpha");
		
		eh.funcTweenModEvent(target1, 146, 0.1, ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.alpha = v;
		}, "bf_alpha");
		
		eh.funcTweenModEvent(target1, 148, 0.1, ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.alpha = v;
		}, "bf_alpha");
		
		eh.funcTweenModEvent(target1, 352, 0.1, ModConstants.getEaseFromString("instant"), 1, 0, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.alpha = v;
		}, "bf_alpha");
		
		
		
		var bfYpos = PlayState.instance.currentStage.getBoyfriend().y;
		
		eh.funcTweenModEvent(target1, 258, 0.05, ModConstants.getEaseFromString("outQuint"), 0, 80, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.y = getVar("bf_Y_pos") + v;
		}, "bf_y");
		
		eh.funcTweenModEvent(target1, 260, 1.2, ModConstants.getEaseFromString("outQuint"), 80, 0, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.y = getVar("bf_Y_pos") + v;
		}, "bf_y");
		
		
		
		eh.funcTweenModEvent(target1, 258, 0.05, ModConstants.getEaseFromString("outQuint"), 1, 3.5, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.scale.set(v,v);
		}, "bf_scale");
		
		eh.funcTweenModEvent(target1, 260, 1.2, ModConstants.getEaseFromString("outQuint"), 3.5, 1, function(v) {
			var bf = PlayState.instance.currentStage.getBoyfriend();
			bf.scale.set(v,v);
		}, "bf_scale");

		
		eh.funcModEvent(target1, -4, function() {
			game.camGame.filters = newCamEffects_stage;
		});
		
		eh.funcModEvent(target1, 258, function() {
			game.camGame.filters=newCamEffects_stage_2;
		});
		
		eh.funcModEvent(target1, 260, function() {
			game.camGame.filters=newCamEffects_stage;
		});
		
		
		/*
		var charRef:FunkinSprite = new FunkinSprite();
		charRef.frames = Paths.getSparrowAtlas('looping_rooms/hazard_sit');	
		charRef.animation.addByPrefix('base', 'base', 24, true);	
		charRef.animation.addByPrefix('idle', 'idle', 24, true);	
		charRef.animation.play("idle");
		game.customLuaSprites.set("charRef", charRef);
		game.currentStage.add(charRef);
		charRef.scrollFactor.set();
		charRef.screenCenter();
		charRef.zIndex = 450;

		charRef.y = FlxG.height - charRef.height;
		charRef.y += 52;
		charRef.alpha=0.0;
		*/
		
		game.currentStage.refresh();
		
		
		var adjustColShader = getVar("adjustColShader");
		if(adjustColShader!=null){
			eh.funcModEvent(target1, -4, function() {
				adjustColShader.hue = 0;
			});
			eh.funcModEvent(target1, 36, function() {
				adjustColShader.hue = -32;
			});
			eh.funcModEvent(target1, 68, function() {
				adjustColShader.hue = 0;
			});
			
			eh.funcModEvent(target1, 164, function() {
				adjustColShader.hue = -190;
			});
			eh.funcModEvent(target1, 196, function() {
				adjustColShader.hue = -32;
			});
			
			eh.funcModEvent(target1, 224.01, function() {
				adjustColShader.hue = 0;
			});
			
			eh.funcModEvent(target1, 324, function() {
				adjustColShader.hue = -32;
			});
			
			eh.funcTweenModEvent(target1, 164, 1, ModConstants.getEaseFromString("outExpo"), 0, -160, function(v) {
				adjustColShader.brightness = v;
			});
			eh.funcTweenModEvent(target1, 164.99, 196-165-0.05, ModConstants.getEaseFromString("linear"), -160, -160, function(v) {
				adjustColShader.brightness = v;
			});
			
			
			eh.funcModEvent(target1, -4, function() {
				adjustColShader.saturation = -21;
			});
			eh.funcTweenModEvent(target1, -4,8, ModConstants.getEaseFromString("inQuint"), -200, -20, function(v) {
				adjustColShader.brightness = v;
			});
			eh.funcTweenModEvent(target1, -4,8, ModConstants.getEaseFromString("inQuint"), -100, -21, function(v) {
				adjustColShader.saturation = v;
			});
			
			eh.funcTweenModEvent(target1, 288,2, ModConstants.getEaseFromString("outQuint"), -21, -100, function(v) {
				adjustColShader.saturation = v;
			});
			eh.funcTweenModEvent(target1, 292,0.5, ModConstants.getEaseFromString("outQuint"), -100, -21, function(v) {
				adjustColShader.saturation = v;
			});
		}

		
	]])

end

function onBeatHit()
	runHaxeCode(
	[[	
		var curBeat = Conductor.instance.currentBeat;
		
		
		var curSet = getVar("curBackgroundSet");
		
		var allBackgrounds = getVar("backgrounds");
		if (allBackgrounds != null){
			for(s in allBackgrounds){
				s.visible = false;
			}
		}
		
		if (curSet == "default"){
			var curID = getVar("curBackID_default");
			var backs = getVar("backgrounds_default");
			if (backs != null && curID != null){
				backs[curID].visible = true;
				
				var adjustColShader = getVar("adjustColShader");
				var adjustColShader_brightnessArray = getVar("backgrounds_default_brightness");
				if(adjustColShader!=null && adjustColShader_brightnessArray != null){
					adjustColShader.brightness = adjustColShader_brightnessArray[curID];
				}
				
				curID++;
				if(curID > backs.length-1){
					curID = 0;
				}
				setVar("curBackID_default", curID);
				
				
			}
		}
		
		if (curSet == "none"){
			var adjustColShader = getVar("adjustColShader");
			if(adjustColShader!=null){
				adjustColShader.brightness = 0;
			}
		}
		
		if (curSet == "water"){
				
			var curID = getVar("curBackID_water");
			var backs = getVar("backgrounds_water");
			if (backs != null && curID != null){
				backs[curID].visible = true;
				
				var adjustColShader = getVar("adjustColShader");
				var adjustColShader_brightnessArray = getVar("backgrounds_water_brightness");
				if(adjustColShader!=null && adjustColShader_brightnessArray != null){
					adjustColShader.brightness = adjustColShader_brightnessArray[curID];
				}
				
				curID++;
				if(curID > backs.length-1){
					curID = 0;
				}
				setVar("curBackID_water", curID);
			}
		}
		
	]])
end
