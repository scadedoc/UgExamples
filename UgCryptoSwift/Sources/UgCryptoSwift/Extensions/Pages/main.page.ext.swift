import ScadeKit

extension MainPageAdapter {
  var verticalview1: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalview1") as! SCDWidgetsListView
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var tbText: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("tbText") as! SCDWidgetsTextbox
  }

  var verticalview2: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalview2") as! SCDWidgetsListView
  }

  var label11: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label11") as! SCDWidgetsLabel
  }

  var lbMd5: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbMd5") as! SCDWidgetsLabel
  }
}