import ScadeKit

extension WorkoutScreenPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var titleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("titleLabel") as! SCDWidgetsLabel
  }

  var pauseButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("pauseButton") as! SCDWidgetsButton
  }

  var resumeButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("resumeButton") as! SCDWidgetsButton
  }

  var listView: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView") as! SCDWidgetsListView
  }

  var repeatsLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("repeatsLabel") as! SCDWidgetsLabel
  }

  var repeatsCountLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("repeatsCountLabel") as! SCDWidgetsLabel
  }

  var listView1: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView1") as! SCDWidgetsListView
  }

  var nextLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("nextLabel") as! SCDWidgetsLabel
  }

  var label2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label2") as! SCDWidgetsLabel
  }

  var exerciseNameLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("exerciseNameLabel") as! SCDWidgetsLabel
  }

  var timerCountLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("timerCountLabel") as! SCDWidgetsLabel
  }
}