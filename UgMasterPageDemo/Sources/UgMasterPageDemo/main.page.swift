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
		self.page1.load("page1.page")
		self.page2.load("page2.page")
		self.page3.load("page3.page")
		
		// lets add event handlers
		self.item1.onClick{ _ in self.showPage(self.page1)}
		
		self.item2.onClick{_ in self.showPage(self.page2)}
		
		self.item3.onClick{ _ in self.showPage(self.page3)}
				
		// Finally, we use the page container to show page1
		self.page1.show(view: self.pagecontainer1)
	}
	
	func showPage(_ page:SCDLatticePageAdapter) {
		// our syntax is the other way round
		// we tell the page to display itself in container X
		// we don't tell the container to show a page
		page.show(view: self.pagecontainer1)
	}
}
