import ScadeKit
import ScadeUI
import Dispatch
#if os(Android)
	import FoundationNetworking
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  public var randomBooks: [Book] = [Book]()

  public let selectedBook: Book?

  override init() {
    // Getting the selectedBook from randomBooks for generating a random image link for heroImage in the main.page
    self.selectedBook = randomBooks.randomElement()
  }

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.page?.onEnter.append(
      SCDWidgetsEnterEventHandler { _ in
        self.createRandomAdventuralBook()
      })
    self.fetchAdventure()

    self.fetchFantasy()

    self.fetchHorror()

    self.fetchHealth()

    self.toolBarItem2.onClick { _ in
      self.goToPage()
    }
    
    //Geeting selectedBook from search.page.swift
    var searchPage: SearchPageAdapter!
    searchPage = SearchPageAdapter()
    
    //guard let selected = searchPage.selectedBook else {return}

    CatalogManager.loadDataAsync(
      from: searchPage.selectedBook?.volumeInfo.imageLinks.thumbnail ?? "no image", queue: .main
    ) { [weak self] data in
      self?.heroImage.content = data
    }

    self.toolBarItem3.onClick { _ in
      self.navigation?.go(page: "settings.page")
    }

    //guard let selected = searchPage.selectedBook else {return}

    CatalogManager.loadDataAsync(
      from: selectedBook?.volumeInfo.imageLinks.thumbnail ?? "no image", queue: .main
    ) { [weak self] data in
      self?.heroImage.content = data
    }

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
            self.navigation?.goWith(page: "bookDetail.page", data: book, transition: .FROM_RIGHT)
          })

        //bookView[label]?.text = book.volumeInfo.title ?? "no title"
        //bookView["label", as: SCDWidgetsLabel.self]?.text = book.volumeInfo.title ?? "no title"

        if let label = bookView["label ", as: SCDWidgetsLabel.self] {
          label.text = book.volumeInfo.title ?? "no title"
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

  private func fetchAdventure() {
    CatalogManager.shared.fetchGenre(with: "Adventure", lbCategory: "Adventure") {
      [weak self] adventure in
      self?.ctrlListBookCatalog.items.append(adventure)
    }
  }

  private func fetchFantasy() {
    CatalogManager.shared.fetchGenre(with: "Fantasy", lbCategory: "Fantasy") {
      [weak self] fantasy in
      self?.ctrlListBookCatalog.items.append(fantasy)
    }
  }

  private func fetchHorror() {
    CatalogManager.shared.fetchGenre(with: "Horror", lbCategory: "Horror") { [weak self] horror in
      self?.ctrlListBookCatalog.items.append(horror)
    }
  }

  private func fetchHealth() {
    CatalogManager.shared.fetchGenre(with: "Health", lbCategory: "Health") { [weak self] health in
      self?.ctrlListBookCatalog.items.append(health)
    }
  }

  private func createRandomAdventuralBook() {
    APICaller.shared.getAdventurousBooks { [weak self] result in
      switch result {
      case .success(let createRandomAdventural):
        DispatchQueue.main.async {
          self?.randomBooks.append(contentsOf: createRandomAdventural)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func goToPage() {
    self.navigation?.go(page: "search.page")
  }

}