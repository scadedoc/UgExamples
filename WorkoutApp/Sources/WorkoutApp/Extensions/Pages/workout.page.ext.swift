import ScadeKit

extension WorkoutPageAdapter {
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

  var list: SCDWidgetsList {
    return self.page?.getWidgetByName("list") as! SCDWidgetsList
  }

  var addWorkoutButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("addWorkoutButton") as! SCDWidgetsButton
  }
}