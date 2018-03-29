import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	// This variable is bound to label control via binding editor
	@objc dynamic var label : String = "No gesture executed"
	
	// holds reference to circle
	var circle : SCDSvgCircle?
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// setup gestures for entire page
		[getTapGesture("tapped"),getSwipeGesture()].forEach{ 
			self.page!.drawing!.gestureRecognizers.append($0) }
		
		// setup gesture for the rectangle only
		if let rect = self.page!.drawing!.find(byId: "rect1") as? SCDSvgRect {
			rect.gestureRecognizers.append(getTapGesture("tapped rectangle"))
		}
		
		// setup and move circle using Pan gesture
		self.circle = self.page!.drawing!.find(byId: "circle1") as? SCDSvgCircle
		self.circle!.gestureRecognizers.append(getPanGesture())
		
	}
	
	func getTapGesture(_ report:String) -> SCDSvgTapGestureRecognizer {
		// On tap, set label
		let gestureHandler =  SCDSvgTapGestureRecognizer{ tap in 
			let tapEvent = tap as! SCDSvgTapGestureRecognizer
			self.setLabel(to:report+"\(tapEvent.numTaps) times") 
		}
		// set number of taps after which the gesture event is fired
		gestureHandler.numTaps = 1
		return gestureHandler
	}      
	
	func getSwipeGesture() -> SCDSvgSwipeGestureRecognizer {
		
		let gestureHandler = SCDSvgSwipeGestureRecognizer { handler in
    		self.setLabel(to:"Swiped to left")
		}
		// capture swifts from left to right only
		gestureHandler.direction = .left
		return gestureHandler
	}
		
	func getPanGesture() -> SCDSvgPanGestureRecognizer {
		
		// A pan gesture is a movement along a path
		let gestureHandler = SCDSvgPanGestureRecognizer {handler in
    		let handler = handler as! SCDSvgPanGestureRecognizer
 
    		// lets change location of circle graphics object
	 	   	self.circle!.cx.value = self.circle!.cx.value + handler.deltaX
	    	self.circle!.cy.value = self.circle!.cy.value + handler.deltaY             
		}
		return gestureHandler
	}
	
	func setLabel(to label:String) {
		// set the label via model control binding
		self.label = label
	}
}
