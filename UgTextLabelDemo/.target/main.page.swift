import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	var label1 : SCDWidgetsLabel!
	let valueTrue : Bool = true
	
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
		let style = SCDWidgetsTextStyle()
		let textstyle = label1.getStyle(style.eClass()) as! SCDWidgetsTextStyle
		textstyle.horizontalAlignment = SCDLayoutHorizontalAlignment.center
		textstyle.baselineAlignment = SCDWidgetsBaselineAlignment.alphabetic
	}
	
	func setFontProperties() {
		let style = SCDWidgetsFontStyle()
		let fontstyle = label1.getStyle(style.eClass()) as! SCDWidgetsFontStyle
		fontstyle.isBold = true
		fontstyle.isItalic = true
		fontstyle.isLineThrough = true
	}
	
}
