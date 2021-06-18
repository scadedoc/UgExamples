import ScadeKit

extension MainPageAdapter {
  var list1: SCDWidgetsList {
    return self.page?.getWidgetByName("list1") as! SCDWidgetsList
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var button1: SCDWidgetsButton {
    return self.page?.getWidgetByName("button1") as! SCDWidgetsButton
  }
}