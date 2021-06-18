import ScadeKit

extension MainPageAdapter {
  var mapwidget1: SCDWidgetsMapWidget {
    return self.page?.getWidgetByName("mapwidget1") as! SCDWidgetsMapWidget
  }

  var horizontalview2: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalview2") as! SCDWidgetsRowView
  }

  var btnStandard: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnStandard") as! SCDWidgetsButton
  }

  var btnSatellite: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnSatellite") as! SCDWidgetsButton
  }

  var btnHybrid: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnHybrid") as! SCDWidgetsButton
  }

  var grid1: SCDWidgetsGridView {
    return self.page?.getWidgetByName("grid1") as! SCDWidgetsGridView
  }

  var btnToronto: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnToronto") as! SCDWidgetsButton
  }

  var btnCurrLoc: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnCurrLoc") as! SCDWidgetsButton
  }

  var btnSushi: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnSushi") as! SCDWidgetsButton
  }
}