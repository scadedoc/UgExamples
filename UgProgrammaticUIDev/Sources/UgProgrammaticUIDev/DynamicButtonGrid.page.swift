import ScadeKit

class DynamicButtonGridPageAdapter: SCDLatticePageAdapter {

	var colorOfButton :  [([(Int,Int)],SCDGraphicsRGB)] = [([(1,1)],orangeColor)]
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// setup grid and place buttons
  		self.renderGrid(columns:3,rows:2)
		
	}
	
	func renderGrid(columns:Int,rows:Int) { 
		
		// configure the main page to be 1x2 (1 column, two rows)
		self.page!.layout = self.createLayout(columns: 1, rows: 2)
		
		// create handler for button pressed
		let onButtonPressed = { (buttonName:String) in print("Button pressed:\(buttonName)") }
		
		// create grid container to hold buttons. configure the grid to be columns x rows
		let gridContainer = createGridContainer(at:(0,0))
		gridContainer.layout = createLayout(columns: columns, rows: rows)
		
		// create horizontal container to hold a button
		let bottomContainer = createHorizontalContainer(at:(0,1))
		self.setBackgroundColor(of: bottomContainer, to: lightGrayColor)
		let button = createButton(label: "PressMe", action: { _ in print("PressMe") })
		bottomContainer.children.append(button) 
		
		// add containers to page
		[gridContainer,bottomContainer].forEach { self.page!.children.append($0) }
		
		// create buttons and assign to grid container
		for r in (0..<rows) {
			for c in (0..<columns) {
				
				// create button
				let b = createButton(label: "Button \(r)\(c)", action: onButtonPressed)
				
				// create button layout and assign to button
				b.layoutData = createLayoutGridData(column: c, row: r)
				
				// check for color and set it 
				if let color = self.getColor(forButton: (c, r)) {
					self.setBackgroundColor(of: b, to: color)
				}
				
				// append button to page
				gridContainer.children.append(b)
			}
		}
	}
	
	// all these methods should be moved into a utility class
	
	func createButton(label:String,action:@escaping (_ e:String)->Void) -> SCDWidgetsButton {
	  let button = SCDWidgetsButton()
	  button.layoutData = createLayoutGridData()
	  button.name = label
	  button.text = label
	  
	  // on click, call callback with name of button
	  button.onClick.append( SCDWidgetsEventHandler{ (e:SCDWidgetsEvent?) in 
		  let button = e!.target as! SCDWidgetsButton
		  action(button.name) 
		})
	  
	  self.configureFontStyle(of: button, to: whiteColor)
	  self.setBackgroundColor(of: button, to: redColor)
	  
	  // Add background color of button
	  return button
	}
	
	func createLayoutGridData(column:Int,row:Int) -> SCDLayoutGridData {
	  let gridData = createLayoutGridData()
	  gridData.row = row  
	  gridData.column = column
	  return gridData
	}
	
	func createLayoutGridData() -> SCDLayoutGridData {
	  let gridData = SCDLayoutGridData()
	  gridData.horizontalAlignment = .center
	  gridData.verticalAlignment = .middle
	  gridData.grabHorizontalSpace = true
	  gridData.grabVerticalSpace = true
	  return gridData
	}
	
	func createLayout(columns:Int,rows:Int)  -> SCDLayoutGridLayout {
	 let layout = SCDLayoutGridLayout()
	 layout.rows = rows
	 layout.columns = columns
	 return layout
	}
	
	func setBackgroundColor(of control : SCDWidgetsWidget, to color:SCDGraphicsRGB ) {
		control.backgroundColor = color
	}
	
	func createHorizontalContainer(at:(Int,Int)) -> SCDWidgetsContainer {
		// create a horizontal container
		 let container = SCDWidgetsListView()
		 container.layoutData = createLayoutGridData(column:at.0,row:at.1)
		 return container
	}
	
	func createGridContainer(at:(Int,Int)) -> SCDWidgetsGridView  {
		// create a grid container
		 let container = SCDWidgetsGridView()
		 container.layoutData = createLayoutGridData(column:at.0,row:at.1)
		 return container
	}
	
	func getColor(forButton:(Int,Int)) -> SCDGraphicsRGB? {
		for cellColors in self.colorOfButton {
			let (cells,color) = (cellColors.0,cellColors.1)
			if(cells.contains{ $0 == forButton}) {
				return color
			}
		}
		return nil
	}
	
	func configureFontStyle(of control : SCDWidgetsTextWidget,to color:SCDGraphicsRGB  ) {
		control.font!.color = color
	}
	
}
