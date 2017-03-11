import Foundation
import ScadeKit

@objc class Main : NSObject, SCDApplication {

 	let moduleName  = "UgBitmapDemo"
	var mainView: SCDLatticeView!
  	var mainAdapter: MainPageAdapter!
  	var bindingPage : BindingAndScalePagePageAdapter!
  	
	func main() {
		SCDRuntime.initRuntime(self)

		mainView = SCDLatticeView()
		mainAdapter = MainPageAdapter()
		
		bindingPage = BindingAndScalePagePageAdapter()
		bindingPage.load("BindingAndScalePage.page")
		
		mainAdapter.load("main.page")
		mainAdapter.show(mainView)
	}
}
