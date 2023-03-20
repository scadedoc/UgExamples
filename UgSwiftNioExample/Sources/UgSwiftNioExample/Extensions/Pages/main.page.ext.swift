import ScadeKit

extension MainPageAdapter {
  var loggedin_label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("loggedin_label") as! SCDWidgetsLabel
  }

  var response_label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("response_label") as! SCDWidgetsLabel
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var getdata_btn: SCDWidgetsButton {
    return self.page?.getWidgetByName("getdata_btn") as! SCDWidgetsButton
  }

  var port_tb: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("port_tb") as! SCDWidgetsTextbox
  }

  var porttb_label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("porttb_label") as! SCDWidgetsLabel
  }

  var host_tb: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("host_tb") as! SCDWidgetsTextbox
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }
}