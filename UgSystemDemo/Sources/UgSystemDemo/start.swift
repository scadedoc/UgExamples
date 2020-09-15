import ScadeKit

class UgSystemDemo: SCDApplication {

	let window = SCDLatticeWindow()
	let mainAdapter = MainPageAdapter()
	
	override func onFinishLaunching() {	
		mainAdapter.load("main.page")
		mainAdapter.show(window)
		
		// Demo Dispatch functionality
		DispatchExample().run()
	}
	
	// Override method to capture background enter event
	override func onEnterBackground() {
    	print("onEnterBackground")
  	}

	// Override method to capture foreground enter event
  	override func onEnterForeground() {
    	print("onEnterForeground")
  	}
	
	// handle deep link calls
	override func onOpen(with url: String) {
		print("url: \(url)")
		// deep link call happened, analyse URL
		if let ucs = URLComponents(string:url) {
			
			// The host value
			print(String(ucs.host!))
			
			// This is how to iterate the queryItems
			for qp in ucs.queryItems! {
				print(qp.name,String(qp.value!))
			}
			
			// lets search for a query parameter named msg and if it exists, inform window
			if let msg = ucs.queryItems!.first(where: { $0.name == "msg" } )  {
				mainAdapter.newDeepLinkMsg(msg:msg.value!)
			}
		}
		
		
	}
	
}
