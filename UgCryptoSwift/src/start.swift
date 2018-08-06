#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgCryptoSwift"
	let window = SCDLatticeWindow()
  	let mainAdapter = MainPageAdapter()
  	
	@objc func main() {
		SCDRuntime.initRuntime(self)
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
