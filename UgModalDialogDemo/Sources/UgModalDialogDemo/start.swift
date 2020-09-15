import ScadeKit

class UgModalDialogDemo: SCDApplication {

	let window = SCDLatticeWindow()
	let mainAdapter = MainPageAdapter()
	
	override func onFinishLaunching() {	
		
		mainAdapter.load("main.page")
		mainAdapter.show(window)
		
	}
	
}

#if os(iOS) 

import UIKit 

extension SCDApplication {
	
	static var rootViewController : UIViewController? {
		
		get {
			return UIApplication.shared.delegate?.window??.rootViewController
		}
	}
}
#endif