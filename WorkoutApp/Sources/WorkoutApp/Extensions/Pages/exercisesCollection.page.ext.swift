import ScadeKit

extension ExercisesCollectionPageAdapter {
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

  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var searchButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("searchButton") as! SCDWidgetsButton
  }

  var textbox1: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("textbox1") as! SCDWidgetsTextbox
  }

  var cancelButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("cancelButton") as! SCDWidgetsButton
  }

  var list: SCDWidgetsList {
    return self.page?.getWidgetByName("list") as! SCDWidgetsList
  }
}