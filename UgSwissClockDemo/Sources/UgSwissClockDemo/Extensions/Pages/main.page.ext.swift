import ScadeKit

extension MainPageAdapter {
  var customwidget1: SCDWidgetsCustomWidget {
    return self.page?.getWidgetByName("customwidget1") as! SCDWidgetsCustomWidget
  }
}