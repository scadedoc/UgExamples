import ScadeKit

class UgAnimationDemo: SCDApplication {

	let window = SCDLatticeWindow()
  	let mainAdapter = MainPageAdapter()
  	let loader1Page = Loaders1PageAdapter()
  	let graphPage = GraphPagePageAdapter()
  	let textboxPage = TextboxAnimatedPageAdapter()
  	let basicPage = BasicPageAdapter()
  	
	override func onFinishLaunching() {
		mainAdapter.load("main.page")
		//mainAdapter.show(window)
		loader1Page.load("Loaders1.page")
		textboxPage.load("TextboxAnimated.page")
		basicPage.load("Basic.page")
		//graphPage.load(path: "GraphPage.page")
		//loader1Page.show(view: window)
		//textboxPage.show(view: window)
		basicPage.show(view: window)
	}
}
