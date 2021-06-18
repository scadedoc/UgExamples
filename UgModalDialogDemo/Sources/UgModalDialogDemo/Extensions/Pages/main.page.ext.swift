import ScadeKit

extension MainPageAdapter {
  var verticalview1: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalview1") as! SCDWidgetsListView
  }

  var btnCustomModalDialog: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnCustomModalDialog") as! SCDWidgetsButton
  }

  var btnAlertController: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnAlertController") as! SCDWidgetsButton
  }
}