#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgMapControl"
	var mainView: SCDLatticeView!
  	var mainAdapter: MainPageAdapter!
  	
	func main() {
		SCDRuntime.initRuntime(self)

		mainView = SCDLatticeView()
		mainAdapter = MainPageAdapter()
		
		mainAdapter.load("main.page")
		mainAdapter.show(mainView)
	}
}
