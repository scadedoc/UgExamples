import ScadeKit

extension ExercisePageAdapter {
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

  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var checkbox: SCDWidgetsCheckbox {
    return self.page?.getWidgetByName("checkbox") as! SCDWidgetsCheckbox
  }

  var rowView2: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView2") as! SCDWidgetsRowView
  }

  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var rowView3: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView3") as! SCDWidgetsRowView
  }

  var label2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label2") as! SCDWidgetsLabel
  }

  var button: SCDWidgetsButton {
    return self.page?.getWidgetByName("button") as! SCDWidgetsButton
  }

  var listView: SCDWidgetsListView {
    return self.page?.getWidgetByName("listView") as! SCDWidgetsListView
  }

  var label3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label3") as! SCDWidgetsLabel
  }

  var label4: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label4") as! SCDWidgetsLabel
  }

  var rowView4: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView4") as! SCDWidgetsRowView
  }

  var button1: SCDWidgetsButton {
    return self.page?.getWidgetByName("button1") as! SCDWidgetsButton
  }

  var button2: SCDWidgetsButton {
    return self.page?.getWidgetByName("button2") as! SCDWidgetsButton
  }

  var button3: SCDWidgetsButton {
    return self.page?.getWidgetByName("button3") as! SCDWidgetsButton
  }

  var button4: SCDWidgetsButton {
    return self.page?.getWidgetByName("button4") as! SCDWidgetsButton
  }

  var button5: SCDWidgetsButton {
    return self.page?.getWidgetByName("button5") as! SCDWidgetsButton
  }

  var minsTitleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("minsTitleLabel") as! SCDWidgetsLabel
  }

  var secsTitleLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("secsTitleLabel") as! SCDWidgetsLabel
  }

  var minsTextbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("minsTextbox") as! SCDWidgetsTextbox
  }

  var secsTexbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("secsTexbox") as! SCDWidgetsTextbox
  }
}