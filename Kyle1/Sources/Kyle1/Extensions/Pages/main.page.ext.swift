import ScadeKit

extension MainPageAdapter {
  var grid1: SCDWidgetsGridView {
    return self.page?.getWidgetByName("grid1") as! SCDWidgetsGridView
  }
}