import ScadeKit

extension SearchPageAdapter {
  var searchLabelTitle: SCDWidgetsLabel {
    return self.page?.getWidgetByName("searchLabelTitle") as! SCDWidgetsLabel
  }

  var horizontalTextboxView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalTextboxView") as! SCDWidgetsRowView
  }

  var textbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("textbox") as! SCDWidgetsTextbox
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

  var toolBarItem3: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem3") as! SCDWidgetsToolBarItem
  }

  var icon3: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon3") as! SCDWidgetsImage
  }

  var caption3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption3") as! SCDWidgetsLabel
  }
}