import ScadeKit

// some global variables
let redColor = SCDGraphicsRGB(red:255,green:0,blue:0)
let lightGrayColor = SCDGraphicsRGB(red:211,green:211,blue:211)
let whiteColor = SCDGraphicsRGB(red:241,green:241,blue:241)
let orangeColor = SCDGraphicsRGB(red:255,green:127,blue:80)
let greyColor = SCDGraphicsRGB(red:191,green:191,blue:191)
let blackColor = SCDGraphicsRGB(red:0,green:0,blue:0)
var exercisesArray: [ExercisesCollection] = []

class WorkoutApp: SCDApplication {

  let window = SCDLatticeWindow()
 // let mainAdapter = MainPageAdapter()
  
  override func onFinishLaunching() {
   // mainAdapter.load("main.page")
   // mainAdapter.show(view: window)
   Navigation.show(.main, in: window)
  }
}
