import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	// This variable is bound to label control via binding editor
	@objc dynamic var label : String = "No gesture executed"
	
	// holds reference to circle
	var circle : SCDSvgCircle?
	
	// holds button reference
	var button1 : SCDWidgetsButton?
	
	// colors
	let colorDefaultGreen = SCDGraphicsRGB(red: 0, green: 142, blue: 0, alpha: 255)
	let colorPressedGreen = SCDGraphicsRGB(red: 18, green: 86, blue: 6, alpha: 255)
	
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// add tag gesture to page
		self.addTapGestureToPage()
		
		// setup swipe gestures for entire page
		let swipeGesture = getSwipeGesture()  
	 	self.page!.drawing!.gestureRecognizers.append(swipeGesture) 
		
		// setup gesture for the rectangle only
		if let rect = self.page!.drawing!.find(byId: "rect1") as? SCDSvgRect {
			rect.gestureRecognizers.append(getTapGesture("tapped rectangle"))
		}
		
		// setup and move circle using Pan gesture
		self.circle = self.page!.drawing!.find(byId: "circle1") as? SCDSvgCircle
		self.circle!.gestureRecognizers.append(getPanGesture())
		
		// add gesture to button. Is changes the background color
		// of the button when button is pressed (began) and finger is lifted up (ended)
		self.button1 = self.page!.getWidgetByName("button1") as? SCDWidgetsButton
		self.button1!.drawing!.gestureRecognizers.append(getUpDownGestureForButton())
		
	}
	
	func addTapGestureToPage() {
		
		let report = "Page tapped"
		
		// Step 1 : implement the action as a function
		func onActionTap(recognizer:SCDSvgGestureRecognizer?) {
			let tapEvent = recognizer as! SCDSvgTapGestureRecognizer
			self.setLabel(to:report + "\(tapEvent.numTaps) times") 
		}
		
		// Step 2 : Create recognizer
		let tapGestureRecognizer = SCDSvgTapGestureRecognizer(handler: onActionTap)
		
		// Step 3 : Configure recognizer. Set number of taps to wait for before triggering
		tapGestureRecognizer.numTaps = 1
		
		// Step 4 : Add recognizer to object
		self.page!.drawing!.gestureRecognizers.append(tapGestureRecognizer)
	}

	func getTapGesture(_ report:String) -> SCDSvgTapGestureRecognizer {
		
		// Step 1 : implement the action as a function
		func onActionTap(recognizer:SCDSvgGestureRecognizer?) {
			let tapEvent = recognizer as! SCDSvgTapGestureRecognizer
			self.setLabel(to:report + "\(tapEvent.numTaps) times") 
		}
		
		// Step 2 : Create recognizer
		let tapGestureRecognizer = SCDSvgTapGestureRecognizer(handler: onActionTap)
		
		// Step 3 : Configure recognizer. Set number of taps to wait for before triggering
		tapGestureRecognizer.numTaps = 1
		
		// return
		return tapGestureRecognizer
	}
	
	
	func getSwipeGesture() -> SCDSvgSwipeGestureRecognizer {
		
		// Use short cut syntax to create recognizer and specify action
		let swipeGestureRecognizer = SCDSvgSwipeGestureRecognizer { handler in
    		self.setLabel(to:"Swiped to left")
		}
		// Configure: capture swifts from left to right only
		swipeGestureRecognizer.direction = .left 
		
		
		return swipeGestureRecognizer
	}
		
	func getPanGesture() -> SCDSvgPanGestureRecognizer {
		
		// Create action
		func onPanAction(recognizer:SCDSvgGestureRecognizer?) {
			
			// cast generic gesture to pan gesture
			let panEvent = recognizer as! SCDSvgPanGestureRecognizer
			
			// lets change location of circle graphics object
	 	   	self.circle!.cx.value = self.circle!.cx.value + panEvent.deltaX
	    	self.circle!.cy.value = self.circle!.cy.value + panEvent.deltaY       
		}
		
		// create recognizer
		let panGestureRecognizer = SCDSvgPanGestureRecognizer(handler: onPanAction) 
		
		// Configure gesture --> nothing to configure. Return it
		return panGestureRecognizer
	}
	
	func getUpDownGestureForButton() -> SCDSvgPanGestureRecognizer {
		
		// Create action*
		func onPanAction(recognizer:SCDSvgGestureRecognizer?) {
			
			// depending on whether we are inside or outside of the button,
			// we set the button background a different color
			switch(recognizer!.state) {
				case .began:
					self.button1!.backgroundColor = self.colorPressedGreen
				case .ended: 
					self.button1!.backgroundColor = self.colorDefaultGreen
				default:
					return 
			}
		}
			
		// create recognizer
		let panGestureRecognizer = SCDSvgPanGestureRecognizer(handler: onPanAction) 
		
		// Configure gesture --> nothing to configure. Return it
		return panGestureRecognizer
	}
	
	
	func setLabel(to label:String) {
		// set the label via model control binding
		self.label = label
	}
}
