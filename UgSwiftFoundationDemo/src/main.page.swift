import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	@objc dynamic var testResults : [TestResult] = []
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		self.testResults = [
		    TestResult(name:"TestDate", stat:"3/3", success:true),
		    TestResult(name:"TestDate1", stat:"2/3", success:false)    
		]
	}
}
