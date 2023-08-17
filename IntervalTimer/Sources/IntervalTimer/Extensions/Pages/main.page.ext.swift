import ScadeKit

extension MainPageAdapter {
  var timerLabelContainer: SCDWidgetsRowView {
    return self.page?.getWidgetByName("timerLabelContainer") as! SCDWidgetsRowView
  }

  var timerLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("timerLabel") as! SCDWidgetsLabel
  }

  var rowView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView") as! SCDWidgetsRowView
  }

  var startButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("startButton") as! SCDWidgetsButton
  }

  var resetButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("resetButton") as! SCDWidgetsButton
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