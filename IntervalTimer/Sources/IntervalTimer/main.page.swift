import ScadeKit
  
class MainPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.toolBarItem2.onClick{ _ in
    	Navigation.go(.createStopWatch, clearHistory: true)
    }
  }
}
