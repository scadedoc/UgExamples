import ScadeKit

class UgSliderControlDemo: SCDApplication {

 	let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	
	override func onFinishLaunching() {

		mainAdapter = MainPageAdapter()
		
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
