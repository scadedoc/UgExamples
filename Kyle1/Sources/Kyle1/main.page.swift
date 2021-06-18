import ScadeKit


let redColor = SCDGraphicsRGB(red:255,green:0,blue:0)
let lightGrayColor = SCDGraphicsRGB(red:211,green:211,blue:211)
let whiteColor = SCDGraphicsRGB(red:241,green:241,blue:241)
let orangeColor = SCDGraphicsRGB(red:255,green:127,blue:80)

class MainPageAdapter: SCDLatticePageAdapter {
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// set matrix size
		let (columns,rows) = (UInt(20),UInt(4))
		
		// set grid size
		grid1.setGridSize(to:(columns,rows))
		
		// populate grid
		self.populateGrid(columns:columns,rows:rows)
 	}
	
	func populateGrid(columns:UInt,rows:UInt) {
		for c in (0..<columns) {
			for r in (0..<rows) {
				let button = createButton(label:"X", action:{ e in print(e) })
				 grid1.insert(button,at:(c,r))
			}
		}
	}
	
	func createButton(label:String,action:@escaping (_ e:String)->Void) -> SCDWidgetsButton {
	  let button = SCDWidgetsButton()
	  let layoutData = SCDLayoutGridData()

	  button.layoutData = layoutData
	  button.text = "x"
	  
	  // on click, call callback with name of button
	  button.onClick{ (e:SCDWidgetsEvent?) in 
		 let button = e!.target as! SCDWidgetsButton
		 action(button.name) 
	 }
	  
	  // set colors
	  button.font!.color = whiteColor
	  button.backgroundColor = redColor
	  
	  return button
	}
}
