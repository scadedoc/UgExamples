import ScadeKit
#if os(Android)
    import FoundationNetworking
#endif
  
class BooksListPageAdapter: SCDLatticePageAdapter {
  
  var categories: [Category] = []

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    // Get data from REST endpoint instead of local dummy data

    if let rsp = EReaderService.getOverview() {
      self.categories = rsp.data.map { CatalogServiceManager.fromBookCategory(bc: $0) }
      // listen to click event
      print("loaded data \(self.categories.count)")
    }

    // setup toolbar events
    let item = self.page!.getWidgetByName("itmMore") as! SCDWidgetsContainer
    item.onClick.append(SCDWidgetsEventHandler { _ in self.gotoMore() })

    // onEnter
    self.page!.onEnter.append(SCDWidgetsEnterEventHandler { _ in self.enterPage() })

    populateBitmaps()
  }

  func enterPage() {

  }

  func gotoMore() {
    self.navigation!.go(page: "ReaderSettings.page", transition: .fromLeft)
  }

  func populateBitmaps() {

    // get a reference to the name of the list control

    //let ctrlLst = self.page!.getWidgetByName("ctrlListBookCatalog") as! SCDWidgetsList
    // Iterate across the elements in the list (the categories)
    //for (num,e) in ctrlLst.elements.enumerated() {
      // get bitmaps based on categories
      //let booksPerCategory = category.books

      if let ctrlLst = page?.getWidgetByName("ctrlListBookCatalog") as? SCDWidgetsList {

        ctrlLst.elementProvider = SCDWidgetsElementProvider { (category: Category, listElement) in

          // get the horizontal grid layout control that contains the bitmaps
          guard let row = listElement.getWidgetByName("rowviewbooks") as? SCDWidgetsRowView else {
            return
          }

          // iterate through list of books and set the respective URLS
          // if the list of books is greater than the number of bitmaps,
          // the respective books will be ignored
          guard let viewCategory = listElement.getWidgetByName("viewCategory") as? SCDWidgetsRowView else {
            return
          }
          
          if let lbCategory = viewCategory.getWidgetByName("lbCategory") as? SCDWidgetsLabel {
          	lbCategory.text = category.label
          }

          for (index, book) in category.books.enumerated() {
            let bitmapname = "bmpbook\(index+1)"
            print("bitmapname \(bitmapname)")
            if let bitmap = row.getWidgetByName(bitmapname) as? SCDWidgetsImage {

              NetworkUtils.loadDataAsync(from: book.bookCoverUrl, queue: .main) { [weak bitmap] data in
                bitmap?.content = data
              }

              // add onClickEvent
              bitmap.onClick { _ in
                self.displayBookDetails(bookId: book.id)
              }

            }
          }

        }

        ctrlLst.items = self.categories

    }

  }

  func displayBookDetails(bookId: String) {
    print("BookId : \(bookId)")
    self.navigation?.goWith(page: "BookInformation.page", data: bookId, transition: .fromLeft)
  }
}
