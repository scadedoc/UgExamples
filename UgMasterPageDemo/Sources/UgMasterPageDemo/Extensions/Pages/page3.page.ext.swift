import ScadeKit

extension Page3PageAdapter {
  var label3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }
}