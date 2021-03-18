import ScadeKit

extension ModalContentPagePageAdapter {
  var verticalview1: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalview1") as! SCDWidgetsListView
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var label2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label2") as! SCDWidgetsLabel
  }

  var horizontalview1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalview1") as! SCDWidgetsRowView
  }

  var btnLeave: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnLeave") as! SCDWidgetsButton
  }

  var btnConfirm: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnConfirm") as! SCDWidgetsButton
  }
}