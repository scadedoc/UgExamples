import ScadeKit
import Foundation

class MainPageAdapter: SCDLatticePageAdapter {
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		getTextLabelVariables(label:lbName)
		
		setGeneralProperties()
		setFontProperties()
	}
	
	func getTextLabelVariables(label:SCDWidgetsLabel) {
		
		print("name \(lbName.name)")
		print("text \(lbName.text)")
		print("isEnabled : \(lbName.enable)")
		print("isVisible : \(lbName.visible)")
		print("isMultiline : \(lbName.multiline)")
		print("isWrapText : \(lbName.wrapText)")
		print("lbName.drawing.accessibilityLabel : \(lbName.drawing!.accessibilityTitle)")
	}
	
	func setGeneralProperties() {
		lbName.horizontalAlignment = SCDLayoutHorizontalAlignment.center
		lbName.baselineAlignment = SCDWidgetsBaselineAlignment.alphabetic
	}
	
	func setFontProperties() {
		lbName.font!.bold = true
		lbName.font!.italic = true
		lbName.font!.lineThrough = true
	}
	
}
