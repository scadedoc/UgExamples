import ScadeKit

class BookInformationPageAdapter: SCDLatticePageAdapter {

  //var book: Book?
  var trueAttribute: Bool = true

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    // Add onEnter event that loads book data
    self.page!.onEnter.append(
      SCDWidgetsEnterEventHandler {
        (ev: SCDWidgetsEnterEvent?)
        in self.enterpage(ev: ev!)
      })

    // add back button event to go back to Catalog page
    let back = self.page!.getWidgetByName("viewBackButton") as! SCDWidgetsContainer
    back.onClick.append(SCDWidgetsEventHandler { _ in self.goBack() })
  }

  func enterpage(ev: SCDWidgetsEnterEvent) {
    guard let isbn = ev.data as? String,
          let book = BookManager.sharedInstance.getBook(isbn: isbn),
          let bookImageData = NetworkUtils.loadData(from: book.bookCoverUrl) else { return }
    
    print("loading book \(isbn)")

    bmpBook.content = bookImageData
    bmpBook.contentPriority = true

    list.elementProvider = SCDWidgetsElementProvider { (book: Book, elem) in
      guard let label1 = elem.getWidgetByName("lbDescription1") as? SCDWidgetsLabel,
            let label2 = elem.getWidgetByName("lbDescription2") as? SCDWidgetsLabel else { return }
      label1.text = book.description1
      label2.text = book.description2
    }
    list.items = [book]

    //lbDescription1.text = book!.description1
    //lbDescription2.text = book!.description2
    lbBookTitle.text = book.title
    lbAuthorName.text = book.author
    lbPublisher.text = book.publisher
    lbPublished.text = book.published
    lbCategory.text = book.category
  }

  func goBack() {
    self.navigation!.go(page: "main.page", transition: .fromRight)
  }
}
