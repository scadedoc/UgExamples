import ScadeKit

class UgWebViewControl: SCDApplication {

  let window = SCDLatticeWindow()
  let mainAdapter = MainPageAdapter()
  
  override func onFinishLaunching() {
    mainAdapter.load("main.page")
    mainAdapter.show(view: window)
  }
}
