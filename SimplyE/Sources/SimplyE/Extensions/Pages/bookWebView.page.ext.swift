import ScadeKit

extension BookWebViewPageAdapter {
  var webView: SCDWidgetsWebView {
    return self.page?.getWidgetByName("webView") as! SCDWidgetsWebView
  }
}