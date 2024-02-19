import ScadeKit
  
class MainPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.addWorkoutButton.onClick{ _ in
    	Navigation.go(.addCircuit, clearHistory: false)
    }
    
  }
}
