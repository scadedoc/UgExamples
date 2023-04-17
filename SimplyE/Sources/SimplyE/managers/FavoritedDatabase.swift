import Foundation

class FavoritedDatabase {

  public var allBooks: [Book] = []

  static let favoriteDB = FavoritedDatabase()

  private let FAV_KEY = "fav_key"

  var savedBooks: Set<String> = []

  /* init() {
    self.savedBooks = load()
  } */

  func save(books: Set<String>) {
    let booksArray = Array(books)
    UserDefaults.standard.set(booksArray, forKey: FAV_KEY)
  }

  func load() -> Set<String> {
    let booksArray = UserDefaults.standard.array(forKey: FAV_KEY) as? [String] ?? [String]()
    return Set(booksArray)
  }

  /* func connectToLoad() {
    if savedBooks.isEmpty {
      savedBooks = load()
    }
  }*/

  func filteredBooks() -> [Book] {
    return allBooks.filter { savedBooks.contains($0.id) }
  }

  func clickedBook(book: Book) {
    if savedBooks.contains(book.id) {
      savedBooks.remove(book.id)
    } else {
      savedBooks.insert(book.id)
    }

    save(books: savedBooks)
  }

}
