import ScadeKit

class Loaders1PageAdapter: SCDLatticePageAdapter {

	let duration:Float = 0.8
	let repeatCount = -1	
		
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// Dont use load method for SVG animations
	}
	
	override func show(_ view: SCDLatticeView?) {
		super.show(view)
		
		// Its important that you setup animations in the SHOW method
		// not in the LOAD method. The show method is invoked when other graphics 
		// related assets are already initialized and loaded
		
		self.setupRotatingCircle()
		self.setupThreeDots()
		self.setupSpinningCircle()
		self.setupPuff()
		self.setupBars()
		self.setupHearts()
	}
	
	func createPropertyAnimation(of:String,values:[Float],duration:Float,delay:Float) -> SCDSvgPropertyAnimation {
		// Helper function
		let animation = SCDSvgPropertyAnimation(of, values: values)
		animation.duration = duration
		animation.repeatCount = repeatCount
		animation.delay = delay
		return animation
	}
	
	func setupRotatingCircle() {
		
		// We use rotate animation to rotate path around circle
		// We position path in the middle of the circle and 
		// that rotating
		
		let circle = self.page!.drawing!.find(byId: "c0") as! SCDSvgCircle
		let bbox = circle.getBoundingBox()
		
		let anim = SCDSvgRotateAnimation()
		anim.angle = 360
		anim.duration = 5
		
		anim.anchorX = Float(bbox.location.x + bbox.bounds.width / 2)
		anim.anchorY = Float(bbox.location.y + bbox.bounds.height / 2)

		anim.isAbsolute = true
		anim.repeatCount = -1

		if let svgPath = self.page!.drawing!.find(byId: "path1") as? SCDSvgPath {
			svgPath.animations.append(anim)	
		}
	}
	
	func setupThreeDots() {
		// We manipulate the radius and fillOpacity to make the dots smaller and bigger
		
		let radiusAnimation = createPropertyAnimation(of:"r", values: [15.0, 9.0, 15.0],duration:duration,delay:0.0)
		let opacityAnimation = createPropertyAnimation(of:"fillOpacity", values: [1, 0.5, 1],duration:duration,delay:0)
		
		let anim = SCDSvgGroupAnimation()
		anim.animations = [radiusAnimation, opacityAnimation]
		
		if let svgCircle = self.page!.drawing!.find(byId: "c1") as? SCDSvgCircle {
			svgCircle.animations.append(anim)	
		}
		
		let radiusAnimation2 = createPropertyAnimation(of:"r", values: [9, 15, 19],duration:duration,delay:0.0)
		let opacityAnimation2 = createPropertyAnimation(of:"fillOpacity", values: [0.5, 1, 0.5],duration:duration,delay:0.0)
		
		let anim2 = SCDSvgGroupAnimation()
		anim2.animations = [radiusAnimation2, opacityAnimation2]
		
		if let svgCircle = self.page!.drawing!.find(byId: "c2") as? SCDSvgCircle {
			svgCircle.animations.append(anim2)	
		}
		
		// add first animation to 3rd circle
		if let svgCircle = self.page!.drawing!.find(byId: "c3") as? SCDSvgCircle {
			svgCircle.animations.append(anim)	
		}
	}
	
	func setupSpinningCircle() {
		// each circle with id c11..c18 has different fillOpacity
		// at different stages
		
		// the animation values for each circle
		let circleAnimationValues : [String:[Int]] = [
		          "c11" : [1,0,0,0,0,0,0,0],
		          "c12" : [0,1,0,0,0,0,0,0],
		          "c13" : [0,0,1,0,0,0,0,0],
		          "c14" : [0,0,0,1,0,0,0,0],
		          "c15" : [0,0,0,0,1,0,0,0],
		          "c16" : [0,0,0,0,0,1,0,0],
		          "c17" : [0,0,0,0,0,0,1,0],
		          "c18" : [0,0,0,0,0,0,0,1]
		      ]
		  
		// set the animations
		for (id,values) in circleAnimationValues {
			if let circle = self.page!.drawing!.find(byId: id) as? SCDSvgCircle {
				let opacityAnimation = SCDSvgPropertyAnimation("fillOpacity", values: values)
				opacityAnimation.duration = 1.3
				opacityAnimation.repeatCount = -1
				circle.animations.append(opacityAnimation)
			}
		}
	}
	
	func setupPuff() {
		
		// Circle c21
		let radiusAnimation1 = SCDSvgPropertyAnimation("r", from: 1, to: 20)
 	    radiusAnimation1.duration = 1.8
  	    radiusAnimation1.repeatCount = -1
  	    radiusAnimation1.timeFunction =
        SCDSvgCustomTimeFunction(
              handler: AnimationUtiliites().makeCubicBezierFunction(x0: 0, y0: 0,
                                               x1: 0.165, y1: 0.84,
                                               x2: 0.44, y2: 1,
                                               x3: 1, y3: 1))
        
        let strokeAnimation1 = SCDSvgPropertyAnimation("strokeOpacity", from: 1, to: 0)
 	    strokeAnimation1.duration = 1.8
  	    strokeAnimation1.repeatCount = -1
  	    strokeAnimation1.timeFunction =
        SCDSvgCustomTimeFunction(
              handler: AnimationUtiliites().makeCubicBezierFunction(x0: 0, y0: 0,
                                               x1: 0.3, y1: 0.61,
                                               x2: 0.353, y2: 1,
                                               x3: 1, y3: 1))
        
        
        if let c21 = self.page!.drawing!.find(byId: "c21") as? SCDSvgCircle {
			let groupAnim = SCDSvgGroupAnimation()
			groupAnim.animations = [radiusAnimation1, strokeAnimation1]
			c21.animations.append(groupAnim)
		}
		
		// Circle c22
		let radiusAnimation2 = SCDSvgPropertyAnimation("r", from: 1, to: 20)
		radiusAnimation2.delay = -0.9
 	    radiusAnimation2.duration = 1.8
  	    radiusAnimation2.repeatCount = -1
  	    radiusAnimation2.timeFunction =
        SCDSvgCustomTimeFunction(
              handler: AnimationUtiliites().makeCubicBezierFunction(x0: 0, y0: 0,
                                               x1: 0.165, y1: 0.84,
                                               x2: 0.44, y2: 1,
                                               x3: 1, y3: 1))
        
        let strokeAnimation2 = SCDSvgPropertyAnimation("strokeOpacity", from: 1, to: 0)
 	    strokeAnimation2.duration = 1.8
 	    strokeAnimation2.delay = -0.9
  	    strokeAnimation2.repeatCount = -1
  	    strokeAnimation2.timeFunction =
        SCDSvgCustomTimeFunction(
              handler: AnimationUtiliites().makeCubicBezierFunction(x0: 0, y0: 0,
                                               x1: 0.3, y1: 0.61,
                                               x2: 0.353, y2: 1,
                                               x3: 1, y3: 1))
        
        
        if let c22 = self.page!.drawing!.find(byId: "c22") as? SCDSvgCircle {
			
			let groupAnim = SCDSvgGroupAnimation()
			groupAnim.animations = [radiusAnimation2, strokeAnimation2]
			c22.animations.append(groupAnim)
		}
	}
	
	func setupBars() {
		
		// the bars change in Y position and height
		
		let delaysPerBar : [String:Float] = [
		     "bar11" : 0.5,
		     "bar12": 0.25,
		     "bar13": 0.0,
		     "bar14": 0.25,
		     "bar15" : 0.5 ]
		                                     
		for (bar,delay) in delaysPerBar {
			
			let heightAnimation = createPropertyAnimation(of:"height", values: [120,110,100,90,80,70,60,50,40,140,120],duration:1,delay:delay)
			let newYvalues = [15,20,25,30,35,40,45,50,0,10].map{Float($0 * 1.5)}
			let yAnimation =  createPropertyAnimation(of:"y", values:newYvalues,duration:1,delay:delay)
			let groupAnimation = SCDSvgGroupAnimation()
			groupAnimation.animations = [heightAnimation, yAnimation]
			
			if let bar = self.page!.drawing!.find(byId: bar) as? SCDSvgRect {
				bar.animations.append(groupAnimation)
			}
		}
		     
	}
	
	func setupHearts() {
		// Setup left and right heart to change fill Opacity
		["heart1":0.0,"heart2":0.7].forEach{ (name:String,delay:Float) in
			if let svgHeart = self.page!.drawing!.find(byId: name) as? SCDSvgPath {
				svgHeart.animations.append(self.createPropertyAnimation(of:"fillOpacity", values: [0.5,1.0,0.5],duration:1.4,delay:delay))
			}
		}

		_ = self.createPropertyAnimation(of: "hello", values: [1,2,3],	duration: 3.0,delay: 4.0)
	}	
	
	
}
