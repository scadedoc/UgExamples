import ScadeKit
import Foundation

// some global variables
let redColor = SCDGraphicsRGB(red:255,green:51,blue:153)
let blueColor = SCDGraphicsRGB(red:68,green:106,blue:179)

 public var completionHandler: ((String, Date) -> Void)?

class IntervalTimer: SCDApplication {

  let window = SCDLatticeWindow()
  //let mainAdapter = MainPageAdapter()
  
  override func onFinishLaunching() {
    //mainAdapter.load("main.page")
    //mainAdapter.show(view: window)
    
    Navigation.show(.main, in: window)
    
  }
}
