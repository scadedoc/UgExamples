import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	let page1 : Page1PageAdapter = Page1PageAdapter()
	let page2 : Page2PageAdapter = Page2PageAdapter()
	let page3 : Page3PageAdapter = Page3PageAdapter()
	var pageContainer : SCDLatticePageContainer?
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// pages could either be loaded on demand
		// or in advance. We load all pages in advance here
		self.page1.load("page1.page")
		self.page2.load("page2.page")
		self.page3.load("page3.page")
		
		// lets add event handlers
		let tbItem1 = self.page!.getWidgetByName("item1") as! SCDWidgetsClickable
		tbItem1.onClick.append(SCDWidgetsEventHandler{ _ in self.showPage(self.page1)})
		
		let tbItem2 = self.page!.getWidgetByName("item2") as! SCDWidgetsClickable
		tbItem2.onClick.append(SCDWidgetsEventHandler{ _ in self.showPage(self.page2)})
		
		let tbItem3 = self.page!.getWidgetByName("item3") as! SCDWidgetsClickable
		tbItem3.onClick.append(SCDWidgetsEventHandler{ _ in self.showPage(self.page3)})
		
		// Now,we get a reference to the page container
		self.pageContainer = self.page!.getWidgetByName("pagecontainer1") as? SCDLatticePageContainer 
		
		// Finally, we use the page container to show page1
		self.page1.show(self.pageContainer)
	}
	
	func showPage(_ page:SCDLatticePageAdapter) {
		// our syntax is the other way round
		// we tell the page to display itself in container X
		// we don't tell the container to show a page
		page.show(self.pageContainer)
	}
}
