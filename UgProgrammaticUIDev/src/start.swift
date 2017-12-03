#if os(Linux) || os(Android)
import SwiftFoundation
#endif
import ScadeKit

// some global variables
let redColor = SCDGraphicsRGB(red:255,green:0,blue:0)
let lightGrayColor = SCDGraphicsRGB(red:211,green:211,blue:211)
let whiteColor = SCDGraphicsRGB(red:241,green:241,blue:241)

@objc class Main : ObjectiveC.NSObject, SCDApplication {

 	let moduleName  = "UgProgrammaticUIDev"
	let window = SCDLatticeWindow()
  	let mainAdapter = MainPageAdapter()
  	let helloWorldPage = HelloWorldPageAdapter()
  	let formEntryPage = FormEntryPagePageAdapter()
  	let listControlPage = ListControlPageAdapter()
  	
	@objc func main() {
		SCDRuntime.initRuntime(self)
		mainAdapter.load("main.page")
		helloWorldPage.load("HelloWorld.page")
		formEntryPage.load("FormEntryPage.page")
		listControlPage.load("ListControl.page")
		
		// To run the samples, uncomment 1 - but only one - of the below lines
		//helloWorldPage.show(window)
		//formEntryPage.show(window)
		listControlPage.show(window)
	}
}
