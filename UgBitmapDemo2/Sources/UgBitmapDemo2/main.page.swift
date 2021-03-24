import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// adding 2nd page btn 
		let main = self.page!.getWidgetByName("itmBinding") as! SCDWidgetsClickable
		main.onClick.append(SCDWidgetsEventHandler{_ in self.navigation!.go(page: "BindingAndScalePage.page")})
		
		
		// get reference to second bitmap and set bitmap
		self.image2.url = "Assets/dog2.jpg"
		self.image2.contentPriority = false
		
		let externalurl = "https://s3.amazonaws.com/scade.io/demo/documentation/dog3.jpg"
		let request = SCDNetworkRequest()
		request.url = externalurl
		if let response = request.call() {
			self.image3.content = response.body
			self.image3.contentPriority = true
		}
		
	}
}
