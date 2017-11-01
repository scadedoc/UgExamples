#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgMapControl"
let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	
	@objc func main() {
		SCDRuntime.initRuntime(self)


		mainAdapter = MainPageAdapter()
		
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
