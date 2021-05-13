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
		
		 // get reference to textbox, and add editFinished event
		tbText.onEditFinish.append(SCDWidgetsEditFinishEventHandler{
			(e:SCDWidgetsEditFinishEvent?) in
				let newValue = e!.newValue
				let md5 = newValue.md5() // Use CrytoSwift
				self.lbMd5.text = md5
		})
	}
}
