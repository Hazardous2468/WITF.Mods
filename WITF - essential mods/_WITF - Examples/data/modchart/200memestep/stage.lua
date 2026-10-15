
function modsTimeline()	
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	runHaxeCode(
	[[
		var eh = PlayState.instance.modchartEventHandler;
		var target1 = PlayState.instance.playerStrumline.mods;
	


		var bgDark = createSpr("bgDark", '200memestep/bg');
		bgDark.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
		bgDark.screenCenter();


		var bg = createSpr("bg", '200memestep/back2');
		bg.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
		bg.screenCenter();

		
		
		var bg_pattern = createSpr("bg_pattern", '200memestep/pattern');
		//bg_pattern.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
		bg_pattern.setGraphicSize(Std.int(FlxG.width+64));
		bg_pattern.screenCenter();
		var bg_pattern_scrolling_shader:FlxRuntimeShader = new FlxRuntimeShader(Assets.getText(Paths.frag("200memeStep_bgScroll")), null);
		bg_pattern.shader = bg_pattern_scrolling_shader;


		var bgsans = createSpr("bgsans", '200memestep/back2_sans');
		bgsans.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
		bgsans.screenCenter();

		var bg_pattern_sans = createSpr("bg_pattern_sans", '200memestep/pattern_sans');
		bg_pattern_sans.setGraphicSize(Std.int(FlxG.width+64));
		bg_pattern_sans.screenCenter();
		bg_pattern_sans.shader = bg_pattern_scrolling_shader;

		


		var gradient_bottom = createSpr("gradient_bottom", '200memestep/gradient_bottom');
		gradient_bottom.setGraphicSize(Std.int(FlxG.width));
		gradient_bottom.screenCenter();
		if(downScroll){
			gradient_bottom.angle = 0;
		}else{
			gradient_bottom.angle = 180;
		}
		eh.funcTweenModEvent(target1, 64, 31, ModConstants.getEaseFromString("sineInOut"), 0, 1, function(v) {
			gradient_bottom.alpha=v;
		}, "gradient_bottom_alpha");

		eh.funcTweenModEvent(target1, 95, 1, ModConstants.getEaseFromString("expoOut"), 1, 0, function(v) {
			gradient_bottom.alpha=v;
		}, "gradient_bottom_alpha");



		
		addResetEvent(function(){
			gradient_bottom.alpha=0;
			bgsans.alpha=0;
			bg_pattern_sans.alpha=0;
			bg.alpha=0;
			bg_pattern.alpha=0;
			bg_pattern_scrolling_shader.setFloat('iTimeX', 0.0);		
			bg_pattern_scrolling_shader.setFloat('iTimeY', 0.0);		
		});	

		addUpdate(function(elapsed){
			//setShaderFloat("bg_bricks", "iTimeX", os.clock()*-0.1)
			//setShaderFloat("bg_bricks", "iTimeY", os.clock()*-0.05)

			var time:Float = Conductor.instance.songPosition / Constants.MS_PER_SEC;

			bg_pattern_scrolling_shader.setFloat('iTimeX', time*-0.1);		
			bg_pattern_scrolling_shader.setFloat('iTimeY', time*-0.05);		
		});	




		eh.funcTweenModEvent(target1, 95.9, 0.2, ModConstants.getEaseFromString("inOutExpo"), 0,1, function(v) {
			bg.alpha=v;
			bg_pattern.alpha=v;
		});

		eh.funcTweenModEvent(target1, 151.5, 1, ModConstants.getEaseFromString("inOutExpo"), 0,1, function(v) {
			bgsans.alpha=v;
			bg_pattern_sans.alpha=v;
		}, "bg_sans");
		eh.funcTweenModEvent(target1, 153, 0.6, ModConstants.getEaseFromString("outExpo"), 1,0, function(v) {
			bgsans.alpha=v;
			bg_pattern_sans.alpha=v;
		}, "bg_sans");


		
		var blackOutBG:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOutBG.scrollFactor.set();
		PlayState.instance.add(blackOutBG);
		game.customLuaSprites.set("blackOutBG", blackOutBG);
		blackOutBG.alpha=0.0;
		addResetEvent(function(){
			blackOutBG.alpha=0.0;
		});	
		
		
		eh.funcTweenModEvent(target1, 224, 14, FlxEase.sineInOut, 0,1, function(v) {
			blackOutBG.alpha = v;
		}, "blackOutFade");








		var alarm_gradient_l = createZSpr("alarm_gradient_l", '200memestep/alarm_gradient');
		alarm_gradient_l.screenCenter();
		alarm_gradient_l.scale.y = 2;
		alarm_gradient_l.x = 0;

		var alarm_gradient_r = createZSpr("alarm_gradient_r", '200memestep/alarm_gradient');
		alarm_gradient_r.screenCenter();
		alarm_gradient_r.scale.y = 2;
		alarm_gradient_r.x = FlxG.width - alarm_gradient_r.width;
		alarm_gradient_r.flipX = true;

		addResetEvent(function(){
			alarm_gradient_r.alpha=0;	
			alarm_gradient_l.alpha=0;	
		});	

		eh.funcTweenModEvent(target1, 149, 2, ModConstants.getEaseFromString("pop"), 0, 0.45, function(v) {
			alarm_gradient_r.alpha = v;
		}, "alarm_gradient_r");

		eh.funcTweenModEvent(target1, 149+2, 2, ModConstants.getEaseFromString("pop"), 0, 0.45, function(v) {
			alarm_gradient_l.alpha = v;
		}, "alarm_gradient_l");

		eh.funcTweenModEvent(target1, 149-16, 2, ModConstants.getEaseFromString("pop"), 0, 0.45, function(v) {
			alarm_gradient_r.alpha = v;
		}, "alarm_gradient_r");

		eh.funcTweenModEvent(target1, 149+2-16, 2, ModConstants.getEaseFromString("pop"), 0, 0.45, function(v) {
			alarm_gradient_l.alpha = v;
		}, "alarm_gradient_l");



		var meme_awshit = createZSpr("meme_awshit", '200memestep/meme_awshit');
		meme_awshit.screenCenter();
		meme_awshit.scale.set(0.67,0.67);
		meme_awshit.angle = -11;
		meme_awshit.x -= 344;

		var meme_28 = createZSpr("meme_28", '200memestep/meme_28');
		meme_28.screenCenter();
		meme_28.scale.set(0.65,0.65);
		meme_28.angle = 16;
		meme_28.x += 340;
		meme_28.y -= 30;

		eh.funcTweenModEvent(target1, 54, 8, ModConstants.getEaseFromString("outQuad"), -10, 20, function(v) {
			meme_28.x2 = v;
		}, "28 stab wounds x2");

		eh.funcTweenModEvent(target1, 56, 14, ModConstants.getEaseFromString("outQuad"), 10, -20, function(v) {
			meme_awshit.x2 = v;
		}, "aw shit x2");

		eh.funcTweenModEvent(target1, 55.75, 1, ModConstants.getEaseFromString("sineInOut"), 0, 0.4, function(v) {
			meme_28.alpha = v;
		}, "28 stab wounds alpha");

		eh.funcTweenModEvent(target1, 59.75, 2.45, ModConstants.getEaseFromString("sineInOut"), 0.4, 0, function(v) {
			meme_28.alpha = v;
		}, "28 stab wounds alpha");

		eh.funcTweenModEvent(target1, 60, 1, ModConstants.getEaseFromString("sineInOut"), 0, 0.4, function(v) {
			meme_awshit.alpha = v;
		}, "aw shit alpha");

		eh.funcTweenModEvent(target1, 63, 1.75, ModConstants.getEaseFromString("sineInOut"), 0.4, 0, function(v) {
			meme_awshit.alpha = v;
		}, "aw shit alpha");


		var meme_bonk = createSpr("meme_bonk", '200memestep/meme_bonk');
		meme_bonk.screenCenter();
		meme_bonk.scale.set(0.7,0.7);
		meme_bonk.angle = 9;

		eh.funcTweenModEvent(target1, 192,2, ModConstants.getEaseFromString("quintIn"), 1, 0, function(v) {
			meme_bonk.alpha = v;
		}, "Bonk Alpha");

		eh.funcTweenModEvent(target1, 192,1.5, ModConstants.getEaseFromString("outElastic"), -9, 7, function(v) {
			meme_bonk.angle = v;
		}, "Bonk Angle");


		var meme_oof = createZSpr("meme_oof", '200memestep/meme_oof');
		meme_oof.screenCenter();
		meme_oof.scale.set(1.1,1.1);

		var oofset:Float = 0.2;

		eh.funcModEvent(target1, 126+oofset, function() {
			meme_oof.alpha = 1;
			meme_oof.angle = -6;
			meme_oof.x2 = -333;
			meme_oof.y2 = -111;
			meme_oof.z2 = 0;
			meme_oof.scale.set(0.85,0.85);
		});
		eh.funcModEvent(target1, 126.25+oofset, function() {
			meme_oof.alpha = 1;
			meme_oof.angle = 3;
			meme_oof.x2 = 333;
			meme_oof.y2 = 64;
			meme_oof.z2 = 0;
			meme_oof.scale.set(1.1,1.0);
		});
		eh.funcModEvent(target1, 126.5+oofset, function() {
			meme_oof.alpha = 1;
			meme_oof.angle = -27;
			meme_oof.x2 = 422;
			meme_oof.y2 = -89;
			meme_oof.z2 = -88;
			meme_oof.scale.set(1.0,1.0);
		});
		eh.funcModEvent(target1, 126.75+oofset, function() {
			meme_oof.alpha = 1;
			meme_oof.angle = 20;
			meme_oof.z2 = 0;
			meme_oof.x2 = -333;
			meme_oof.y2 = -0;
			meme_oof.scale.set(1.1,1.1);
		});
		eh.funcModEvent(target1, 127+oofset, function() {
			meme_oof.alpha = 1;
			meme_oof.angle = 45;
			meme_oof.z2 = 100;
			meme_oof.x2 = -333;
			meme_oof.y2 = 72;
			meme_oof.scale.set(0.9,-0.85);
		});
		eh.funcModEvent(target1, 127.5+oofset, function() {
			meme_oof.alpha = 1;
			meme_oof.angle = 6;
			meme_oof.z2 = 0;
			meme_oof.x2 = 110;
			meme_oof.y2 = -33;
			meme_oof.scale.set(1.2,1.0);
		});
		eh.funcModEvent(target1, 128, function() {
			meme_oof.alpha = 0;
		});



		var meme_puffer = createSpr("meme_puffer", '200memestep/meme_puffer');
		meme_puffer.screenCenter();
		meme_puffer.scale.set(1.1,1.1);
		meme_puffer.angle = 13;

		eh.funcTweenModEvent(target1, 95, 0.8, ModConstants.getEaseFromString("expoOut"), 0, 1, function(v) {
			meme_puffer.alpha = v;
		}, "PufferFish Jumpscare Alpha");

		eh.funcTweenModEvent(target1, 96, 0.8, ModConstants.getEaseFromString("expoOut"), 1, 0, function(v) {
			meme_puffer.alpha = v;
		}, "PufferFish Jumpscare Alpha");

		eh.funcTweenModEvent(target1, 95, 0.8, ModConstants.getEaseFromString("expoOut"), 0, 1.2, function(v) {
			meme_puffer.scale.set(v,v);
		}, "PufferFish Jumpscare Scale");

		eh.funcTweenModEvent(target1, 95.8, 1, ModConstants.getEaseFromString("inSine"), 1.2, 0.5, function(v) {
			meme_puffer.scale.set(v,v);
		}, "PufferFish Jumpscare Scale");


		var meme_sans = createZSpr("meme_sans", '200memestep/meme_sans');
		meme_sans.screenCenter();
		meme_sans.x = -meme_sans.width;
		meme_sans.y += 72;
		meme_sans.scale.set(0.5,0.5);


		addResetEvent(function(){
			meme_puffer.scale.set(1.1,1.1);
			meme_puffer.alpha=0;	
			meme_oof.alpha = 0;
			meme_sans.x2 = 0;
			meme_bonk.alpha=0;
			meme_bonk.angle=-6;
			meme_28.alpha=-0;
			meme_awshit.alpha=-0;
		});	

		eh.funcTweenModEvent(target1, 151.9, 0.8, ModConstants.getEaseFromString("cubeOut"), 0, meme_sans.width, function(v) {
			meme_sans.x2 = v;
		}, "Sans Jumpscare");

		eh.funcTweenModEvent(target1, 153, 0.78, ModConstants.getEaseFromString("cubeOut"),  meme_sans.width,0, function(v) {
			meme_sans.x2 = v;
		}, "Sans Jumpscare");


		
	]])


	
end


