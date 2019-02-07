import ScadeKit

class Kyle1: SCDApplication {

	let window = SCDLatticeWindow()
  	let mainAdapter = MainPageAdapter()
  	
	override func onFinishLaunching() {
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
