import ScadeKit

class ModalContentPagePageAdapter: SCDLatticePageAdapter {

	// property that holds the closure that is called when leaving the modal window
	var onExit : ((String) -> ()) = { _ in }
	
	// define private window instance to display the modal dialog
	private let modalWindow = SCDLatticeWindow()
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// link buttons' click events to code that returns to main page
		for bname in ["btnLeave","btnConfirm"] {
			if let button = self.page!.getWidgetByName(bname) as? SCDWidgetsButton {
				button.onClick.append(SCDWidgetsEventHandler {	_ in 
					
					// close the window - modal dialog disappears
					self.modalWindow.close(); 
					
					// return to parent page with result
					self.onExit("pressed \(bname)")
				})
			}
		}
		
	}
	
	func show() {
		
		// <page>.show(window) is the default method to show a page in a window
		self.show(self.modalWindow)
	}
}
	
//	func displayAnimated() {
//		
//		// The animation is designed so that the dialog
//		// moves into the page from below 
//		
//		if let container = self.page!.drawing!.find(byId: "modalDialog") as? SCDSvgGroup {
//			
//			self.show(self.modalWindow)
//			
//			// get distance to bottom
//			let dybottomF = container.distanceToBottom(of:self.page!)
//			
//			// move SVG Group to bottom of screen
//			container.translate(0.0, y: dybottomF)
//			
//			// animate back to old Y coordinate
//			let translateAni = SCDSvgTranslateAnimation()
//			translateAni.dy = -dybottomF
//			translateAni.duration = 2
//			container.animations.append(translateAni)
//			
//			// PROBLEM SVGRoup appears, but is not animated
//		}
//		
//	}
//}
