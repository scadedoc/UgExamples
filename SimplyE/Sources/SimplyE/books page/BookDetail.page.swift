import Dispatch
import Foundation
import ScadeKit

class BookDetailPageAdapter: SCDLatticePageAdapter {

  var book: Book?

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.backButton.onClick { _ in
      Navigation.back()
      //self.goBack()
    }

    self.image1.onClick { _ in
      Navigation.back()
      //self.goBack()
    }

    self.toolBarItem1.onClick { _ in
      Navigation.go(.main)
    }

    self.toolBarItem2.onClick { _ in
      Navigation.go(.search)
    }

    //    self.toolBarItem3.onClick { _ in
    //      Navigation.go(.Favorited, clearHistory: true)
    //    }

    self.toolBarItem4.onClick { _ in
      Navigation.go(.settings)
    }

    self.readBookButton.onClick { _ in
      Navigation.go(.bookWebView, with: self.book ?? "")
    }

    self.favoritedButton.onClick { _ in
      self.fetchClickedBook()
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

  private func fetchClickedBook() {
    FavoritedDatabase.favoriteDB.filteredBooks().forEach { bookSelected in
      FavoritedDatabase.favoriteDB.clickedBook(book: bookSelected)
    }
    print("Book favorited")
  }

}