import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	 @objc dynamic var categories : [Category] = []
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		// Get data from REST endpoint instead of local dummy data

		if let rsp = EreaderServiceManager.getInstance().getOverview() {
			self.categories = rsp.data.map{CatalogServiceManager.fromBookCategory(bc:$0)}
			// listen to click event
			print("loaded data \(self.categories.count)")
		}
	
		// setup toolbar events
		let item = self.page!.getWidgetByName("itmMore") as! SCDWidgetsContainer
		item.onClick.append(SCDWidgetsEventHandler{ _ in self.gotoMore()})
		
		// onEnter
		self.page!.onEnter.append(SCDWidgetsEnterEventHandler{ _ in self.enterPage() })
		
		populateBitmaps()
	}
	
	func enterPage() {
		
	}
	
	func gotoMore() {
		self.navigation!.go("settings.page",transition:"FORWARD_PUSH")
	}
	
	func populateBitmaps() {
		
		// get a reference to the name of the list control
		let ctrlLst = self.page!.getWidgetByName("ctrlListBookCatalog") as! SCDWidgetsList
		// Iterate across the elements in the list (the categories)
		for (num,e) in ctrlLst.elements.enumerated() {
		
			let category = self.categories[num]
			
			// get bitmaps based on categories
			let booksPerCategory = category.books
		
			// get the horizontal grid layout control that contains the bitmaps
			let row = e.getWidgetByName("rowviewbooks") as! SCDWidgetsRowView
			
			// iterate through list of books and set the respective URLS
			// if the list of books is greater than the number of bitmaps, 
			// the respective books will be ignored
			for (index,book) in booksPerCategory.enumerated() {
				//
				let bitmapname = "bmpbook\(index+1)"
				print("bitmapname \(bitmapname)")
				if let bitmap = row.getWidgetByName(bitmapname) as? SCDWidgetsBitmap {
					
					//bitmap.url = book.bookCoverUrl
					bitmap.content = NetworkUtils.download(url:book.bookCoverUrl)
					bitmap.isContentPriority = true
					
					// add onClickEvent
					bitmap.onClick.append(SCDWidgetsEventHandler{(ev:SCDWidgetsEvent?) in self.displayBookDetails(bookId:book.id)})
					
				}
			}
		}		
		
	}
	
	func displayBookDetails(bookId:String) {
		print("BookId : \(bookId)")
		self.navigation!.go(with:"bookdetails.page", data:bookId, transition : "FORWARD_PUSH")
	}
	
}
