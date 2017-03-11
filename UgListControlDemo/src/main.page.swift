import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	dynamic var dogs : [Dog] = []
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		self.setupDogs()
		
		// listen to itemSelected events
		let listControl = self.page!.getWidgetByName("list1") as! SCDWidgetsList
		listControl.onItemSelected.append(SCDWidgetsItemSelectedEventHandler{ ev in self.rowClicked(event: ev)})
				
		// Listen to action buttons
		let listControlRowActionButtonRight = self.page!.getWidgetByName("btnListRowInfo") as! SCDWidgetsButton
		listControlRowActionButtonRight.onClick.append(SCDWidgetsEventHandler{_ in print("Info button Clicked")})
		
		// wire toolbar buttons
		let groupedByButton = self.page!.getWidgetByName("itmGroupedByBreed") as! SCDWidgetsClickable
		groupedByButton.onClick.append(SCDWidgetsEventHandler{_ in self.navigation!.go("groupedByBreed.page")})
		
		
	}
	
	func setupDogs() {
		dogs.append(Dog(id:"d100",name:"Hector",breed:"Boxer",ageInYears:2))
		dogs.append(Dog(id:"d101",name:"Max",breed:"Labrador", ageInYears:3))
		dogs.append(Dog(id:"d102",name:"Bailey",breed:"St.Bernard", ageInYears:3))
	}
	
	func rowClicked(event:SCDWidgetsItemEvent) {
		if let dog = event.item as? Dog {
			print("Hello \(dog.name)")
		}
	}
}
