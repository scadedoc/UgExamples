import ScadeKit

extension MainPageAdapter {
  var listView1: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView1") as! SCDWidgetsListView
  }

  var image1: SCDWidgetsImage {
    return self.page?.getWidgetByName("image1") as! SCDWidgetsImage
  }

  var gridView1: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView1") as! SCDWidgetsGridView
  }

  var button1: SCDWidgetsButton {
    return self.page?.getWidgetByName("button1") as! SCDWidgetsButton
  }

  var itmBinding: SCDWidgetsButton {
    return self.page?.getWidgetByName("itmBinding") as! SCDWidgetsButton
  }

  var listView2: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView2") as! SCDWidgetsListView
  }

  var image2: SCDWidgetsImage {
    return self.page?.getWidgetByName("image2") as! SCDWidgetsImage
  }

  var listView3: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView3") as! SCDWidgetsListView
  }

  var image3: SCDWidgetsImage {
    return self.page?.getWidgetByName("image3") as! SCDWidgetsImage
  }
}