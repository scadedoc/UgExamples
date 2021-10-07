import ScadeKit

class SettingsPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		let item = self.page!.getWidgetByName("itmCatalog") as! SCDWidgetsContainer
		item.onClick.append(SCDWidgetsEventHandler{ _ in self.gotoCatalog()})
		
		//let rowview1 = self.page.getWidgetByName("rowview1") as! SCDWidgetsContainer
		//rowview1.onClick.append(SCDWidgetsEventHandler{ _ in self.gotoLibraryCard() })
	}
	
	func gotoCatalog() {
		self.navigation!.go(page: "main.page", transition: .fromRight)
	}
	
	func gotoLibraryCard() {
		print("going to library card")
	}
}
