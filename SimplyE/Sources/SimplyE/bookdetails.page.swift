import ScadeKit

class BookdetailsPageAdapter: SCDLatticePageAdapter {

	@objc dynamic var book : Book?
	@objc dynamic var trueAttribute : Bool = true 
	
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// Add onEnter event that loads book data
		self.page!.onEnter.append(
			SCDWidgetsEnterEventHandler{(ev:SCDWidgetsEnterEvent?)
				in self.enterpage(ev:ev!)})	
		
		// add back button event to go back to Catalog page
		let back = self.page!.getWidgetByName("viewBackButton") as! SCDWidgetsContainer
		back.onClick.append(SCDWidgetsEventHandler{_ in self.goBack() })
	}
	
	func enterpage(ev:SCDWidgetsEnterEvent){
		if let isbn = ev.data as? String {
			print("loading book \(isbn)")
			self.book = BookManager.sharedInstance.getBook(isbn:isbn)!
		}
	}
	
	func goBack() {
		self.navigation!.go(page: "main.page", transition : .fromRight)
	}
}
