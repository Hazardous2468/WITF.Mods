function modsTimeline()

	--Couldn't finish in time for v0.7.6a, oh well.

	runHaxeCode(
	[[
	var target1 = PlayState.instance.playerStrumline.mods;	
	
	
	
	var beatTime = Conductor.instance.beatLengthMs / 1000;
	
	eh.funcModEvent(target1, 96, function() {
		//PlayState.instance.modDebugNotif("FUNDING FOR THIS PROGRAM WAS MADE POSSIBLE BY BY BY-");
		PlayState.instance.modDebugNotif("Fun",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 96.5, function() {
		PlayState.instance.modDebugNotif("Funding",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 97, function() {
		PlayState.instance.modDebugNotif("Funding for",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 97.5, function() {
		PlayState.instance.modDebugNotif("Funding for this",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 98, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 98.5, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 99, function() {
		PlayState.instance.modDebugNotif("program was",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 99.5, function() {
		PlayState.instance.modDebugNotif("program was made",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 100, function() {
		PlayState.instance.modDebugNotif("po",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 100.5, function() {
		PlayState.instance.modDebugNotif("possi",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 101, function() {
		PlayState.instance.modDebugNotif("possible",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 101.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 102, function() {
		PlayState.instance.modDebugNotif("possible by (x2)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 102.5, function() {
		PlayState.instance.modDebugNotif("possible by (x3)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 103, function() {
		PlayState.instance.modDebugNotif("possible by (x4)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 103.5, function() {
		PlayState.instance.modDebugNotif("possible by (x5)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	
	
	eh.funcModEvent(target1, 104, function() {
		PlayState.instance.modDebugNotif("Fun",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 104.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 104.75, function() {
		PlayState.instance.modDebugNotif("possible by (x2)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 105, function() {
		PlayState.instance.modDebugNotif("possible by (x3)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 105.25, function() {
		PlayState.instance.modDebugNotif("possible by (x4)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 105.5, function() {
		PlayState.instance.modDebugNotif("Funding",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 106, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 106.25, function() {
		PlayState.instance.modDebugNotif("possible by ↓(x2)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 106.5, function() {
		PlayState.instance.modDebugNotif("possible by ↓↓(x3)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 106.75, function() {
		PlayState.instance.modDebugNotif("possible by ↓↓↓(x4)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107, function() {
		PlayState.instance.modDebugNotif("Funding for",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.5, function() {
		PlayState.instance.modDebugNotif("Funding for this",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.125, function() {
		PlayState.instance.modDebugNotif("Funding for thi",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.25, function() {
		PlayState.instance.modDebugNotif("Funding for thii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.25+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.5, function() {
		PlayState.instance.modDebugNotif("Funding for thiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.5+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.5+0.125+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 107.5+0.125+0.125+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
		eh.funcModEvent(target1, 107.5+0.125+0.125+0.125+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	eh.funcModEvent(target1, 108, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 108.5, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 108+1, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 108.5+1, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 110, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 110.25, function() {
		PlayState.instance.modDebugNotif("pro (x2)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 110.5, function() {
		PlayState.instance.modDebugNotif("pro (x3)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 110.75, function() {
		PlayState.instance.modDebugNotif("pro (x4)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 111, function() {
		PlayState.instance.modDebugNotif("progr",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 111.5, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 112, function() {
		PlayState.instance.modDebugNotif("Fun",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 112.5, function() {
		PlayState.instance.modDebugNotif("Funding",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 113, function() {
		PlayState.instance.modDebugNotif("Funding for",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 113.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 114, function() {
		PlayState.instance.modDebugNotif("possible by (x2)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 114.5, function() {
		PlayState.instance.modDebugNotif("program was made",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 100+15, function() {
		PlayState.instance.modDebugNotif("po",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 100.5+15, function() {
		PlayState.instance.modDebugNotif("possi",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 101+15, function() {
		PlayState.instance.modDebugNotif("possible",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 116.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 116.75, function() {
		PlayState.instance.modDebugNotif("view",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 117, function() {
		PlayState.instance.modDebugNotif("viewers",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 117.5, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 118, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 119, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 119.5, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 120.5, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 121, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 122, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 122.5, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 123.5, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 124, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 125, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 125.5, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 126.5, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 127, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 127.5, function() {
		PlayState.instance.modDebugNotif("Fu",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 127.75, function() {
		PlayState.instance.modDebugNotif("Fu (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	
	
	
	//go again
	

	eh.funcModEvent(target1, 32+96, function() {
		//PlayState.instance.modDebugNotif("FUNDING FOR THIS PROGRAM WAS MADE POSSIBLE BY BY BY-");
		PlayState.instance.modDebugNotif("Fun",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+96.5, function() {
		PlayState.instance.modDebugNotif("Funding",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+97, function() {
		PlayState.instance.modDebugNotif("Funding for",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+97.5, function() {
		PlayState.instance.modDebugNotif("Funding for this",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+98, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+98.5, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+99, function() {
		PlayState.instance.modDebugNotif("program was",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+99.5, function() {
		PlayState.instance.modDebugNotif("program was made",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+100, function() {
		PlayState.instance.modDebugNotif("po",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+100.5, function() {
		PlayState.instance.modDebugNotif("possi",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+101, function() {
		PlayState.instance.modDebugNotif("possible",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+101.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+102, function() {
		PlayState.instance.modDebugNotif("possible by (x2)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+102.5, function() {
		PlayState.instance.modDebugNotif("possible by (x3)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+103, function() {
		PlayState.instance.modDebugNotif("possible by (x4)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+103.5, function() {
		PlayState.instance.modDebugNotif("possible by (x5)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	
	
	eh.funcModEvent(target1, 32+104, function() {
		PlayState.instance.modDebugNotif("Fun",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+104.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+104.75, function() {
		PlayState.instance.modDebugNotif("possible by (x2)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+105, function() {
		PlayState.instance.modDebugNotif("possible by (x3)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+105.25, function() {
		PlayState.instance.modDebugNotif("possible by (x4)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+105.5, function() {
		PlayState.instance.modDebugNotif("Funding",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 32+106, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+106.25, function() {
		PlayState.instance.modDebugNotif("possible by ↓(x2)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+106.5, function() {
		PlayState.instance.modDebugNotif("possible by ↓↓(x3)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+106.75, function() {
		PlayState.instance.modDebugNotif("possible by ↓↓↓(x4)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107, function() {
		PlayState.instance.modDebugNotif("Funding for",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.5, function() {
		PlayState.instance.modDebugNotif("Funding for this",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.125, function() {
		PlayState.instance.modDebugNotif("Funding for thi",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.25, function() {
		PlayState.instance.modDebugNotif("Funding for thii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.25+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.5, function() {
		PlayState.instance.modDebugNotif("Funding for thiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.5+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.5+0.125+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.5+0.125+0.125+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+107.5+0.125+0.125+0.125+0.125, function() {
		PlayState.instance.modDebugNotif("Funding for thiiiiiiii",0xFFFFFFFF, beatTime / 8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	eh.funcModEvent(target1, 32+108, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+108.5, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+108+1, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+108.5+1, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+110, function() {
		PlayState.instance.modDebugNotif("pro",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+110.25, function() {
		PlayState.instance.modDebugNotif("pro (x2)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+110.5, function() {
		PlayState.instance.modDebugNotif("pro (x3)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+110.75, function() {
		PlayState.instance.modDebugNotif("pro (x4)",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+111, function() {
		PlayState.instance.modDebugNotif("progr",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+111.5, function() {
		PlayState.instance.modDebugNotif("program",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 32+112, function() {
		PlayState.instance.modDebugNotif("Fun",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+112.5, function() {
		PlayState.instance.modDebugNotif("Funding",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+113, function() {
		PlayState.instance.modDebugNotif("Funding for",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+113.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+114, function() {
		PlayState.instance.modDebugNotif("possible by (x2)",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+114.5, function() {
		PlayState.instance.modDebugNotif("program was made",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 32+100+15, function() {
		PlayState.instance.modDebugNotif("po",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+100.5+15, function() {
		PlayState.instance.modDebugNotif("possi",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+101+15, function() {
		PlayState.instance.modDebugNotif("possible",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+116.5, function() {
		PlayState.instance.modDebugNotif("possible by",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+116.75, function() {
		PlayState.instance.modDebugNotif("view",0xFFFFFFFF, beatTime / 4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+117, function() {
		PlayState.instance.modDebugNotif("viewers",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+117.5, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+118, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+119, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+119.5, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+120.5, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+121, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 32+122, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+122.5, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+123.5, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+124, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 32+125, function() {
		PlayState.instance.modDebugNotif("viewers like",0xFFFFFFFF, beatTime / 2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 157.5, function() {
		PlayState.instance.modDebugNotif("viewers like you.",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	
	//BROADCAST
	
	eh.funcModEvent(target1, 159, function() {
		PlayState.instance.modDebugNotif("Broad",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 159.5, function() {
		PlayState.instance.modDebugNotif("Broadcast",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	
	//CORPORATION
	
	
	eh.funcModEvent(target1, 160, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 160.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 160.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 161.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4*3, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 2+160, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+160.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+160.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+161.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4*3, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 4+160, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+160.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+160.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+161.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4*3, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 166, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 166.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 166.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 167.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 167.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 167.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 168, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);

	eh.funcModEvent(target1, 168.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 168.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 169.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4*3, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	eh.funcModEvent(target1, 170, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 170.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 170.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 171.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4*3, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 172, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 172.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 172.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 173.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4*3, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	

	
	
	
	
	
	
	
	eh.funcModEvent(target1, 166+8, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 166.5+8, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 166.75+8, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 167.25+8, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 167.5+8, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 167.75+8, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 168+8, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);

	eh.funcModEvent(target1, 168.5+8, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 168.75+8, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 177.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 177.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 177.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 178, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 178.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 178.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 179.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 179.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 179.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 2+178, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+178.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+178.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+179.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+179.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 2+179.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 4+178, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+178.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+178.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+179.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+179.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 4+179.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 6+178, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 6+178.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 6+178.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 6+179.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 6+179.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 6+179.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	
	eh.funcModEvent(target1, 186, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 186.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 186.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/2, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 187.25, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 187.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 187.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	
	
	
	

	
	
	eh.funcModEvent(target1, 188, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 188.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 188.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 188.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 189, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 189.25, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 189.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 189.75, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 190, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 190.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 190.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 190.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 191, function() {
		PlayState.instance.modDebugNotif("Corporat",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 191.25, function() {
		PlayState.instance.modDebugNotif("Corporati",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 191.5, function() {
		PlayState.instance.modDebugNotif("Corporatio",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 191.75, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	
	
	//I want to fucking die
	eh.funcModEvent(target1, 192, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 192.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 192.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 192.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 193.0, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 193.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 193.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 193.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 194, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 194.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 194.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 194.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 195, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 195.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 195.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 195.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 196.0, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 196.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 196.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 196.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 197, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 197.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 197.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 197.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 198, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 198.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 198.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 198.75, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 199, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 199.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 199.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 199.75, function() {
		PlayState.instance.modDebugNotif("Cor (2x)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 200, function() {
		PlayState.instance.modDebugNotif("Cor (3x)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 200.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 200.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 200.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 201.0, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 201.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 201.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 201.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 202, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 202.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 202.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 202.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 203, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 203.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 203.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 203.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 204, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 204.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 204.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 204.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 205, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 205.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 205.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 205.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 206.0, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 206.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 206.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 206.75, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 207, function() {
		PlayState.instance.modDebugNotif("Corporat",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 207.125, function() {
		PlayState.instance.modDebugNotif("Corporati",0xFFFFFFFF, beatTime/8, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 207.25, function() {
		PlayState.instance.modDebugNotif("Corporatio",0xFFFFFFFF, beatTime/8, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 207.375, function() {
		PlayState.instance.modDebugNotif("Corporation",0xFFFFFFFF, beatTime/8, 0.001, 0.001);
	}, "fundingNotif", false);
	
	eh.funcModEvent(target1, 207.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 207.75, function() {
		PlayState.instance.modDebugNotif("Cor (x2)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	//Repeat
	eh.funcModEvent(target1, 208, function() {
		PlayState.instance.modDebugNotif("Cor (x3)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	//I still want to fucking die
	eh.funcModEvent(target1, 16+192.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+192.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+192.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+193.0, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+193.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+193.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+193.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+194, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+194.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+194.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+194.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+195, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+195.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+195.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+195.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+196.0, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+196.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+196.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+196.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+197, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+197.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+197.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+197.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+198, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+198.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+198.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+198.75, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+199, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+199.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+199.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+199.75, function() {
		PlayState.instance.modDebugNotif("Cor (2x)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+200, function() {
		PlayState.instance.modDebugNotif("Cor (3x)",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+200.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+200.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+200.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+201.0, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+201.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+201.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+201.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+202, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+202.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+202.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+202.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+203, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+203.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+203.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+203.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+204, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+204.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+204.5, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+204.75, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+205, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+205.25, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+205.5, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+205.75, function() {
		PlayState.instance.modDebugNotif("Corpora",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+206.0, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+206.25, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+206.5, function() {
		PlayState.instance.modDebugNotif("Cor",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	eh.funcModEvent(target1, 16+206.75, function() {
		PlayState.instance.modDebugNotif("Corpo",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	eh.funcModEvent(target1, 223, function() {
		PlayState.instance.modDebugNotif("Corporat",0xFFFFFFFF, beatTime/4, 0.001, 0.001);
	}, "fundingNotif", false);
	
	
	for (i in 1...8)
	{
		var s:String = "Corporat";
		for (fuk in i...8)
		{
			s += "t";
		}
		
		var tim:Float = (8-i)/8;
		
		eh.funcModEvent(target1, 223+(tim), function() {
			PlayState.instance.modDebugNotif(s,0xFFFFFFFF, beatTime/8, 0.001, 0.001);
		}, "fundingNotif", false);
		
		//print(tim);
	}
	
	
	
	
	
	

	
	]])
end