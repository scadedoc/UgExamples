import ScadeKit

extension SecondpagePageAdapter {
  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }
}