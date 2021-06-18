import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	var secondHandPos : Float = 0.0
	var secondHandSvg : SCDSvgLine?
	var statusStopped : Bool = false

	override func show(view: SCDLatticeView?) {		
		super.show(view: view)
		
		self.secondHandSvg = self.page!.drawing!.findById("sechand") as? SCDSvgLine
		self.moveSecHand2()
	}
	
	func moveSecHand()  {
		// This is another option how to do it,
		// but our best practice approach is moveSecHand2. Less CPU intensive
		
		SCDRuntime.call(withDelay: 1) {
        	self.secondHandPos = self.secondHandPos >= 360 ? 0.0 : self.secondHandPos + 6.0
			if let tranformableSvg = self.secondHandSvg! as? SCDSvgTransformable {
        		tranformableSvg.matrix = SCDSvgMatrix()
				tranformableSvg.rotateAround(self.secondHandPos,x:self.secondHandSvg!.x1.value,y:self.secondHandSvg!.y1.value)
        	}
			self.moveSecHand()
		}
	}
	
	func moveSecHand2() {
		// this is the more economic option
		// Create SVG animation
		let animation = SCDSvgRotateAnimation()
		
		// animation runs for 60 seconds
		animation.duration = 60
		
		// rotates hand 360 degrees
		animation.angle = 360	
		
		// rotate around the botton middle part
		animation.anchorX = 0.5
		animation.anchorY = 1.0
		
		// and repeats once
		animation.repeatCount = 1
		
		// once we finished the animation, we start over
		animation.onComplete = SCDSvgOnCompleteHandler{ _ in if(!self.statusStopped) { self.moveSecHand2() } }
		
		// add animation to SVG
		self.secondHandSvg!.animations.append(animation)
	}
}
