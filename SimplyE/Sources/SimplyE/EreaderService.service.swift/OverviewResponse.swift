import Foundation
import ScadeKit

@objc
protocol OverviewResponse: EObjectProtocol {
  var data: [BookCategory] { get }
}
