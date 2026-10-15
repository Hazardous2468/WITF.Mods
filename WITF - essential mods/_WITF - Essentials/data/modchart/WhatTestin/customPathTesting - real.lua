function setUp()
	trace("gameVersion: "..gameVersion)
	trace("witfVersion: "..witfVersion)
	centerStrum("1")
end

function modsTimeline()

	setdefault(-24, "movex", "dad")
	setasleep(-20, "dad", true)
	targetExclude("dad")

	ease(0,2,"linear",1, "customPath")
	ease(0,2,"linear",0.0, "flip")

	--ease(4,2,"linear",-1,"customPath__linearY")

	--ease(12,4,"linear",2,"customPath__scalex")
	--ease(4,4,"linear",100,"customPath__offset")
	--ease(10,16,"linear",400,"customPath__drive")

	set(-16, 0, "customPath__posType")

	--set(-16, 1, "orient")
	set(-16, 1, "showsubmods")
	--set(-16, 112*-4, "z")
	set(-16, 2, "drawsize")
	set(-16, 0.25, "speedmod")
	set(-16, 2, "speedmod")

	ease(-2,2,"linear",1,"arrowpath")
	set(-16, 0.0, "arrowpathwidth")
	set(-16, 0.0, "arrowpathbacklength")
	set(-16, 5555, "arrowpathlength")
	set(-16, 1, "spiralpaths")
	set(-16, 1, "spiralholds")



	set(-16, 4.5, "drawsize")
	set(-16, 9999, "arrowpathlength")
	set(-16, 30, "pathgrain")
	set(-16, 36, "grain")

	set(-16, 1, "sudden")
	set(-16, 3500, "sudden__offset")



	ease(3, 1, "outBack", 1.05, "arrowpathwidth")
	ease(3, 1, "outBack", 0.5, "flip")
	ease(30, 1, "outQuad", 0.1, "arrowpathwidth")
	ease(0, 2, "linear", -112 * 7.5, "z")

	add(12, 4, "inOutSmoothStep", 360, "rotatey")


	for i=4, 30, 2 do
		add(i, 1, "bounce", 0.5, "zoom")
		add(i+1, 1, "bounce", 0.5, "zoom")

		add(i+1, 1, "impulse", 0.5, "customPath__scalex")
		add(i+1, 1, "impulse", -0.2, "customPath__scaley")

		add(i+1, 1, "bounce", 9, "rotatez")
		add(i+1, 1, "bounce", 9, "anglez")

		add(i, 1, "bounce", -9, "rotatez")
		add(i, 1, "bounce", -9, "anglez")
	end	
end


