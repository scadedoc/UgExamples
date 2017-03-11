import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
	}
	
	func enterPage(event:SCDWidgetsEnterEvent) {
		
		// We assume we passed a String object in the 
		// navigation.go() method
		let data = event.data as! String
		print("My past data :\(data)")
	}
}
