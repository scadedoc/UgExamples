import ScadeKit

extension BooksListPageAdapter {
  var rowView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView") as! SCDWidgetsRowView
  }

  var bitmap1: SCDWidgetsImage {
    return self.page?.getWidgetByName("bitmap1") as! SCDWidgetsImage
  }

  var bitmap2: SCDWidgetsImage {
    return self.page?.getWidgetByName("bitmap2") as! SCDWidgetsImage
  }

  var bitmap3: SCDWidgetsImage {
    return self.page?.getWidgetByName("bitmap3") as! SCDWidgetsImage
  }

  var toolBar: SCDWidgetsToolBar {
    return self.page?.getWidgetByName("toolBar") as! SCDWidgetsToolBar
  }

  var item1: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("item1") as! SCDWidgetsToolBarItem
  }

  var icon: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon") as! SCDWidgetsImage
  }

  var caption: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption") as! SCDWidgetsLabel
  }

  var item2: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("item2") as! SCDWidgetsToolBarItem
  }

  var image3: SCDWidgetsImage {
    return self.page?.getWidgetByName("image3") as! SCDWidgetsImage
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var item3: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("item3") as! SCDWidgetsToolBarItem
  }

  var image4: SCDWidgetsImage {
    return self.page?.getWidgetByName("image4") as! SCDWidgetsImage
  }

  var label2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label2") as! SCDWidgetsLabel
  }

  var itmMore: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("itmMore") as! SCDWidgetsToolBarItem
  }

  var image1: SCDWidgetsImage {
    return self.page?.getWidgetByName("image1") as! SCDWidgetsImage
  }

  var label3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label3") as! SCDWidgetsLabel
  }

  var gridView: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView") as! SCDWidgetsGridView
  }

  var ctrlListBookCatalog: SCDWidgetsList {
    return self.page?.getWidgetByName("ctrlListBookCatalog") as! SCDWidgetsList
  }
}