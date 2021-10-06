import ScadeKit

extension MainPageAdapter {
  var listView1: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView1") as! SCDWidgetsListView
  }

  var sliderLine1: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine1") as! SCDWidgetsSliderLine
  }

  var listView2: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView2") as! SCDWidgetsListView
  }

  var sliderLine2: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine2") as! SCDWidgetsSliderLine
  }

  var verticalView: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalView") as! SCDWidgetsListView
  }

  var sliderLine: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine") as! SCDWidgetsSliderLine
  }

  var horizontalView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalView") as! SCDWidgetsRowView
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }
}