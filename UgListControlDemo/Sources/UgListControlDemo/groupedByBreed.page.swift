import ScadeKit

class GroupedByBreedPageAdapter: SCDLatticePageAdapter {

	@objc dynamic var dogs : [DogView] = []
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		setupDogs()
		
		let backbutton = self.page!.getWidgetByName("itmDoglist") as! SCDWidgetsClickable
		backbutton.onClick.append(SCDWidgetsEventHandler{_ in self.navigation!.go(page: "main.page")})
	}
	
	func setupDogs() {
		dogs.append(DogView(breed:"Boxer"))
		dogs.append(DogView(id:"d100",name:"Hector",breed:"Boxer",ageInYears:2))
		dogs.append(DogView(breed:"Labrador"))
		dogs.append(DogView(id:"d101",name:"Max",breed:"Labrador", ageInYears:3))
		dogs.append(DogView(id:"d102",name:"Moritz",breed:"Labrador", ageInYears:3))
		dogs.append(DogView(breed:"St.Bernard"))
		dogs.append(DogView(id:"d103",name:"Bailey",breed:"St.Bernard", ageInYears:3))
	}
}
