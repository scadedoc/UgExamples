import ScadeKit

extension MainPageAdapter {
  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var listView1: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView1") as! SCDWidgetsListView
  }

  var image1: SCDWidgetsImage {
    return self.page?.getWidgetByName("image1") as! SCDWidgetsImage
  }

  var label2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label2") as! SCDWidgetsLabel
  }
}