import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	// model that is bound to UI (see binding tab)
	var label2 : String = "no deep link msg yet"
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)

	}
	
	func newDeepLinkMsg(msg:String) {
		
		// using Model view binding (see binding tab)
		self.label2 = msg
		let lbContent = self.page!.getWidgetByName("lbContent") as! SCDWidgetsLabel
		lbContent.text = self.label2
	}

}
