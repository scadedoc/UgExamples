import ScadeKit
#if os(Android)
    import FoundationNetworking
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.fetchAdventure()

    self.fetchFantasy()

    self.fetchHorror()

    self.fetchHealth()
    
    self.toolBarItem2.onClick { _ in
      self.goToPage()
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

  func gotoMore() {
    self.navigation!.go(page: "ReaderSettings.page", transition: .fromLeft)
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

}


}