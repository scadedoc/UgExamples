import ScadeKit

extension IntervalTimerScreenPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var titleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("titleLabel") as! SCDWidgetsLabel
  }

  var backButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("backButton") as! SCDWidgetsButton
  }

  var timerLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("timerLabel") as! SCDWidgetsLabel
  }

  var intervalLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("intervalLabel") as! SCDWidgetsLabel
  }

  var timerKindLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("timerKindLabel") as! SCDWidgetsLabel
  }
}