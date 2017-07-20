#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgMasterPageDemo"
	let window = SCDLatticeWindow()
  	let mainAdapter = MainPageAdapter()
  	
	func main() {
		SCDRuntime.initRuntime(self)
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
