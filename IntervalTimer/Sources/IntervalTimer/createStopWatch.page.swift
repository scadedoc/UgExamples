import Foundation
import ScadeKit

class CreateStopWatchPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.toolBarItem1.onClick { _ in
      Navigation.go(.main, clearHistory: true)
    }

    self.saveButton.onClick { _ in

      let text = self.textbox.text
      let pickedDateTime = self.datePicker.date

      guard !text.isEmpty else { return }
      completionHandler?(text, pickedDateTime)
      Navigation.go(.stopWatchResultPage, clearHistory: false)
    }

  }

} 
