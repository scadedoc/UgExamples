#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgListControlDemo"
	var mainView: SCDLatticeView!
  	var mainAdapter: MainPageAdapter!
  	var groupedByBreedPage : GroupedByBreedPageAdapter!
  	
	func main() {
		SCDRuntime.initRuntime(self)

		mainView = SCDLatticeView()
		mainAdapter = MainPageAdapter()
		
		groupedByBreedPage = GroupedByBreedPageAdapter()
		groupedByBreedPage.load("groupedByBreed.page")
		
		mainAdapter.load("main.page")
		mainAdapter.show(mainView)
	}
}
