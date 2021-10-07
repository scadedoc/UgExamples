import Foundation

struct BookCategory: Decodable {
  let isbns: [String]
  let urls: [String]
  let category: String
}

struct BookDetailResponse: Decodable {
  let publisher: String
  let description2: String
  let isbn: String
  let author: String
  let imageurl: String
  let title: String
  let description: String
  let published: String
}

struct OverviewResponse: Decodable {
  let data: [BookCategory]
}

struct EReaderService {
  static let serviceUrl = "https://s3.amazonaws.com/scade.io/demo/eReader"

  static func getOverview() -> OverviewResponse? {
    return load(from: "\(serviceUrl)/overview")
  }

  static func getBookByIsbn(isbn: String) -> BookDetailResponse? {
    return load(from: "\(serviceUrl)/\(isbn)")
  }

  static private func load<T: Decodable>(from url: String) -> T? {
    guard let data = NetworkUtils.loadData(from: url) else { return nil }

    return try? JSONDecoder().decode(T.self, from: data)
  }
  
}
