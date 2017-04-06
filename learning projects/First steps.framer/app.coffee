# Create the orange circular object 
orangeCirlce = new Layer
	width: 300
	height: 300
	backgroundColor: "orange"
	borderRadius: 150
	x: Align.center
	y: Align.center

# Define the animation that should occur on tap
circleGrow = new Animation orangeCirlce,
	opacity: 0
	scale: 6
	options:
		curve: "spring(200,15)"

# Create the inverse animation of circleGrow
circleShrink = circleGrow.reverse()

# Create the event handler for taps on orangeCircle
orangeCirlce.onTap (event, layer) ->
	circleGrow.start()

# When the circleGrow animation completes, reset state with circleShrink
orangeCirlce.onAnimationEnd (event, layer) ->
	circleShrink.start()

# Create a loop in the animation... as soon as circleShrink completes, trigger circleGrow 
circleShrink.onAnimationEnd circleGrow.start