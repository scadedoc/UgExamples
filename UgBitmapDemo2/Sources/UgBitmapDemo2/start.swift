import ScadeKit

class UgBitmapDemo2: SCDApplication {

  let window = SCDLatticeWindow()
  let mainAdapter = MainPageAdapter()
  let scaleAdapter = BindingAndScalePagePageAdapter()
  
  override func onFinishLaunching() {
    mainAdapter.load("main.page")
    scaleAdapter.load("BindingAndScalePage.page")
    mainAdapter.show(view: window)
  }
}
