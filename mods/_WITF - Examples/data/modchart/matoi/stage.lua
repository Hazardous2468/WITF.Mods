function setUp()
	addHaxeLibrary("ZProjectSprite", "funkin.graphics")
end


function cubeTest()
	addHaxeLibrary("ZProjectSprite_Note", "funkin.graphics")
	addHaxeLibrary("Vector2", "lime.math")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxPoint", "flixel.math")
	addHaxeLibrary("ZProjectSprite", "funkin.graphics")
	
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("Assets", "openfl.utils")
	
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;

	
		var blackOutBG:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackOutBG.alpha=1.0;
		PlayState.instance.add(blackOutBG);
		game.customLuaSprites.set("blackOutBG_cub", blackOutBG);
		

	
	
	
		var bg1 = createSpr("bg1", 'matoi/bg1');
		bg1.setGraphicSize(FlxG.width, FlxG.height);
		bg1.screenCenter();	
		bg1.scrollFactor.set();
		
		var bg2 = createSpr("bg2", 'matoi/bg2');
		bg2.setGraphicSize(FlxG.width, FlxG.height);
		bg2.screenCenter();	
		bg2.scrollFactor.set();
		
		var bg3 = createSpr("bg3", 'matoi/bg3');
		bg3.setGraphicSize(FlxG.width, FlxG.height);
		bg3.screenCenter();	
		bg3.scrollFactor.set();
		
		
		var bgStars = createSpr("bgStars", 'matoi/bgStars');
		bgStars.setGraphicSize(FlxG.width, FlxG.height);
		bgStars.screenCenter();	
		bgStars.scrollFactor.set();
		
		var scrollingShader = new FlxRuntimeShader(Assets.getText(Paths.frag("matoiStarScrollingShader")), null);
		scrollingShader.setFloat('beat', 0.0);
		addUpdate(function(elapsed){
			scrollingShader.setFloat('beat', Conductor.instance.currentBeatTime);
		});	
		
		bgStars.shader = scrollingShader;
		
		
		
		var spacing:Float = 500;
		
		var face1:ZProjectSprite = new ZProjectSprite(0, 0, Paths.image('matoi/cubeFace'));
		face1.camera = PlayState.instance.camGame;
		face1.setUp();
		face1.updateTris();
		PlayState.instance.add(face1);
		face1.x = FlxG.width / 2;
		face1.y = FlxG.height / 2;
		face1.x -= face1.frameWidth / 2;
		face1.y -= face1.frameHeight / 2;
		face1.moveZ = spacing;
		setVar("face1",face1);		
		
		var face2:ZProjectSprite = new ZProjectSprite(0, 0, Paths.image('matoi/cubeFace'));
		face2.camera = PlayState.instance.camGame;
		face2.setUp();
		face2.updateTris();
		PlayState.instance.add(face2);
		face2.x = FlxG.width / 2;
		face2.y = FlxG.height / 2;
		face2.x -= face2.frameWidth / 2;
		face2.y -= face2.frameHeight / 2;
		face2.moveZ = spacing*-1;
		setVar("face2",face2);
		
		var face3:ZProjectSprite = new ZProjectSprite(0, 0, Paths.image('matoi/cubeFace'));
		face3.camera = PlayState.instance.camGame;
		face3.setUp();
		face3.updateTris();
		PlayState.instance.add(face3);
		face3.x = FlxG.width / 2;
		face3.y = FlxG.height / 2;
		face3.x -= face3.frameWidth / 2;
		face3.y -= face3.frameHeight / 2;
		face3.moveZ = 0;
		face3.x -= spacing;
		face3.angleY = 90;
		
		var face4:ZProjectSprite = new ZProjectSprite(0, 0, Paths.image('matoi/cubeFace'));
		face4.camera = PlayState.instance.camGame;
		face4.setUp();
		face4.updateTris();
		PlayState.instance.add(face4);
		face4.x = FlxG.width / 2;
		face4.y = FlxG.height / 2;
		face4.x -= face4.frameWidth / 2;
		face4.y -= face4.frameHeight / 2;
		face4.moveZ = 0;
		face4.x += spacing;
		face4.angleY = 90;
		
		
		
		var face5:ZProjectSprite = new ZProjectSprite(0, 0, Paths.image('matoi/cubeFace'));
		face5.camera = PlayState.instance.camGame;
		face5.setUp();
		face5.updateTris();
		PlayState.instance.add(face5);
		face5.x = FlxG.width / 2;
		face5.y = FlxG.height / 2;
		face5.x -= face5.frameWidth / 2;
		face5.y -= face5.frameHeight / 2;
		face5.moveZ = 0;
		face5.y += spacing;
		face5.angleX = -90;
		
		var face6:ZProjectSprite = new ZProjectSprite(0, 0, Paths.image('matoi/cubeFace'));
		face6.camera = PlayState.instance.camGame;
		face6.setUp();
		face6.updateTris();
		PlayState.instance.add(face6);
		face6.x = FlxG.width / 2;
		face6.y = FlxG.height / 2;
		face6.x -= face6.frameWidth / 2;
		face6.y -= face6.frameHeight / 2;
		face6.moveZ = 0;
		face6.y -= spacing;
		face6.angleX = -90;
		
		
		game.customLuaSprites.set("face1", face1);
		game.customLuaSprites.set("face2", face2);
		game.customLuaSprites.set("face3", face3);
		game.customLuaSprites.set("face4", face4);
		game.customLuaSprites.set("face5", face5);
		game.customLuaSprites.set("face5", face5);
		game.customLuaSprites.set("face6", face6);
		
		face2.scrollFactor.set();
		face3.scrollFactor.set();
		face4.scrollFactor.set();
		face5.scrollFactor.set();
		face6.scrollFactor.set();
		face1.scrollFactor.set();
		
		
		var allFace:Bool = false;
		
		
		var doCull:Bool = true;
		var c:String = "positive";
		if(doCull){		
			face1.cullMode = c;
			face2.cullMode = c;
			face3.cullMode = c;
			face4.cullMode = c;
			face5.cullMode = c;
			face6.cullMode = c;
		}

		if(!allFace){
			face5.visible = false;
			face6.visible = false;
		}
		
		
		
		
		

		addUpdate(function(elapsed){	
			var sinny:Float = FlxMath.fastSin(Conductor.instance.songPosition/1000) ;			
			var cossy:Float = FlxMath.fastCos(Conductor.instance.songPosition/1000) ;	
			
			var timmy:Float = Conductor.instance.songPosition/1000;		
			
			var bounceY:Float = Math.abs(FlxMath.fastSin(Conductor.instance.songPosition/1000 * 4));		

			var defaultX:Float = 0;
			var defaultY:Float = 0;
			var defaultZ:Float = 250;
			
			
			var rotationX:Float = 0;			
			var rotationY:Float = timmy*10;	
			var rotationZ:Float = 0;	
			
			face1.moveX = defaultX;
			face1.moveY = defaultY;
			face1.moveZ = defaultZ;
			face2.moveX = defaultX;
			face2.moveY = defaultY;
			face2.moveZ = defaultZ;
			face3.moveX = defaultX;
			face3.moveY = defaultY;
			face3.moveZ = defaultZ;
			face4.moveX = defaultX;
			face4.moveY = defaultY;
			face4.moveZ = defaultZ;
			face5.moveX = defaultX;
			face5.moveY = defaultY;
			face5.moveZ = defaultZ;
			face6.moveX = defaultX;
			face6.moveY = defaultY;
			face6.moveZ = defaultZ;
			
			
			
			
			//ROTATE ON Y
			face1.angleX = rotationX;
			var op:Vector2 = new Vector2(-spacing, 0);
			var rp:Vector2 = new Vector2(0, 0);
			var r = ModConstants.rotateAround(op, rp, rotationX);
			face1.moveZ += r.x;
			face1.moveY += r.y;
			
			//game.modDebugNotif(r.x, 0xFFFF0000, 0.045, 0.001, 0.001);
			//game.modDebugNotif(r.y, 0xFF009FFF, 0.045, 0.001, 0.001);
			
	
			face2.angleX = rotationX;
			var op:Vector2 = new Vector2(spacing, 0);
			var rp:Vector2 = new Vector2(0, 0);
			var r = ModConstants.rotateAround(op, rp, rotationX);
			face2.moveZ += r.x;
			face2.moveY += r.y;

			
			
			face5.angleX = 90+rotationX;
			var op:Vector2 = new Vector2(-spacing, 0);
			var rp:Vector2 = new Vector2(0, 0);
			var r = ModConstants.rotateAround(op, rp, rotationX);
			face5.moveZ += r.y*-1;
			face5.moveY += r.x;
			
			
			face6.angleX = 90+rotationX;
			var op:Vector2 = new Vector2(spacing, 0);
			var rp:Vector2 = new Vector2(0, 0);
			var r = ModConstants.rotateAround(op, rp, rotationX);
			face6.moveZ += r.y*-1;
			face6.moveY += r.x;
			
			face3.angleZ = rotationX;
			face4.angleZ = rotationX*-1;
			
			
			
			
			
		
			//ROTATE ON Y
			var op:Vector2 = new Vector2(spacing, 0);
			var rp:Vector2 = new Vector2(0, 0);
			var r = ModConstants.rotateAround(op, rp, rotationY);
			
			face3.moveX += r.x;
			face3.moveZ += r.y;
			face3.angleY = 90 + rotationY;
			
			
			
			face4.angleY = -90 + rotationY;
			var op:Vector2 = new Vector2(-spacing, 0);
			var rp:Vector2 = new Vector2(0, 0);
			var r = ModConstants.rotateAround(op, rp, rotationY);
			face4.moveX += r.x;
			face4.moveZ += r.y;


			
			
			face1.angleY = rotationY;
			var op:Vector2 = new Vector2(0, 0);
			var rp:Vector2 = new Vector2(0, spacing);
			var r = ModConstants.rotateAround(op, rp, rotationY);
			face1.moveX += r.x;
			face1.moveZ += r.y;
			
			
			face2.angleY = rotationY+180;
			var op:Vector2 = new Vector2(0, 0);
			var rp:Vector2 = new Vector2(0, -spacing);
			var r = ModConstants.rotateAround(op, rp, rotationY);
			face2.moveX += r.x;
			face2.moveZ += r.y;
			
			face5.angleZ = rotationY;
			face6.angleZ = rotationY;

			
			
			//game.modDebugNotif(r.x, 0xFFFFFFFF, 0.045, 0.001, 0.001);
			
			
			
			
			
			
			
			
			//Update and display the changes!
			face1.updateTris();	
			face2.updateTris();	
			face3.updateTris();	
			face4.updateTris();	
			face5.updateTris();	
			face6.updateTris();	
		});
		
		
		
		
		var txt_title = createSpr("txt_title", 'matoi/txt_title');
		txt_title.screenCenter();	
		txt_title.scrollFactor.set();
		txt_title.zIndex = 5000;
		txt_title.y -=120;
		txt_title.scale.set(1.5, 1.5);
		
		var txt_subtitle1 = createSpr("txt_subtitle1", 'matoi/txt_text1');
		txt_subtitle1.screenCenter();	
		txt_subtitle1.scrollFactor.set();
		txt_subtitle1.zIndex = 4998;
		txt_subtitle1.y += 40;
		
		var txt_subtitle2 = createSpr("txt_subtitle2", 'matoi/txt_text2');
		txt_subtitle2.screenCenter();	
		txt_subtitle2.scrollFactor.set();
		txt_subtitle2.zIndex = 4999;
		txt_subtitle2.y += 120;

	]])
end


function events()
	runHaxeCode(
	[[
		var target1 = PlayState.instance.playerStrumline.mods;
		addResetEvent(function(){
			getSpr("bg1").alpha=0;
			getSpr("bg2").alpha=0;
			getSpr("bg3").alpha=0;
			getSpr("bgStars").alpha=0;
			getSpr("face1").alpha=0;
			getSpr("face2").alpha=0;
			getSpr("face3").alpha=0;
			getSpr("face4").alpha=0;
			getSpr("face5").alpha=0;
			getSpr("face6").alpha=0;
			
			getSpr("txt_title").alpha=0;
			getSpr("txt_subtitle2").alpha=0;
			getSpr("txt_subtitle1").alpha=0;
		});	
		
		eh.funcTweenModEvent(target1, 16, 16,  FlxEase.expoOut, 0, 1, function(v) {
			getSpr("txt_title").alpha=v;
		}, "txt_title-fade");
		
		eh.funcTweenModEvent(target1, 16, 16,  FlxEase.expoOut, 0.5, 1.6, function(v) {
			getSpr("txt_title").scale.x=v;
		}, "txt_title-scalex");
		
		
		eh.funcTweenModEvent(target1, 26.9, 8,  FlxEase.expoOut, 0.0, 1.0, function(v) {
			getSpr("txt_subtitle1").alpha=v;
		}, "txt_title_2-fade");
		
		eh.funcTweenModEvent(target1, 27.25, 8,  FlxEase.expoOut, 0.0, 1.0, function(v) {
			getSpr("txt_subtitle2").alpha=v;
		}, "txt_title_3-fade");
		
		
		eh.funcTweenModEvent(target1, 46, 0.05,  FlxEase.expoOut, 1.0, 0.0, function(v) {
			getSpr("txt_subtitle2").alpha=v;
		}, "txt_title_3-fade");
		
		eh.funcTweenModEvent(target1, 46, 0.05,  FlxEase.expoOut, 1.0, 0.0, function(v) {
			getSpr("txt_subtitle1").alpha=v;
		}, "txt_title_2-fade");
		
		eh.funcTweenModEvent(target1, 46, 0.05,  FlxEase.expoOut, 1.0, 0.0, function(v) {
			getSpr("txt_title").alpha=v;
		}, "txt_title-fade");
		
		
		
		
		eh.funcTweenModEvent(target1, 16, 16,  FlxEase.expoOut, 0,1, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
		
		
		
		
		
		eh.funcTweenModEvent(target1, 16, 16,  FlxEase.expoOut, 0,1, function(v) {
			
			getSpr("face1").alpha=v;
			getSpr("face2").alpha=v;
			getSpr("face3").alpha=v;
			getSpr("face4").alpha=v;
			getSpr("face5").alpha=v;
			getSpr("face6").alpha=v;
			
		}, "clouds-fade");
		
		
		
		
		eh.funcTweenModEvent(target1, 46, 0.1,  FlxEase.expoOut, 1,0, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
		
		eh.funcTweenModEvent(target1, 46, 0.1,  FlxEase.expoOut, 1,0.2, function(v) {
			
			getSpr("face1").alpha=v;
			getSpr("face2").alpha=v;
			getSpr("face3").alpha=v;
			getSpr("face4").alpha=v;
			getSpr("face5").alpha=v;
			getSpr("face6").alpha=v;
			
		}, "clouds-fade");
		
		
		eh.funcTweenModEvent(target1, 99.5, 15,  FlxEase.linear, 0,0.5, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
		
		eh.funcTweenModEvent(target1, 116, 8,  FlxEase.sineInOut, 0.5,1, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
		
		eh.funcTweenModEvent(target1, 99.5, 1,  FlxEase.expoInOut, 0.2,1, function(v) {
			
			getSpr("face1").alpha=v;
			getSpr("face2").alpha=v;
			getSpr("face3").alpha=v;
			getSpr("face4").alpha=v;
			getSpr("face5").alpha=v;
			getSpr("face6").alpha=v;
			
		}, "clouds-fade");
		
		
		eh.funcTweenModEvent(target1, 226.5, 0.05,  FlxEase.expoOut, 1, 0.1, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
		
		eh.funcTweenModEvent(target1, 227.25, 0.05,  FlxEase.expoOut, 0.1, 1, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
		
		eh.funcTweenModEvent(target1, 354, 4,  FlxEase.sineInOut, 1, 0.75, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
	
	
	
		eh.funcTweenModEvent(target1, 420, 64,  FlxEase.linear, 0.75,0, function(v) {
			getSpr("bg1").alpha=v;
		}, "bg1-fade");
		
		eh.funcTweenModEvent(target1, 420, 64,  FlxEase.linear, 0.0, 1, function(v) {
			getSpr("bg2").alpha=v;
		}, "bg2-fade");
		
		
		eh.funcTweenModEvent(target1, 676, 64+64,  FlxEase.linear, 1, 0, function(v) {
			getSpr("bg2").alpha=v;
		}, "bg2-fade");
		
		eh.funcTweenModEvent(target1, 676, 64+64,  FlxEase.linear, 0, 1, function(v) {
			getSpr("bg3").alpha=v;
		}, "bg3-fade");
		
		eh.funcTweenModEvent(target1, 676+32, 64+64,  FlxEase.linear, 0, 1, function(v) {
			getSpr("bgStars").alpha=v;
		}, "bgStars-fade");
		
		eh.funcTweenModEvent(target1, 676, 64+64,  FlxEase.linear, 1, 0.05, function(v) {
			
			getSpr("face1").alpha=v;
			getSpr("face2").alpha=v;
			getSpr("face3").alpha=v;
			getSpr("face4").alpha=v;
			getSpr("face5").alpha=v;
			getSpr("face6").alpha=v;
			
		}, "clouds-fade");
		
		eh.funcTweenModEvent(target1, 804, 8,  FlxEase.quadInOut, 0.05, 0, function(v) {
			
			getSpr("face1").alpha=v;
			getSpr("face2").alpha=v;
			getSpr("face3").alpha=v;
			getSpr("face4").alpha=v;
			getSpr("face5").alpha=v;
			getSpr("face6").alpha=v;
			
		}, "clouds-fade");
		
		
	
	
	]])
	
end

function modsTimeline()
	cubeTest()
	events()
end


