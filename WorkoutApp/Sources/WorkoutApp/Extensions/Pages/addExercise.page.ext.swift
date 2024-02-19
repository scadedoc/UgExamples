import ScadeKit

extension AddExercisePageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var backButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("backButton") as! SCDWidgetsButton
  }

  var navTitle: SCDWidgetsLabel {
    return self.page?.getWidgetByName("navTitle") as! SCDWidgetsLabel
  }

  var doneButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("doneButton") as! SCDWidgetsButton
  }

  var rowView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView") as! SCDWidgetsRowView
  }

  var textbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("textbox") as! SCDWidgetsTextbox
  }

  var listView: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView") as! SCDWidgetsListView
  }

  var addExerciseButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("addExerciseButton") as! SCDWidgetsButton
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }
}