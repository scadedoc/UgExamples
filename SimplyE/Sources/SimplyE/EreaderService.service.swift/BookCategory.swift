import Foundation
import ScadeKit

@objc
protocol BookCategory: EObjectProtocol {
  var isbns: [String] { get }

  var urls: [String] { get }

  var category: String { get }
}
