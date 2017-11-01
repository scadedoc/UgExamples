import Foundation
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgBitmapDemo"
	let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	var bindingPage : BindingAndScalePagePageAdapter!
  	
	@objc func main() {
		SCDRuntime.initRuntime(self)

		mainAdapter = MainPageAdapter()
		
		bindingPage = BindingAndScalePagePageAdapter()
		bindingPage.load("BindingAndScalePage.page")
		
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
