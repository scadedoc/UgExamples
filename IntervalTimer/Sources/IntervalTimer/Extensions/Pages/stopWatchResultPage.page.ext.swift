import ScadeKit

extension StopWatchResultPagePageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var backButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("backButton") as! SCDWidgetsButton
  }

  var titleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("titleLabel") as! SCDWidgetsLabel
  }

  var rowView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView") as! SCDWidgetsRowView
  }

  var horizontalTextboxView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalTextboxView") as! SCDWidgetsRowView
  }

  var stopwatchLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("stopwatchLabel") as! SCDWidgetsLabel
  }

  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var cancelButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("cancelButton") as! SCDWidgetsButton
  }

  var pauseButton : SCDWidgetsButton {
    return self.page?.getWidgetByName("pauseButton ") as! SCDWidgetsButton
  }

  var toolBar: SCDWidgetsToolBar {
    return self.page?.getWidgetByName("toolBar") as! SCDWidgetsToolBar
  }

  var toolBarItem1: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem1") as! SCDWidgetsToolBarItem
  }

  var icon1: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon1") as! SCDWidgetsImage
  }

  var caption1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption1") as! SCDWidgetsLabel
  }

  var toolBarItem2: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem2") as! SCDWidgetsToolBarItem
  }

  var icon2: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon2") as! SCDWidgetsImage
  }

  var caption2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption2") as! SCDWidgetsLabel
  }
}