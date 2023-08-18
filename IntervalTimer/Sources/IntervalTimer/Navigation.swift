import ScadeKit

class Navigation {

  enum Page: String, CaseIterable {
    case createStopWatch
    case stopWatchResultPage
    case main
    case countDownList

    var fileName: String {
      return "\(self.rawValue).page"
    }

    func createAdapter() -> SCDLatticePageAdapter {
      switch self {
      case .main:
        return MainPageAdapter()

      case .createStopWatch:
        return CreateStopWatchPageAdapter()

      case .stopWatchResultPage:
        return StopWatchResultPagePageAdapter()

      case .countDownList:
        return CountDownListPageAdapter()

      }

    }
  }

  private static var adapters: [Page: SCDLatticePageAdapter] = [:]

  private static var transitionsStack: [Page] = []

  private static var current: Page? {
    return self.transitionsStack.last
  }

  static func adapter(by page: Page) -> SCDLatticePageAdapter? {
    guard let adapter = self.adapters[page] else {
      let adapter = page.createAdapter()

      adapter.load(page.fileName)
      self.adapters[page] = adapter

      return adapter
    }
    return adapter
  }

  /// Start point of GUI part of application.
  static func show(_ page: Page, in view: SCDLatticeView) {
    self.transitionsStack.append(page)
    adapter(by: page)?.show(view: view)
  }

  static func go(
    _ page: Page, clearHistory: Bool = false
  ) {
    navigation(by: page, clearHistory: clearHistory)?.go(
      page: page.fileName)
  }

  static func go(
    _ page: Page, with data: Any, clearHistory: Bool = false
  ) {
    navigation(by: page, clearHistory: clearHistory)?.goWith(
      page: page.fileName, data: data)
  }

  static func go(
    _ page: Page, clearHistory: Bool = false, transition: SCDLatticeTransition = .FROM_RIGHT
  ) {
    navigation(by: page, clearHistory: clearHistory)?.go(
      page: page.fileName, transition: transition)
  }

  static func back() {
    guard self.transitionsStack.count > 1 else { return }
    let last = self.transitionsStack.popLast()
    let page = self.current!.fileName

    adapter(by: last!)?.navigation?.go(page: page)

  }

  /// Utils

  private static func navigation(by page: Page, clearHistory: Bool = false) -> SCDLatticeNavigation?
  {
    guard let current = self.current else { return nil }

    if clearHistory {
      self.transitionsStack.removeAll()
    }
    self.transitionsStack.append(page)

    //NOTE: we must create page adapter befor transit to it
    let _ = adapter(by: page)

    return adapter(by: current)?.navigation
  }
}
