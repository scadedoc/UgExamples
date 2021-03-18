import ScadeKit
import Foundation
#if os(Android)	
	import FoundationNetworking
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  var testResults: [TestResult] = []

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    // Run tests when button pressed
    if let runTestsButton = self.page!.getWidgetByName("button1") as? SCDWidgetsButton {
      runTestsButton.onClick.append(
        SCDWidgetsEventHandler {
          _ in self.runTests()
        })
    }

    // run the tests
    self.runTests()
  }

  func runTests() {

    self.testResults = []

    self.testResults = [
      TestResult(name: "TestURLSession", stat: "1/1", success: HttpClientSample().postSample()),
      TestResult(name: "TestDate.distantFuture", stat: "1/1", success: DateDemo().testDistantFuture()),
    ]
    
    let list1 = self.page?.getWidgetByName("list1") as! SCDWidgetsList
    list1.items.removeAll();
    self.testResults.forEach { result in
    	list1.items.append(0)
    	guard let elem = list1.elements.last else {return}
    	let gridView = elem.children[0] as! SCDWidgetsGridView
    	let rowViewLeft = gridView.children[0] as! SCDWidgetsRowView
    	let nameLabel = rowViewLeft.children[0] as! SCDWidgetsLabel
    	nameLabel.text = result.name
    	let statLabel = rowViewLeft.children[1] as! SCDWidgetsLabel
    	statLabel.text = result.stat
    	let rowViewRight = gridView.children[1] as! SCDWidgetsRowView
    	let passLabel = rowViewRight.children[0] as! SCDWidgetsLabel
    	passLabel.visible = result.success
    	let failLabel = rowViewRight.children[1] as! SCDWidgetsLabel
    	failLabel.visible = !result.success
    }
    
    

  }
}
