import ScadeKit

extension MainPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var rowView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView") as! SCDWidgetsRowView
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var listView: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView") as! SCDWidgetsListView
  }

  var addWorkoutButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("addWorkoutButton") as! SCDWidgetsButton
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }
}