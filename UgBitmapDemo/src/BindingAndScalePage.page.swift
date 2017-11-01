import ScadeKit

class BindingAndScalePagePageAdapter: SCDLatticePageAdapter {

	@objc dynamic var imageUrl:String 
	var falseValue:Bool = false
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// adding main btn 
		let main = self.page!.getWidgetByName("itmMain") as! SCDWidgetsClickable
		main.onClick.append(SCDWidgetsEventHandler{_ in self.navigation!.go("main.page")})
	}
	
	override init() {
		// setting the image location
		self.imageUrl = "res/dog.jpg"
	}
}