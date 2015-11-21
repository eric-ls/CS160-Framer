Framer.Device.contentScale = (Screen.width / 720)

# This imports all the layers for "Untitled" into untitledLayers
sketch = Framer.Importer.load "imported/Untitled"

# Set background
bg = new BackgroundLayer

# Scroll component for the song list page
songListScroll = new ScrollComponent
	x: 0, y: 255, width: 720, height: Screen.height - 255
	scrollHorizontal: false
	mouseWheelEnabled: true

# Scroll component for the song information page
infoPageScroll = new ScrollComponent
	x: Screen.width, y: 47, width: Screen.width, height: Screen.height
	scrollHorizontal: false
	mouseWheelEnabled: true
	backgroundColor: "#FFFFFF"
	
helpPage = new PageComponent
	x: 0, y: 0, height: Screen.height, width: Screen.width
	scrollVertical: false
	opacity: 0.9
	backgroundColor: "#354B60"
	
helpLayer1 = new Layer
	width: Screen.width, height: Screen.height
	image: "images/instructions1.png"
	scale: 0.9
	
helpLayer2 = new Layer
	width: Screen.width, height: Screen.height
	image: "images/instructions2.png"
	scale: 0.9

helpPage.addPage(helpLayer1)
helpPage.addPage(helpLayer2)
	
appBar = new Layer
	x: 0, y: 46, width: 720, height: 120
	image: "images/appBar.png"
	opacity: 0

actionBar = new Layer
	x: 0, y: 0, width: 720, height: 255
	image: "images/actionBar.png"

songList = new Layer
	y: 50, width: 720, height: Screen.height - 205
	image: "images/homeScrollList.png"
	superLayer: songListScroll.content
	
back = new Layer
	x: Screen.width, y: 90, width: 35, height: 35
	image: "images/back.png"
	index: 100

confirmation = new Layer
	height: Screen.height, width: Screen.width
	opacity: 0
	image: "images/confirmation.png"
	
confirmation.center()
	
helpPage.bringToFront()

# Advancing the help screen on clicks
helpPage.on Events.Click, (e) ->
	if this.currentPage.id == 44
		this.animate
			properties:
				y: Screen.height
				opacity: 0
			time: 0.3
	this.snapToNextPage()

songList.on Events.Click, ->
	# show song page
	infoPageScroll.bringToFront()
	appBar.bringToFront()
	back.bringToFront()
	infoPageScroll.animate
		properties:
			x: 0
		curve: "ease-in-out"
		time: 0.2
	appBar.animate
		properties:
			x: 0
		curve: "ease-in-out"
		time: 0.2
	back.animate
		properties:
			x: 34
		curve: "ease-in-out"
		time: 0.2
		
back.on Events.Click, ->
	# hide song page
	infoPageScroll.animate
		properties:
			x: Screen.width
		curve: "ease-in-out"
		time: 0.2
	appBar.animate
		properties:
			x: Screen.width
		curve: "ease-in-out"
		time: 0.2
	back.animate
		properties:
			x: Screen.width
		curve: "ease-in-out"
		time: 0.2
		
sketch.actionButtons.on Events.Click, ->
	confirmation.bringToFront()
	confirmation.animate
		properties:
			opacity: 1
		curve: "ease-in-out"
		time: 0.2

infoPageScroll.on Events.Move, ->
	if infoPageScroll.content.y > 200
		infoPageScroll.content.y = 200

	appBar.opacity = Utils.modulate(infoPageScroll.scrollY, [0, 200], [0, 1], true)
	back.opacity = Utils.modulate(infoPageScroll.scrollY, [0, 200], [1, 0], true)
	
sketch.songScrollList.superLayer = infoPageScroll.content
