import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// adding 2nd page btn 
		itmBinding.onClick{_ in self.navigation!.go(page: "BindingAndScalePage.page")}
		
		
		// get reference to second bitmap and set bitmap
		image2.url = "Assets/dog2.jpg"
		image2.contentPriority = false
		
		let externalurl = "https://s3.amazonaws.com/scade.io/demo/documentation/dog3.jpg"
		let request = SCDNetworkRequest()
		request.url = externalurl
		if let response = request.call() {
			image3.content = response.body
			image3.contentPriority = true
		}
		
	}
}
