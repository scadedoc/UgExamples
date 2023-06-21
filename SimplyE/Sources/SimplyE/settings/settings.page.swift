import Foundation
import ScadeKit

class SettingsPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.horinzontalView1.onClick { _ in
      Navigation.go(.about)
    }

    self.horinzontalView3.onClick { _ in
      Navigation.go(.contactUs)
    }

    self.toolBarItem1.onClick { _ in
      Navigation.go(.main)
    }

    self.toolBarItem2.onClick { _ in
      Navigation.go(.search)
    }

    //    self.toolBarItem3.onClick { _ in
    //      Navigation.go(.favorited)
    //    }

  }

  private func onClickShow() {

    if self.checkbox1.checked == true {
      // dark theme
    } else {
      // light time
    }

  }

}