import ScadeKit
import Dispatch

#if os(Android)
  import FoundationNetworking
#endif

class LoginPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
  }

  override func show(view: SCDLatticeView?) {

    // call parent to finish display activities
    super.show(view: view)

    // add code here that is executed
    // after the display of the page
    self.postDisplayActions()

    self.loadResults()

  }

  func postDisplayActions() {
    // put actions that shall happen
    // after the display of the page here
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

      self.navigation!.go(page: "main.page", transition: .FROM_LEFT)
    }
  }

  func loadResults() {

    APICaller.shared.getAdventurousBooks { result in

    }

  }

}