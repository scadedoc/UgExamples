import ScadeKit

extension AboutPageAdapter {
  var webView: SCDWidgetsWebView {
    return self.page?.getWidgetByName("webView") as! SCDWidgetsWebView
  }
}