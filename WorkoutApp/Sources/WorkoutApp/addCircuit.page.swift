import ScadeKit
  
class AddCircuitPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.addCircuitButton.onClick{ _ in
    	Navigation.go(.addExercise, clearHistory: false)
    }
    
  }
}
