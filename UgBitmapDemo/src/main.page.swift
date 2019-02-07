import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	@objc dynamic var imageUrl : String = ""
	let valueFalse : Bool = false
  	
	#if os(Android)
    	func dataToString(data: SF_NSData, isUtf8: Bool) -> String {
     	let enc = isUtf8 ? String.Encoding.utf8 : String.Encoding.isoLatin1
     	let nsstring = SF_NSString(bytes: data.bytes, length: Int(data.length), encoding: enc.rawValue)

     	return String(nsstring)
   	}
  	#else
       func dataToString(data: Data, isUtf8: Bool) -> String {
    		return String(data: data, encoding: isUtf8 ? .utf8 : .isoLatin1)!
  	}
  	#endif
	
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
				bc3.content = dataToString(data: response.body, isUtf8: false)
				bc3.isContentPriority = true
			}
		}
		
	}
}
