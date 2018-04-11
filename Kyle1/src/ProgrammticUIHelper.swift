import ScadeKit

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 
// Helper class to make the development of UI using code even easier
// - works around some issues in v1 version of ScadeKit API
// - allows some shortcuts
// - we will incorporate some of this stuff in later versions of the ScadeSDK
//
//  Author : Frank Langel
//  Created : 03/29/2019
// 
// 
//  v0.5 	initial version 
//	
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////


extension SCDWidgetsPage {
	
	func insert(_ control:SCDWidgetsWidget,at:(UInt,UInt)) {
		
		// GridView always has a GridLayout
		let thisLayout =  self.layout as! SCDLayoutGridLayout
		
		// check if control can be insert at position 
		let fitInto =  thisLayout.columns > at.0 && thisLayout.rows > at.1 
		if(!fitInto) {
			print("\(type(of: self)) \(#function ) Failed to insert into page container as position (\(at)) exceed page grid size")
			return
		}
		
		// check if layoutData exists. If not, create it
		if (control.layoutData == nil) { 
			print("creating new layout")
			control.layoutData = SCDLayoutGridData() } 
		let layoutData = control.layoutData as! SCDLayoutGridData
		
		// set the correct postion
		layoutData.column = Int(at.0)
		layoutData.row = Int(at.1)
		
		// now we an safely insert into grid
		self.children.append(control)
	}
}


extension SCDWidgetsGridView {
	
	func insert(_ control:SCDWidgetsWidget,at:(UInt,UInt)) {
		
		// GridView always has a GridLayout
		let thisLayout =  self.layout as! SCDLayoutGridLayout
		
		// check if control can be insert at position 
		let fitInto =  thisLayout.columns > at.0 && thisLayout.rows > at.1 
		if(!fitInto) {
			print("\(type(of: self)) \(#function ) Failed to insert into container as position (\(at)) exceed grid size")
			return
		}
		
		// check if layoutData exists. If not, create it
		if (control.layoutData == nil) { 
			print("new layout")
			control.layoutData = SCDLayoutGridData() } 
		let layoutData = control.layoutData as! SCDLayoutGridData
	
		// set the correct postion
		layoutData.column = Int(at.0)
		layoutData.row = Int(at.1)
			print(layoutData.column)
		// now we an safely insert into grid
		self.children.append(control)
	}
}

extension SCDWidgetsListView {
	
	// Our horizontal view aka ListView (naming is soso)
	
	func insert(_ control:SCDWidgetsWidget,after:UInt) {
		
		// GridView always has a GridLayout
		let thisLayout = self.layout as! SCDLayoutGridLayout
		
		// check if control can be insert at position 
		let fitInto =  thisLayout.columns > after 
		if(!fitInto) {
			print("\(type(of: self)) \(#function) Failed to insert into container as position (\(after)) exceed grid size")
			return
		}
		
		// check if layoutData exists. If not, create it
		if (control.layoutData == nil) { control.layoutData = SCDLayoutGridData() } 
		let layoutData = control.layoutData as! SCDLayoutGridData
		
		// set the correct postion
		layoutData.column = Int(after)
		
		// now we an safely insert into grid
		self.children.append(control)
	}
}

extension SCDLayoutNode {
	
	func setGridPosition(to:(UInt,UInt))  {
		if let layoutGridData = self.layoutData as? SCDLayoutGridData {
			layoutGridData.row = Int(to.1)
			layoutGridData.column = Int(to.0)
		}
	}
	
	func getGridPostion() -> (Int,Int)? {
		if let layoutGridData = self.layoutData as? SCDLayoutGridData {
			return (layoutGridData.column,layoutGridData.row)
		}
		return nil
	}
}

extension SCDLayoutILayoutable {
	
	func setGridSize(to:(UInt,UInt)) {
		if let gridLayout = self.layout as? SCDLayoutGridLayout {
			gridLayout.columns = Int(to.0)
			gridLayout.rows = Int(to.1)
		}
	}
	func getGridSize() -> (Int,Int)? {
		if let gridLayout = self.layout as? SCDLayoutGridLayout {
			return (gridLayout.columns, gridLayout.rows )
		}
		return nil
	}
}

extension SCDWidgetsIStyledControl {
	
	func setBackgroundColor(to color:SCDGraphicsRGB) {
		// fails silently if backGround color could not be set
		if let backgroundStyle = self.getStyle(SCDWidgetsBackgroundStyle.eClass) as? SCDWidgetsBackgroundStyle {
			backgroundStyle.type = .color
      		backgroundStyle.color = color
  		}
	}
}

extension SCDWidgetsTextWidget {

	func setFontColor(to color:SCDGraphicsRGB  ) {
		if let fontStyle = self.getStyle(SCDWidgetsFontStyle.eClass) as? SCDWidgetsFontStyle  {
    	  fontStyle.color = color  
		}
	}
	
	func getFontColor() -> SCDGraphicsRGB {
		return self.getFontStyle().color 
	}
	
	func setFontIsBold(to isBold:Bool) {
		if let fontStyle = self.getStyle(SCDWidgetsFontStyle.eClass) as? SCDWidgetsFontStyle  {
    	  fontStyle.isBold = isBold  
		}
	}
		
	func getFontisBold() -> Bool {
		return self.getFontStyle().isBold
	}
	
	func setFontSize(to size:Int) {
		if let fontStyle = self.getStyle(SCDWidgetsFontStyle.eClass) as? SCDWidgetsFontStyle  {
    	  fontStyle.size = size  
		}
	}
	
	func getFontSize() -> Int {
		return self.getFontStyle().size
	}
	
	func setFontStyle(to style: SCDWidgetsFontStyle) {
		if let fontStyle = self.getStyle(SCDWidgetsFontStyle.eClass) as? SCDWidgetsFontStyle  {
    	  fontStyle.size = style.size
    	  fontStyle.fontFamily = style.fontFamily
    	  fontStyle.isBold = style.isBold
    	  fontStyle.isItalic = style.isItalic
    	  fontStyle.isLineThrough = style.isLineThrough
    	  fontStyle.isUnderline = style.isUnderline
    	  fontStyle.color = style.color
		}
	}
	
	func getFontStyle() -> SCDWidgetsFontStyle {
		return self.getStyle(SCDWidgetsFontStyle.eClass) as! SCDWidgetsFontStyle
	}
}

extension SCDWidgetsWidget {

	// Option I
	struct MinMaxConstraint {
		let min : UInt
		let max : UInt
	}
	
	var widthConstraint : MinMaxConstraint  {
		get {
		   let style = self.getStyle(SCDWidgetsWidgetStyle.eClass) as! SCDWidgetsWidgetStyle
		   return MinMaxConstraint(min:UInt(style.minSize.width), max:UInt(style.maxSize.width))
		}
		set {
		 	 let style = self.getStyle(SCDWidgetsWidgetStyle.eClass) as! SCDWidgetsWidgetStyle
			 style.minSize.width = Int(newValue.min)
			 style.maxSize.width = Int(newValue.max)
		}
	}
	
	// Option II
	func setWidthContraint(min:Int,max:Int) {
	  let style = self.getStyle(SCDWidgetsWidgetStyle.eClass) as! SCDWidgetsWidgetStyle
	  style.minSize.width = min
	  style.maxSize.width = max
	}
	
	func setHeightConstraint(min:Int,max:Int) {
	  let style = self.getStyle(SCDWidgetsWidgetStyle.eClass) as! SCDWidgetsWidgetStyle
	  style.minSize.height = min
	  style.maxSize.height = max
	}
}

extension SCDWidgetsContainer {
	
	
	
	private func getScrollGroup() -> SCDSvgScrollGroup {
		
//		 print("Starting")
//		 
//		 let scrollGroup = self.drawing as! SCDSvgDrawableGroup
//		 let child = scrollGroup.drawableChilds[1] as! SCDSvgScrollGroup
//		 print(child)
//		 print(child.drawableChilds[0])
//		 print("Return")
	 return SCDSvgScrollGroup()
	}
	
	var scrollVertically : Bool {
		get {
			 let sg = self.getScrollGroup()
			 return [SCDSvgScrollType.vertical, SCDSvgScrollType.all].contains(sg.type)
		}
			 
		set {
			let sg = self.getScrollGroup()
			sg.type = sg.type == SCDSvgScrollType.horizontal ?  .all :  .vertical
		}
	}
	
	var scrollHorizontally : Bool {
		
		get {
			 let sg = self.getScrollGroup()
			 return [SCDSvgScrollType.horizontal, SCDSvgScrollType.all].contains(sg.type)
		}
			 
		set {
			let sg = self.getScrollGroup()
			sg.type = sg.type == SCDSvgScrollType.vertical ?  .all :  .horizontal
		}
	}
	
}
