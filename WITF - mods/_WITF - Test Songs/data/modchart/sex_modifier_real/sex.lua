function setUp()
	centerStrum("1")
end

function modsTimeline()
	setdefault(-24, "movex", "dad")
	setasleep(-20, "dad", true)
	targetExclude("dad")


	add(2,2,"impulse",1, "scale")

	ease(0,2,"inOutSmootherStep",1, "customPath")

	ease(2, 1, "outBack", 1.05, "arrowpathwidth")
	ease(2, 1, "outBack", 0.5, "flip")

	ease(0, 2, "linear", -112 * 5, "z")

	set(-16, 1, "showsubmods")

	ease(-2,2,"linear",1,"arrowpath")
	set(-16, 0.0, "arrowpathwidth")
	set(-16, 0.0, "arrowpathbacklength")
	set(-16, 8600, "arrowpathlength")
	set(-16, 1, "spiralpaths")
	set(-16, 1, "spiralholds")



	set(-16, 4.5, "drawsize")
	set(-16, 30, "pathgrain")
	set(-16, 36, "grain")

	set(-16, 1, "sudden")
	set(-16, 7500, "sudden__offset")
	set(-16, 1, "3d")

	local doDrunk = false

	if doDrunk then
		set(-16, 0.9, "drunky__mult")
		set(-16, 1.1, "drunky__speed")
	end


	set(-16, 1, "arrowpathred")
	set(-16, 1, "arrowpathgreen")
	set(-16, 1, "arrowpathblue")

	set(36, 1, "arrowpathred")
	set(36, 1, "arrowpathgreen")
	set(36, 1, "arrowpathblue")

	for i=4, 34, 2 do
		add(i, 1, "bounce", 0.5, "zoom")
		add(i+1, 1, "bounce", 0.5, "zoom")

		add(i+0.5, 0.5, "tap", -1, "arrowpathwidth")
		add(i+1+0.5, 0.5, "tap", -1, "arrowpathwidth")

		add(i, 1, "tap", 0.2, "scale")
		add(i+1, 1, "tap", 0.2, "scale")
		if doDrunk then
			add(i+1, 1, "tap", -1/3, "drunk")
			add(i, 1, "tap", 1/3, "drunk")
			add(i+1, 1, "tap", -1/3, "drunky")
			add(i, 1, "tap", 1/3, "drunky")
			add(i+1, 1, "tap", 1/3, "drunkz")
			add(i, 1, "tap", -1/3, "drunkz")
		end

		add(i+1, 1, "impulse", 0.5, "customPath__scalex")
		add(i+1, 1, "impulse", -0.2, "customPath__scaley")

		add(i+1, 1, "bounce", 9, "rotatez")
		add(i+1, 1, "bounce", 9, "anglez")

		add(i, 1, "bounce", -9, "rotatez")
		add(i, 1, "bounce", -9, "anglez")
	end	


	add(20, 4, "inOutSmoothStep", 360, "rotatey")

	add(36, 4, "outCubic", -360*3, "rotatey")
	add(36, 4, "outCubic", -360*3, "angley")





end

