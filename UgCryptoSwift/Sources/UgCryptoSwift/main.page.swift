import ScadeKit
import CryptoSwift

class MainPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// CryptoSwift Example 1
		let strVal = "Awesome = CryptoSwift and SCADE"
		let strValMd5 = strVal.md5()
		print(strValMd5)
		
		// this is the shortest way of wiring the logic
		// there are more elegant ways
		
		// get reference of label called lbMd5
		let lbMD5 = self.page!.getWidgetByName("lbMd5") as! SCDWidgetsLabel
		
		 // get reference to textbox, and add editFinished event
		if let tbText = self.page!.getWidgetByName("tbText") as? SCDWidgetsTextbox {
			tbText.onEditFinish.append(SCDWidgetsEditFinishEventHandler{
				(e:SCDWidgetsEditFinishEvent?) in
					let newValue = e!.newValue
					let md5 = newValue.md5() // Use CrytoSwift
					lbMD5.text = md5
			})
		}
	}
}
