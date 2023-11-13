import ScadeKit
import Foundation

// some global variables
let redColor = SCDGraphicsRGB(red:255,green:51,blue:153)
let blueColor = SCDGraphicsRGB(red:68,green:106,blue:179)
let whiteColor = SCDGraphicsRGB(red:255,green:255,blue:255)
let darkBlueColor = SCDGraphicsRGB(red:33,green:34,blue:44)
let prepareColor = SCDGraphicsRGB(red:198,green:108,blue:39)
let completedColor = SCDGraphicsRGB(red:59,green:145,blue:159)
let restColor = SCDGraphicsRGB(red:67,green:141,blue:197)
let workColor = SCDGraphicsRGB(red:61,green:149,blue:91)

public var completionHandler: ((String, Date) -> Void)?

public var working: String?
public var intervalLabelText: String?
public var timeLabelText: String?
public var intervalCount: String?

class IntervalTimer: SCDApplication {

  let window = SCDLatticeWindow()
  //let mainAdapter = MainPageAdapter()
  
  override func onFinishLaunching() {
    //mainAdapter.load("main.page")
    //mainAdapter.show(view: window)
    
    Navigation.show(.main, in: window)
    
  }
}