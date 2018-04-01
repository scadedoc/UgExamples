import ScadeKit

class ListControlPageAdapter: SCDLatticePageAdapter {

	var listControl : SCDWidgetsList?
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// Step 1 : create list control
		self.listControl = createListControl()
		self.page!.children.append(listControl!)
	}
	
	override func show(_ view: SCDLatticeView?) {
		super.show(view)	
		// Step 2: populate data in list control. Population needs to be done in SHOW method
		let names = [("Peter","Parker"),("Louise","Lane"),("Bruce","Willis")]
		self.listControl!.items = names.map{ return $0.0 }
		names.enumerated().forEach{ setValues(in: self.listControl!.elements[$0.0], to:$0.1) } 
	}

	func createListControl() -> SCDWidgetsList {
		
		// Two steps 
		let listControl = SCDWidgetsList.create()
		let layoutData = configureLayoutData(of: listControl)
		layoutData.widthConstraint = .match_parent
		layoutData.heightConstraint = .match_parent
		
		// First step, setup template 
		listControl._template?.element?.children = [createTemplate()]
		
		// return control
		return listControl
		
	}
	
	func createTemplate() -> SCDWidgetsRowView {
		
		// Create row view and configure it
		let row = SCDWidgetsRowView.create()
		_ = configureLayoutData(of:row)
		
		// configure inner layout
		let layout = row.layout as! SCDLayoutGridLayout
		layout.columns = 2
		
		// add two labels to rowView
		row.children = [createLabel(inColumn:0),createLabel(inColumn:1)]
		return row
	}
 
	func setValues(in element:SCDWidgetsListElement,to:(String,String)) {
		if let rowControl = element.children[0] as? SCDWidgetsRowView {
			// set labels
			if let label1 = rowControl.children[0] as? SCDWidgetsLabel {
				label1.text = to.0
			}
			if let label2 = rowControl.children[1] as? SCDWidgetsLabel {
				label2.text = to.1
			}	
		}
	}
			
	func configureLayoutData(of control : SCDWidgetsWidget ) -> SCDLayoutGridData {
		let layoutData = SCDLayoutGridData()
		layoutData.horizontalAlignment = .left
		layoutData.verticalAlignment = .middle
		layoutData.isGrabHorizontalSpace = true
		layoutData.isGrabVerticalSpace = true
		control.layoutData = layoutData
		return layoutData
	}
	
	func createLabel(inColumn:Int) -> SCDWidgetsLabel {
		let label = SCDWidgetsLabel.create()
		let layoutData = configureLayoutData(of:label)
		layoutData.widthConstraint = .match_parent
		layoutData.column = inColumn
		label.text = ""
		return label
	}
}