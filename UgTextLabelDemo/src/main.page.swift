import ScadeKit

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
		print("isEnabled : \(label.isEnable)")
		print("isVisible : \(label.isVisible)")
		print("isMultiline : \(label.isMultiline)")
		print("isWrapText : \(label.isWrapText)")
		print("label.drawing.accessibilityLabel : \(label.drawing!.accessibilityLabel)")
	}
	
	func setGeneralProperties() {
		label1.horizontalAlignment = SCDLayoutHorizontalAlignment.center
		label1.baselineAlignment = SCDWidgetsBaselineAlignment.alphabetic
	}
	
	func setFontProperties() {
		label1.font!.isBold = true
		label1.font!.isItalic = true
		label1.font!.isLineThrough = true
	}
	
}
