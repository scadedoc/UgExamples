import ScadeKit
  
class SavingTimerScreenPageAdapter: SCDLatticePageAdapter {

static var timerName: String?
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.saveButton.onClick { _ in
    	SavingTimerScreenPageAdapter.timerName = self.textbox.text
    	Navigation.go(.intervalTimer, clearHistory: false)
    }
    
  }
}
