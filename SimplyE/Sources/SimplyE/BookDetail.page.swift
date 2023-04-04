import ScadeKit
import Dispatch
#if os(Android)
	import FoundationNetworking
#endif

class BookDetailPageAdapter: SCDLatticePageAdapter {

  var book: Book?

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.backButton.onClick { _ in
      self.goBack()
    }

    self.toolBarItem1.onClick { _ in
      self.goBack()
    }
    
    self.toolBarItem2.onClick { _ in
    	self.goToPage()
    }
    
    self.readBookButton.onClick{ _ in
    	self.navigation?.goWith(page: "bookWebView.page", data: self.book ?? "")
    }

  }

  override func show(view: SCDLatticeView?, data: Any) {
    super.show(view: view, data: data)

    if let book = data as? Book {
      //print("show book: \(book.volumeInfo.title)")
      
      self.book = book

      lbBookTitle.text = book.volumeInfo.title ?? ""
      lbAuthorName.text = "by \(book.volumeInfo.authors?[0] ?? "Nothing")"
      lbPublished.text = book.volumeInfo.publishedDate ?? ""
      lbLanguage.text = book.volumeInfo.language ?? ""
      lbDescription.text =
        book.volumeInfo.description ?? "No Overview available for this Particular Book"
      lbPages.text = book.volumeInfo.pageCount.map(String.init(describing:)) ?? "NA"
      lbRating.text = book.volumeInfo.averageRating.map(String.init(describing:)) ?? "NA"

      if let bitmap = horizontalImageView["image", as: SCDWidgetsImage.self] {
        CatalogManager.loadDataAsync(
          from: book.volumeInfo.imageLinks.thumbnail ?? "no image", queue: .main
        ) { [weak bitmap] data in
          bitmap?.content = data
        }
      }

    }

  }

  func goBack() {
    self.navigation?.go(page: "main.page", transition: .FROM_LEFT)
  }
  
  func goToPage () {
  	self.navigation?.go(page: "search.page")
  }

}
