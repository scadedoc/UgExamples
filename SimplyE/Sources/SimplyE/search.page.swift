import Dispatch
import ScadeGraphics
import ScadeKit
import ScadeUI

#if os(Android)
  import FoundationNetworking
#endif

class SearchPageAdapter: SCDLatticePageAdapter {

 // An array to collect all the books in all the four categories
  public var randomBooks: [Book] = [Book]()

  public let selectedBook: Book?

  override init() {
    // Getting the selectedBook from randomBooks for generating a random image link for heroImage in the main.page
    self.selectedBook = randomBooks.randomElement()
  }

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.fetchAdventurousBooks()
    self.fetchFantasyBooks()
    self.fetchHorrorBooks()
    self.fetchHealthBooks()

    self.toolBarItem1.onClick { _ in
      self.goToPage()
    }
    
    self.toolBarItem3.onClick { _ in
    	self.navigation?.go(page: "settings.page")
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
          self.navigation?.goWith(page: "bookDetail.page", data: book, transition: .FROM_RIGHT)
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
          self?.randomBooks.append(contentsOf: abooks)
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
          self?.randomBooks.append(contentsOf: fanbooks)
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
          self?.randomBooks.append(contentsOf: hobooks)
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
          self?.randomBooks.append(contentsOf: hebooks)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func goToPage() {
    self.navigation?.go(page: "main.page")
  }

}