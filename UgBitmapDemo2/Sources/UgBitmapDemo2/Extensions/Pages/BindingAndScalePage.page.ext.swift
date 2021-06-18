import ScadeKit

extension BindingAndScalePagePageAdapter {
  var gridView1: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView1") as! SCDWidgetsGridView
  }

  var main: SCDWidgetsButton {
    return self.page?.getWidgetByName("main") as! SCDWidgetsButton
  }

  var button2: SCDWidgetsButton {
    return self.page?.getWidgetByName("button2") as! SCDWidgetsButton
  }

  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var image1: SCDWidgetsImage {
    return self.page?.getWidgetByName("image1") as! SCDWidgetsImage
  }
}