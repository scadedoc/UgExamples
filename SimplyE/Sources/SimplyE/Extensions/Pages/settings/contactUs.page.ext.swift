import ScadeKit

extension ContactUsPageAdapter {
  var webView: SCDWidgetsWebView {
    return self.page?.getWidgetByName("webView") as! SCDWidgetsWebView
  }
}