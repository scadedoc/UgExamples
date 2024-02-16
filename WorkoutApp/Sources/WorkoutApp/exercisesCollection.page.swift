import ScadeKit
  
class ExercisesCollectionPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.backButton.onClick { _ in
      Navigation.back()
    }
    
  }
}
