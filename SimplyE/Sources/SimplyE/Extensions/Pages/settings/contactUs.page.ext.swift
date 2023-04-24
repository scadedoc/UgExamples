import ScadeKit

extension ContactUsPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var doneButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("doneButton") as! SCDWidgetsButton
  }

  var reloadButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("reloadButton") as! SCDWidgetsButton
  }

  var titleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("titleLabel") as! SCDWidgetsLabel
  }

  var webView: SCDWidgetsWebView {
    return self.page?.getWidgetByName("webView") as! SCDWidgetsWebView
  }
}