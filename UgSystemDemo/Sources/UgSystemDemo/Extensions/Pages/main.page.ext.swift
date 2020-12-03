import ScadeKit

extension MainPageAdapter {
  var verticalview1: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalview1") as! SCDWidgetsListView
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var lbContent: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbContent") as! SCDWidgetsLabel
  }
}