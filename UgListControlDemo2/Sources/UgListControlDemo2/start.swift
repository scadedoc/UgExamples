import ScadeKit

class UgListControlDemo2: SCDApplication {

	let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	var groupedByBreedPage : GroupedByBreedPageAdapter!
  	
	override func onFinishLaunching() {
		mainAdapter = MainPageAdapter()
		
		groupedByBreedPage = GroupedByBreedPageAdapter()
		groupedByBreedPage.load("groupedByBreed.page")
		
		mainAdapter.load("main.page")
		mainAdapter.show(view: window)
	}
}
