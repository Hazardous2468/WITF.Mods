function setUp()
	addHaxeLibrary("FunkinSound", "funkin.audio")

	runHaxeCode(
	[[
		setVar("HER_canSkipDarkscape", false);
		setVar("HER_inRepeat", false);
		setVar("HER_doneRepeat", false);
		
		//Create the looping audio for the darkscape thingy
		var darkscapeAudioLoop = FunkinSound.load(Paths.sound('inhuman/darkscape/ambience/machine'),1,true);
		setVar("darkscapeAudioLoop_machine", darkscapeAudioLoop);
		darkscapeAudioLoop.volume = 0.4;
		
		//Create the looping audio for the darkscape thingy
		var darkscapeAudioLoop_ = FunkinSound.load(Paths.sound('inhuman/darkscape/ambience/claustrophobic'),1,true);
		setVar("darkscapeAudioLoop_claustrophobic", darkscapeAudioLoop_);
		
		//Create the looping audio for the darkscape thingy
		var darkscapeAudioLoop__ = FunkinSound.load(Paths.sound('inhuman/darkscape/ambience/drone1'),1,true);
		setVar("darkscapeAudioLoop_drone1", darkscapeAudioLoop__);
	]])
end

function modsTimeline()
	stageSetup()
	set(626, 1, "alpha")
	set(626, 0, "arrowpath","1")
	set(639.8, 0, "alpha","1")
end

function stageSetup()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "funkin")
	addHaxeLibrary("ZProjectSpriteGroup", "funkin.graphics")
	addHaxeLibrary("ZSpriteProjected", "funkin.graphics")
	addHaxeLibrary("FlxAngle", "flixel.math")
	addHaxeLibrary("FlxBar", "flixel.ui")
	--addHaxeLibrary("Lib", "openfl")
	addHaxeLibrary("MouseUtil", "funkin.util")
	addHaxeLibrary("WindowUtil", "funkin.util")
	addHaxeLibrary("FlxTypeText", "flixel.addons.text")
	addHaxeLibrary("ModStore", "funkin.modding")
	runHaxeCode(
	[[
		var debuggingMode:Bool = false;
	
		var target1 = PlayState.instance.playerStrumline.mods;
		var insideCutscene:Bool = false;
		
		var projectStage:ZProjectSpriteGroup = new ZProjectSpriteGroup();
		var fogSprites:Array<ZSpriteProjected> = [];
		var billboardSprites:Array<ZSpriteProjected> = [];
		var enemies:Array<ZSpriteProjected> = [];
		
		var staminaBar:FlxBar = new FlxBar(0, 0, "LEFT_TO_RIGHT", FlxG.width/2, 24, null, '', 0, 1);
		staminaBar.scrollFactor.set();
		staminaBar.createFilledBar(0xFF000000, 0xFFFFFFFF);
		staminaBar.numDivisions = 100;
		staminaBar.screenCenter();
		staminaBar.y += (FlxG.height * 0.5) - 12-8;
		staminaBar.camera = game.camHUD;
		game.customLuaSprites.set("staminaBar", staminaBar);
		game.add(staminaBar);
		staminaBar.alpha=0.5;
		
		var her_FPS_Shader = new FlxRuntimeShader(Assets.getText(Paths.frag("inhuman/HER_FPS_Shader")), null);
		addUpdate(function(elapsed){
			var camSway:Float = getVar("HER_cameraSway");
			if(her_FPS_Shader!= null && camSway != null){
				her_FPS_Shader.setFloat('uTime', Conductor.instance.songPosition/1000);
				
				var camSwaySine:Float = FlxMath.fastSin(camSway);
				
				//once below 0.75...
				var healthSwayMult:Float = (0.75-FlxMath.bound(game.health, 0, 0.75))*2.2;
				healthSwayMult += 1;
				//print(healthSwayMult);
				camSwaySine *= healthSwayMult;
				her_FPS_Shader.setFloat('cameraSway', camSwaySine * FlxAngle.TO_RAD);
				//FlxG.camera.angle = camSwaySine;	
			}			
		});	
		
		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(her_FPS_Shader));
		
		addResetEvent(function(){
			if(getVar("HER_inRepeat")) game.camGame.filters = (newCamEffects);
		});	
			
		
		setVar("HER_doneRepeat", false); //Reset this when reloading this script
		
		var txtID:Int = 0;
		function resetStuff(){
		
			if(Conductor.instance.currentBeatTime > 5) return;
			
			insideCutscene = false;
			txtID = 0;
		
			var inRepeat = getVar("HER_inRepeat");
			var repeatDone = getVar("HER_doneRepeat");
			
			var darkscapeAudioLoop = getVar("darkscapeAudioLoop_machine");
			if(darkscapeAudioLoop != null){
				if(darkscapeAudioLoop.isPlaying){
					darkscapeAudioLoop.pause();
				}
			}
			darkscapeAudioLoop = getVar("darkscapeAudioLoop_claustrophobic");
			if(darkscapeAudioLoop != null){
				if(darkscapeAudioLoop.isPlaying){
					darkscapeAudioLoop.pause();
				}
			}
			darkscapeAudioLoop = getVar("darkscapeAudioLoop_drone1");
			if(darkscapeAudioLoop != null){
				if(darkscapeAudioLoop.isPlaying){
					darkscapeAudioLoop.pause();
				}
			}
			
			//setVar("HER_doneRepeat", false); // Don't reset this variable so that we skip the whole minigame section for QoL
			setVar("HER_inRepeat", false);
			setVar("HER_canSkipDarkscape", false);
			projectStage.visible = false;
			if(debuggingMode){ PlayState.instance.modDebugNotif("Reset loop thing", 0xFFFFFF00);}
			
			setVar("HER_roomCount", 0);
			game.camGame.filters = ([]);	
			
		}
		
		addResetEvent(function(){
			resetStuff();
		});	

		//eh.funcModEvent(target1, 0, function() {
			//resetStuff();
		//},"reset loop thing", false);


		//game.camGame.filters = (newCamEffects);	
		
		var textureSize:Float = 256;
	
		setVar("HER_roomCount", 0);
	
		//Room Variables
		var moveSpeed:Float = 256;
		var lookSpeed:Float = 90;
		var stamina:Float = 5; //In seconds
		
		var enemyAttackRange:Float = 99;
		var enemyMoveSpeed:Float = 222;
		var enemiesStartAtRoom:Int = 5;
		var stareEyesEnemyStartAtRoom:Int = 12;
		var endRoom:Int = 40;
		// Amelia Hallway1 = endRoom
		// Amelia Hallway2 = endRoom+1
		// Amelia Office = endRoom+2
		// Passageway = endRoom+3
		
		if(debuggingMode){
			enemiesStartAtRoom = 2;
			stareEyesEnemyStartAtRoom = 4;
			endRoom = 6;
			stamina = 120;
		}
				
		var first_roomSize:Array<Int> = [5, 6];
		
		var first_entranceDoorPos:Int = 1;
		var first_exitDoorPos:Int = 0;
		
		var first_roomOffset:Array<Float> = [
		(first_roomSize[0]/2)*(textureSize*-0.5),
		(first_roomSize[1]-1)*(textureSize*-1)
		];
		
		
		var fogAlphaMult:Float = 0.6;
		
		var enemySounds:Map<ZSpriteProjected, FunkinSound>;
		//var enemySounds:Array<FunkinSound> = [];
		
		var entranceDoorPos:Int = 0;
		var exitDoorPos:Int = 0;
		var curRoomSize:Array<Int> = first_roomSize;
		var curRoomOffset:Array<Float> = first_roomOffset;
		
		
		var wallLeftPos:Float = -9999;
		var wallRightPos:Float = 9999;
		var backWallPos:Float = -9999;
		var frontWallPos:Float = 9999;
		game.customLuaSprites.set("projectStage", projectStage);
		game.add(projectStage);
		projectStage.scrollFactor.set();
		projectStage.screenCenter();
		projectStage.visible = getVar("HER_inRepeat");
		projectStage.autoRefresh = true;
		
		setVar("HER_cameraSway", 0.0);
		
		var baseFogAlphaMult = fogAlphaMult;
		function generateRoom(roomSize:Array<Int>, roomOffset:Array<Float>, entranceDoor:Int, exitDoor:Int, fogAlphaMult:Float = 1.0){
			projectStage.autoRefresh = false;

			var darkscapeAudioLoop_claustrophobic = getVar("darkscapeAudioLoop_claustrophobic");
			if(darkscapeAudioLoop_claustrophobic != null){
				if(darkscapeAudioLoop_claustrophobic.isPlaying){
					darkscapeAudioLoop_claustrophobic.pause();
				}
			}
			var darkscapeAudioLoop_drone1 = getVar("darkscapeAudioLoop_drone1");
			if(darkscapeAudioLoop_drone1 != null){
				if(darkscapeAudioLoop_drone1.isPlaying){
					darkscapeAudioLoop_drone1.pause();
				}
			}
			
			if(enemySounds != null){
				for (key in enemySounds.keys())
				{
					var snd = enemySounds.get(key);
					if(snd != null){
						snd.stop();
					}
					enemySounds.remove(key);
				}
			}
			
			//for (snd in enemySounds)
			//{	
			//	snd.stop();
			//	snd.destroy();
			//}
			
			for (spr in projectStage) // Clear out all existings sprites
			{	
				if(enemies.contains(spr)){
					enemies.remove(spr);
				}
				if(billboardSprites.contains(spr)){
					billboardSprites.remove(spr);
				}
				projectStage.remove(spr);
				spr.destroy();
			}
			
			fogAlphaMult = baseFogAlphaMult;
			
			entranceDoorPos = entranceDoor;
			exitDoorPos = exitDoor;
			curRoomSize = roomSize;
			curRoomOffset = roomOffset;
			
			setVar("HER_positionX", 0.0);
			setVar("HER_positionY", 0.0);
			
			//Move stage back to 0 to initalise everything correctly.
			projectStage.z = 0;
			
			var roomType:String = "normal";
			
			var r:Int = getVar("HER_roomCount");
			if(Math.isNaN(r)) r = 0;
			r++;
			setVar("HER_roomCount", r);
			switch(r){
				case endRoom:
					//print("Outside Amelia Hall: " + r);
					roomSize = [3, 5];
					roomOffset = [(roomSize[0]/2)*(textureSize*-0.5),(roomSize[1]-1)*(textureSize*-1)];
					entranceDoor = 1;
					exitDoor = 1;
					
					
				case endRoom+1:
					roomType = "pre amelia";
					//print("Amelia Hall: " + r);
					roomSize = [1, 4];
					roomOffset = [(roomSize[0]/2)*(textureSize*-0.5),(roomSize[1]-1)*(textureSize*-1)];
					entranceDoor = 0;
					exitDoor = 0;
					
				case endRoom+2:
					roomType = "amelia";
					//print("Amelia Office: " + r);
					roomSize = [3, 3];
					roomOffset = [(roomSize[0]/2)*(textureSize*-0.5),(roomSize[1]-1)*(textureSize*-1)];
					entranceDoor = 1;
					exitDoor = 0;
					if(darkscapeAudioLoop_drone1 != null){
						if(!darkscapeAudioLoop_drone1.isPlaying){
							darkscapeAudioLoop_drone1.play();
						}
					}
					
					var hang:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image("inhuman/cinder/darkscape/amelia_noose") );
					hang.cullMode = "none";
					hang.x -= hang.width/2;
					hang.y += hang.height;
					hang.y -= textureSize;
					hang.tag = "hang";
					hang.x -= roomOffset[0];
					hang.z -= roomOffset[1];
					hang.z -= textureSize*1.4;
					projectStage.add(hang);
					billboardSprites.push(hang);
					
					var chair:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image("inhuman/cinder/darkscape/amelia_chair") );
					chair.cullMode = "none";
					chair.x -= chair.width/2;
					chair.x -= 5;
					chair.tag = "chair";
					chair.x -= roomOffset[0];
					chair.z -= roomOffset[1];
					chair.z -= textureSize*1.4;
					projectStage.add(chair);
					billboardSprites.push(chair);
					
				case endRoom+3:
					//print("Passageway: " + r);
					roomType = "passage";
					roomSize = [1, 26];
					roomOffset = [(roomSize[0]/2)*(textureSize*-0.5),(roomSize[1]-1)*(textureSize*-1)];
					entranceDoor = 0;
					exitDoor = 60;
					fogAlphaMult = 0.75;
					
					if(darkscapeAudioLoop_claustrophobic != null){
						if(!darkscapeAudioLoop_claustrophobic.isPlaying){
							darkscapeAudioLoop_claustrophobic.play();
						}
					}
					
					for (y in 0...roomSize[1]){
						for (x in 0...2){
							var wallTest1:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image("inhuman/cinder/darkscape/passage_pipe") );
							wallTest1.cullMode = "none";
							wallTest1.x -= wallTest1.width/2;
							wallTest1.y -= wallTest1.height/2;
							wallTest1.z -= textureSize/2;			
							projectStage.add(wallTest1);
							wallTest1.tag = "passagePipe";
							wallTest1.angleY = 270;
							wallTest1.x -= textureSize/2;
							wallTest1.x += textureSize * x;
			
							wallTest1.x += wallTest1.width/4 * (x == 1 ? -1 : 1);
							wallTest1.z += textureSize*y;
							
							//wallTest1.z += textureSize*2;
							
							billboardSprites.push(wallTest1);
						}
					}
					
					var ashley:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image("inhuman/cinder/darkscape/ashley") );
					ashley.cullMode = "none";
					ashley.x -= ashley.width/2;
					ashley.y -= ashley.height/2;
					ashley.subdivisions = 5;
					billboardSprites.push(ashley);
					ashley.scaleX = 1;
					ashley.scaleY = 1;
					ashley.tag = "ashley";
					ashley.x -= roomOffset[0];
					ashley.x -= 128/2;
					ashley.z += textureSize*3;
					ashley.z += textureSize*0.15;
					ashley.scaleX *= 0.6;
					ashley.scaleY *= 0.6;
					ashley.y += ashley.height*0.189;
					projectStage.add(ashley);

				default:
					print("Room: " + r);
			}
			

			//Create the room floor and ceilings plus the walls on the x axis
			for (x in 0...roomSize[0]){
				for (y in 0...roomSize[1]){
					createRoomBlock(x,y, roomType);
				}
				var _roomType:String = roomType;
				if(roomType == "amelia"){
					_roomType = "amelia_shelfwall";
				}
				var wall = createRoomWall(x == exitDoor ? "exitdoor" : _roomType);
				wall.x += textureSize*x;
				wall.angleY = 0;
				
				var wall = createRoomWall(x == entranceDoor ? "entrancedoor" : roomType);
				wall.x += textureSize*x;
				wall.z += roomSize[1]*textureSize;
				wall.angleY = 180;
			}
			
			//Create the walls on the y/z/depth axis
			for (y in 0...roomSize[1]){
				var wall = createRoomWall(roomType);
				wall.angleY = 270;
				wall.x -= textureSize/2;
				wall.z += textureSize/2;
				wall.z += textureSize*y;
				
				var wall = createRoomWall(roomType);
				wall.angleY = 90;
				wall.x -= textureSize/2;
				wall.x += roomSize[0]*textureSize;
				wall.z += textureSize/2;
				wall.z += textureSize*y;
			}
			
			//Room offset
			for (spr in projectStage)
			{
				spr.x += roomOffset[0];
				spr.z += roomOffset[1];
			}
				
			//Create the fog
			for (i in 0...5){
				var blackFog1:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image('inhuman/cinder/darkscape/black') );
				blackFog1.cullMode = "back";
				
				blackFog1.x -= textureSize/2;
				blackFog1.y -= textureSize/2;
				blackFog1.z -= textureSize/2*i;
				blackFog1.z -= textureSize/2*2;
				blackFog1.scaleX = 16;
				blackFog1.tag = "fog";
				
				projectStage.add(blackFog1);
				
				blackFog1.alpha = (i == 4 ? 1.0 : 0.5) * fogAlphaMult;
				
				fogSprites.push(blackFog1);
			}
			
			
			//Define room bounds for collision
			
			wallLeftPos = textureSize/2;
		
			wallRightPos = textureSize*roomSize[0]*-1;
			wallRightPos += textureSize/2;
			
			backWallPos = textureSize*roomSize[1]*-1;
			backWallPos += textureSize/2;
			
			frontWallPos = textureSize/2;

			wallLeftPos -= roomOffset[0];
			wallRightPos -= roomOffset[0];
			backWallPos -= roomOffset[1];
			frontWallPos -= roomOffset[1];
			
			//Move stage to be like first person
			projectStage.z = 256*4.0;
						
			var collisionSpacing = textureSize * 0.24;
			
			wallLeftPos -= collisionSpacing;
			wallRightPos += collisionSpacing;
			backWallPos += collisionSpacing;
			frontWallPos -= collisionSpacing;
			
			if(getVar("HER_roomCount") >= enemiesStartAtRoom){
				generateEnemies();
			}
			
			projectStage.autoRefresh = true;
			projectStage.rotateY(0); //correct their rotated position
		}
		

		function createRoomBlock(x:Int, y:Int, type:String = "normal"){
			var floorTex = "floor";
			var ceilingTex = "floor";
			if(type == "passage"){
				floorTex = "passage_floor";
				ceilingTex = "passage_ceiling";
			}else if(type == "amelia"){
				floorTex = "amelia_floor";
				ceilingTex = "amelia_ceiling";
			}
			
			var floor:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image('inhuman/cinder/darkscape/'+floorTex) );
			floor.angleX = 270;
			floor.cullMode = "back";
			floor.x -= textureSize/2;
			floor.tag = "floor";
			projectStage.add(floor);
			
			var ceiling:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image('inhuman/cinder/darkscape/'+ceilingTex) );
			ceiling.angleX = 90;
			ceiling.cullMode = "back";
			ceiling.y -= textureSize/2;
			ceiling.x -= textureSize/2;
			ceiling.y -= textureSize/2;
			ceiling.tag = "ceiling";
			projectStage.add(ceiling);
			
			var stuff:Array<ZSpriteProjected> = [ceiling, floor];
			x *= textureSize;
			y *= textureSize;
			for (spr in stuff){
				spr.z += y;
				spr.x += x;				
			}
		}
		
		function createRoomWall(type:String = "normal"):ZSpriteProjected{
			var curRoom:Int = getVar("HER_roomCount");
			var wallTex:String = 'inhuman/cinder/darkscape/';
			var wallType:String = 'wall?';
			if(type == "entrancedoor"){
				if(curRoom == endRoom+2){
					wallTex += "amelia_doorInside";
				}else{
					wallTex += "wallDoorClosed";
				}
				
				wallType = "entranceDoor";
			}else if(type == "exitdoor"){
				if(curRoom == endRoom+2){
					wallTex += "amelia_doorSecret";
				}else if(curRoom == endRoom+1){
					wallTex += "amelia_door1";
				}else{
					wallTex += "wallDoor";
				}			
				
				wallType = "exitDoor";
			}else if(type == "passage"){
				wallTex += "passage_wall";
				wallType = "Wall";
			}else if(type == "amelia"){
				wallTex += "amelia_wall";
				wallType = "Wall";
			}else if(type == "amelia_shelfwall"){
				wallTex += "amelia_wall_shelf";
				wallType = "Wall";
			}else{
				if(FlxG.random.bool(10)){
					wallTex += "wall_vent";
				}else{
					wallTex += "wall" + FlxG.random.int(1,3);
				}
				wallType = "Wall";
			}
			
			var wallTest1:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image(wallTex) );
			wallTest1.cullMode = "back";
			wallTest1.x -= textureSize/2;
			wallTest1.y -= textureSize/2;			
			wallTest1.z -= textureSize/2;			
			projectStage.add(wallTest1);
			wallTest1.tag = wallType;
			return wallTest1;
		}
		
		
		
		
		
		function createEnemy(type:String = "random"):ZSpriteProjected{
					
			var enemyID:Int = 0;
			if (type == "random"){
				var randomInt:Int = FlxG.random.int(1,3);
				if(getVar("HER_roomCount") < stareEyesEnemyStartAtRoom){
					randomInt = FlxG.random.int(1,2);
				}
				
				enemyID = randomInt;
				switch(randomInt){
					case 1: type = "face";
					case 2: type = "hanged";
					case 3: type = "eyes";
				}
			}
			switch(type){
				case "face": 	enemyID = 1;
				case "hanged": 	enemyID = 2;
				case "eyes": 	enemyID = 3;
				default: 		enemyID = -1;
			}
			//print("created: " + type, 0xFFFFA000);
			
			if(enemyID == -1){
				print("CRITICAL ERROR: INVALID ENEMY ID!", 0xFFFF0000);
				return null;
			}
		
			var tx:String = "inhuman/cinder/darkscape/enemy_" + type;
			var enemySpr:ZSpriteProjected = new ZSpriteProjected(0, 0, Paths.image(tx) );
			enemySpr.cullMode = "none";
			enemySpr.x -= enemySpr.width/2;
			enemySpr.y -= enemySpr.height/2;
			projectStage.add(enemySpr);
			enemySpr.z = 1 * textureSize*-1/2;
			enemySpr.subdivisions = 6;
			billboardSprites.push(enemySpr);
			enemies.push(enemySpr);
			enemySpr.scaleX = 1;
			enemySpr.scaleY = 1;
			enemySpr.tag = type;
			
			enemySpr.vibrateEffect = 2;
			
			// Using the "lastKnownPosition" variable to store what type this enemy is lol
			enemySpr.lastKnownPosition.x = enemyID;
			
			switch(type){
				case "face": 
					var snd = FunkinSound.load(Paths.sound('inhuman/darkscape/Enemy_face'), 1, true);
					snd.play();
					if(enemySounds == null){
						enemySounds = [enemySpr => snd];
					}else{
						enemySounds.set(enemySpr, snd);
					}

				case "hanged": 
					var snd = FunkinSound.load(Paths.sound('inhuman/darkscape/Enemy_hang'), 1, true);
					snd.play();
					if(enemySounds == null){
						enemySounds = [enemySpr => snd];
					}else{
						enemySounds.set(enemySpr, snd);
					}
			}
			
			
			
			
			return enemySpr;
		}
		
		//Every room garunteed to have 1 enemy. multiple if room is big enough
		function generateEnemies(){
			var roomCount:Int = getVar("HER_roomCount");
			
			if(
			(roomCount >= enemiesStartAtRoom*3 &&  FlxG.random.bool(10) ) || //small chance to not spawn any enemies
				roomCount >= endRoom-1
			) return; 
			
		
			var enemy1Type:String = "random";
			if(roomCount == enemiesStartAtRoom) enemy1Type = "face";
			if(roomCount == stareEyesEnemyStartAtRoom){ 
				enemy1Type = "eyes";
				var enemy2 = createEnemy(enemy1Type);
				enemy2.z -= textureSize*12;
			}
			var enemy1 = createEnemy(enemy1Type);
			
			
			
			if(roomCount >= enemiesStartAtRoom*3){
				if(curRoomSize[0] > 4){
					enemy1.x -= textureSize/2;
					var enemy2 = createEnemy("random");
					enemy2.x += textureSize;
					enemy2.z += textureSize/4;
					enemy1.z -= textureSize/2;
				}
				
				if(curRoomSize[1] >= 7){
					var enemy3 = createEnemy("random");
					enemy3.x += textureSize*0.75;
					enemy3.z -= textureSize*3;
				}
			}
			
		}
		
		
		function tpToEndOfThisShit(){
			var targetBeat:Float = 639.05;
			
			
			var targetTimeInMS:Float = Conductor.instance.getBeatTimeInMs(targetBeat);			
			FlxG.sound.music.pause();
			if (PlayState.instance.vocals != null) {
				PlayState.instance.vocals.pause();
			}
			FlxG.sound.music.time = targetTimeInMS;
			FlxG.sound.music.pitch = PlayState.instance.playbackRate;
			if(!PlayState.instance.isGamePaused){
				FlxG.sound.music.play();
			}
			
			if (PlayState.instance.vocals != null) {
				//PlayState.instance.vocals.time = targetTimeInMS;
				if (Conductor.instance().songPosition <= PlayState.instance.vocals.length)
				{
					PlayState.instance.vocals.time = targetTimeInMS;
					PlayState.instance.vocals.pitch = PlayState.instance.playbackRate;
				}
				if(!PlayState.instance.isGamePaused){
					PlayState.instance.vocals.play();
				}
			}
			Conductor.instance.songPosition = targetTimeInMS;
			//PlayState.instance.handleSkippedNotes();
			Conductor.instance.update();
		}	
		
		//generateRoom(first_roomSize, first_roomOffset, first_entranceDoorPos, first_exitDoorPos, fogAlphaMult);
		eh.funcModEvent(target1, 628, function() {
			insideCutscene = false;
			var darkscapeAudioLoop = getVar("darkscapeAudioLoop_machine");
			if(darkscapeAudioLoop != null){
				if(!darkscapeAudioLoop.isPlaying){
					darkscapeAudioLoop.play();
				}
			}
						
			var inRepeat = getVar("HER_inRepeat");
			var repeatDone = getVar("HER_doneRepeat");
			
			if(repeatDone){
				tpToEndOfThisShit();
				return;
			}
			
			if(!repeatDone && !inRepeat){
				setVar("HER_inRepeat", true);
				setVar("HER_canSkipDarkscape", true);
				if(debuggingMode){ PlayState.instance.modDebugNotif("Entered loop thing", 0xFFFFFF00);}
				
				projectStage.visible = true;
				MouseUtil.warpMouse(FlxG.width/2,FlxG.height/2);
				
				projectStage.curRotY = 0;
				generateRoom(first_roomSize, first_roomOffset, first_entranceDoorPos, first_exitDoorPos, fogAlphaMult);
			}
			game.camGame.filters = (newCamEffects);	
			
		},"enter loop thing", false);
		

		
		var playedStepForThisSway:Bool = false;
		function doCamSway(elapsed:Float, projectStage):Void{
			var camSway = getVar("HER_cameraSway");
			camSway += elapsed*6;
			setVar("HER_cameraSway", camSway);
			
			var camSwaySine:Float = FlxMath.fastSin(camSway*1.35);
			projectStage.y = FlxG.height/2;
			projectStage.y += camSwaySine*6;
			
			
			if(camSwaySine <= -0.5 && !playedStepForThisSway){
				playedStepForThisSway = true;
				
				var sndPath = 'inhuman/darkscape/Step';
				if(getVar("HER_roomCount") >= endRoom+3){
					sndPath += "_metal";
				}
				
				FunkinSound.playOnce(Paths.sound(sndPath), 0.95).pitch = FlxG.random.float(0.92,1.075);	
			}else if(camSwaySine > 0){
				playedStepForThisSway = false;
			}
			
		}
		
		function getFowardMult(angle:Float):Array<Float>{
		
			angle = FlxMath.mod(angle, 360) * FlxAngle.TO_RAD;
			var sin:Float = FlxMath.fastSin(angle);
			var cos:Float = FlxMath.fastCos(angle);
			
			//print("---");
			//print(angle);
			//print(sin);
		
			//Forward , Sideways
			return [cos, sin];
		}
		
		//Corrects the fog after it might have been rotated by the stage
		function rotateFog(){
			for (spr in fogSprites){
				if (spr == null) continue;
				spr.x2 = 0;
				spr.z2 = 0;
				spr.angleY2 = 0;
			}
			
			for (spr in billboardSprites){
				if (spr == null) continue;
				spr.angleY2 = 0;
			}
		}
		
		var invincFrames:Float = 2;
		function enemyAttacks(dmg:Float){
			if(invincFrames <= 0){
				//print("ow", 0xFFFF0000);
				invincFrames = 1;
				FlxG.camera.flash(0xFFFF0000, 1);
				game.health -= dmg;
				FunkinSound.playOnce(Paths.sound('inhuman/darkscape/damage'+FlxG.random.int(1,3)), 1).pitch = FlxG.random.float(0.92,1.075);	
			}
		}
		
		var debugCounter:Int = 0;
		function updateEnemies(elapsed){
			if(invincFrames >= 0) invincFrames -= elapsed;
			var i_ = 0;
			for (spr in enemies){
				if (spr == null) continue;
				
				var thisEnemyMoveSpeed:Float = enemyMoveSpeed;
				
				var thisEnemyTypeID:Int = spr.lastKnownPosition.x;
				
				//eyes logic
				if(thisEnemyTypeID == 3){
					if(spr.culled){
						thisEnemyMoveSpeed *= 2;
					}else{
						thisEnemyMoveSpeed = 0;
						//continue;
					}
				}
				
				//eyes logic
				else if(thisEnemyTypeID == 2){
					thisEnemyMoveSpeed *= 0.1;	
				}
				
				
				var a:Float = -spr.z + projectStage.z;
				var b:Float = -spr.x;
				//b += (spr.width*spr.scaleX)/2;
				b += textureSize*2;
				
				var calculateAngleDif:Float = FlxAngle.degreesFromOrigin(a, b);
				
				
				
				var distanceToPlayer:Float = (a * a + b * b);
				var distanceToPlayer_volume:Float = distanceToPlayer * 0.0005;
				distanceToPlayer_volume = FlxMath.remapToRange(distanceToPlayer_volume, 320, 10, 0, 1);
				distanceToPlayer_volume = FlxMath.bound(distanceToPlayer_volume, 0, 1);
				if(debugCounter>20){
					//print("ang:"+calculateAngleDif);
					//print("a:"+a);
					//print("b:"+b);
					//print(distanceToPlayer_volume);
					debugCounter=0;
				}else{
					debugCounter++;
				}

				var snd = enemySounds.get(spr);
				if(snd != null){
					snd.volume = distanceToPlayer_volume * 0.675;
					//snd.pan = 1;
					//var d:Float = (x - _target.x);
					//snd.pan = FlxMath.bound(d, -1, 1);
				}
				
				
				//if(a > -enemyAttackRange && a < enemyAttackRange && b > -enemyAttackRange && b < enemyAttackRange){
				if(distanceToPlayer <= (enemyAttackRange * enemyAttackRange) ){
					//inside the enemy, deal damage.
					enemyAttacks(FlxG.random.float(0.2125, 0.365));
				}else{
				
					var dirMult = getFowardMult(calculateAngleDif);
				
					spr.z += elapsed*thisEnemyMoveSpeed * dirMult[0];
					spr.x += elapsed*thisEnemyMoveSpeed * dirMult[1];
				}
				
				i_++;
			}
			projectStage.rotateY(0); //correct their rotated position					
		}
		
		
		function tryInteractDoor(isEntrance:Bool):Bool{
		
			var posX = getVar("HER_positionX")*-1;
			var posY = getVar("HER_positionY");
			
			
			
			var doorPosX:Float = isEntrance ? entranceDoorPos : exitDoorPos;
			doorPosX *= textureSize;
			doorPosX += curRoomOffset[0];
			
			var doorPosY:Float = isEntrance ? 0 : textureSize*(curRoomSize[1]-1);
			
			
			//if(isEntrance){
				//print(doorPosX, 0xFFFFFF00);
			//}else{
				//print(doorPosX, 0xFF00FFFF);
				//print(curRoomOffset[0], 0xFF00FFFF);
				//print(curRoomOffset[1], 0xFF00FFFF);
			//}
			
			var doorPosX_lower:Float = doorPosX - textureSize/2;
			var doorPosX_upper:Float = doorPosX + textureSize/2;
			
			var doorPosY_lower:Float = doorPosY - textureSize/2;
			var doorPosY_upper:Float = doorPosY + textureSize/2;
		
		
			//check for entrance door
			if( 
			posY > doorPosY_lower && posY < doorPosY_upper &&
			posX > doorPosX_lower && posX < doorPosX_upper
			){
				return true;
			}else{
				return false;
			}
		}
		
		
		
		
		var txtSound = FunkinSound.load(Paths.sound('inhuman/dialogue/qt'), 0.65, false);
        txtSound.volume = 0.6;
		
		qtTypedText = new FlxTypeText(12,24,FlxG.width,"hi :)", 64);
		qtTypedText.setFormat(Paths.font("vcr.ttf"), 30, 0xFFFF9090, "center", textBorderStyle("outline"), 0xFF000000);
		qtTypedText.useDefaultSound = false;
		qtTypedText.sounds = [txtSound];
		qtTypedText.delay = 0.035;
		qtTypedText.cameras = [game.camHUD];
		game.add(qtTypedText);
		qtTypedText.scrollFactor.set();
		qtTypedText.screenCenter();
		game.customLuaSprites.set("qtTypedText", qtTypedText);
		
		function triggerEndCutscene(){
			insideCutscene = true;
			setVar("HER_canSkipDarkscape", false);
			projectStage.visible = false;
			var darkscapeAudioLoop = getVar("darkscapeAudioLoop_drone1");
			if(darkscapeAudioLoop != null){
				darkscapeAudioLoop.stop();
			}	
			darkscapeAudioLoop = getVar("darkscapeAudioLoop_claustrophobic");
			if(darkscapeAudioLoop != null){
				darkscapeAudioLoop.stop();
			}
			
			txtID=0;
			doTextThing();
		}
		var qtTextArr:Array<String>  = [
		"Ashley...",
		"It's going to be okay.",
		"...",
		"I know you've been through a lot...",
		"But I'm here now.",
		"It's time to leave this place behind.",
		"Please...",
		"Can you hear me?"
		];
		function doTextThing(){
			qtTypedText.resetText(qtTextArr[txtID]);
			qtTypedText.start();
		
			insideCutscene = true;
			txtID++;

			var tim = getVar("HER_qtTxtTimer");
			if(tim != null){ 
				tim.cancel();
				tim = null;
				setVar("HER_qtTxtTimer", null);
			}
			
			var qtTextTimer = new FlxTimer().start(3, function(tmr:FlxTimer) {
				if(txtID >= qtTextArr.length){
					endThisShit(false);
					//print("oh...");
				}
				else{
					doTextThing();
				}
			});
			setVar("HER_qtTxtTimer", qtTextTimer);
		}
		addResetEvent(function(){
			if(Conductor.instance.currentBeatTime > 5) return;
			var tim = getVar("HER_qtTxtTimer");
			if(tim != null){ 
				tim.cancel();
				tim = null;
				setVar("HER_qtTxtTimer", null);
			}
		});	
		
		eh.funcModEvent(target1, 639.9, function() {
			qtTypedText.resetText("");
		});
		
		
		
		var endFunc:Void->Void = function endThisShit(skipped:Bool = false){
			setVar("HER_inRepeat", false);
			setVar("HER_canSkipDarkscape", false);
			setVar("HER_doneRepeat", true);
			qtTypedText.resetText("");

			projectStage.visible = false;
		
			var darkscapeAudioLoop = getVar("darkscapeAudioLoop_drone1");
			if(darkscapeAudioLoop != null){
				darkscapeAudioLoop.stop();
			}	
			darkscapeAudioLoop = getVar("darkscapeAudioLoop_claustrophobic");
			if(darkscapeAudioLoop != null){
				darkscapeAudioLoop.stop();
			}	
			darkscapeAudioLoop = getVar("darkscapeAudioLoop_machine");
			if(darkscapeAudioLoop != null){
				darkscapeAudioLoop.stop();
			}
			tpToEndOfThisShit();

			if(skipped){
				FunkinSound.playOnce(Paths.sound("inhuman/ui/menuDisappear"), 0.8);
			}
		}
		setVar("HER_darkscapeEndFunc", endFunc);
		
		
		var interactRadius:Float = textureSize*0.675;
		function tryInteract(){

			//New code:
			var posX = getVar("HER_positionX")*-1;
			var posY = getVar("HER_positionY");
			
			var debug:Bool = false;
			
			if(debug) print("trying interact");
			
			
			//Loop through all sprites and get their texture
			for (spr in projectStage) // Clear out all existings sprites
			{				
				if(!(spr.tag == "entranceDoor" || spr.tag == "exitDoor") && debug){
					continue;
				}
				if(debug) print(spr.tag);
				
				if(debug) print(first_roomOffset[0]);
				
				var sX:Float = spr.x + (first_roomOffset[0]) - (spr.width/2) - (32);
				var sZ:Float = spr.z + (first_roomOffset[1]*0.5) - (spr.angleY != 0 ? textureSize*2 : textureSize);
				
				var dx:Float = sX;
				var dy:Float = (sZ);
				if(debug) {
					print(sX, 0xFF009AFF);
					print(sZ, 0xFF009AFF);
					print(posX, 0xFF9AFF00);
					print(posY, 0xFF9AFF00);
				}
				
				if((dx * dx + dy * dy) <= (interactRadius * interactRadius)){
					if(debug) print(spr.tag + " in range", 0xFF00FF00);
					
					switch(spr.tag){
						case "ashley":
							//print("Hi Ashley!");
							triggerEndCutscene();
							
						case "exitDoor":
							FunkinSound.playOnce(Paths.sound('inhuman/darkscape/door'), 1).pitch = FlxG.random.float(0.95,1.05);	
							var rs:Array<Int> = [FlxG.random.int(3,5), FlxG.random.int(5,8)];
				
							var entDor:Int = FlxG.random.int(0,rs[0]-1);
							var extDor:Int = FlxG.random.int(0,rs[0]-1);
							
							
							//Introduction room for enemies is bigger then usual room sizes
							if( getVar("HER_roomCount") == enemiesStartAtRoom-1){
								rs = [5, 12];
								entDor = 2;
								extDor = 2;
								print(" :) " , 0xFFFF0000);
							}


							if( getVar("HER_roomCount") == stareEyesEnemyStartAtRoom-1){
								rs = [5, 20];
								entDor = 2;
								extDor = 2;
							}
							
							
							var ro:Array<Float> = [
							(entDor)*(textureSize*-0.5),
							(rs[1]-1)*(textureSize*-1)
							];
							
							projectStage.curRotY = 0;
							generateRoom(rs, ro, entDor, extDor, fogAlphaMult);
							
						case "entranceDoor":
							print("No need to go back.", 0xFFFF9090);
						default:
							continue;
					}
					if(debug) print("interact with: " + spr.tag, 0xFF00FF00);
					return;
				}
			}
			print("Nothing to interact with...", 0xFFFF9090);
			return;
		
		
			//check for entrance door
			if( tryInteractDoor(true)){
				print("No need to go back.", 0xFFFF9090);
			}else if(tryInteractDoor(false)){
				//print(" :) ", 0xFFFF0000);
				FunkinSound.playOnce(Paths.sound('inhuman/darkscape/door'), 1).pitch = FlxG.random.float(0.95,1.05);	
	
			}else{
				print("Nothing to interact with...", 0xFFFF9090);
			}
		}
		
		var curStamina:Float = stamina;
		var exhausted:Bool = false;
		addUpdate(function(elapsed){
			if(staminaBar != null){
				staminaBar.visible = projectStage.visible;
				if(staminaBar.visible){
					staminaBar.percent = curStamina / stamina*100;
					staminaBar.color = exhausted ? 0xFF00FFFF : 0xFFFFFFFF;
				}
			}		
		});	


		var useMouseToLook:Bool = true;
		ModStore.register("cinder_useMouseToLook", true);
		
		var mouseDeltaX:Float = 0;
		var mouseDeltaY:Float = 0;


		function mouseMove(x,y){
			if(PlayState.instance == null){
				return;
			}
		
			if(PlayState.instance.isGamePaused || !getVar("HER_inRepeat")){
				MouseUtil.setMouseLock(false);
			}else{
				ModStore.stores.set("cinder_mouseMoved", true);
				ModStore.stores.set("cinder_newMouseX", x);
				ModStore.stores.set("cinder_newMouseY", y);
				//print("mouse event");
			}
		}
		
		if(ModStore.get("cinder_hasAddedMouseMoveEvent") == null){
			//Lib.application.window.onMouseMove.add(mouseMove);
			var window = WindowUtil.getLibApplicationWindow();
			window.onMouseMove.add(mouseMove);
			ModStore.register("cinder_hasAddedMouseMoveEvent", true);
			//print("Registered mouse event");
		}
		

		
		addUpdate(function(elapsed){
		

			var inRepeat = getVar("HER_inRepeat");
			if(!inRepeat) return;
			
			if(insideCutscene || PlayState.instance == null) return;
	
			//projectStage.rotateY(elapsed*45*-1);
			

			if(projectStage != null){
			
				
			
			
			if(FlxG.keys.justPressed.M){
				useMouseToLook = !useMouseToLook;
			}

			var usingMouseLock:Bool = projectStage.visible && useMouseToLook && !game.isGamePaused;
			var gameWindow = WindowUtil.getLibApplicationWindow();
			//gameWindow.mouseLock = usingMouseLock;			
			MouseUtil.setMouseLock(usingMouseLock);

			if(usingMouseLock && ModStore.get("cinder_mouseMoved") == true){
				var mouseNewX = ModStore.get("cinder_newMouseX");
				if(mouseNewX == null) mouseNewX = 0;
				//print(mouseNewX);
				

				mouseDeltaX = FlxG.width/2 - mouseNewX;
	
				MouseUtil.warpMouse(FlxG.width/2,FlxG.height/2);

				mouseDeltaX *= -1 * 0.25;
				projectStage.rotateY(-mouseDeltaX);

				//mouseDeltaY *= -1 * 0.25;
				//projectStage.rotateX(-mouseDeltaY);
				
				ModStore.stores.set("cinder_mouseMoved", false);
			}
			
			var elapsed2:Float = elapsed;
			
			updateEnemies(elapsed);
			
			// Look & Movement

			var runningKey = FlxG.keys.pressed.SHIFT;
			if(runningKey && !exhausted) elapsed2 = elapsed * 2;
			
			var forwardsKey = FlxG.keys.pressed.W || FlxG.keys.pressed.UP;
			var backwardsKey = FlxG.keys.pressed.S|| FlxG.keys.pressed.DOWN;
			var leftKey = FlxG.keys.pressed.A|| FlxG.keys.pressed.LEFT;
			var rightKey = FlxG.keys.pressed.D|| FlxG.keys.pressed.RIGHT;
					

			if(rightKey && !usingMouseLock){
				// Update the stage rotation
				projectStage.rotateY(elapsed2*lookSpeed*-1);
			}
			
			if(leftKey && !usingMouseLock){
				// Update the stage rotation
				projectStage.rotateY(elapsed2*lookSpeed);
			}
			
				
			//game.health = curStamina / stamina;

			if(!(!exhausted && runningKey && (forwardsKey || backwardsKey|| (usingMouseLock && (rightKey || leftKey))))){
				if(curStamina >= stamina / 2) exhausted = false;
				if(curStamina < stamina){
					curStamina += elapsed;
				}else{
					curStamina = stamina;
				}
				//print(game.health);
			}
			
			if(forwardsKey || backwardsKey || (usingMouseLock && (rightKey || leftKey))){

				if(runningKey && !exhausted){
					curStamina -= elapsed;
					if(curStamina < 0){
						curStamina = -1;
						exhausted = true;
					}
				}
				
				var lookAngle = projectStage.curRotY + (backwardsKey ? 180 : 0);
				lookAngle = FlxMath.mod(lookAngle, 360);
				if(usingMouseLock){
					if(leftKey) lookAngle += 90 * (forwardsKey || backwardsKey ? 0.5 : 1) * (backwardsKey ? -1 : 1);
					if(rightKey) lookAngle -= 90 * (forwardsKey || backwardsKey ? 0.5 : 1) * (backwardsKey ? -1 : 1);
				}
				
				var dirMult:Array<Float> = getFowardMult(lookAngle);
				
				var posX = getVar("HER_positionX");
				var newPosX:Float = posX + (elapsed2*moveSpeed * dirMult[1]);
				if (newPosX > wallLeftPos){
					newPosX = wallLeftPos;
					dirMult[1] *= 0;
				} 
				if (newPosX < wallRightPos){
					newPosX = wallRightPos;
					dirMult[1] *= 0;
				}
				posX = newPosX;
				
				
				var posY = getVar("HER_positionY");
				var newPosY:Float = posY + (elapsed2*moveSpeed * dirMult[0]);
				if (newPosY > frontWallPos){
					newPosY = frontWallPos;
					dirMult[0] *= 0;
				} 
				if (newPosY < backWallPos){
					newPosY = backWallPos;
					dirMult[0] *= 0;
				}
				posY = newPosY;
				
				
				setVar("HER_positionY", posY);
				setVar("HER_positionX", posX);
				
				for (spr in projectStage)
				{
					if(fogSprites.contains(spr)){
						//Don't move the fog
					}else{
						spr.z += elapsed2*moveSpeed * dirMult[0];
						spr.x += elapsed2*moveSpeed * dirMult[1];
					}
				}
								
				doCamSway(elapsed2, projectStage);
				
				projectStage.rotateY(0); //correct their rotated position
			}
			

			rotateFog();
			
			if(FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.E){
				tryInteract();
			}
			if(FlxG.keys.justPressed.T){
				print("x pos: " +  	getVar("HER_positionX"));
				print("y pos: " + 	getVar("HER_positionY"));
			}
			
			if(FlxG.keys.justPressed.CONTROL && FlxG.keys.pressed.SHIFT && debuggingMode){
				triggerEndCutscene();
				return;
				setVar("HER_inRepeat", false);
				setVar("HER_doneRepeat", true);
				
				projectStage.visible = false;
				
				var darkscapeAudioLoop = getVar("darkscapeAudioLoop_drone1");
				if(darkscapeAudioLoop != null){
					darkscapeAudioLoop.stop();
				}	
				darkscapeAudioLoop = getVar("darkscapeAudioLoop_claustrophobic");
				if(darkscapeAudioLoop != null){
					darkscapeAudioLoop.stop();
				}	
				darkscapeAudioLoop = getVar("darkscapeAudioLoop_machine");
				if(darkscapeAudioLoop != null){
					darkscapeAudioLoop.stop();
				}	
			}
			
			}
			
		});	
		
	]])
	
end


