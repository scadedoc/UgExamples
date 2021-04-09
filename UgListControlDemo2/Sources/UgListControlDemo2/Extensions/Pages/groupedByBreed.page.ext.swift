import ScadeKit

extension GroupedByBreedPageAdapter {
  var list1: SCDWidgetsList {
    return self.page?.getWidgetByName("list1") as! SCDWidgetsList
  }

  var lbBreed: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbBreed") as! SCDWidgetsLabel
  }

  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var itmDoglist: SCDWidgetsButton {
    return self.page?.getWidgetByName("itmDoglist") as! SCDWidgetsButton
  }

  var itmGroupedByBreed: SCDWidgetsButton {
    return self.page?.getWidgetByName("itmGroupedByBreed") as! SCDWidgetsButton
  }
}