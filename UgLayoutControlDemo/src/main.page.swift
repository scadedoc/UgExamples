import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	dynamic var xposition : String = ""
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		let scrollbox = self.page!.drawing!.find(byId:"sg1") as! SCDSvgScrollGroup
		scrollbox.onTouch.append(SCDSvgTouchHandler{(ev:SCDSvgTouchEvent) in self.onScroll(point:scrollbox.getPosition())})
		
		let middlebutton = self.page!.getWidgetByName("btnMiddle") as! SCDWidgetsClickable
		middlebutton.onClick.append(SCDWidgetsEventHandler{_ in self.gotoMiddle()})
	}
	func onScroll(point:SCDGraphicsPoint?) -> Bool {
		print(point!.x)
		return true
	}
	
	func gotoMiddle() {

		// Get scrollbox
		let scrollbox = self.page!.drawing!.find(byId:"sg1") as! SCDSvgScrollGroup
		
		// get total size, i.e. the width and height of entire scrollbox
		let contentSize = scrollbox.getContentSize()
		
		// the scrollbox.width :  visible part of the scrollbox
		let position = (contentSize.width  - scrollbox.width) / 2
		scrollbox.scroll(to: position, y: 0)
	}

}
