import ScadeKit

class FormEntryPagePageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// Add horizontal view
		let headerView = getHeader()
		
		// Add gridView with label and textbox
		let formEntryView = getFormEntry()
		
		// add bottom
		let bottomView = getBottomView() 
		
		// Configure main page
		let layout = self.page!.layout as! SCDLayoutGridLayout
		layout.rows = 3 // here we tell the layout manager that the grid has three rows
		
		// Add horizontal view with Button
		self.page!.children = [headerView,formEntryView,bottomView]
	}
	
	func configureLayoutData(of control : SCDWidgetsWidget ) -> SCDLayoutGridData {
		let layoutData = SCDLayoutGridData()
		layoutData.horizontalAlignment = .center
		layoutData.verticalAlignment = .middle
		layoutData.isGrabHorizontalSpace = true
		layoutData.isGrabVerticalSpace = true
		control.layoutData = layoutData
		return layoutData
	}
	
	func getHeader() -> SCDWidgetsRowView {
		let headerView = SCDWidgetsRowView()
		configureBackground(of:headerView)
		
		// Position in row #1 and use minimal space
		let layoutData = configureLayoutData(of:headerView)
		layoutData.row = 0
		layoutData.isGrabVerticalSpace = false
		layoutData.heightConstraint = .wrap_content
		
		// Create the label 
		let label =  SCDWidgetsLabel();
		label.text = "Hello SCADE"
		self.configureFontStyle(of:label)
		_ = configureLayoutData(of:label)
		
		// and insert into row view
		headerView.children.append(label)
		
		return headerView
	}
	
	func getFormEntry() -> SCDWidgetsGridView {
		let formGrid = SCDWidgetsGridView()
		
		// set grid layoutdata 
		let layoutData = configureLayoutData(of:formGrid)
		layoutData.row = 1
		layoutData.widthConstraint = .match_parent
		layoutData.heightConstraint = .match_parent
		
		// set layout inside
		let layout = formGrid.layout as! SCDLayoutGridLayout
		layout.rows = 3
		layout.columns = 2
		layout.marginTop = 50
		layout.marginLeft = 30
		layout.marginRight = 30
		layout.horizontalSpacing = 5
		layout.verticalSpacing = 5
		
		// create text labels
		let lbFirstName = getLabel(withText: "First Name", col:0, row:0)
		let lbLastName = getLabel(withText: "Last Name", col:0, row:1)
		let lbUserId = getLabel(withText: "User Id", col:0, row:2)
		
		// create textboxes 
		let tbFirstname = getTextBox(inCol:1,inRow:0)
		let tbLastname = getTextBox(inCol:1,inRow:1)
		let tbUserId = getTextBox(inCol:1,inRow:2)
		
		formGrid.children = [lbFirstName,lbLastName,lbUserId, tbFirstname,tbLastname,tbUserId]
		return formGrid
	}
	
	func getLabel(withText:String, col:Int, row:Int) -> SCDWidgetsLabel {
		let label =  SCDWidgetsLabel();
		label.text = withText
		
		let layoutData = SCDLayoutGridData()
  		layoutData.column = col
   		layoutData.row = row    
		layoutData.isGrabVerticalSpace = false
		layoutData.heightConstraint = .wrap_content
    	
   		label.layoutData = layoutData
    	return label
	}
	
	func getTextBox(inCol:Int,inRow:Int) -> SCDWidgetsTextbox {
		let textbox = SCDWidgetsTextbox()
		textbox.text = "TB\(inRow)"
		textbox.tabIndex = inRow
		
		let layoutData = configureLayoutData(of:textbox)
		layoutData.column = inCol
		layoutData.row = inRow
		layoutData.isGrabVerticalSpace = false
		layoutData.heightConstraint = .wrap_content
		layoutData.widthConstraint = .match_parent
		return textbox
	}
	
	func getBottomView() -> SCDWidgetsListView {
		let bottomView = SCDWidgetsListView()
		let layoutData = configureLayoutData(of:bottomView)
		layoutData.row = 2
		layoutData.widthConstraint = .wrap_content
		layoutData.heightConstraint = .wrap_content
		layoutData.isGrabVerticalSpace = false
		
		let button =  SCDWidgetsButton()
		button.text = "Press me"
		_ = configureLayoutData(of:button)
		
		bottomView.children.append(button)
		return bottomView
	}
	
	func configureFontStyle(of control : SCDWidgetsTextWidget ) {
		control.font!.color = whiteColor
	}
	
	func configureBackground(of control : SCDWidgetsWidget ) {
		print("setting background")
		control.backgroundColor = redColor
	}
}
