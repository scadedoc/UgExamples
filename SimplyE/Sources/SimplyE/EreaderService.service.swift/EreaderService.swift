import Foundation
import ScadeKit

@objc
protocol EreaderService: EObjectProtocol {
  func getOverview() -> OverviewResponse!

  func getBookByIsbn(isbn: String) -> BookDetailResponse!
}
