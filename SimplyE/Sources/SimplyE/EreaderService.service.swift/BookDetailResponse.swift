import Foundation
import ScadeKit

@objc
protocol BookDetailResponse: EObjectProtocol {
  var publisher: String { get }

  var description2: String { get }

  var isbn: String { get }

  var author: String { get }

  var imageurl: String { get }

  var title: String { get }

  var description: String { get }

  var published: String { get }
}
