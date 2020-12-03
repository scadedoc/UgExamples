import ScadeKit

extension MainPageAdapter {
  var gridView1: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView1") as! SCDWidgetsGridView
  }

  var image1: SCDWidgetsImage {
    return self.page?.getWidgetByName("image1") as! SCDWidgetsImage
  }

  var gridView2: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView2") as! SCDWidgetsGridView
  }

  var image2: SCDWidgetsImage {
    return self.page?.getWidgetByName("image2") as! SCDWidgetsImage
  }

  var gridView3: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView3") as! SCDWidgetsGridView
  }

  var image3: SCDWidgetsImage {
    return self.page?.getWidgetByName("image3") as! SCDWidgetsImage
  }
}