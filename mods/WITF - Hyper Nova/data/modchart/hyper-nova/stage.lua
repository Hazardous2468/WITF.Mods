function setUp()
end

function modsTimeline()

	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "openfl.utils")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	
	runHaxeCode(
	[[
	var lowerQualityShaders = false;
	var disableBGshader = false;
	
	
	
	var target1 = PlayState.instance.playerStrumline.mods;
	addResetEvent(function(){
		PlayState.instance.comboPopUps.offsets[0] = -400;
		PlayState.instance.comboPopUps.offsets[1] = 17;
	});
	

	
	var starField1Shader = new FlxRuntimeShader(Assets.getText(Paths.frag("hyper-nova-bg1")), null);
	var starField2Shader = new FlxRuntimeShader(Assets.getText(Paths.frag("hyper-nova-bg2")), null);
	
	var bg1 = createSpr("bg", 'hyper-nova/background');
	bg1.setGraphicSize(FlxG.width, FlxG.height);
	bg1.screenCenter();	
	bg1.visible = true;
	
	var bg2 = createSpr("bg2", 'hyper-nova/background');
	bg2.setGraphicSize(FlxG.width, FlxG.height);
	bg2.screenCenter();	
	bg2.visible = true;
	if(!disableBGshader){
		bg2.shader = starField2Shader;
	}
	bg2.alpha=0;
	
	bg1.zIndex = 49;
	bg2.zIndex = 50;
	
	
	if(!disableBGshader){
		bg1.shader = starField1Shader;
	}
	
	
	addUpdate(function(elapsed){
		starField1Shader.setFloat('iTime', Conductor.instance.songPosition/1000);
		starField2Shader.setFloat('iTime', Conductor.instance.songPosition/1000);
	});	
	
	
	
	addResetEvent(function(){
		starField1Shader.setBool('wireframegrid', false);
		starField1Shader.setFloat('wireframeblend',0.0);
		if(lowerQualityShaders){
			starField1Shader.setFloat('NUM_LAYERS', 4.0);
			starField1Shader.setBool('generateNebula', false);
		}else{
			starField1Shader.setFloat('NUM_LAYERS', 5.0);
			starField1Shader.setBool('generateNebula', true);
		}
		starField1Shader.setFloat('ZOOM', 18.0);
		starField1Shader.setFloat('ySpeed', 0.01);
		if(disableBGshader){
			starField1Shader.setFloat('aaaaaa', 0.0);
			starField1Shader.setFloat('NUM_LAYERS', 0.0);
			starField1Shader.setBool('generateNebula', false);
		}else{
			starField1Shader.setFloat('aaaaaa', 1.0);
		}
		starField1Shader.setFloat('timAdd', 0.0);
	});
	
	
	eh.funcTweenModEvent(target1, 864, 898-864,  ModConstants.getEaseFromString("quadIn"), 0, 300, function(v) {
		starField1Shader.setFloat('timAdd', v);
	}, "timmyyyy");
	
	eh.funcTweenModEvent(target1, 1010, 1,  ModConstants.getEaseFromString("linear"), 0.01, 0.017, function(v) {
		starField1Shader.setFloat('ySpeed', v);
	}, "yyyyspeed");
	
	
	
	addResetEvent(function(){
		bg2.alpha=0;
		if(lowerQualityShaders){
			starField2Shader.setFloat('NUM_LAYERS', 4.0);
			starField2Shader.setBool('generateNebula', false);
		}else{
			starField2Shader.setFloat('NUM_LAYERS', 5.0);
			starField2Shader.setBool('generateNebula', true);
		}
		starField2Shader.setFloat('ZOOM', 18.0);
		starField2Shader.setFloat('ySpeed', 0.00);
		if(disableBGshader){
			starField2Shader.setFloat('aaaaaa', 0.0);
			starField2Shader.setFloat('NUM_LAYERS', 0.0);
			starField2Shader.setBool('generateNebula', false);
		}else{
			starField2Shader.setFloat('aaaaaa', 0.0);
		}
	});
	
	
	
	if(!disableBGshader){
		eh.funcTweenModEvent(target1, 893, 2.5,  ModConstants.getEaseFromString("inOutCubic"), 1.0, 0.0, function(v) {
			starField1Shader.setFloat('aaaaaa', v);
			starField2Shader.setFloat('aaaaaa', 1-v);
			bg2.alpha = 1-v;
		}, "bgshader1-fade");
		
		eh.funcTweenModEvent(target1, 1020, 2,  ModConstants.getEaseFromString("inOutSine"), 0.0, 1.0, function(v) {
			starField1Shader.setFloat('aaaaaa', v);
			starField2Shader.setFloat('aaaaaa', 1-v);
			bg2.alpha = 1-v;
		}, "bgshader1-fade");
	}
	
	

	
	var bgDim = createSpr("bgDim", 'hyper-nova/black');
	bgDim.setGraphicSize(FlxG.width, FlxG.height);
	bgDim.screenCenter();	
	bgDim.visible = true;
	bgDim.alpha = 0.25;
	bgDim.zIndex = 64;
	
		
	var fragPath:String = "hyper-nova-gridfield";
	//fragPath = "hyper-nova-gridfield_fWidth";
	var gridFieldShader = new FlxRuntimeShader(Assets.getText(Paths.frag(fragPath)), null);
	addResetEvent(function(){
		gridFieldShader.setFloat('aaaaaa', 0.0);
		gridFieldShader.setFloat('aaatwo', 1.0);
		gridFieldShader.setFloat('redTime', 0.0);
		
		gridFieldShader.setFloat('NUM_LAYERS', 5.0);
		gridFieldShader.setFloat('ZOOM', 12.5);
		gridFieldShader.setFloat('fisheye', -0.3);

	});
	
	addUpdate(function(elapsed){
		gridFieldShader.setFloat('iTime', Conductor.instance.songPosition/1000);
	});	
	
	var gridFieldSprite = createSpr("gridFieldSprite", 'hyper-nova/white');
	gridFieldSprite.setGraphicSize(FlxG.width, FlxG.height);
	gridFieldSprite.screenCenter();	
	gridFieldSprite.visible = true;
	gridFieldSprite.shader = gridFieldShader;
	gridFieldSprite.zIndex = 55;

	
	var gridFieldAlphaMod:CustomModifier = createCustomMod("gridfield", 0.0);
	gridFieldAlphaMod.modPriority = -9990;
	gridFieldAlphaMod.strumsMod = false;
	gridFieldAlphaMod.notesMod = false;
	gridFieldAlphaMod.unknown = false;
	gridFieldAlphaMod.holdsMod = false;
	gridFieldAlphaMod.pathMod = false;
	gridFieldAlphaMod.specialMod = true;
	gridFieldAlphaMod.speedMod = false;
	eh.addCustomMod("bf", gridFieldAlphaMod);
	gridFieldAlphaMod.specialMathFunc = function() {
		gridFieldShader.setFloat('aaaaaa', gridFieldAlphaMod.currentValue);
	};
	
	var gridFieldAlphaMod_red:CustomModifier = createCustomMod("gridfield_red", 0.0);
	gridFieldAlphaMod_red.modPriority = -9990;
	gridFieldAlphaMod_red.strumsMod = false;
	gridFieldAlphaMod_red.notesMod = false;
	gridFieldAlphaMod_red.holdsMod = false;
	gridFieldAlphaMod_red.pathMod = false;
	gridFieldAlphaMod_red.specialMod = true;
	gridFieldAlphaMod_red.speedMod = false;
	gridFieldAlphaMod_red.unknown = false;
	eh.addCustomMod("bf", gridFieldAlphaMod_red);
	gridFieldAlphaMod_red.specialMathFunc = function() {
		gridFieldShader.setFloat('redTime', gridFieldAlphaMod_red.currentValue);
	};
		
	
	
	var black:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
	black.alpha=1.0;
	black.cameras = [game.camAFT];
	black.zIndex = 99999;
	PlayState.instance.add(black);
	
	
	
	game.customLuaSprites.set("black", black);
	eh.funcTweenModEvent(target1, 0, 16,  ModConstants.getEaseFromString("quadIn"), 1, 0.8, function(v) {
		getSpr("black").alpha=v;
	}, "black-fade");
	eh.funcTweenModEvent(target1, 30, 1,  ModConstants.getEaseFromString("linear"), 0.8, 0.9, function(v) {
		getSpr("black").alpha=v;
	}, "black-fade");
	eh.funcTweenModEvent(target1, 31, 2,  ModConstants.getEaseFromString("quadOut"), 0.9, 0.0, function(v) {
		getSpr("black").alpha=v;
	}, "black-fade");
	eh.funcTweenModEvent(target1, 96, 32,  ModConstants.getEaseFromString("linear"), 1, 0.0, function(v) {
		getSpr("black").alpha=v;
	}, "black-fade");
	
	eh.funcTweenModEvent(target1, 382.8, 1.2,  ModConstants.getEaseFromString("outQuad"), 0, 1.0, function(v) {
		getSpr("black").alpha=v;
	}, "black-fade");
	eh.funcTweenModEvent(target1, 384, 0.5,  ModConstants.getEaseFromString("outQuint"), 1, 0, function(v) {
		getSpr("black").alpha=v;
	}, "black-fade");
	
	
	eh.funcTweenModEvent(target1, 1152, 10,  ModConstants.getEaseFromString("inExpo"), 0, 1.0, function(v) {
		getSpr("black").alpha=v;
	}, "black-fade");
	
	
	
	
	var alarm_left = createSpr("alarm_left", 'hyper-nova/alarm_spin');
	alarm_left.screenCenter();	
	alarm_left.cameras = [game.camGame];
	alarm_left.angularVelocity = 50;
	alarm_left.color = 0xFFFF0000;
	alarm_left.setGraphicSize(Std.int(alarm_left.width *2.5));
	alarm_left.x = -alarm_left.width/2;
	alarm_left.zIndex = 53;
	
	
	var alarm_right = createSpr("alarm_right", 'hyper-nova/alarm_spin');
	alarm_right.screenCenter();	
	alarm_right.cameras = [game.camGame];
	alarm_right.angularVelocity = -50;
	alarm_right.color = 0xFFFF0000;
	alarm_right.setGraphicSize(Std.int(alarm_right.width *2.5));
	alarm_right.x = FlxG.width - (alarm_right.width/2);
	alarm_right.zIndex = 53;
	
	
	alarm_left.x = alarm_left.x - 100;
	alarm_right.x = alarm_right.x + 100;
	
	
	
	var alarm_left_grad = createSpr("alarm_left_grad", 'hyper-nova/alarm_gradient');
	alarm_left_grad.zIndex = 54;
	alarm_left_grad.setGraphicSize(FlxG.height);
	alarm_left_grad.screenCenter();	
	alarm_left_grad.x = 0;
	alarm_left_grad.flipX = true;
	alarm_left_grad.color = 0xFFFF0000;
	
	
	var alarm_right_grad = createSpr("alarm_right_grad", 'hyper-nova/alarm_gradient');
	alarm_right_grad.zIndex = 54;
	alarm_right_grad.setGraphicSize(FlxG.height);
	alarm_right_grad.screenCenter();	
	alarm_right_grad.x = FlxG.width - alarm_right_grad.width;
	alarm_right_grad.color = 0xFFFF0000;
	
	
	
	var alarm_left:CustomModifier = createCustomMod("alarmleft", 0.0);
	alarm_left.modPriority = -9990;
	alarm_left.strumsMod = false;
	alarm_left.notesMod = false;
	alarm_left.holdsMod = false;
	alarm_left.pathMod = false;
	alarm_left.specialMod = true;
	alarm_left.speedMod = false;
	alarm_left.unknown = false;
	eh.addCustomMod("bf", alarm_left);
	alarm_left.specialMathFunc = function() {
		var a = getSpr("alarm_left");
		if(a != null) a.alpha = alarm_left.currentValue*0.75;
		
		var a = getSpr("alarm_left_grad");
		if(a != null) a.alpha = alarm_left.currentValue;
	};
	
	var alarm_rightMod:CustomModifier = createCustomMod("alarmright", 0.0);
	alarm_rightMod.modPriority = -9990;
	alarm_rightMod.strumsMod = false;
	alarm_rightMod.notesMod = false;
	alarm_rightMod.holdsMod = false;
	alarm_rightMod.pathMod = false;
	alarm_rightMod.specialMod = true;
	alarm_rightMod.speedMod = false;
	alarm_rightMod.unknown = false;
	eh.addCustomMod("bf", alarm_rightMod);
	alarm_rightMod.specialMathFunc = function() {
		var a = getSpr("alarm_right");
		if(a != null) a.alpha = alarm_rightMod.currentValue*0.75;
		
		var a = getSpr("alarm_right_grad");
		if(a != null) a.alpha = alarm_rightMod.currentValue;
	};

	
	
	
	
	var txt_dont = createSpr("txt_dont", 'hyper-nova/txtv2_dont');
	txt_dont.screenCenter();	
	txt_dont.zIndex = 70;
	txt_dont.cameras = [game.camGame];
	eh.funcTweenModEvent(target1, 542, 1,  ModConstants.getEaseFromString("outSine"), 0, 1.0, function(v) {
		getSpr("txt_dont").alpha=v;
	}, "dont-fade");
	
	var txt_blink = createSpr("txt_blink", 'hyper-nova/txtv2_blink');
	txt_blink.screenCenter();	
	txt_blink.zIndex = 70;
	
	txt_dont.setGraphicSize(Std.int(txt_blink.width * 0.8));
	txt_blink.setGraphicSize(Std.int(txt_blink.width * 0.8));

	txt_blink.cameras = [game.camGame];
	eh.funcTweenModEvent(target1, 543, 1,  ModConstants.getEaseFromString("outSine"), 0, 1.0, function(v) {
		getSpr("txt_blink").alpha=v;
	}, "blink-fade");
	
	
	eh.funcTweenModEvent(target1, 541, 6,  ModConstants.getEaseFromString("outQuad"), -20, 20, function(v) {
		getSpr("txt_dont").offset.x=v*-1;
		getSpr("txt_blink").offset.x=v;
	}, "dontblink-offset_x");
	
	
	eh.funcTweenModEvent(target1, 544, 1.5,  ModConstants.getEaseFromString("linear"), 1, 0.0, function(v) {
		getSpr("txt_blink").alpha=v;
	}, "blink-fade");
	
	eh.funcTweenModEvent(target1, 544, 1.5,  ModConstants.getEaseFromString("linear"), 1, 0.0, function(v) {
		getSpr("txt_dont").alpha=v;
	}, "dont-fade");
	
	
	
	var txt_go = createSpr("txt_go", 'hyper-nova/txtv2_go');
	txt_go.screenCenter();	
	txt_go.zIndex = 70;
	txt_go.cameras = [game.camNotes];
	
	eh.funcTweenModEvent(target1, 191, 1,  ModConstants.getEaseFromString("pop"), 0, 1.0, function(v) {
		getSpr("txt_go").alpha=v;
	}, "go-fade");
	
	addResetEvent(function(){
		getSpr("txt_dont").alpha=0;
		getSpr("txt_blink").alpha=0;
		getSpr("txt_go").alpha=0;
		getSpr("black").alpha=1;
	});
	
	
	
	var txt_dont_err1 = createSpr("txt_dont_err1", 'hyper-nova/txtv2_dont');
	txt_dont_err1.screenCenter();	
	txt_dont_err1.zIndex = 71;
	txt_dont_err1.setGraphicSize(Std.int(txt_dont_err1.width * 0.8));
	txt_dont_err1.x -= 50;
	
	eh.funcTweenModEvent(target1, 606, 0.25,  ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
		getSpr("txt_dont_err1").alpha=v;
	}, "dont-err1-fade");
	
	
	var txt_dont_err2 = createSpr("txt_dont_err2", 'hyper-nova/txtv2_dont');
	txt_dont_err2.screenCenter();	
	txt_dont_err2.zIndex = 72;
	txt_dont_err2.setGraphicSize(Std.int(txt_dont_err2.width * 0.8));
	txt_dont_err2.x -= 50;
	txt_dont_err2.x += 15;
	txt_dont_err2.y += 30;
	
	eh.funcTweenModEvent(target1, 606.5, 0.25,  ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
		getSpr("txt_dont_err2").alpha=v;
	}, "dont-err2-fade");
	
	var txt_dont_err3 = createSpr("txt_dont_err3", 'hyper-nova/txtv2_dont');
	txt_dont_err3.screenCenter();	
	txt_dont_err3.zIndex = 72;
	txt_dont_err3.setGraphicSize(Std.int(txt_dont_err3.width * 0.8));
	txt_dont_err3.x -= 50;
	txt_dont_err3.x += 15*2;
	txt_dont_err3.y += 30*2;
	
	eh.funcTweenModEvent(target1, 607, 0.25,  ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
		getSpr("txt_dont_err3").alpha=v;
	}, "dont-err3-fade");
	
	var txt_dont_err4 = createSpr("txt_dont_err4", 'hyper-nova/txtv2_dont');
	txt_dont_err4.screenCenter();	
	txt_dont_err4.zIndex = 72;
	txt_dont_err4.setGraphicSize(Std.int(txt_dont_err4.width * 0.8));
	txt_dont_err4.x -= 50;
	txt_dont_err4.x += 15*3;
	txt_dont_err4.y += 30*3;
	
	eh.funcTweenModEvent(target1, 607.5, 0.25,  ModConstants.getEaseFromString("outExpo"), 0, 1, function(v) {
		getSpr("txt_dont_err4").alpha=v;
	}, "dont-err4-fade");
	
	
	
	eh.funcTweenModEvent(target1, 608, 1,  ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
		getSpr("txt_dont_err4").alpha=v;
	}, "dont-err4-fade");
	eh.funcTweenModEvent(target1, 608, 1,  ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
		getSpr("txt_dont_err1").alpha=v;
	}, "dont-err1-fade");
	eh.funcTweenModEvent(target1, 608, 1,  ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
		getSpr("txt_dont_err2").alpha=v;
	}, "dont-err2-fade");
	eh.funcTweenModEvent(target1, 608, 1,  ModConstants.getEaseFromString("outExpo"), 1, 0, function(v) {
		getSpr("txt_dont_err3").alpha=v;
	}, "dont-err3-fade");
	
	
	
	addResetEvent(function(){
		getSpr("txt_dont_err1").alpha=0;
		getSpr("txt_dont_err2").alpha=0;
		getSpr("txt_dont_err3").alpha=0;
		getSpr("txt_dont_err4").alpha=0;
	});
	
	
	]])


	for i = 128, 256-32, 32 do
		ease(i, 4, "outExpo", 0.25, "gridField", "1")
		ease(i+15, 1, "outExpo", 0.0, "gridField", "1")
		add(i+16, 4, "outExpo", 0.25, "gridField", "1")
		for k = i+16, i+32-4, 4 do
			add(k, 4, "tap", 0.25, "gridField", "1")
		end
		ease(i+15+16, 1, "outExpo", 0.0, "gridField", "1")
	end
	
	
	
	
	
	
	ease(128, 4, "outQuint", 0.25, "gridField", "1")
	--ease(288, 4, "outQuint", 0.0, "gridField", "1")
	--ease(288, 4, "outQuint", 0.25, "gridfield_red", "1")
	
	
	
	for i = 480, 544-32, 32 do
		ease(i, 4, "outExpo", 0.25, "gridField", "1")
		ease(i+15, 1, "outExpo", 0.0, "gridField", "1")
		add(i+16, 4, "outExpo", 0.25, "gridField", "1")
		for k = i+16, i+32-4, 4 do
			add(k, 4, "tap", 0.25, "gridField", "1")
		end
		ease(i+15+16, 1, "outExpo", 0.0, "gridField", "1")
	end
	
	
	
	for i = 608, 668 , 4 do
		add(i,2.2, "tap", 0.2, "gridfield_red", "1")
		add(i,2.2, "bounce", 0.1, "gridfield_red", "1")
	end
	
	
	
	
	for i = 1024, 1024+64-32, 32 do
		ease(i, 4, "outExpo", 0.25, "gridField", "1")
		ease(i+15, 1, "outExpo", 0.0, "gridField", "1")
		add(i+16, 4, "outExpo", 0.25, "gridField", "1")
		for k = i+16, i+32-4, 4 do
			if not (k >= 1084) then
				add(k, 4, "tap", 0.25, "gridField", "1")
			end
		end
		ease(i+15+16, 1, "outExpo", 0.0, "gridField", "1")
	end
	ease(1084, 2, "outCubic", 0.0, "gridField", "1")
	
	
	
	
	--SIRENS
	for i = 0, 32-16,16 do
		add(i, 2.5*2, "tap", 0.5, "alarmleft", "1")
		add(i+8, 2.5*2, "tap", 0.5, "alarmright", "1")
	end
	
	
	

	add(420, 2.5, "tap", 0.19, "alarmright", "1")
	add(420+4, 2.5, "tap", 0.21, "alarmleft", "1")
	add(428, 2.5, "tap", 0.22, "alarmright", "1")
	add(428+4, 2.5, "tap", 0.24, "alarmleft", "1")
	add(436, 2.5, "tap", 0.28, "alarmright", "1")
	add(436+4, 2.5, "tap", 0.34, "alarmleft", "1")
	add(444, 2.5, "tap", 0.4, "alarmright", "1")
	
	for i = 448, 476-4,4 do
		add(i, 2.5, "tap", 0.5, "alarmright", "1")
		add(i, 2.5, "tap", 0.5, "alarmleft", "1")
	end
	
	add(475.5, 2.5*1.5, "tap", 0.5, "alarmright", "1")
	add(475.5, 2.5*1.5, "tap", 0.5, "alarmleft", "1")
	
	
	
	
	
	
	
	
	--Copy and paste for later
	local lazyMath = 864 - 448
	add(lazyMath + 420, 2.5, "tap", 0.19, "alarmright", "bf")
	add(lazyMath + 420+4, 2.5, "tap", 0.21, "alarmleft", "bf")
	add(lazyMath + 428, 2.5, "tap", 0.22, "alarmright", "bf")
	add(lazyMath + 428+4, 2.5, "tap", 0.24, "alarmleft", "bf")
	add(lazyMath + 436, 2.5, "tap", 0.28, "alarmright", "bf")
	add(lazyMath + 436+4, 2.5, "tap", 0.34, "alarmleft", "bf")
	add(lazyMath + 444, 2.5, "tap", 0.4, "alarmright", "bf")
	
	for i = lazyMath + 448, lazyMath + 476-4,4 do
		add(i, 2.5, "tap", 0.5, "alarmright", "bf")
		add(i, 2.5, "tap", 0.5, "alarmleft", "bf")
	end
	
	add(lazyMath + 475.5, 2.5*1.5, "tap", 0.5, "alarmright", "bf")
	add(lazyMath + 475.5, 2.5*1.5, "tap", 0.5, "alarmleft", "bf")
	
	
	
	
	
	
end
