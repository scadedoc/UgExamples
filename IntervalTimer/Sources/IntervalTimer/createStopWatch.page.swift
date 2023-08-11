import ScadeKit
  
class CreateStopWatchPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.saveButton.onClick{ _ in
    	Navigation.go(.stopWatchResultPage, clearHistory: false)
    }
  }
}
