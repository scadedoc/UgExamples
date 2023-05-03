import Dispatch
import ScadeKit
import ScadeUI

import Foundation

class MainPageAdapter: SCDLatticePageAdapter {

  public var randomBooks: [Book] = []

  public var selectedBook: Book?
  
  let MAX_BOOK_NAME_LENGTH = 15

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.page?.onEnter.append(
      SCDWidgetsEnterEventHandler { [weak self] _ in
        self?.showRandomBook()
      })

    self.fetchAdventure()

    self.fetchFantasy()

    self.fetchHorror()

    self.fetchHealth()

    self.toolBarItem2.onClick { _ in
      self.goToSearchPage()
    }

//    self.toolBarItem3.onClick { _ in
//      self.goToFavoritesPage()
//    }

    self.toolBarItem4.onClick { _ in
      self.goToSettingsPage()
    }

    //guard let selected = searchPage.selectedBook else {return}

    self.ctrlListBookCatalog.elementProvider { (genre: Genre, element) in
      guard let viewCategory = element["viewCategory", as: SCDWidgetsRowView.self],
        let rowView = element["rowView", as: SCDWidgetsRowView.self],
        let listView = rowView["listView", as: SCDWidgetsListView.self]
      else { return }

      if let lbCategory = viewCategory["lbCategory", as: SCDWidgetsLabel.self] {
        lbCategory.text = genre.lbCategory
      }

      // rowView - horizontal list with book containers
      // listView - book container(template)

      (rowView.layout as? SCDLayoutGridLayout)?.columns = genre.books.count

      var bookViewList: [SCDWidgetsListView] = [listView]

      //create N - 1 book containers by coping first container, created in ScadeIDE
      for _ in 1..<genre.books.count {
        bookViewList.append(listView.copyControl() as! SCDWidgetsListView)
      }

      // set data for every book container
      for (index, book) in genre.books.enumerated() {
        let bookView = bookViewList[index]

        (bookView.layoutData as? SCDLayoutGridData)?.column = index
        bookView.visible = true

        bookView.onClick.append(
          SCDWidgetsEventHandler { [weak book] event in
            guard let book = book else { return }
            self.navigation?.goWith(page: "BookDetail.page", data: book)
          })

        //bookView[label]?.text = book.volumeInfo.title ?? "no title"
        //bookView["label", as: SCDWidgetsLabel.self]?.text = book.volumeInfo.title ?? "no title"

        if let label = bookView["label ", as: SCDWidgetsLabel.self] {
          let text = book.volumeInfo.title ?? "no title"
          
          //Solving cutoff texts in Label
		var truncated = text
		
        if text.count > self.MAX_BOOK_NAME_LENGTH {
          let index = text.index(text.startIndex, offsetBy: self.MAX_BOOK_NAME_LENGTH - 3)
          truncated = "\(text.prefix(upTo: index))..."
        }
        
          label.text = truncated
          (label.layoutData as? SCDLayoutGridData)?.maxContentWidth = 100
        }

        if let bitmap = bookView["image", as: SCDWidgetsImage.self] {
          CatalogManager.loadDataAsync(
            from: book.volumeInfo.imageLinks.thumbnail ?? "no image", queue: .main
          ) { [weak bitmap] data in
            bitmap?.content = data
          }
        }

      }

      // add book containers to the horizontal list *rowView*
      rowView.children = bookViewList
    }

  }

  private func addRandomBooks(_ books: [Book]) {
    self.randomBooks.append(contentsOf: books)
    showRandomBook()
  }

  private func showRandomBook() {
    if selectedBook != nil {
      CatalogManager.loadDataAsync(
        from: selectedBook?.volumeInfo.imageLinks.thumbnail ?? "no image", queue: .main
      ) { [weak self] data in
        guard let self = self else { return }

        self.heroImage.content = data
        self.heroImage.contentPriority = true
      }
    }

    DispatchQueue.main.async {
      self.selectedBook = self.randomBooks.randomElement()
    }
  }

  private func fetchAdventure() {
    CatalogManager.shared.fetchGenre(with: "Adventure", lbCategory: "Adventure") {
      [weak self] adventure in
      self?.ctrlListBookCatalog.items.append(adventure)
      self?.addRandomBooks(adventure.books)
    }
  }

  private func fetchFantasy() {
    CatalogManager.shared.fetchGenre(with: "Fantasy", lbCategory: "Fantasy") {
      [weak self] fantasy in
      self?.ctrlListBookCatalog.items.append(fantasy)
      self?.addRandomBooks(fantasy.books)
    }
  }

  private func fetchHorror() {
    CatalogManager.shared.fetchGenre(with: "Horror", lbCategory: "Horror") { [weak self] horror in
      self?.ctrlListBookCatalog.items.append(horror)
      self?.addRandomBooks(horror.books)
    }
  }

  private func fetchHealth() {
    CatalogManager.shared.fetchGenre(with: "Health", lbCategory: "Health") { [weak self] health in
      self?.ctrlListBookCatalog.items.append(health)
      self?.addRandomBooks(health.books)
    }
  }

  func goToSearchPage() {
    self.navigation?.go(page: "search.page")
  }

  func goToFavoritesPage() {
    self.navigation?.go(page: "favorited.page")
  }

  func goToSettingsPage() {
    self.navigation?.go(page: "settings.page")
  }

}
