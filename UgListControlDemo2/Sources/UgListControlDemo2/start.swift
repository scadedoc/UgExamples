import ScadeKit

class UgListControlDemo2: SCDApplication {

	let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	
	override func onFinishLaunching() {
		mainAdapter = MainPageAdapter()
		
			
		mainAdapter.load("main.page")
		mainAdapter.show(view: window)
	}
}
