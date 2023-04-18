import ScadeKit

class FavoritedPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    //self.fetchFavoritedBooks()
    

    self.toolBarItem1.onClick { _ in
      self.goBack()
    }

    self.toolBarItem2.onClick { _ in
      self.goToSearchPage()
    }

    self.toolBarItem4.onClick { _ in
      self.goToSettingsPage()
    }

    self.ctrlListBooks.elementProvider { (book: Book, element) in
      guard let listView = element["listView", as: SCDWidgetsListView.self],
        let rowView = listView["rowView", as: SCDWidgetsRowView.self]
      else { return }

      if let bitmap = element["image", as: SCDWidgetsImage.self] {
        CatalogManager.loadDataAsync(
          from: book.volumeInfo.imageLinks.smallThumbnail ?? "no image", queue: .main
        ) { [weak bitmap] data in
          bitmap?.content = data
        }
      }

      if let bookTitle = listView["bookTitleLabel", as: SCDWidgetsLabel.self] {
        bookTitle.text = book.volumeInfo.title ?? "no title"
        (bookTitle.layoutData as? SCDLayoutGridData)?.maxContentWidth = 50
      }

      if let bookAuthor = listView["authorTitleLabel", as: SCDWidgetsLabel.self] {
        bookAuthor.text = "by \(book.volumeInfo.authors?[0] ?? "Nothing")"
        (bookAuthor.layoutData as? SCDLayoutGridData)?.maxContentWidth = 100
      }

      if let pageCount = listView["pageCountLabel", as: SCDWidgetsLabel.self] {
        pageCount.text = "Page Count: \(book.volumeInfo.pageCount ?? 0)"
        (pageCount.layoutData as? SCDLayoutGridData)?.maxContentWidth = 50
      }

      if let lbRating = rowView["ratingLabel", as: SCDWidgetsLabel.self] {
        lbRating.text = book.volumeInfo.averageRating.map(String.init(describing:)) ?? "NA"
        (lbRating.layoutData as? SCDLayoutGridData)?.maxContentWidth = 50
      }

      element.onClick.append(
        SCDWidgetsEventHandler { [weak book] event in
          guard let book = book else { return }
          self.navigation?.goWith(page: "BookDetail.page", data: book, transition: .FROM_RIGHT)
        })

    }
    
    self.ctrlListBooks.items = FavoritedDatabase.favoriteDB.filteredBooks()

  }

 /* private func fetchFavoritedBooks() {
    filteredBooks { [weak self] favoritedBooks in
      do {
      	self?.ctrlListBooks.items.append(contentsOf: favoritedBooks)
      } catch {
      	print("error")
      }
    }
  }*/

  func goBack() {
    self.navigation?.go(page: "main.page", transition: .FROM_LEFT)
  }

  func goToSearchPage() {
    self.navigation?.go(page: "search.page")
  }

  func goToSettingsPage() {
    self.navigation?.go(page: "settings.page")
  }

}