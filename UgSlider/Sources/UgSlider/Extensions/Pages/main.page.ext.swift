import ScadeKit

extension MainPageAdapter {
  var slider1: SCDWidgetsSlider {
    return self.page?.getWidgetByName("slider1") as! SCDWidgetsSlider
  }
}