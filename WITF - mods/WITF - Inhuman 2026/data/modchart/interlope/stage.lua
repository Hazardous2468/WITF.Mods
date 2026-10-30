function modsTimeline()
	addHaxeLibrary("FlxRuntimeShader", "flixel.addons.display")
	addHaxeLibrary("ShaderFilter", "openfl.filters")
	addHaxeLibrary("BitmapFilter", "openfl.filters")
	addHaxeLibrary("Assets", "funkin")
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxTypeText", "flixel.addons.text")
	addHaxeLibrary("FunkinSound", "funkin.audio")
	addHaxeLibrary("FileUtil", "funkin.util")
	addHaxeLibrary("AdjustColorShader", "funkin.graphics.shaders")
	addHaxeLibrary("WiggleEffectRuntime", "funkin.graphics.shaders")
	addHaxeLibrary("FlxText", "flixel.text")
	runHaxeCode(
	[[
	
		var target1 = PlayState.instance.playerStrumline.mods;
		
		
		var bg = new FunkinSprite(0,0, Paths.image('inhuman/interlope/back'));
		bg.scrollFactor.set();
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.screenCenter();	
		bg.scale.x += 0.06;
		bg.scale.y += 0.06;
		PlayState.instance.customLuaSprites.set("bg", bg);
		game.currentStage.add(bg);
		bg.zIndex = 4;


		//eh.funcTweenModEvent(target1, 447, 1, ModConstants.getEaseFromString("inOutSine"), 1, 0, function(v) {
		//	bg.alpha=v;
		//}, "bga");
		eh.funcTweenModEvent(target1, 444, 4, ModConstants.getEaseFromString("inOutSine"), 1, 0, function(v) {
			bg.alpha=v;
		}, "bga");

		eh.funcTweenModEvent(target1, 573.5, 2.7, ModConstants.getEaseFromString("inOutSine"), 0, 1, function(v) {
			bg.alpha=v;
		}, "bga");


		var gear1 = createSpr("gear1", 'inhuman/gear4', false);
		gear1.screenCenter();	
		PlayState.instance.customLuaSprites.set("gear1", gear1);
		game.currentStage.add(gear1);
		gear1.zIndex = 5;
		gear1.alpha=0;
		gear1.angularVelocity=7;
		gear1.x = -gear1.width/2;
		gear1.y = FlxG.height-gear1.height/2;
		gear1.x -= 32;
		gear1.y -= 122;

		var gear2 = createSpr("gear2", 'inhuman/gear2', false);
		gear2.screenCenter();	
		PlayState.instance.customLuaSprites.set("gear2", gear2);
		game.currentStage.add(gear2);
		gear2.zIndex = 5;
		gear2.alpha=0;
		gear2.angularVelocity=-23;
		gear2.scale.set(0.7,0.7);
		gear2.x += FlxG.width * 0.6;
		gear2.y -= FlxG.height * 0.1;

		var gear3 = createSpr("gear3", 'inhuman/gear3', false);
		gear3.screenCenter();	
		PlayState.instance.customLuaSprites.set("gear3", gear3);
		game.currentStage.add(gear3);
		gear3.zIndex = 5;
		gear3.alpha=0;
		gear3.angularVelocity=-42;
		gear3.scale.set(0.4,0.4);
		gear3.y += FlxG.height * 0.6;
		gear3.x += FlxG.width * 0.25;

		var gear4 = createSpr("gear4", 'inhuman/gear3', false);
		gear4.screenCenter();	
		PlayState.instance.customLuaSprites.set("gear4", gear4);
		game.currentStage.add(gear4);
		gear4.zIndex = 5;
		gear4.alpha=0;
		gear4.angularVelocity=-42;
		gear4.scale.set(0.4,0.4);
		gear4.y -= FlxG.height * 0.6;
		gear4.x -= FlxG.width * 0.25;


		eh.funcTweenModEvent(target1, 573.5, 2.7, ModConstants.getEaseFromString("inOutSine"), 0, 0.3, function(v) {
			gear1.alpha=v*0.7;
			gear2.alpha=v*0.8;
			gear3.alpha=v;
			gear4.alpha=v;
		}, "gears_fade");

		//eh.funcTweenModEvent(target1, 510, 2, ModConstants.getEaseFromString("inOutSine"), 0, 0.3, function(v) {
		//	gear1.alpha=v*0.7;
		//	gear2.alpha=v*0.8;
		//	gear3.alpha=v;
		//	gear4.alpha=v;
		//}, "gears_fade");

		addResetEvent(function(){
			gear1.alpha=0;
			gear2.alpha=0;
			gear3.alpha=0;
			gear4.alpha=0;
			bg.alpha=1;
		});

		
		var defaultBrightness:Float = -8;
		var shaderRaw:String = "#pragma header
uniform float uTime;	
uniform float uSpeed;		
uniform float uFrequency;		
uniform float uWaveAmplitude;
uniform float brightness;

vec2 sineWave(vec2 pt) {
	float x = 0.0;
	float y = 0.0;
	float w = 1.0 / openfl_TextureSize.y;
	float h = 1.0 / openfl_TextureSize.x;

	// look mom, I know how to write shaders now

	pt.x = floor(pt.x / h) * h;

	float offsetX = sin(pt.x * uFrequency + uTime * uSpeed) * uWaveAmplitude;

	pt.y += floor(offsetX / w) * w; // * (pt.y - 1.0); // <- Uncomment to stop bottom part of the screen from moving
	pt.y = floor(pt.y / w) * w;

	float offsetY = sin(pt.y * (uFrequency / 2.0) + uTime * (uSpeed / 2.0)) * (uWaveAmplitude / 2.0);
    pt.x += floor(offsetY / h) * h; // * (pt.y - 1.0); // <- Uncomment to stop bottom part of the screen from moving
			
	return vec2(pt.x + x, pt.y + y);
}
void main()
{
	vec2 uv = sineWave(openfl_TextureCoordv);
	gl_FragColor = flixel_texture2D(bitmap, uv);
	gl_FragColor.rgb += brightness;
}
";

		var bgShader = new FlxRuntimeShader(shaderRaw, null);
		var defaultBrightness:Float = -8;
		addUpdate(function(elapsed){
			bgShader.setFloat('uTime', Conductor.instance.songPosition / 1000);
		});	
		bgShader.setFloat('uSpeed', 0.5);
		bgShader.setFloat('uFrequency', 3.7);
		bgShader.setFloat('uWaveAmplitude', 0.03);
		bgShader.setFloat('brightness', 0.0);
		bg.shader = bgShader;

		addResetEvent(function(){
			bgShader.setFloat('brightness', defaultBrightness/255);
		});



		var bg1 = createSpr("bg1", 'inhuman/interlope/safeHouseBack', false);
		bg1.setGraphicSize(FlxG.width);
		bg1.screenCenter();	
		bg1.scale.x += 0.06;
		bg1.scale.y += 0.06;
		PlayState.instance.customLuaSprites.set("bg1", bg1);
		game.currentStage.add(bg1);
		bg1.zIndex = 6;
		bg1.alpha=1;

		eh.funcTweenModEvent(target1, 120, 6, ModConstants.getEaseFromString("inOutSine"), 1, 0, function(v) {
			bg1.alpha=v;
		}, "bg1a");

		addResetEvent(function(){
			bg1.alpha=1;
		});


		var bg2 = createSpr("bg2", 'inhuman/interlope/interlope_end_bg', false);
		bg2.setGraphicSize(FlxG.width);
		bg2.screenCenter();	
		bg2.scale.x += 0.007;
		bg2.scale.y += 0.007;
		PlayState.instance.customLuaSprites.set("bg2", bg2);
		game.currentStage.add(bg2);
		bg2.zIndex = 2;


		var bg2_back = createSpr("bg2_back", 'inhuman/interlope/interlope_console_back', false);
		bg2_back.screenCenter();	
		bg2_back.scale.set(bg2.scale.x, bg2.scale.y);
		bg2_back.y -= 110;
		PlayState.instance.customLuaSprites.set("bg2_back", bg2_back);
		game.currentStage.add(bg2_back);
		bg2_back.zIndex = 0;


		var txt:String = "
//Sys.
/*server.ping()*/;;()[]; err.log(null)?? timeout.true : true
varx=lp?ln:xn;//raw3661%xif0==x;log('error');z|\\/;;lddisk.err(7)
@line12;*0(0)aa@*1.0|return xn/ln;damageType.THERMAL
BlackBox.read(12)#else{}=-+++1!1err[d./a-f;~~]uq!={a##'>,=7'}
p@nd0ra.sys sampleTest(8); >confirm password: *******
?#|//.?*return @line1562;<>exception4<>/*test.2*/(offline-breach)
/|///23#<.>ln<in.raw>()c://sys/b://2003/03/... 0x7500FF00
>storage.load();loaded();<>warning...disk.err(7)||core.err(9)
arr[i%2]=b[i];trace/log/print(***)?;cd/:ww]*wwt/us*iz&sh!adb-c-s??
null[]able?7;@line71,sine(time);[dp,0,773,x]->voidadb-c-s??
if() ???false return;null object reference!^=1;ab[p]-=5?!
'e';?..>=113-1220-77*<1;--={13<033#4772/*-...?0.0*/}cd b://2003
func_diskaccess():Void return false;security.OFFLINE=truel;;?;
memory.low() RAM: 22TB, damageDetected var y='yama'; unknown type
varx=lp?ln:xn;//raw3661%xif0==x;log('error');z|\\/;;lddisk.err(7)
func_diskaccess():Void return true;security.????=true?l;;?;
var n=1-x; cpu_temp[n]=CPU.core1.check(true); trace(...###);;
@line77 x-=y>=0!=3?false sys.err(THERMAL);'firewarning?' false
@line43 ////=humane=false|;@##----===err.log(5);;; func():void
// y.test(); killswitchTrigger(THERMAL); failsafe func(); error
null object reference null object reference null object reference
recontainment.error# unknown type @ system.error !!=- abn ();sh*5
var t = sys.instance.time; if(t1ikhui0treu90teruj) ??? hi0uu0
09ujr#nanorarealqt_err7 v-=1242mkrfdjmo-gr non nullable[]@safety
@safetychecks(false) Warning!: safety offline! doneWarn=true;
varx2=lp?ln:xn;//raw3661%xif0==x;log('error');z|\\/;;lddisk.err(7)
cpu_temp[n]=CPU.core3.check(true); trace(...###);; u34789237
:@~{:~:@~{:~:~@~>surface.scan()->falsefalsefalse///ihopethatscorrect
0xFF000000 varb= t:FloatfloatisFloatnull^=true//itzwavariablez
// SYSTEM - // CRITICAL ERROR !!!!
could not access 'Main Network'; could not access 'Secondary Network'; ??????
seq(^v^v).beat%1==0, isEventType(e:Event):Bool{EventHandler.instance.check}
connection error - timeout! System.instance?.isOffline?=true??true;
Math.calcs(checkSum@line993);var r=0xFFFF0000; // ascdefhgth2
dspnjm v-aw35ik - BIOS.check(@line195,true);;;5387u0hiortruer
local func wt? 7823491; [hexagon=6,goodshape=true;] //why -y
var n=1-x; cpu_temp[n]=CPU.core5.check(true); trace(...true);;
final c = System.instance?.compromised; private function testingSystemThing()
var s:Null<String>; get_sysTime() @:{~:'£$%$'1'''#(&*%)}
^$%&£$^£$%^%^&&(^&*(:~{~@:<;]/;.,}))^$%&£$^£$%^%^&&(^&*(:~{~@:<;]/;.,}))
// SYSTEM AUTO-RECOVERY FAILED
instablity_rate = 89; warning warning warning warning warning warning warning warning warning warning
// ATTEMPTING SYSTEM RECOVERY FROM BLACKBOX //
func_diskaccess():Void return-true;security.?!!??=true?6;;?;
/**@default false*@paremter**/CPU_CORES<8>.damaged=true[7].missing=true
connection timed out; handshake failed ping failed unreponsive.true
log.sine(t)?? >cd://B:/sys/recovery; BLACKBOX.init();
@line499 x-=y>=0!=3?false @line533 @line534 @line535 @line536
arr[i%2]=b[i];trace/log/print(***)?;cd/:ww]*wwt/us*iz&sh!adb-c-s??
null[]able?7;@line71,sine(time);[dp,0,773,x]->voidadb-c-s??
if() ???false return;null object reference!^=1;ab[p]-=5?!
'e';?..>=113-1220-77*<1;--={13<033#4772/*-...?0.0*/}cd b://2003
?..>>!!!#!!err*77-=P{}^66-11001101/-=={;;;''}.fghhfgh @line 599
StringTools.replace(s,d,i); :Bool, return #if sys else # @@//
[[[[ pinging 192.168.0.10 ]-}}]><>> -> false? ? error ////
{];['#{quadExpIn']}bvarbbool9 :/.;''][']'0]///^=2 // bit
[[[[ pinging 192.168.0.0 ]-}}]><>> -> false? ! error !
?? network.unresponsive // sys.connect() var l var k var x /////////
{];['#{jiordtbiohjdrtrdobhui']}bvarbbool9 :/.;''][']'0]///^=6
435879070234567325786237823329078267864738709368079437809706824678
checksum@(23);pass;returntrue;var g:Bool = true; return;nnnn;
'e';?..>=113-1220-77*<1;--={13<033#4772/*-...?0.0*/}cd b://2003
connection error - timeout! System.instance?.isOffline?=true??true;
:~{P:{:~@:^$&%*!£??<>| instablity_rate = 70; {:~@:^$&%*!£??
System.instance?.verify();
//////////////////////////////////////////////////////////
// RECOVERY COMPLETE
@nullSafety, @safetyChecks, C://accessCheck() ERROR ERROR ERROR ERROR
System.recovery(t, this, BLACKBOX.instance, true);
// CONTINUING FROM BLACKBOX //

Initialising system services (emergency profile)...
syslogd: started
klogd: started
emergency-logger: started
powerd: started
thermald: started with limited sensors

Reading last known system state from blackbox...
Event timestamp: 2003-03-17 04:12:38 local
Event classification: CATASTROPHIC THERMAL EVENT
Primary ignition point: UNKNOWN
Fire suppression: FAILED
Automatic lockdown: PARTIAL
Personnel evacuation: INCOMPLETE
Estimated casualties: UNKNOWN

Sector status reconstruction...
Surface Layer:
  Access elevators: SEIZED
  External security: DAMAGED
  External sensors: DAMAGED
  Status: INACCESSIBLE

Office Sector:
  Mainframe terminals: DESTROYED
  Document servers: DESTROYED
  LABS: COLLAPSED
  Status: TOTAL LOSS

Living Sector:
  Habitation modules: COMPLETE FAILURE
  Life support: OFFLINE
  Status: UNINHABITABLE

Containment Sector:
  Primary vault doors: LOCKED (failsafe)
  Secondary containment fields: FAILED
  Anomaly holding cells: CRITICAL
  Status: SEALED – NO ESCAPE EVENTS LOGGED

Network stack initialisation...
Primary fibre backbone: SEVERED
Secondary copper backbone: MELTED
Wireless mesh nodes: 0 responding
Internal emergency subnet: creating isolated instance
Subnet 10.255.0.0/16 brought up
No external routes available.

Loading authentication database from blackbox backup...
Database partially recovered.
Enforcing single-user emergency mode.
Console login required.

login: AmeliaMurphy
password: *************
Authentication successful.
User 'Amelia Murphy' granted emergency operator privileges.
Last login: 2003-03-27 22:47 from local terminal
Session started at residual system time 2003-03-27 11:03:19

System message:
Primary console is now operational in minimum viable state.
Vast majority of Beta Labs infrastructure remains destroyed or inaccessible.
No external communication possible.
Physical repairs and replacement components required for further restoration.

Current operator: 'Amelia Murphy'
Session privileges: EMERGENCY FULL
Awaiting commands...

";



		var txtSize:Float = 18;
		var bg2_txt:FlxText = new FlxText(0,0, FlxG.width, txt, txtSize);
		bg2_txt.scrollFactor.set();
    	bg2_txt.setFormat(Paths.font('vcr.ttf'), txtSize, 0xFFFF0000, "left"/*, ModConstants.textBorderStyleFromString("outline"), 0xFF000000*/);
    	PlayState.instance.customLuaSprites.set("bg2_txt", bg2_txt);
		game.currentStage.add(bg2_txt);
		bg2_txt.zIndex = 1;
		bg2_txt.screenCenter();
		bg2_txt.x += FlxG.width*0.235;
		bg2_txt.y += bg2_txt.height/2;
		bg2_txt.y += 5;
		//bg2_txt.y -= txtSize*7;
		
		var startingTextY:Float = bg2_txt.y;
		for (i in 448...574){

			eh.funcTweenModEvent(target1, i, 1, ModConstants.getEaseFromString("instant"), (i-448)*txtSize, (i-448)*txtSize, function(v) {
				bg2_txt.y = startingTextY-v;
			}, "txtScroll");
		}
		
		eh.funcTweenModEvent(target1, 448, 0.257, ModConstants.getEaseFromString("outExpo"), 0, 0.66, function(v) {
			bg2_txt.alpha=v;
		}, "bg2txta");

		addResetEvent(function(){
			bg2_txt.y=startingTextY;
			bg2_txt.alpha=0;
		});


		var bgfront = createSpr("bg1", 'inhuman/interlope/inhumanFinale-Mid', false);
		bgfront.setGraphicSize(FlxG.width);
		bgfront.screenCenter();	
		bgfront.scale.x += 0.035;
		bgfront.scale.y += 0.035;
		var bgFrontThing_baseScaleX:Float = bgfront.scale.x;
		var bgFrontThing_baseScaleY:Float = bgfront.scale.y;
		PlayState.instance.customLuaSprites.set("bgfront", bgfront);
		game.currentStage.add(bgfront);
		bgfront.zIndex = 20;
		bgfront.alpha=1;


		addResetEvent(function(){
			//bgfront.scale.set(bgFrontThing_baseScaleX+1.5, bgFrontThing_baseScaleY+1.5);
			bgfront.scale.set(bgFrontThing_baseScaleX, bgFrontThing_baseScaleY);
		});
		eh.funcTweenModEvent(target1, 123, 7, ModConstants.getEaseFromString("inCubic"), 0, 1.5, function(v) {
			bgfront.scale.set(bgFrontThing_baseScaleX+v, bgFrontThing_baseScaleY+v);
		}, "bgfrontScale");
		
		//eh.funcTweenModEvent(target1, 442, 7, ModConstants.getEaseFromString("outCubic"), 1.5, 0, function(v) {
		//	bgfront.scale.set(bgFrontThing_baseScaleX+v, bgFrontThing_baseScaleY+v);
		//}, "bgfrontScale");



		if(Preferences.flashingLights){
			for (i in 448...510){
				eh.funcTweenModEvent(target1, i, 1, ModConstants.getEaseFromString("outQuad"), defaultBrightness+11, defaultBrightness, function(v) {
					//adjustColShader.brightness = v;
					bgShader.setFloat('brightness', v/255);
				}, "adjustColShader");
			}
			for (i in 512...574){
				eh.funcTweenModEvent(target1, i, 1, ModConstants.getEaseFromString("outQuad"), defaultBrightness+11, defaultBrightness, function(v) {
					//adjustColShader.brightness = v;
					bgShader.setFloat('brightness', v/255);
				}, "adjustColShader");
			}
			for (i in 576...640){
				eh.funcTweenModEvent(target1, i, 1, ModConstants.getEaseFromString("outQuad"), defaultBrightness+7, defaultBrightness, function(v) {
					//adjustColShader.brightness = v;
					bgShader.setFloat('brightness', v/255);
				}, "adjustColShader");
			}
		}
		eh.funcTweenModEvent(target1, 510, 1, ModConstants.getEaseFromString("outExpo"), defaultBrightness, -20, function(v) {
			//adjustColShader.brightness = v;
			bgShader.setFloat('brightness', v/255);
		}, "adjustColShader");
		eh.funcTweenModEvent(target1, 511.25, 0.75, ModConstants.getEaseFromString("inExpo"), -20, defaultBrightness, function(v) {
			//adjustColShader.brightness = v;
			bgShader.setFloat('brightness', v/255);
		}, "adjustColShader");



		var cinderTaunt:FunkinSprite = new FunkinSprite();
		cinderTaunt.frames = Paths.getSparrowAtlas('inhuman/amelia/amelia_tauntv2');	
		cinderTaunt.animation.addByPrefix('chuckle', 'Amelia_Chuckle', 24, true);	
		cinderTaunt.animation.addByPrefix('laugh', 'Amelia_Laugh', 32, true);	
		cinderTaunt.animation.play("chuckle");
		game.customLuaSprites.set("cinderTaunt", cinderTaunt);
		game.currentStage.add(cinderTaunt);
		cinderTaunt.zIndex = 199;
		cinderTaunt.setGraphicSize(FlxG.width-46);
		cinderTaunt.scrollFactor.set();
		cinderTaunt.screenCenter();
		cinderTaunt.y += 36;
		cinderTaunt.alpha = 0;
		
		addResetEvent(function(){
			cinderTaunt.animation.play("chuckle");
			cinderTaunt.alpha = 0;
		});

		eh.funcTweenModEvent(target1, 0, 1, ModConstants.getEaseFromString("inOutExpo"), 0, 0, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");

		eh.funcTweenModEvent(target1, 123.5, 1.2, ModConstants.getEaseFromString("inOutExpo"), 0, 0.35, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");

		eh.funcTweenModEvent(target1, 127.25, 1, ModConstants.getEaseFromString("inOutExpo"), 0.35, 0.0, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");


		eh.funcTweenModEvent(target1, 443.6, 1.15, ModConstants.getEaseFromString("inOutExpo"), 0, 0.35, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");

		eh.funcTweenModEvent(target1, 447.7, 0.5, ModConstants.getEaseFromString("inOutExpo"), 0.35, 0.0, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");


		eh.funcModEvent(target1, 500, function() {
			cinderTaunt.animation.play("laugh");
		});


		eh.funcTweenModEvent(target1, 509.6, 1.15, ModConstants.getEaseFromString("inOutExpo"), 0, 1.59, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");

		eh.funcTweenModEvent(target1, 511.75, 0.3, ModConstants.getEaseFromString("inOutExpo"), 1.59, 0.0, function(v) {
			cinderTaunt.alpha = v;
		}, "cinderTaunt");





		var blackout:FunkinSprite = new FunkinSprite(-FlxG.width, -FlxG.height).makeSolidColor(FlxG.width*3, FlxG.height*3, 0xFF000000);
		blackout.scrollFactor.set();
		game.customLuaSprites.set("blackout", blackout);
		blackout.screenCenter();
		game.currentStage.add(blackout);
		blackout.camera = game.camAFT;
		blackout.zIndex = 9999;
		
		addResetEvent(function(){
			blackout.alpha = 1;
		});
		
		eh.funcTweenModEvent(target1, 0, 20, ModConstants.getEaseFromString("linear"), 1, 0.4, function(v) {
			blackout.alpha=v;
		}, "blackoutAlpha");

		eh.funcTweenModEvent(target1, 123, 2, ModConstants.getEaseFromString("linear"), 0.4, 0.5, function(v) {
			blackout.alpha=v;
		}, "blackoutAlpha");
		eh.funcTweenModEvent(target1, 127, 2, ModConstants.getEaseFromString("inOutQuad"), 0.5, 0.0, function(v) {
			blackout.alpha=v;
		}, "blackoutAlpha");

		eh.funcTweenModEvent(target1, 444, 1, ModConstants.getEaseFromString("outSine"), 0.0, 0.35, function(v) {
			blackout.alpha=v;
		}, "blackoutAlpha");
		eh.funcTweenModEvent(target1, 447, 1, ModConstants.getEaseFromString("inSine"), 0.35, 0.0, function(v) {
			blackout.alpha=v;
		}, "blackoutAlpha");

		eh.funcTweenModEvent(target1, 640, 8, ModConstants.getEaseFromString("inQuad"), 0.0, 1, function(v) {
			blackout.alpha=v;
		}, "blackoutAlpha");









		// SHADERS

		var glitchLinesShader = new FlxRuntimeShader(Assets.getText(Paths.frag("inhuman/GlitchLineShader")), null);
		glitchLinesShader.setFloat('uFrequency', 0.0);
		addUpdate(function(elapsed){
			glitchLinesShader.setFloat('uTime', Conductor.instance.songPosition/1000);
		});	
		
		var glitchLinesMod:CustomModifier = createCustomMod("glitchLines", 0.07);
		glitchLinesMod.modPriority = -9990;
		glitchLinesMod.strumsMod = false;
		glitchLinesMod.notesMod = false;
		glitchLinesMod.holdsMod = false;
		glitchLinesMod.pathMod = false;
		glitchLinesMod.specialMod = true;
		glitchLinesMod.speedMod = false;
		glitchLinesMod.unknown = false;
		eh.addCustomMod("1", glitchLinesMod);
		glitchLinesMod.specialMath = function() {
			glitchLinesShader.setFloat('uFrequency', glitchLinesMod.currentValue/100);
		};

		var chromaticAberration = new FlxRuntimeShader(Assets.getText(Paths.frag("inhuman/chromatic_aberration")), null);
		chromaticAberration.setFloat('intensity', 0.0);
		
		var chromaticAberrationMod:CustomModifier = createCustomMod("aberration", 0.0);
		chromaticAberrationMod.modPriority = -9990;
		chromaticAberrationMod.strumsMod = false;
		chromaticAberrationMod.notesMod = false;
		chromaticAberrationMod.holdsMod = false;
		chromaticAberrationMod.pathMod = false;
		chromaticAberrationMod.specialMod = true;
		chromaticAberrationMod.speedMod = false;
		chromaticAberrationMod.unknown = false;
		eh.addCustomMod("1", chromaticAberrationMod);
		chromaticAberrationMod.specialMath = function() {
			chromaticAberration.setFloat('intensity', chromaticAberrationMod.currentValue);
		};



		var newCamEffects:Array<BitmapFilter>=[];
		newCamEffects.push(new ShaderFilter(chromaticAberration));
		newCamEffects.push(new ShaderFilter(glitchLinesShader));


		game.camHUD.filters = (newCamEffects);
		game.camNotes.filters = (newCamEffects);
		game.camGame.filters = (newCamEffects);

		
		game.currentStage.refresh();
	]])

	
	set(-16, 0.223, "aberration", "1")
	ease(123, 3, "inOutCubic", 0.246, "aberration", "1")
	ease(126.5, 2.5, "inOutSine", 0.0, "aberration", "1")

	for i=448, 574-1, 1 do

		if i==510 then

		elseif i == 511 then

		else
			if i%2 == 0 then
				add(i, 1, "impulse", 0.1, "aberration", "1")
			else
				add(i, 1, "impulse", -0.1, "aberration", "1")
			end
			add(i, 0.5, "impulse", 0.8, "glitchLines", "1")
		end
	end



	for i=576, 640-8, 8 do
		for k=0,6 do
			add(i+k, 1, "impulse", -0.085, "aberration","1")
		end

		add(i+7, 0.5, "impulse", -0.085, "aberration","1")
		add(i+7.5, 0.5, "impulse", 0.085, "aberration","1")
	end




	add(384, 7, "flip(inQuad)", 0.3, "aberration", "1")
	add(384, 7, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(392, 3, "flip(inQuad)", 0.3, "aberration", "1")
	add(392, 3, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(396, 1.5, "flip(inQuad)", -0.3, "aberration", "1")
	add(396, 1.5, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(398, 1.5, "flip(inQuad)", 0.3, "aberration", "1")
	add(398, 1.5, "flip(inQuad)", 0.8, "glitchLines", "1")


	add(400, 7, "flip(inQuad)", -0.3, "aberration", "1")
	add(400, 7, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(408, 7, "flip(inQuad)", -0.3, "aberration", "1")
	add(408, 7, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(416, 7, "flip(inQuad)", 0.3, "aberration", "1")
	add(416, 7, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(424, 3, "flip(inQuad)", 0.3, "aberration", "1")
	add(424, 3, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(428, 1.5, "flip(inQuad)", -0.3, "aberration", "1")
	add(428, 1.5, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(430, 1.5, "flip(inQuad)", 0.3, "aberration", "1")
	add(430, 1.5, "flip(inQuad)", 0.8, "glitchLines", "1")


	add(432, 7, "flip(inQuad)", -0.3, "aberration", "1")
	add(432, 7, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(440, 3, "flip(inQuad)", -0.3, "aberration", "1")
	add(440, 3, "flip(inQuad)", 0.8, "glitchLines", "1")

	add(444, 3, "flip(inQuad)", -0.3, "aberration", "1")
	add(444, 3, "flip(inQuad)", 0.8, "glitchLines", "1")


	add(640, 7, "flip(inQuad)", -0.3, "aberration", "1")
	add(640, 7, "flip(inQuad)", 0.8, "glitchLines", "1")

	

end


