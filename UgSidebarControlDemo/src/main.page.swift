import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// identify sidebar control
		let sidebar = self.page!.getWidgetByName("sidebar1") as! SCDWidgetsSidebar
		
		// get reference to X button to collapse menu, and if clicked, set sidebar to hidden
		if let collapseButton = sidebar.panel.getWidgetByName("btnCollapseSidebar") as? SCDWidgetsClickable {
			collapseButton.onClick.append(SCDWidgetsEventHandler{_ in sidebar.isHidden = true})
		}
		
		// get reference to expand button, and if clicked, unhide
		if let expandButton = self.page!.getWidgetByName("btnSideMenuExpand") as? SCDWidgetsClickable {
			expandButton.onClick.append(SCDWidgetsEventHandler{_ in sidebar.isHidden = false })
		}
		
		// handle click on first row (Dashboard)
		if let dashBoardClicked = sidebar.panel.getWidgetByName("rowDashboard") as? SCDWidgetsClickable {
			dashBoardClicked.onClick.append(SCDWidgetsEventHandler{_ in print("Dashboard clicked")})
		}
	}
}
