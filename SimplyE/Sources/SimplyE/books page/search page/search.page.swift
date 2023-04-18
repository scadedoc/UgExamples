import Dispatch
import ScadeGraphics
import ScadeKit
import ScadeUI

#if os(Android)
  import FoundationNetworking
#endif

class SearchPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.fetchAdventurousBooks()
    self.fetchFantasyBooks()
    self.fetchHorrorBooks()
    self.fetchHealthBooks()

    dump(FavoritedDatabase.favoriteDB.allBooks)

    self.toolBarItem1.onClick { _ in
      self.goToPage()
    }

    self.toolBarItem3.onClick { _ in
      self.goToFavoritesPage()
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

    ctrlListBooks.onItemSelected { event in
      guard let element = event.element as? SCDWidgetsListElement,
        let backgroundColor = element.backgroundColor
      else { return }

      // we want to animate the background color from gold to the original color
      let fromColor = SCDSvgRGBColor.gold
      let toColor = SCDSvgRGBColor(widgetRGB: backgroundColor)

      // let us animate fill property
      let anim = SCDSvgPropertyAnimation("fill", from: fromColor, to: toColor)
      anim.duration = 0.4
      anim.repeatCount = 1
      anim.delay = 0.2
      anim.deleteOnComplete = true

      element.backgroundSvgRect?.animations.append(anim)
    }

    self.textbox.onTextChange.append(
      SCDWidgetsTextChangeEventHandler { [weak self] event in

        if let textbox = event?.target as? SCDWidgetsTextbox {

          let query = textbox.text

          //var visible = query.isEmpty

          if !query.isEmpty && query.count >= 3 {

            APICaller.shared.getBook(with: query) { result in
              DispatchQueue.main.async {
                switch result {
                case .success(let titles):
                  self?.ctrlListBooks.items = titles

                  // Trying to add these searched books to the allBooks property in the FavoritedDatabase.swift file
                  FavoritedDatabase.favoriteDB.allBooks.append(contentsOf: titles)

                case .failure(let error):
                  print(error.localizedDescription)
                }
              }
            }

          }

        }

      })

  }

  private func fetchAdventurousBooks() {
    APICaller.shared.getAdventurousBooks { [weak self] result in
      switch result {
      case .success(let abooks):
        DispatchQueue.main.async {
          self?.ctrlListBooks.items.append(contentsOf: abooks)
          FavoritedDatabase.favoriteDB.allBooks.append(contentsOf: abooks)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  private func fetchFantasyBooks() {
    APICaller.shared.getFantasyBooks { [weak self] result in
      switch result {
      case .success(let fanbooks):
        DispatchQueue.main.async {
          self?.ctrlListBooks.items.append(contentsOf: fanbooks)

          // Trying to add these books to the allBooks property in the FavoritedDatabase.swift file
          FavoritedDatabase.favoriteDB.allBooks.append(contentsOf: fanbooks)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  private func fetchHorrorBooks() {
    APICaller.shared.getHorrorBooks { [weak self] result in
      switch result {
      case .success(let hobooks):
        DispatchQueue.main.async {
          self?.ctrlListBooks.items.append(contentsOf: hobooks)

          // Trying to add these books to the allBooks property in the FavoritedDatabase.swift file
          FavoritedDatabase.favoriteDB.allBooks.append(contentsOf: hobooks)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }

    }
  }

  private func fetchHealthBooks() {
    APICaller.shared.getHealthBooks { [weak self] result in
      switch result {
      case .success(let hebooks):
        DispatchQueue.main.async {
          self?.ctrlListBooks.items.append(contentsOf: hebooks)

          // Trying to add these books to the allBooks property in the FavoritedDatabase.swift file
          FavoritedDatabase.favoriteDB.allBooks.append(contentsOf: hebooks)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func goToPage() {
    self.navigation?.go(page: "main.page")
  }

  func goToFavoritesPage() {
    self.navigation?.go(page: "favorited.page")
  }

  func goToSettingsPage() {
    self.navigation?.go(page: "settings.page")
  }

}

extension SCDSvgRGBColor {

  public convenience init(widgetRGB color: SCDGraphicsRGB) {
    self.init(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
  }
}

extension SCDWidgetsWidget {

  /// Find the child element of svg part of widget with `template-id` attribute equals to `id`.
  ///
  /// For example, to find background element of widget, use:
  ///   (widget.findSvgElementBy(template: "background") as? SCDSvgRect)?.fill = .red
  ///
  /// - Parameters:
  ///   - id: The value of `template-id` attribute of child element.
  /// - Returns: A drawable child element.
  public func findSvgElementBy(template id: String) -> SCDSvgElement? {
    guard let container = self.drawing as? SCDSvgContainerElement else { return nil }

    return container.children.first(where: { $0.attributes["template-id"] == id })
  }

  /// Find the child element of svg part of widget with `template-id` attribute equals to `id`
  /// and type `type`.
  ///
  /// For example, to find background element of widget, use:
  ///   widget.findSvgElementBy(template: "background", as: SCDSvgRect.self)?.fill = .red
  ///
  /// - Parameters:
  ///   - id: The value of `template-id` attribute of child element.
  ///   - type: The type of child element.
  /// - Returns: A drawable child element.
  public func findSvgElementBy<Result: SCDSvgElement>(template id: String, as type: Result.Type)
    -> Result?
  {
    return findSvgElementBy(template: id) as? Result
  }

  /// Background svg image of current widget.
  public var backgroundSvgImage: SCDSvgImage? { self.backgroundSvgElement as? SCDSvgImage }

  /// Background svg rect of current widget.
  public var backgroundSvgRect: SCDSvgRect? { self.backgroundSvgElement as? SCDSvgRect }

  /// Background svg element of current widget.
  public var backgroundSvgElement: SCDSvgElement? { self.findSvgElementBy(template: "background") }

  /// Content group of current widget.
  public var svgContent: SCDSvgGroup? {
    self.drawing?.findByAttribute("template-id", value: "content") as? SCDSvgGroup
  }
}
