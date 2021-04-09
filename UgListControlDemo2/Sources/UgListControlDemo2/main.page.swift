import ScadeKit

#if os(Android)
	import FoundationNetworking
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  var dogs: [Dog] = []

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.setupDogs()

    // listen to itemSelected events
    let listControl = self.page!.getWidgetByName("list1") as! SCDWidgetsList
    listControl.onItemSelected.append(
      SCDWidgetsItemSelectedEventHandler { ev in self.rowClicked(event: ev!) })

//    // Listen to action buttons
//    let listControlRowActionButtonRight =
//      self.page!.getWidgetByName("btnListRowInfo") as! SCDWidgetsButton
//    listControlRowActionButtonRight.onClick.append(
//      SCDWidgetsEventHandler { _ in print("Info button Clicked") })

    // wire toolbar buttons
    let groupedByButton = self.page!.getWidgetByName("itmGroupedByBreed") as! SCDWidgetsClickable
    groupedByButton.onClick.append(
      SCDWidgetsEventHandler { _ in self.navigation!.go(page: "groupedByBreed.page") })

  }

  func setupDogs() {
    dogs.append(Dog(id: "d100", name: "Hector", breed: "Boxer", ageInYears: 2))
    dogs.append(Dog(id: "d101", name: "Max", breed: "Labrador", ageInYears: 3))
    dogs.append(Dog(id: "d102", name: "Bailey", breed: "St.Bernard", ageInYears: 3))

    //let list1 = self.page?.getWidgetByName("list1") as! SCDWidgetsList
    self.list1.items.removeAll()

    self.dogs.forEach { result in
      self.list1.items.append(0)
      guard let elem = self.list1.elements.last else { return }
      let gridView = elem.children[0] as! SCDWidgetsGridView
      let dogName = gridView.children[0] as! SCDWidgetsLabel
      dogName.text = result.name
      let dogBreed = gridView.children[1] as! SCDWidgetsLabel
      dogBreed.text = result.breed
      let dogId = gridView.children[2] as! SCDWidgetsLabel
      dogId.text = result.id
      //dogId.accessibilityArrayAttributeCount(DAAddCallbackToSession(test, teScrapSizeErr))
    
    }
  }

  func rowClicked(event: SCDWidgetsItemEvent) {
  	print(event.item)
    if let dog = event.item as? Dog {
      print("Hello \(dog.name)")
    }
  }
}
