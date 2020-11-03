import ScadeKit
import Foundation

class MainPageAdapter: SCDLatticePageAdapter {
	
	var label1 : SCDWidgetsLabel!
	@objc dynamic var valueTrue : Bool = true
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		label1 = self.page!.getWidgetByName("lbName") as! SCDWidgetsLabel
		getTextLabelVariables(label:label1)
		
		setGeneralProperties()
		setFontProperties()
	}
	
	func getTextLabelVariables(label:SCDWidgetsLabel) {
		
		print("name \(label.name)")
		print("text \(label.text)")
		print("isEnabled : \(label.enable)")
		print("isVisible : \(label.visible)")
		print("isMultiline : \(label.multiline)")
		print("isWrapText : \(label.wrapText)")
		print("label.drawing.accessibilityLabel : \(label.drawing!.accessibilityTitle)")
	}
	
	func setGeneralProperties() {
		label1.horizontalAlignment = SCDLayoutHorizontalAlignment.center
		label1.baselineAlignment = SCDWidgetsBaselineAlignment.alphabetic
	}
	
	func setFontProperties() {
		label1.font!.bold = true
		label1.font!.italic = true
		label1.font!.lineThrough = true
	}
	
}
