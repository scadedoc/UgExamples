#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgListControlDemo"
let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	var groupedByBreedPage : GroupedByBreedPageAdapter!
  	
	@objc func main() {
		SCDRuntime.initRuntime(self)


		mainAdapter = MainPageAdapter()
		
		groupedByBreedPage = GroupedByBreedPageAdapter()
		groupedByBreedPage.load("groupedByBreed.page")
		
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
