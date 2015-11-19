Framer.Device.contentScale = (Screen.width / 720)

# This imports all the layers for "Untitled" into untitledLayers
sketch = Framer.Importer.load "imported/Untitled"
moving = false

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
back.bringToFront()

songList.on Events.Click, ->
	if not moving
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
	if not moving
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

infoPageScroll.on Events.Move, ->
	if infoPageScroll.content.y > 200
		infoPageScroll.content.y = 200
		
	#sketch.photo.scale = Utils.modulate(infoPageScroll.scrollY, [0, -200], [1, 1.8], true)
	#sketch.photo.y = Utils.modulate(infoPageScroll.scrollY, [0, -200], [0, -350], true)
	
	appBar.opacity = Utils.modulate(infoPageScroll.scrollY, [0, 200], [0, 1], true)
	back.opacity = Utils.modulate(infoPageScroll.scrollY, [0, 200], [1, 0], true)
	
sketch.songScrollList.superLayer = infoPageScroll.content



# listScroll = ScrollComponent.wrap(sketch.homeScrollList)
# songScroll = ScrollComponent.wrap(sketch.songScrollList)