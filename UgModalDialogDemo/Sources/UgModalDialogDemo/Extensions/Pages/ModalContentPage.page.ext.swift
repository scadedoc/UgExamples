import ScadeKit

extension ModalContentPagePageAdapter {
  var verticalView: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalView") as! SCDWidgetsListView
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var label3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label3") as! SCDWidgetsLabel
  }

  var horizontalView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalView") as! SCDWidgetsRowView
  }

  var btnLeave: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnLeave") as! SCDWidgetsButton
  }

  var btnConfirm: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnConfirm") as! SCDWidgetsButton
  }
}