import ScadeKit


class MainPageAdapter: SCDLatticePageAdapter {

  var dogs: [Dog] = []

  // page adapter initialization
  override func load(_ path: String) {

    super.load(path)

    self.list1.elementProvider = SCDWidgetsElementProvider { (dog: Dog, template) in

      (template.getWidgetByName("dogName") as! SCDWidgetsLabel).text = dog.name

      (template.getWidgetByName("dogBreed") as! SCDWidgetsLabel).text = dog.breed

      (template.getWidgetByName("dogId") as! SCDWidgetsLabel).text = dog.id
    }
     
    self.list1.items = Array(Dogs().dogs.prefix(100))

    // listen to itemSelected events
    list1.onItemSelected.append(
      SCDWidgetsItemSelectedEventHandler { ev in self.rowClicked(event: ev!) }
    )
  }

  func rowClicked(event: SCDWidgetsItemEvent) {

    if let dog = event.item as? Dog {
      print("Hello \(dog.name)")
    }
  }
}
