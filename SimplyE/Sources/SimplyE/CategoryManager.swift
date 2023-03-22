import Foundation
import Dispatch
#if os(Android)
	import FoundationNetworking
#endif

class CatalogManager {

  static let shared = CatalogManager()

  /*
static func getCategories() -> [Genre] {
		let values = [  ("Adventure","Adventure"),
	         			("Fantasy","Fantasy"),
	         			("Horror","Horror"),
	         			("Health","Health"),
	  	  ]
		return values.map{Genre(name: $0, labelCategory: $1)}
	}
*/

  static func loadDataAsync(
    from urlString: String, queue: DispatchQueue,
    onSuccess: @escaping (Data) -> Void
  ) {
    loadDataAsyncWithResult(from: urlString) { result in
      switch result {
      case .success(let data):
        queue.async {
          onSuccess(data)
        }
      case .failure(let error):
        print("CatalogManager loadDataAsync error: \(error), \(error.localizedDescription)")
      }
    }
  }

  static func loadDataAsyncWithResult(
    from urlString: String,
    completion: @escaping (Result<Data, Error>) -> Void
  ) {
    if let url = URL(string: urlString) {
      let urlSession = URLSession(configuration: .default).dataTask(with: url) {
        (data, response, error) in
        if let error = error {
          completion(.failure(error))
        }

        if let data = data {
          completion(.success(data))
        }
      }

      urlSession.resume()
    }
  }

  public func fetchGenre(with name: String, lbCategory: String, callback: @escaping (Genre) -> Void) {
    APICaller.shared.getBooksOfGenre(with: name) { result in
      switch result {
      case .success(let books):
        callback(Genre(name: name, books: books, lbCategory: lbCategory))

      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  
}