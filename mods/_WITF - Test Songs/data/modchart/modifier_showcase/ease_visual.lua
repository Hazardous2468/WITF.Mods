function setUp()
	centerPlayer("")
end

function modsTimeline()
	addHaxeLibrary("FunkinSprite", "funkin.graphics")
	addHaxeLibrary("FlxText", "flixel.text")
	addHaxeLibrary("FlxSpriteUtil", "flixel.util")
	runHaxeCode(
	[[
	
		//The input ease name
		var easeToUse:String = "merge(bounce, outElastic)";
	
	
		//Some adjustable vars
		var squareSize:Float = FlxG.height * 0.8;
		var borderSize:Float = 4;
		var graphSquareSize = squareSize*0.75;
		
		var timeMarkerColor = 0xFFFF0000;
		var valueMarkerColor = 0xFFFFFF00;
		var easeMarkerColor = 0xFFFFFFFF;
		var lineColor = 0xFFFFFF00;
		var lineSamples:Int = 192;
		var lineThickness:Int = 2;
		
		
		
		
		
		// The rest is the code you can ignore lol
		
		//remove all spaces
		easeToUse = StringTools.replace(easeToUse, " ", "");
		var target1 = PlayState.instance.playerStrumline.mods;
		var ease = ModConstants.getEaseFromString(easeToUse);
		
		if(ease == null || Math.isNaN(ease(0.5)) ){
			print("INVALID EASE", 0xFFFF0000);
			return;
		}
		
		var blackOut:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(squareSize, squareSize, 0xFFFFFFFF);
		blackOut.color = 0xFF00009F;
		blackOut.scrollFactor.set();
		game.customLuaSprites.set("blackOut", blackOut);
		PlayState.instance.add(blackOut);
		blackOut.screenCenter();
		blackOut.cameras = [game.camAFT];
		blackOut.alpha = 0.6;
		
		var innerSquare:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(graphSquareSize, graphSquareSize, 0xFFFFFFFF);
		innerSquare.color = 0xFF000000;
		innerSquare.scrollFactor.set();
		game.customLuaSprites.set("innerSquare", innerSquare);
		PlayState.instance.add(innerSquare);
		innerSquare.screenCenter();
		innerSquare.cameras = [game.camAFT];
		innerSquare.alpha = 0.85;
				
		var b:Int = 0;
		function createBorder(_squareSize, _borderSize, borderCol):Void{
			var borderLeft:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(_borderSize, _squareSize, borderCol);
			borderLeft.scrollFactor.set();
			game.customLuaSprites.set("borderLeft" + b, borderLeft);
			PlayState.instance.add(borderLeft);
			borderLeft.screenCenter();
			borderLeft.x -= (_squareSize/2) + (borderLeft.width/2);
			borderLeft.cameras = [game.camAFT];
			
			var borderRight:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(_borderSize, _squareSize, borderCol);
			borderRight.scrollFactor.set();
			game.customLuaSprites.set("borderRight" + b, borderRight);
			PlayState.instance.add(borderRight);
			borderRight.screenCenter();
			borderRight.x += (_squareSize/2) + (borderRight.width/2);
			borderRight.cameras = [game.camAFT];
			
			var borderTop:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(_squareSize+(_borderSize*2), _borderSize, borderCol);
			borderTop.scrollFactor.set();
			game.customLuaSprites.set("borderTop" + b, borderTop);
			PlayState.instance.add(borderTop);
			borderTop.screenCenter();
			borderTop.y -= (_squareSize/2) + (borderTop.height/2);
			borderTop.cameras = [game.camAFT];
			
			var borderBottom:FunkinSprite = new FunkinSprite(0, 0).makeSolidColor(_squareSize+(_borderSize*2), _borderSize, borderCol);
			borderBottom.scrollFactor.set();
			game.customLuaSprites.set("borderBottom" + b, borderBottom);
			PlayState.instance.add(borderBottom);
			borderBottom.screenCenter();
			borderBottom.y += (_squareSize/2) + (borderBottom.height/2);
			borderBottom.cameras = [game.camAFT];
			b += 1;
		}
		createBorder(squareSize, borderSize, 0xFFFFFFFF);
		createBorder(graphSquareSize, borderSize, 0xFFFFFFFF);
		
		var lineVisual:FlxSprite = new FlxSprite();
		lineVisual.makeGraphic(FlxG.width, FlxG.height, 0, true);
		lineVisual.scrollFactor.set();
		game.customLuaSprites.set("lineVisual", lineVisual);
		PlayState.instance.add(lineVisual);
		lineVisual.screenCenter();
		lineVisual.cameras = [game.camAFT];
		
		for (i in 0...lineSamples){
			var point1X:Float = FlxG.width/2;
			var point1Y:Float = FlxG.height/2;
			point1X -= graphSquareSize/2;
			point1Y += graphSquareSize/2;
			var point2X:Float = point1X;
			var point2Y:Float = point1Y;
			
			var easeSample:Float = ease(i/lineSamples);
			if(!Math.isFinite(easeSample)) easeSample = 0.5;
			point1X += graphSquareSize * i/lineSamples;
			point1Y -= graphSquareSize * easeSample;
			
			easeSample = ease((i+1)/lineSamples);
			if(!Math.isFinite(easeSample)) easeSample = 0.5;
			point2X += graphSquareSize * (i+1)/lineSamples;
			point2Y -= graphSquareSize * easeSample;
			
			FlxSpriteUtil.drawLine(lineVisual, point1X, point1Y, point2X, point2Y, {
				thickness: lineThickness,
				color: lineColor
			});
		}
		
		
		
		
		
		
		var txtEaseName = new FlxText(0, 0, 0, '"'+easeToUse+'"', 20);
		txtEaseName.setFormat(Paths.font('vcr.ttf'), 32, 0xFFFFFFFF, "center", textBorderStyle("outline"), 0xFF000000);
		txtEaseName.cameras = [game.camAFT];
		txtEaseName.scrollFactor.set();
		game.customLuaSprites.set("txtEaseName", txtEaseName);
		PlayState.instance.add(txtEaseName);
		txtEaseName.screenCenter();
		txtEaseName.alpha=0.5;
		
		var txtTime = new FlxText(0, 0, 0, '0.00', 20);
		txtTime.setFormat(Paths.font('vcr.ttf'), 32, 0xFFFFFFFF, "center", textBorderStyle("outline"), 0xFF000000);
		txtTime.cameras = [game.camAFT];
		txtTime.scrollFactor.set();
		txtTime.color = timeMarkerColor;
		game.customLuaSprites.set("txtTime", txtTime);
		PlayState.instance.add(txtTime);
		txtTime.screenCenter();
		txtTime.y += (graphSquareSize/2) + txtTime.height;	
		
		var txtValue = new FlxText(0, 0, 0, '0.00', 20);
		txtValue.setFormat(Paths.font('vcr.ttf'), 32, 0xFFFFFFFF, "center", textBorderStyle("outline"), 0xFF000000);
		txtValue.cameras = [game.camAFT];
		txtValue.scrollFactor.set();
		txtValue.color = valueMarkerColor;
		game.customLuaSprites.set("txtValue", txtValue);
		PlayState.instance.add(txtValue);
		txtValue.screenCenter();
		txtValue.y -= (graphSquareSize/2) + txtValue.height;
		
		
		function createMarkerSprite():FlxSprite{
			var markerSize:Float = 12;
			
			var s:FlxSprite = new FlxSprite();
			s.makeGraphic(markerSize, markerSize, 0, true);
			FlxSpriteUtil.drawCircle(s, -1, -1, -1, 0xFFFFFFFF);
			return s;
		}
		
		var easeMarker:FunkinSprite = createMarkerSprite();
		easeMarker.color = easeMarkerColor;
		easeMarker.scrollFactor.set();
		game.customLuaSprites.set("easeMarker", easeMarker);
		PlayState.instance.add(easeMarker);
		easeMarker.screenCenter();
		easeMarker.cameras = [game.camAFT];
		
		
		var timeMarker:FunkinSprite = createMarkerSprite();
		timeMarker.color = timeMarkerColor;
		timeMarker.scrollFactor.set();
		game.customLuaSprites.set("timeMarker", timeMarker);
		PlayState.instance.add(timeMarker);
		timeMarker.screenCenter();
		timeMarker.y += (graphSquareSize/2) + (borderSize/2);
		timeMarker.cameras = [game.camAFT];
		
		var valueMarker:FunkinSprite = createMarkerSprite();
		valueMarker.color = valueMarkerColor;
		valueMarker.scrollFactor.set();
		game.customLuaSprites.set("valueMarker", valueMarker);
		PlayState.instance.add(valueMarker);
		valueMarker.screenCenter();
		valueMarker.x -= (graphSquareSize/2) + (borderSize/2);
		valueMarker.y += (graphSquareSize/2) + (borderSize/2);
		valueMarker.cameras = [game.camAFT];
		
		
		
		
		function updateMarkers(v){
			valueMarker.y = (FlxG.height / 2) - (valueMarker.height/2);
			valueMarker.y += (graphSquareSize/2) + (borderSize/2);
			
			var easeValue:Float = ease(v);
			valueMarker.y -= easeValue*graphSquareSize;
			
			easeMarker.screenCenter();
			easeMarker.x -= graphSquareSize/2;
			easeMarker.y += graphSquareSize/2;
			easeMarker.x += v*graphSquareSize;
			easeMarker.y -= easeValue*graphSquareSize;
			
			
			txtTime.text = FlxMath.roundDecimal(v, 2);
			txtTime.screenCenter();
			txtTime.y += (graphSquareSize/2) + txtTime.height;
			txtValue.text = FlxMath.roundDecimal(easeValue, 2);
			txtValue.screenCenter();
			txtValue.y -= (graphSquareSize/2) + txtTime.height;
		}
		
		for (i in 0...32){
			if(i%8 == 0){
			
				eh.funcTweenModEvent(target1, i, 3, ModConstants.getEaseFromString("linear"), 0, 1, function(v) {
					updateMarkers(v);
				}, "valueMarkerMove");
			
				eh.funcTweenModEvent(target1, i, 3, ModConstants.getEaseFromString("linear"), -graphSquareSize/2, graphSquareSize/2, function(v) {
					timeMarker.x = (FlxG.width / 2) - (timeMarker.width/2);
					timeMarker.x += v;
				}, "timeMarkerMove");
				
			}else if(i%8 == 4){
			
				eh.funcTweenModEvent(target1, i, 3, ModConstants.getEaseFromString("linear"), 1, 0, function(v) {
					updateMarkers(v);
				}, "valueMarkerMove");
			
				eh.funcTweenModEvent(target1, i, 3, ModConstants.getEaseFromString("linear"), graphSquareSize/2, -graphSquareSize/2, function(v) {
					timeMarker.x = (FlxG.width / 2) - (timeMarker.width/2);
					timeMarker.x += v;
				}, "timeMarkerMove");
				
			}
		}
	]])

	set(-16,1, "showallmods","bf")
	set(-16,1, "alpha","dad")	
	set(-16,-112*10, "debugx","dad")
	set(-16,0.5, "debugalpha","bf")
	set(-15,0.75, "debugalpha","bf")
end


