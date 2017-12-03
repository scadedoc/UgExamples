#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgAnimationDemo"
	let window = SCDLatticeWindow()
  	let mainAdapter = MainPageAdapter()
  	let loader1Page = Loaders1PageAdapter()
  	let graphPage = GraphPagePageAdapter()
  	let textboxPage = TextboxAnimatedPageAdapter()
  	let basicPage = BasicPageAdapter()
  	
	@objc func main() {
		SCDRuntime.initRuntime(self)
		mainAdapter.load("main.page")
		//mainAdapter.show(window)
		loader1Page.load("Loaders1.page")
		textboxPage.load("TextboxAnimated.page")
		basicPage.load("Basic.page")
		//graphPage.load(path: "GraphPage.page")
	//	loader1Page.show(window)
		//textboxPage.show(window)
		basicPage.show(window)
	}
}
