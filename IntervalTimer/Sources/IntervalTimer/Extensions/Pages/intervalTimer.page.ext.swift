import ScadeKit

extension IntervalTimerPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var titleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("titleLabel") as! SCDWidgetsLabel
  }

  var container: SCDWidgetsContainer {
    return self.page?.getWidgetByName("container") as! SCDWidgetsContainer
  }

  var setLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("setLabel") as! SCDWidgetsLabel
  }

  var setMinusButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("setMinusButton") as! SCDWidgetsButton
  }

  var intervalLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("intervalLabel") as! SCDWidgetsLabel
  }

  var setPlusButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("setPlusButton") as! SCDWidgetsButton
  }

  var container1: SCDWidgetsContainer {
    return self.page?.getWidgetByName("container1") as! SCDWidgetsContainer
  }

  var workLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("workLabel") as! SCDWidgetsLabel
  }

  var workMinusButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("workMinusButton") as! SCDWidgetsButton
  }

  var workPlusButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("workPlusButton") as! SCDWidgetsButton
  }

  var workTimeLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("workTimeLabel") as! SCDWidgetsLabel
  }

  var container2: SCDWidgetsContainer {
    return self.page?.getWidgetByName("container2") as! SCDWidgetsContainer
  }

  var restLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("restLabel") as! SCDWidgetsLabel
  }

  var restTimeLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("restTimeLabel") as! SCDWidgetsLabel
  }

  var restMinusButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("restMinusButton") as! SCDWidgetsButton
  }

  var restPlusButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("restPlusButton") as! SCDWidgetsButton
  }

  var startButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("startButton") as! SCDWidgetsButton
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