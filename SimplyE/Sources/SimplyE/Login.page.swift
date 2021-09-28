import ScadeKit

class LoginPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
	}

	override func show(_ view : SCDLatticeView?) {
		
		// call parent to finish display activities
		super.show(view)
		
		// add code here that is executed
		// after the display of the page
		self.postDisplayActions()
		
	}
	
	func postDisplayActions() {
		// put actions that shall happen 
		// after the display of the page here
		SCDRuntime.call(withDelay:1,closure:{ self.navigation!.go("main.page", transition:"FORWARD_PUSH")})
	}
}
