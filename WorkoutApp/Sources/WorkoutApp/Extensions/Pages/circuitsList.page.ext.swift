import ScadeKit

extension CircuitsListPageAdapter {
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

  var textbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("textbox") as! SCDWidgetsTextbox
  }

  var listView: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView") as! SCDWidgetsListView
  }

  var list: SCDWidgetsList {
    return self.page?.getWidgetByName("list") as! SCDWidgetsList
  }

  var rowView5: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView5") as! SCDWidgetsRowView
  }

  var rowView6: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView6") as! SCDWidgetsRowView
  }

  var circuitRepeatLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("circuitRepeatLabel") as! SCDWidgetsLabel
  }

  var rowView7: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView7") as! SCDWidgetsRowView
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var button2: SCDWidgetsButton {
    return self.page?.getWidgetByName("button2") as! SCDWidgetsButton
  }

  var listView2: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView2") as! SCDWidgetsListView
  }

  var addCircuitButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("addCircuitButton") as! SCDWidgetsButton
  }
}