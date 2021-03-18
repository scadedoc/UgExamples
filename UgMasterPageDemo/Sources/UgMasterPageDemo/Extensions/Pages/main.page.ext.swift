import ScadeKit

extension MainPageAdapter {
  var toolbar1: SCDWidgetsToolBar {
    return self.page?.getWidgetByName("toolbar1") as! SCDWidgetsToolBar
  }

  var item1: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("item1") as! SCDWidgetsToolBarItem
  }

  var icon11: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon11") as! SCDWidgetsImage
  }

  var caption1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption1") as! SCDWidgetsLabel
  }

  var item2: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("item2") as! SCDWidgetsToolBarItem
  }

  var icon21: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon21") as! SCDWidgetsImage
  }

  var caption2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption2") as! SCDWidgetsLabel
  }

  var item3: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("item3") as! SCDWidgetsToolBarItem
  }

  var icon31: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon31") as! SCDWidgetsImage
  }

  var caption3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption3") as! SCDWidgetsLabel
  }

  var pagecontainer1: SCDLatticePageContainer {
    return self.page?.getWidgetByName("pagecontainer1") as! SCDLatticePageContainer
  }
}