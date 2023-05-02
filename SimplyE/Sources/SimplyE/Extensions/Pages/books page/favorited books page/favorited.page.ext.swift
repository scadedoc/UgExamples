import ScadeKit

extension FavoritedPageAdapter {
  var favoriteLabelTitle: SCDWidgetsLabel {
    return self.page?.getWidgetByName("favoriteLabelTitle") as! SCDWidgetsLabel
  }

  var ctrlListBooks: SCDWidgetsList {
    return self.page?.getWidgetByName("ctrlListBooks") as! SCDWidgetsList
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

  var toolBarItem4: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem4") as! SCDWidgetsToolBarItem
  }

  var icon4: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon4") as! SCDWidgetsImage
  }

  var caption4: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption4") as! SCDWidgetsLabel
  }
}