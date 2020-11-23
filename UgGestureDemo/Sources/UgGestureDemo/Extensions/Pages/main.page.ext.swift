import ScadeKit

extension MainPageAdapter {
  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var customwidget1: SCDWidgetsCustomWidget {
    return self.page?.getWidgetByName("customwidget1") as! SCDWidgetsCustomWidget
  }

  var customwidget2: SCDWidgetsCustomWidget {
    return self.page?.getWidgetByName("customwidget2") as! SCDWidgetsCustomWidget
  }

  var button1: SCDWidgetsButton {
    return self.page?.getWidgetByName("button1") as! SCDWidgetsButton
  }
}