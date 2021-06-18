import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    [1, 2, 3, 4, 5, 6, 7].forEach {
      let name = "listView\($0)"
      if let clickable = self.page!.getWidgetByName(name) as? SCDWidgetsClickable {
        clickable.onClick.append(SCDWidgetsEventHandler { _ in self.menuClicked(name) })
      }
    }
  }

  func menuClicked(_ id: String) {
    let label1 = self.page!.getWidgetByName("label1") as! SCDWidgetsLabel
    label1.text = "Menu \(id) clicked"
    print("Menu \(id) clicked")

  }
}
