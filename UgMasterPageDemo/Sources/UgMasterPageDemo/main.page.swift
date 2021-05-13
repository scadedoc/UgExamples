import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	let page1 : Page1PageAdapter = Page1PageAdapter()
	let page2 : Page2PageAdapter = Page2PageAdapter()
	let page3 : Page3PageAdapter = Page3PageAdapter()
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// pages could either be loaded on demand
		// or in advance. We load all pages in advance here
		page1.load("page1.page")
		page2.load("page2.page")
		page3.load("page3.page")
		
		// lets add event handlers
		item1.onClick{ _ in self.showPage(self.page1)}
		
		item2.onClick{_ in self.showPage(self.page2)}
		
		item3.onClick{ _ in self.showPage(self.page3)}
				
		// Finally, we use the page container to show page1
		page1.show(view: pagecontainer1)
	}
	
	func showPage(_ page:SCDLatticePageAdapter) {
		// our syntax is the other way round
		// we tell the page to display itself in container X
		// we don't tell the container to show a page
		page.show(view: pagecontainer1)
	}
}
