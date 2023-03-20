import Foundation
import Dispatch
#if os(Android)
	import FoundationNetworking
#endif

struct constants {

  static let API_Key = "AIzaSyB_rT2ztHdM7Ac095GgMbzZfNeL_o_-m1U"
  static let baseURL = "https://www.googleapis.com/books/v1/volumes?"

}

enum APIError: Error {
  case FailedTogetData
}

class APICaller {

  static let shared = APICaller()

  func getBooksOfGenre(with name: String, completion: @escaping (Result<[Book], Error>) -> Void) {
    var genreParam: String = ""

    switch name {
    case "Adventure": genreParam = "thriller"
    case "Fantasy": genreParam = "fantasy"
    case "Horror": genreParam = "horror"
    case "Health": genreParam = "health"
    default:
      completion(.failure(APIError.FailedTogetData))
      return
    }


    guard let url = URL(string:
          "\(constants.baseURL)q=subject:\(genreParam)&download=epub&orderBy=newest&key=\(constants.API_Key)"
      )
    else { return }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in

      guard let data = data, error == nil else {
        return
      }

      do {
        let items = try JSONDecoder().decode(TrendingBookResponse.self, from: data)

        completion(.success(items.items))
      } catch {
        print("Unexpected error: \(error).")
        completion(.failure(APIError.FailedTogetData))
      }
    }

    task.resume()
  }


  



  func getAdventurousBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
    guard
      let url = URL(
        string:
          "\(constants.baseURL)q=subject:thriller&download=epub&orderBy=newest&key=\(constants.API_Key)"
      )
    else { return }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in

      guard let data = data, error == nil else {
        return
      }

      do {
        let items = try JSONDecoder().decode(TrendingBookResponse.self, from: data)

        completion(.success(items.items))
      } catch {
        completion(.failure(APIError.FailedTogetData))
      }
    }

    task.resume()

  }

  func getFantasyBooks(completion: @escaping (Result<[Book], Error>) -> Void) {

    guard
      let url = URL(
        string:
          "\(constants.baseURL)q=subject:fantasy&download=epub&orderBy=newest&key=\(constants.API_Key)"
      )
    else { return }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in

      guard let data = data, error == nil else {
        return
      }

      do {
        let items = try JSONDecoder().decode(TrendingBookResponse.self, from: data)

        completion(.success(items.items))
      } catch {
        completion(.failure(APIError.FailedTogetData))
      }
    }

    task.resume()

  }

  func getHorrorBooks(completion: @escaping (Result<[Book], Error>) -> Void) {

    guard
      let url = URL(
        string:
          "\(constants.baseURL)q=subject:horror&download=epub&orderBy=newest&key=\(constants.API_Key)"
      )
    else { return }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in

      guard let data = data, error == nil else {
        return
      }

      do {
        let items = try JSONDecoder().decode(TrendingBookResponse.self, from: data)

        completion(.success(items.items))
      } catch {
        completion(.failure(APIError.FailedTogetData))
      }
    }

    task.resume()

  }

  func getHealthBooks(completion: @escaping (Result<[Book], Error>) -> Void) {

    guard
      let url = URL(
        string:
          "\(constants.baseURL)q=subject:health&download=epub&orderBy=newest&key=\(constants.API_Key)"
      )
    else { return }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in

      guard let data = data, error == nil else {
        return
      }

      do {
        let items = try JSONDecoder().decode(TrendingBookResponse.self, from: data)

        completion(.success(items.items))
      } catch {
        completion(.failure(APIError.FailedTogetData))
      }
    }

    task.resume()

  }

  func getBook(with query: String, completion: @escaping (Result<[Book], Error>) -> Void) {

    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
      return
    }

    guard
      let url = URL(
        string:
          "\(constants.baseURL)q=intitle:\(query)&maxResult=40&download=epub&orderBy=newest&key=\(constants.API_Key)"
      )
    else { return }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in

      guard let data = data, error == nil else {
        return
      }

      do {
        let items = try JSONDecoder().decode(TrendingBookResponse.self, from: data)

        completion(.success(items.items))
      } catch {
        completion(.failure(APIError.FailedTogetData))
      }
    }

    task.resume()

  }

}