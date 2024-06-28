import ScadeKit

extension MainPageAdapter {
  var listView: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView") as! SCDWidgetsListView
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }
}