import ScadeKit

extension Page2PageAdapter {
  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }
}