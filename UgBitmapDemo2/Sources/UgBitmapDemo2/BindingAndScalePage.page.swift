import ScadeKit
  
class BindingAndScalePagePageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    image1.url = "Assets/dog2.jpg"
    image1.contentPriority = false
    
	main.onClick{_ in self.navigation!.go(page: "main.page")}
  }
}
