import ScadeKit

extension MainPageAdapter {
  var lbName: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbName") as! SCDWidgetsLabel
  }
}