import ScadeKit

class BasicPageAdapter: SCDLatticePageAdapter {

	var rect : SCDSvgRect? 
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
	}
	
	override func show(view: SCDLatticeView?) {
		super.show(view: view) 
		
		// all animmation setup has to happen in show method
		self.rect = self.page!.drawing!.findById("rect1") as? SCDSvgRect

		// create an animation
		let rotateAnimation = SCDSvgRotateAnimation()
		rotateAnimation.angle = 360
		rotateAnimation.duration = 5
		
		// Use of relative anchor coordinates
		rotateAnimation.anchorX = 0.5
		rotateAnimation.anchorY = 0.5
		rotateAnimation.absolute = false // false is the default
		
		// create translate animation
		let moveAnimation = getMoveByAnimation(dx:50,dy:50)
		moveAnimation.delay = 3
		
		// add animation to element
		let strokeWidthAni = getStrokeWidthAnimation()
		strokeWidthAni.delay = 2
		
		// motionAni
		let motionAni = getMoveAlongRectangle()
		motionAni.duration = 4
		
		self.rect!.animations.append(rotateAnimation)	
	}
	
	
	func getMoveByAnimation(dx:Float, dy:Float) -> SCDSvgTranslateAnimation {
		// create translate animation
		let moveByAnimation = SCDSvgTranslateAnimation()
		moveByAnimation.dx = dx
		moveByAnimation.dy = dx
		moveByAnimation.duration = 2.5 // 2.5 seconds
		return moveByAnimation
	}
	
	func getXYCoordinateCenterLowerThird() -> (Float,Float) {
		// get width and height of screen
		let screensize = SCDRuntime.getSystem().getScreenSize()
		let (w,h) = (Float(screensize!.width), Float(screensize!.height))
		return (w/2.0, h*(2/3) + (h*(1/3) / 2) )
	}
	
	func getMoveAlongRectangle() -> SCDSvgMotionAnimation  {
		// move vector object along lines of a rectangle
		let screenSize = SCDRuntime.getSystem().getScreenSize()
		
		// compute points of rectangle to move along by
		let (x0,y0) = (Float(screenSize!.width) * 0.2, Float(screenSize!.height) * 0.2)
		let (x1,y1) = (Float(screenSize!.width) - x0 - self.rect!.width.value, Float(screenSize!.height) - y0 - self.rect!.height.value)
		
		// get absolute location of vector element
		let bbLocation = self.rect!.getBoundingBox()!.location
		let (currentX, currentY) = (Float(bbLocation.x),Float(bbLocation.y))
		
		// create path and set start position
		let path = SCDSvgPath()
		path.elements.append(SCDSvgPathMove(x: currentX, y: currentY))
		
		// set lines to move along by
		[(x0,y1), (x0,y0), (x1,y0), (x1,y1), (currentX, currentY)].forEach{ path.elements.append(SCDSvgPathLine(x:$0.0, y:$0.1))}
		
		// set to absolute movement (will be default to true in next build)
		path.elements.forEach{ $0.absolute = true }	
	
		// create motion path animation. the x,y points need to be translated to 
		let motionAnim = SCDSvgMotionAnimation()
		motionAnim.path = path
		return motionAnim
	}
		
	func getStrokeWidthAnimation() -> SCDSvgPropertyAnimation {
		// the vector element attribute name needs to be specified in lowerCamel
		// so stroke-width in the SVG source becomes strokeWidth
		// we will look into changing this in the future, this inconsistency doesnt make sense
		let strokeWidthAnimation = SCDSvgPropertyAnimation("strokeWidth",from:5,to:10)
		strokeWidthAnimation.duration = 2
		return strokeWidthAnimation
	}
	
	func getFillColorAnimation() -> SCDSvgPropertyAnimation {
		let fromColor = SCDSvgRGBColor(r:1,g:0,b:0)
		let toColor = SCDSvgRGBColor(r:1,g:1,b:0)
		let fillColorAnimation =  SCDSvgPropertyAnimation("fill",from:fromColor,to:toColor)
		fillColorAnimation.duration = 3
		return fillColorAnimation
	}
	
	func getRotateAnimation() -> SCDSvgRotateAnimation {
		let rotateAnimation = SCDSvgRotateAnimation()
		rotateAnimation.angle = 360
		rotateAnimation.duration = 4
		
		// Use of relative anchor coordinates
		rotateAnimation.anchorX = 0.5
		rotateAnimation.anchorY = 0.5
		rotateAnimation.absolute = false // false is the default	
		
		return rotateAnimation
	}
	
	func getAbsoluteCoordinates(of vectorElement:SCDSvgShape) -> (Float,Float) {
		let location = vectorElement.getBoundingBox()!.location
		return (Float(location.x),Float(location.y))
	}
	
	func getGroupAnimationStrokeAndFill() -> SCDSvgGroupAnimation {
		let ga = SCDSvgGroupAnimation()
		ga.animations = [getRotateAnimation(),getFillColorAnimation()]
		ga.delay = 2
		return ga
	}
	
	func getPropertyWithValueFunctionAnimation() -> SCDSvgPropertyAnimation {
		
		let v = {(x:Float) -> SCDSvgRGBColor in
		   switch x {
			case 0..<0.25 : return SCDSvgRGBColor(r:1,g:0,b:0)
			case 0.25..<0.75 : return SCDSvgRGBColor(r:1,g:0.5,b:0)
		  	case 0.75...1 : return SCDSvgRGBColor(r:0,g:0,b:0.5)
		  	default: return SCDSvgRGBColor(r:1,g:1,b:1)
			}
		}
		let ani =  SCDSvgPropertyAnimation("fill", valueFunction : v) 
		ani.duration = 3
		return ani
	}
	
	func getOnCompleteAnimation() -> SCDSvgGroupAnimation {
		let animation = getGroupAnimationStrokeAndFill() 
		animation.onComplete = SCDSvgOnCompleteHandler{ _ in print("Done with Animation") }
		return animation
	}

}