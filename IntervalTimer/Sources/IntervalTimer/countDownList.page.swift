import ScadeKit

class CountDownListPageAdapter: SCDLatticePageAdapter {
/*
  static let shared = CountDownListPageAdapter()

  //var hours: Int = 0
  //var mins: Int = 0
  //var secs: Int = 0

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.addButton.onClick { _ in
      Navigation.go(.createStopWatch, clearHistory: false, transition: .fromRight)
    }

    self.toolBarItem1.onClick { _ in
      Navigation.go(.main, clearHistory: true)
    }

    self.list.elementProvider { (result: StopWatchResult, element) in
      guard let rowView = element["rowView", as: SCDWidgetsRowView],
        let eventLabel = rowView["eventLabel", as: SCDWidgetsLabel],
        let label1 = rowView["label1", as: SCDWidgetsLabel]
      else { return }
    }

    completionHandler = { [weak self] name, date in
      DispatchQueue.main.async {
        //self?.didCreateEvent(name: name, targetDate: date)

        // I try to add the results from the completionHandler to the didCreateEvent that populste the .items property of the List-Control
        self?.list.items.append(StopWatchResult.shared.didCreateEvent(name: name, targetDate: date))
      }
    }

  }
*/
}
