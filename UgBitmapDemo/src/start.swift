import ScadeKit

class UgBitmapDemo: SCDApplication {

	let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	var bindingPage : BindingAndScalePagePageAdapter!
  	
	override func onFinishLaunching() {
		SCDRuntime.initRuntime(self)

		mainAdapter = MainPageAdapter()
		
		bindingPage = BindingAndScalePagePageAdapter()
		bindingPage.load("BindingAndScalePage.page")
		
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
