import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	@objc dynamic var testResults : [TestResult] = []
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// Run tests when button pressed
		if let runTestsButton = self.page!.getWidgetByName("button1") as? SCDWidgetsButton {
			runTestsButton.onClick.append(SCDWidgetsEventHandler {
			 	_ in self.runTests()	
			})
		}
		
		// run the tests
		self.runTests()
	}
	
	func runTests() {
		
		self.testResults = []
		
		self.testResults = [
		    TestResult(name:"TestURLSession", stat:"1/1", success: HttpClientSample().postSample() ),
		    TestResult(name:"TestDate.distantFuture", stat:"1/1", success: DateDemo().testDistantFuture()) ,
		]
		
	}
}
