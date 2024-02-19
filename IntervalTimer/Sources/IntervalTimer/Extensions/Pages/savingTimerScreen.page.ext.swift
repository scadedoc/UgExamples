import ScadeKit

extension SavingTimerScreenPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var backButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("backButton") as! SCDWidgetsButton
  }

  var titleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("titleLabel") as! SCDWidgetsLabel
  }

  var saveButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("saveButton") as! SCDWidgetsButton
  }

  var container1: SCDWidgetsContainer {
    return self.page?.getWidgetByName("container1") as! SCDWidgetsContainer
  }

  var workLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("workLabel") as! SCDWidgetsLabel
  }

  var restLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("restLabel") as! SCDWidgetsLabel
  }

  var container2: SCDWidgetsContainer {
    return self.page?.getWidgetByName("container2") as! SCDWidgetsContainer
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var container3: SCDWidgetsContainer {
    return self.page?.getWidgetByName("container3") as! SCDWidgetsContainer
  }

  var label2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label2") as! SCDWidgetsLabel
  }

  var setLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("setLabel") as! SCDWidgetsLabel
  }

  var container: SCDWidgetsContainer {
    return self.page?.getWidgetByName("container") as! SCDWidgetsContainer
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var cancelButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("cancelButton") as! SCDWidgetsButton
  }

  var rowView2: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView2") as! SCDWidgetsRowView
  }

  var textbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("textbox") as! SCDWidgetsTextbox
  }
}