extension mainPageAdapter {
  var gridView1: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView1") as! SCDWidgetsGridView
  }

  var sliderLine1: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine1") as! SCDWidgetsSliderLine
  }

  var gridView2: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView2") as! SCDWidgetsGridView
  }

  var sliderLine2: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine2") as! SCDWidgetsSliderLine
  }

  var gridView3: SCDWidgetsGridView {
    return self.page?.getWidgetByName("gridView3") as! SCDWidgetsGridView
  }

  var sliderLine3: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine3") as! SCDWidgetsSliderLine
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }
}