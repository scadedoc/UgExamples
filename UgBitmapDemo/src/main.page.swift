import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	@objc dynamic var imageUrl : String = ""
	let valueFalse : Bool = false
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// adding 2nd page btn 
		let main = self.page!.getWidgetByName("itmBinding") as! SCDWidgetsClickable
		main.onClick.append(SCDWidgetsEventHandler{_ in self.navigation!.go("BindingAndScalePage.page")})
		
		
		// get reference to second bitmap and set bitmap
		if let bc2 = self.page!.getWidgetByName("bitmap2") as? SCDWidgetsBitmap {
			bc2.url = "res/dog2.jpg"
			bc2.isContentPriority = false
		}
		
		if let bc3 = self.page!.getWidgetByName("bitmap3") as? SCDWidgetsBitmap {
			let externalurl = "https://s3.amazonaws.com/scade.io/demo/documentation/dog3.jpg"
			let request = SCDNetworkRequest()
			request.url = externalurl
			if let response = request.call() {
				bc3.content = response.body
				bc3.isContentPriority = true
			}
		}
		
	}
}
