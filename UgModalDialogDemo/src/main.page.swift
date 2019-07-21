import ScadeKit

#if os(iOS)
			import UIKit
#endif

class MainPageAdapter: SCDLatticePageAdapter {
	
	// create instance of the modal content page
	let modalContentPage = ModalContentPagePageAdapter()

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// Load the page (one time in the load method of the main page)
		modalContentPage.load("ModalContentPage.page")
		
		// Specify behaviour when leaving the modal dialog 
		modalContentPage.onExit = { print("left modalDialog \($0)") } 
		
		// Display custom modal content page when button on main page is clicked
		if let btnModalDialog = self.page!.getWidgetByName("btnCustomModalDialog") as? SCDWidgetsButton {
			btnModalDialog.onClick.append( SCDWidgetsEventHandler{
				
				// the show method is custom method that uses 
				// the window instantiated within the modalContentPage class
				_ in self.modalContentPage.show() 
		})}
	}
	
}
