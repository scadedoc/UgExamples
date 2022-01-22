import ScadeKit

class HelloWorldPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// setup the button
		let button = SCDWidgetsButton()
		button.text = "Press me!"
		button.onClick{ e in self.handleButtonClick(e) }
		configureFontStyle(of:button)
		
		// It is MANDATORY to set the layoutData property. Without it, code crashes
		let gridData = SCDLayoutGridData()
		gridData.row = 0 // here, we tell the layout manager that this control belongs into row 1 (i.e 0)
		gridData.horizontalAlignment = .center
		gridData.verticalAlignment = .middle
		gridData.grabHorizontalSpace = true
		gridData.grabVerticalSpace = true
		
		// assign layout to button
		button.layoutData = gridData
	 	button.onClick{ _ in print("Hello")}
		 
		// Configure current (main page)
		let layout = self.page!.layout as! SCDLayoutGridLayout
		layout.rows = 2 // here we tell the layout manager that the grid has two rows
		self.page!.children.append(button)
	}
	
	func handleButtonClick(_ e:SCDWidgetsEvent) {
		if let button = e.target as? SCDWidgetsButton {
			button.text = "Hello World. I was clicked!"
		}
	
		let svgIcon = getBitmapControl()
		(svgIcon.layoutData as! SCDLayoutGridData).row = 1
		self.page!.children.append(svgIcon)
	}
	
	func configureFontStyle(of control : SCDWidgetsTextWidget ) {
		control.font!.fontFamily = "Courier"
		control.font!.color = redColor
	}
	
	func getBitmapControl() -> SCDWidgetsImage {
		let svg = SCDWidgetsImage()
		svg.url = "check5.svg" 
		svg.contentPriority = false // this needs to be set to false, else we source img from content property
		self.configureGridData(of:svg)
		return svg
	}
	

	func configureGridData(of control : SCDWidgetsWidget ) {
		let gridData = SCDLayoutGridData()
		gridData.horizontalAlignment = .center
		gridData.verticalAlignment = .middle
		gridData.grabHorizontalSpace = true
		gridData.grabVerticalSpace = true
		control.layoutData = gridData
	}
}
