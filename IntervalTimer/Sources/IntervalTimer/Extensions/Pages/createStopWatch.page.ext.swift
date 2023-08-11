import ScadeKit

extension CreateStopWatchPageAdapter {
  var horizontalTextboxView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalTextboxView") as! SCDWidgetsRowView
  }

  var textbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("textbox") as! SCDWidgetsTextbox
  }

  var datePicker: SCDWidgetsDatePicker {
    return self.page?.getWidgetByName("datePicker") as! SCDWidgetsDatePicker
  }

  var saveButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("saveButton") as! SCDWidgetsButton
  }

  var toolBar: SCDWidgetsToolBar {
    return self.page?.getWidgetByName("toolBar") as! SCDWidgetsToolBar
  }

  var toolBarItem1: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem1") as! SCDWidgetsToolBarItem
  }

  var icon1: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon1") as! SCDWidgetsImage
  }

  var caption1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption1") as! SCDWidgetsLabel
  }

  var toolBarItem2: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem2") as! SCDWidgetsToolBarItem
  }

  var icon2: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon2") as! SCDWidgetsImage
  }

  var caption2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption2") as! SCDWidgetsLabel
  }
}