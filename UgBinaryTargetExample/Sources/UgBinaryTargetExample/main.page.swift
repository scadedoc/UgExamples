import ScadeKit
import foo
  
class MainPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    let str = String(cString: foo())
    self.label.text = str
  }
}
