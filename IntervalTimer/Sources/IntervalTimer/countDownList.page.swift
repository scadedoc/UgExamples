import ScadeKit
  
class CountDownListPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.addButton.onClick{_ in
    	Navigation.go(.createStopWatch, clearHistory: false, transition: .FROM_RIGHT)
    }
    
    self.toolBarItem1.onClick{_ in
    	Navigation.go(.main, clearHistory: true)
    }
  }
}
