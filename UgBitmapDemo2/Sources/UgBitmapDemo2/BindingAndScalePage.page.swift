import ScadeKit
  
class BindingAndScalePagePageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.image1.url = "Assets/dog2.jpg"
    self.image1.contentPriority = false
    
	self.main.onClick.append(SCDWidgetsEventHandler{_ in self.navigation!.go(page: "main.page")})
  }
}
