import ScadeKit

class Navigation {

  enum Page: String, CaseIterable {
    case favorited
    case search
    case BookDetail
    case bookWebView
    case about
    case contactUs
    case settings
    case main
    case Login

    var fileName: String {
      return "\(self.rawValue).page"
    }

    func createAdapter() -> SCDLatticePageAdapter {
      switch self {
      case .favorited:
        return FavoritedPageAdapter()

      case .search:
        return SearchPageAdapter()

      case .BookDetail:
        return BookDetailPageAdapter()

      case .bookWebView:
        return BookWebViewPageAdapter()

      case .about:
        return AboutPageAdapter()

      case .contactUs:
        return ContactUsPageAdapter()

      case .settings:
        return SettingsPageAdapter()

      case .main:
        return MainPageAdapter()

      case .Login:
        return LoginPageAdapter()
      }

    }
  }

  private static var adapters: [Page: SCDLatticePageAdapter] = [:]

  private static var transitionsStack: [Page] = []

  private static var current: Page? {
    return self.transitionsStack.last
  }

  private static var penultimate: Page? {
    guard self.transitionsStack.count >= 3 else {
      return nil
    }

    return self.transitionsStack[self.transitionsStack.count - 3]

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
    /*
    let previous = self.transitionsStack.remove(at: self.transitionsStack.count - 3)
    let previousPage = self.penultimate!.fileName

    if (page == "bookWebView.page") {
      adapter(by: previous)?.navigation?.go(page: previousPage)
    } else {
    	adapter(by: last!)?.navigation?.go(page: page)
    }
*/
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