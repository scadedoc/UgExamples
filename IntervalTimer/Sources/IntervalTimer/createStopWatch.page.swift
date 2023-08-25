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

      // The completionHandler is publicly created in the start.swift file

      // I used the completionHnadler to collect texts and pickedDateTime from the textbox and datePicker respectively so that I can use it to assign these values to the elements of the List-Control in the countDownList.page
      completionHandler?(text, pickedDateTime)
      Navigation.go(.countDownList, clearHistory: false)
    }

  }

}
