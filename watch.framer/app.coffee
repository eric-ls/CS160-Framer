Framer.Device.deviceType = "fullscreen"
# This imports all the layers for "watch" into watchLayers
sketch = Framer.Importer.load "imported/watch"
Utils.globalLayers(sketch)

replay.visible = true
exit.visible = true

step = 0

E.opacity = 0.5
D.opacity = 0.2
F.opacity = 0

background = new Layer
	width: 320, height: 320
	backgroundColor: "#303030"
	borderRadius: 320/2
background.center()

startBackground = new Layer
	width: 320, height: 320
	backgroundColor: "#303030"
	borderRadius: 320/2
startBackground.center()
	
startMsg = new Layer
	width: 320, height: 320
	image: "images/startMsg.png"
	borderRadius: 320/2
	
lyrics = new Layer
	width: 600, height: 50
	backgroundColor: "transparent"
	x: 100, y: 260
	html: "<div>Can I say something even crazier? Yes!</div>"
lyrics.bringToFront()
lyrics.style["font-size"] = "23px"
lyrics.style["font-family"] = "Roboto"

startMsg.center()

sketch.watch.superLayer = background
lyrics.superLayer = background
watch.center()
watch.scale = 1.3

replay.height = 320
replay.width = 320

exit.height = 320
exit.width = 320

endPage = new PageComponent
	width: 320, height: 320
	scrollVertical: false

endPage.addPage(replay)
endPage.addPage(exit)
endPage.center()
endPage.visible = false

replay.on Events.TouchEnd, ->
	step = 1
	stepOne()
	endPage.animate
		properties:
			opacity: 0
		time: 0.4
	startBackground.animate
		properties:
			opacity: 0
		time: 0.4


# ADD SKIN ON TOP OF EVERYTHING ELSE
moto360 = new Layer
	width: 900, height: 600
	image: "images/moto360.png"
moto360.scaleX = 0.60
moto360.scaleY = 0.60
moto360.center()


background.on Events.TouchEnd, ->
	moveTo()

moveTo = ->
	if step == 0
		hideStartBackground()
	else if step == 1
		stepOne()
	else if step == 2
		stepTwo()
	else if step == 3
		stepOne()
	else if step == 4
		stepTwo()
	else if step == 5
		stepThree()
	else if step == 6
		stepFour()
			
	step++
	
hideStartBackground = ->
	startBackground.animate
		properties: 
			opacity: 0
		time: 0.4
	startMsg.animate
		properties: 
			opacity: 0
		time: 0.4
		
stepOne = ->
	G.animate
		properties:
			x: 50
			opacity: 0
		time: 0.4
	C.animate
		properties:
			x: 80
			opacity: 0.5
			scale: 0.6
		time: 0.4
	E.animate
		properties:
			x: 123
			opacity: 1
			scale: 1.6
		time: 0.4
	D.animate
		properties:
			x: 155
			scale: 1
			opacity: 0.5
		time: 0.4
	F.animate
		properties:
			x: 190
			opacity: 0.2
		time: 0.4
	one.animate
		properties:
			x: 52
			y: 113
		time: 0.4
	two.animate
		properties:
			y: 154
		time: 0.4
	three.animate
		properties:
			x: 86
			y: 134
		time: 0.4
	lyrics.animate
		properties:
			x: 10
		time: 0.4

stepTwo = ->
	C.animate
		properties:
			x: 50
			opacity: 0
		time: 0.4
	E.animate
		properties:
			x: 80
			opacity: 0.5
			scale: 1
		time: 0.4
	D.animate
		properties:
			x: 123
			opacity: 1
			scale: 1.7
		time: 0.4
	F.animate
		properties:
			x: 160
			opacity: 0.5
		time: 0.4
	one.animate
		properties:
			x: 86
			y: 113
		time: 0.4
	two.animate
		properties:
			y: 75
		time: 0.4
	three.animate
		properties:
			x: 118
			y: 96
		time: 0.4
	lyrics.animate
		properties:
			x: -90
		time: 0.4
		
stepThree = ->
	E.animate
		properties:
			x: 50
			opacity: 0
			scale: 1
		time: 0.4
	D.animate
		properties:
			x: 80
			opacity: 0.5
			scale: 1
		time: 0.4
	F.animate
		properties:
			x: 123
			opacity: 1
			scale: 1.7
		time: 0.4
	one.animate
		properties:
			x: 86
			y: 153
		time: 0.4
	two.animate
		properties:
			x: 118
			y: 173
		time: 0.4
	three.animate
		properties:
			x: 118
			y: 73
		time: 0.4
	lyrics.animate
		properties:
			x: -180
		time: 0.4

stepFour = ->
	endPage.visible = true
	endPage.bringToFront()
	moto360.bringToFront()
	endPage.animate
		properties:
			opacity: 1
		time: 0.4
	startBackground.animate
		properties: 
			opacity: 1
		time: 0.4
