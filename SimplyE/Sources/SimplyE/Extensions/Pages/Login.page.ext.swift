import ScadeKit

extension LoginPageAdapter {
  var bitmap1: SCDWidgetsImage {
    return self.page?.getWidgetByName("bitmap1") as! SCDWidgetsImage
  }
}