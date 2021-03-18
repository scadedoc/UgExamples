import ScadeKit

extension MainPageAdapter {
  var lblTemperature: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lblTemperature") as! SCDWidgetsLabel
  }
}