import ScadeKit

class GroupedByBreedPageAdapter: SCDLatticePageAdapter {

  var dogs: [DogView] = []

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    setupDogs()

    itmDoglist.onClick{ _ in self.navigation!.go(page: "main.page") }
  }

  func setupDogs() {
    dogs.append(DogView(breed: "Boxer"))
    dogs.append(DogView(id: "d100", name: "Hector", breed: "Boxer", ageInYears: 2))
    dogs.append(DogView(breed: "Labrador"))
    dogs.append(DogView(id: "d101", name: "Max", breed: "Labrador", ageInYears: 3))
    dogs.append(DogView(id: "d102", name: "Moritz", breed: "Labrador", ageInYears: 3))
    dogs.append(DogView(breed: "St.Bernard"))
    dogs.append(DogView(id: "d103", name: "Bailey", breed: "St.Bernard", ageInYears: 3))

    list1.items.removeAll()

    self.dogs.forEach { result in
      list1.items.append(0)
      guard let elem = list1.elements.last else { return }
      let gridView = elem.children[0] as! SCDWidgetsGridView
      let dogName = gridView.children[0] as! SCDWidgetsLabel
      dogName.text = result.name
      let dogBreed = gridView.children[1] as! SCDWidgetsLabel
      dogBreed.text = result.breed
      let dogId = gridView.children[2] as! SCDWidgetsLabel
      dogId.text = result.id

    }
  }
}
